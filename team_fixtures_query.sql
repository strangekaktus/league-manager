set @team = 4;

select f.match_date,
	ht.name as home_team,
    r.home_goals,
    r.away_goals,
    at.name as away_team
from fixture f 
join team ht on f.home_team_id = ht.team_id
join team at on f.away_team_id = at.team_id
left join result r on f.fixture_id = r.fixture_id
where f.home_team_id = @team or f.away_team_id = @team
order by f.match_date;