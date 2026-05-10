select p.name, t.name as team, count(*) as goals
from matchevent me
join player p on me.player_id = p.player_id
join team t on p.team_id = t.team_id
where me.event_type = 'goal'
group by p.player_id, p.name, t.name
order by goals desc;