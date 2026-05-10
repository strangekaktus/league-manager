drop procedure if exists get_match_report;

delimiter //
create procedure get_match_report(in p_fixture_id int)
begin
	-- result
    select ht.name as home_team,
		r.home_goals,
        r.away_goals,
        at.name as away_team,
        f.match_date,
        ref.name as referee
	from fixture f
    join team ht on f.home_team_id = ht.team_id
    join team at on f.away_team_id = at.team_id
    left join result r on f.fixture_id = r.fixture_id
    left join referee ref on f.referee_id = ref.referee_id
    where f.fixture_id = p_fixture_id;
    
    -- match events
    select me.minute, me.event_type, p.name as player, t.name as team
    from matchevent me
    join player p on me.player_id = p.player_id
    join team t on p.team_id = t.team_id
    where me.fixture_id = p_fixture_id
    order by me.minute;
end //
delimiter ;

call get_match_report(4);