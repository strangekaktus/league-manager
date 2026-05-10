delimiter //
create trigger after_result_insert
after insert on result
for each row
begin
	declare home_team int;
    declare away_team int;
    
    select home_team_id, away_team_id
    into home_team, away_team
    from fixture
    where fixture_id = new.fixture_id;
    
    -- update home team standing
    update standing
    set played = played + 1,
		goals_for = goals_for + new.home_goals,
        goals_against = goals_against + new.away_goals,
        won = won + if(new.home_goals > new.away_goals, 1, 0),
        drawn = drawn + if(new.home_goals = new.away_goals, 1, 0),
        lost = lost + if(new.home_goals < new.away_goals, 1, 0),
        points = points + case
			when new.home_goals > new.away_goals then 3
            when new.home_goals = new.away_goals then 1
            else 0 end
		where team_id = home_team and season_id = (
			select season_id from fixture where fixture_id = new.fixture_id
	);
        
    -- update away team standing
    update standing
    set played = played + 1,
		goals_for = goals_for + new.away_goals,
        goals_against = goals_against + new.home_goals,
        won = won + if(new.home_goals < new.away_goals, 1, 0),
        drawn = drawn + if(new.home_goals = new.away_goals, 1, 0),
        lost = lost + if(new.home_goals > new.away_goals, 1, 0),
        points = points + case
			when new.away_goals > new.home_goals then 3
            when new.away_goals = new.home_goals then 1
            else 0 end
		where team_id = away_team and season_id = (
			select season_id from fixture where fixture_id = new.fixture_id
		);
end //
delimiter ;