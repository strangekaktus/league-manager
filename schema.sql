create database if not exists league_manager;
use league_manager;

create table season (
	season_id	int auto_increment primary key,
    year 		int not null unique
);

create table team (
	team_id			int auto_increment primary key,
    name			varchar(100) not null,
    home_ground 	varchar(100),
    founded_year	int
);

create table player (
	player_id		int auto_increment primary key,
	name 			varchar(100) not null,
	date_of_birth	date,
	position		varchar(30),
	team_id			int,
	foreign key (team_id) references team(team_id) on delete set null
);

create table referee (
	referee_id	int auto_increment primary key,
    name		varchar(100) not null,
    phone 		varchar(20)
);

create table fixture (
	fixture_id		int auto_increment primary key,
    match_date 		date not null,
    home_team_id	int not null,
    away_team_id	int not null,
    season_id		int not null,
    referee_id		int,
    foreign key (home_team_id) references team(team_id),
    foreign key (away_team_id) references team(team_id),
    foreign key (season_id) references season(season_id),
    foreign key (referee_id) references referee(referee_id) on delete set null
);

create table result (
	result_id	int auto_increment primary key,
    fixture_id	int not null unique,
    home_goals	int not null default 0,
    away_goals	int not null default 0,
    foreign key (fixture_id) references fixture(fixture_id) on delete cascade
);

create table matchEvent (
	event_id	int auto_increment primary key,
    fixture_id	int not null,
    player_id	int,
    event_type	varchar(20) not null,
    minute		int not null,
    foreign key (fixture_id) references fixture(fixture_id) on delete cascade,
    foreign key (player_id) references player(player_id) on delete set null
);

create table standing (
	standing_id	int auto_increment primary key,
    team_id		int not null,
    season_id	int not null,
    played 		int not null default 0,
    won			int not null default 0,
    drawn		int not null default 0,
    lost		int not null default 0,
    goals_for	int not null default 0,
    goals_against	int not null default 0,
    points		int not null default 0,
    unique key unique_standing (team_id, season_id),
    foreign key (team_id) references team(team_id),
    foreign key (season_id) references season(season_id)
);