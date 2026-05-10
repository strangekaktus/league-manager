set @season = 1;

select t.name, s.played, s.won, s.drawn, s.lost, 
	s.goals_for, s.goals_against,
    (s.goals_for - s.goals_against) as goal_difference,
    s.points
from standing s 
join team t on s.team_id = t.team_id
where s.season_id = @season
order by s.points desc, goal_difference desc;