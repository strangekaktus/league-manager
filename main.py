import mysql.connector
import config

def get_connection():
    return mysql.connector.connect(
        host=config.DB_HOST,
        user=config.DB_USER,
        password=config.DB_PASSWORD,
        database=config.DB_NAME
    )

def view_standings():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        select t.name, s.played, s.won, s.drawn, s.lost,
            s.goals_for, s.goals_against,
        (s.goals_for - s.goals_against) as goal_difference,
        s.points
        from standing s
        join team t on s.team_id = t.team_id
        where s.season_id = 1
        order by s.points desc, goal_difference desc
        """)
    rows = cursor.fetchall()
    print("\nleague standings:")
    print(f"{'team':<25} {'p':>3} {'w':>3} {'d':>3} {'l':>3} {'gf':>4} {'ga':>4} {'gd':>4} {'pts':>4}")
    print("-" * 60)
    for row in rows:
        print(f"{row[0]:<25} { row[1]:>3} {row[2]:>3} {row[3]:>3} {row[4]:>3} {row[5]:>4} {row[6]:>4} {row[7]:>4} {row[8]:>4}")
    cursor.close()
    conn.close()

def view_top_scorers():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        select p.name, t.name as team, count(*) as goals
        from matchevent me
        join player p on me.player_id = p.player_id
        join team t on p.team_id = t.team_id
        where me.event_type = 'goal'
        group by p.player_id, p.name, t.name
        order by goals desc
    """)

    rows = cursor.fetchall()
    print("\ntop scorers:")
    print(f"{'player':<25} {'team':<25} {'goals':>5}")
    print("-" * 60)
    for row in rows:
        print(f"{row[0]:<25} {row[1]:<25} {row[2]:>5}")
    cursor.close()
    conn.close()

def view_team_fixtures():
    team_id = input("\nenter team id (1-8): ")
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        select f.match_date,
            ht.name as home_team,
            r.home_goals,
            r.away_goals,
            at.name as away_team
        from fixture f
        join team ht on f.home_team_id = ht.team_id
        join team at on f.away_team_id = at.team_id
        left join result r on f.fixture_id = r.fixture_id
        where f.home_team_id = %s or f.away_team_id = %s
        order by f.match_date
    """, (team_id, team_id))
    rows = cursor.fetchall()
    print("\nfixtures:")
    print(f"{'date':<14} {'home team':<25} {'score':<7} {'away team':<25}")
    print("-" * 60)
    for row in rows:
        score = f"{row[2]}-{row[3]}" if row[2] is not None else "vs"
        print(f"{str(row[0]):<14} {row[1]:<25} {score:<7} {row[4]:<25}")
    cursor.close()
    conn.close()

def record_result():
    fixture_id = input("\nenter fixture id: ")
    home_goals = input("enter home goals: ")
    away_goals = input("enter away goals: ")
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("""
            insert into result (fixture_id, home_goals, away_goals)
            values (%s, %s, %s)
        """, (fixture_id, home_goals, away_goals))
        conn.commit()
        print("result recorded successfully.")
    except mysql.connector.Error as e:
        print(f"error: {e}")
    cursor.close()
    conn.close()

def view_match_report():
    fixture_id = input("\nenter fixture id: ")
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.callproc('get_match_report', [fixture_id])
        for result in cursor.stored_results():
            rows = result.fetchall()
            cols = [desc[0] for desc in result.description]
            print("\n" + " | ".join(f"{col:<15}" for col in cols))
            print("-" * (17 * len(cols)))
            for row in rows:
                print(" | ".join(f"{str(val):<15}" for val in row))
    except mysql.connector.Error as e:
        print(f"error: {e}")
    cursor.close()
    conn.close()

def add_fixture():
    print("\nteams:")
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("select team_id, name from team")
    teams = cursor.fetchall()
    for team in teams:
        print(f" {team[0]}. {team[1]}")
    
    home_team_id = input("\nenter home team id: ")
    away_team_id = input("enter away team id: ")
    match_date = input("enter match date (yyyy-mm-dd): ")
    referee_id = input("enter referee id (1-4): ")

    try:
        cursor.execute("""
            insert into fixture (match_date, home_team_id, away_team_id, season_id, referee_id)
            values (%s, %s, %s, 1, %s)
        """, (match_date, home_team_id, away_team_id, referee_id))
        conn.commit()
        print("fixture added successfully.")
    except mysql.connector.Error as e:
        print(f"error: {e}")
    cursor.close()
    conn.close()

def view_all_fixtures():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("""
        select f.fixture_id, f.match_date,
            ht.name as home_team,
            r.home_goals,
            r.away_goals,
            at.name as away_team
        from fixture f
        join team ht on f.home_team_id = ht.team_id
        join team at on f.away_team_id = at.team_id
        left join result r on f.fixture_id = r.fixture_id
        order by f.match_date           
    """)
    rows = cursor.fetchall()
    print("\nall fixtures:")
    print(f"{'id':<5} {'date':<14} {'home team':<25} {'score':<7} {'away team':<25}")
    print("-" * 60)
    for row in rows:
        score = f"{row[3]}-{row[4]}" if row[3] is not None else "vs"
        print(f"{row[0]:<5} {str(row[1]):<14} {row[2]:<25} {score:<7} {row[5]:<25}")
    cursor.close()
    conn.close()

def view_teams():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("select team_id, name, home_ground, founded_year from team")
    rows = cursor.fetchall()
    print("\nteams:")
    print(f"{'id':<5} {'name':<25} {'home ground':<25} {'founded':>7}")
    print("-" * 60)
    for row in rows:
        print(f"{row[0]:<5} {row[1]:<25} {row[2]:<25} {row[3]:>7}")
    cursor.close()
    conn.close()

def view_referees():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("select referee_id, name, phone from referee")
    rows = cursor.fetchall()
    print("\nreferees:")
    print(f"{'id':<5} {'name':<25} {'phone':<20}")
    print("-" * 60)
    for row in rows:
        print(f"{row[0]:<5} {row[1]:<25} {row[2]:<20}")
    cursor.close()
    conn.close()

# MENU
def main():
    while True:
        print("\n----league manager----")
        print("1. view standings")
        print("2. view top scorers")
        print("3. view fixture for a team")
        print("4. record a result")
        print("5. view match report")
        print("6. add a fixture")
        print("7. view all fixtures")
        print("8. view all teams")
        print("9. view all referees")
        print("0. exit")
        choice = input("\nenter choice: ")

        if choice == "1":
            view_standings()
        elif choice == "2":
            view_top_scorers()
        elif choice == "3":
            view_team_fixtures()
        elif choice == "4":
            record_result()
        elif choice == "5":
            view_match_report()
        elif choice == "6":
            add_fixture()
        elif choice == "7":
            view_all_fixtures()
        elif choice == "8":
            view_teams()
        elif choice == "9":
            view_referees()
        elif choice == "0":
            print("exiting.")
            break
        else:
            print("invalid choice, try again.")

if __name__ == "__main__":
    main()