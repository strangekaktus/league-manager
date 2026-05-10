use league_manager;

-- Season
insert into season (year) values (2024);

-- Teams
insert into team (name, home_ground, founded_year) values
('Northside United',     'Northside Park',       1998),
('Southgate FC',         'Southgate Arena',       2003),
('Eastfield Rangers',    'Eastfield Ground',      1985),
('West End Athletic',    'West End Stadium',      2010),
('Riverside City',       'Riverside Meadow',      1992),
('Hilltop Wanderers',    'Hilltop Field',         2001),
('Docklands FC',         'Docklands Ground',      1978),
('Central Park FC',      'Central Park Stadium',  2007);

-- Referees
insert into referee (name, phone) values
('James Howarth',   '070-111-2233'),
('Sarah Nilsson',   '070-444-5566'),
('Mark Peterson',   '070-777-8899'),
('Anna Lindqvist',  '070-222-3344');

-- Players (10 per team)

-- Northside United (team_id = 1)
insert into player (name, date_of_birth, position, team_id) values
('Liam Carter',     '1995-03-12', 'goalkeeper',  1),
('Noah Evans',      '1998-07-24', 'defender',    1),
('Oliver Smith',    '2000-01-15', 'defender',    1),
('James Wilson',    '1997-11-30', 'defender',    1),
('Harry Brown',     '1999-05-08', 'midfielder',  1),
('Jack Taylor',     '2001-09-19', 'midfielder',  1),
('George Johnson',  '1996-04-22', 'midfielder',  1),
('Charlie Davies',  '2002-12-03', 'forward',     1),
('Alfie White',     '1994-08-17', 'forward',     1),
('Freddie Harris',  '2000-06-25', 'forward',     1);

-- Southgate FC (team_id = 2)
insert into player (name, date_of_birth, position, team_id) values
('Mason Clark',     '1996-02-14', 'goalkeeper',  2),
('Logan Lewis',     '1999-10-05', 'defender',    2),
('Lucas Walker',    '2001-07-18', 'defender',    2),
('Ethan Hall',      '1997-03-29', 'defender',    2),
('Aiden Young',     '2000-11-11', 'midfielder',  2),
('Jackson Allen',   '1995-06-07', 'midfielder',  2),
('Sebastian King',  '2002-01-23', 'midfielder',  2),
('Matthew Wright',  '1998-09-14', 'forward',     2),
('Daniel Scott',    '1993-04-30', 'forward',     2),
('Ryan Green',      '2001-08-06', 'forward',     2);

-- Eastfield Rangers (team_id = 3)
insert into player (name, date_of_birth, position, team_id) values
('Tyler Adams',     '1997-05-20', 'goalkeeper',  3),
('Connor Baker',    '2000-12-09', 'defender',    3),
('Dylan Nelson',    '1995-08-15', 'defender',    3),
('Nathan Carter',   '1999-03-27', 'defender',    3),
('Brandon Mitchell','2001-10-02', 'midfielder',  3),
('Jordan Perez',    '1996-07-13', 'midfielder',  3),
('Cameron Roberts', '2002-04-18', 'midfielder',  3),
('Austin Turner',   '1998-01-31', 'forward',     3),
('Zachary Phillips','1994-09-22', 'forward',     3),
('Hunter Campbell', '2000-05-14', 'forward',     3);

-- West End Athletic (team_id = 4)
insert into player (name, date_of_birth, position, team_id) values
('Oscar Morgan',    '1996-11-08', 'goalkeeper',  4),
('Leo Parker',      '1999-06-19', 'defender',    4),
('Hugo Edwards',    '2001-02-25', 'defender',    4),
('Felix Collins',   '1997-08-10', 'defender',    4),
('Theo Stewart',    '2000-04-03', 'midfielder',  4),
('Jasper Morris',   '1995-12-16', 'midfielder',  4),
('Elliot Rogers',   '2002-07-29', 'midfielder',  4),
('Reuben Cook',     '1998-03-07', 'forward',     4),
('Monty Bailey',    '1993-10-21', 'forward',     4),
('Barnaby Reed',    '2001-01-12', 'forward',     4);

-- Riverside City (team_id = 5)
insert into player (name, date_of_birth, position, team_id) values
('Erik Johansson',  '1996-09-04', 'goalkeeper',  5),
('Lars Eriksson',   '1999-04-15', 'defender',    5),
('Sven Lindgren',   '2001-11-28', 'defender',    5),
('Karl Bergstrom',  '1997-06-09', 'defender',    5),
('Bjorn Gustafsson','2000-02-17', 'midfielder',  5),
('Mikael Hansson',  '1995-08-30', 'midfielder',  5),
('Anders Persson',  '2002-05-11', 'midfielder',  5),
('Johan Nilsson',   '1998-12-24', 'forward',     5),
('Patrik Olsson',   '1994-07-06', 'forward',     5),
('Stefan Magnusson','2001-03-19', 'forward',     5);

-- Hilltop Wanderers (team_id = 6)
insert into player (name, date_of_birth, position, team_id) values
('Finn Murphy',     '1997-01-26', 'goalkeeper',  6),
('Cian O Brien',    '2000-08-07', 'defender',    6),
('Darragh Kelly',   '1995-05-18', 'defender',    6),
('Oisin Ryan',      '1999-11-01', 'defender',    6),
('Conor Walsh',     '2001-06-14', 'midfielder',  6),
('Ronan Burke',     '1996-03-25', 'midfielder',  6),
('Eoin Brennan',    '2002-10-08', 'midfielder',  6),
('Sean Doyle',      '1998-07-21', 'forward',     6),
('Niall Lynch',     '1993-02-03', 'forward',     6),
('Padraig Flynn',   '2000-09-16', 'forward',     6);

-- Docklands FC (team_id = 7)
insert into player (name, date_of_birth, position, team_id) values
('Marco Rossi',     '1996-04-11', 'goalkeeper',  7),
('Luca Ferrari',    '1999-11-22', 'defender',    7),
('Matteo Ricci',    '2001-08-05', 'defender',    7),
('Giovanni Bruno',  '1997-05-16', 'defender',    7),
('Antonio Costa',   '2000-01-29', 'midfielder',  7),
('Francesco Leone', '1995-09-10', 'midfielder',  7),
('Davide Romano',   '2002-06-23', 'midfielder',  7),
('Roberto Greco',   '1998-03-04', 'forward',     7),
('Sergio Esposito', '1994-10-17', 'forward',     7),
('Claudio Marino',  '2001-07-30', 'forward',     7);

-- Central Park FC (team_id = 8)
insert into player (name, date_of_birth, position, team_id) values
('Alex Muller',     '1997-02-08', 'goalkeeper',  8),
('Hans Weber',      '2000-09-19', 'defender',    8),
('Klaus Fischer',   '1995-06-30', 'defender',    8),
('Dieter Bauer',    '1999-04-11', 'defender',    8),
('Werner Schmidt',  '2001-01-24', 'midfielder',  8),
('Gunter Koch',     '1996-08-05', 'midfielder',  8),
('Rolf Hoffman',    '2002-05-18', 'midfielder',  8),
('Ernst Wagner',    '1998-12-01', 'forward',     8),
('Fritz Schulz',    '1993-07-14', 'forward',     8),
('Karl Meyer',      '2000-04-27', 'forward',     8);

-- Fixtures (season_id = 1, each team plays every other team once)
insert into fixture (match_date, home_team_id, away_team_id, season_id, referee_id) values
('2024-08-10', 1, 2, 1, 1),
('2024-08-10', 3, 4, 1, 2),
('2024-08-10', 5, 6, 1, 3),
('2024-08-10', 7, 8, 1, 4),
('2024-08-17', 1, 3, 1, 2),
('2024-08-17', 2, 5, 1, 3),
('2024-08-17', 4, 7, 1, 4),
('2024-08-17', 6, 8, 1, 1),
('2024-08-24', 1, 4, 1, 3),
('2024-08-24', 2, 6, 1, 4),
('2024-08-24', 3, 7, 1, 1),
('2024-08-24', 5, 8, 1, 2),
('2024-08-31', 1, 5, 1, 4),
('2024-08-31', 2, 7, 1, 1),
('2024-08-31', 3, 8, 1, 2),
('2024-08-31', 4, 6, 1, 3),
('2024-09-07', 1, 6, 1, 1),
('2024-09-07', 2, 8, 1, 2),
('2024-09-07', 3, 5, 1, 3),
('2024-09-07', 4, 8, 1, 4),
('2024-09-14', 1, 7, 1, 2),
('2024-09-14', 2, 4, 1, 3),
('2024-09-14', 5, 7, 1, 4),
('2024-09-14', 6, 3, 1, 1),
('2024-09-21', 1, 8, 1, 3),
('2024-09-21', 2, 3, 1, 4),
('2024-09-21', 4, 5, 1, 1),
('2024-09-21', 6, 7, 1, 2);

-- Results
insert into result (fixture_id, home_goals, away_goals) values
(1,  2, 1),
(2,  0, 0),
(3,  3, 2),
(4,  1, 3),
(5,  1, 1),
(6,  2, 0),
(7,  0, 2),
(8,  4, 1),
(9,  3, 0),
(10, 1, 2),
(11, 2, 2),
(12, 0, 1),
(13, 1, 0),
(14, 3, 3),
(15, 2, 1),
(16, 1, 4),
(17, 0, 0),
(18, 2, 3),
(19, 1, 1),
(20, 2, 0),
(21, 4, 2),
(22, 0, 1),
(23, 3, 1),
(24, 2, 2),
(25, 1, 2),
(26, 3, 0),
(27, 2, 2),
(28, 1, 0);

-- Match Events (goals only for simplicity, with some cards)
insert into matchevent (fixture_id, player_id, event_type, minute) values
-- fixture 1: northside 2-1 southgate
(1, 10, 'goal',        23),
(1, 9,  'goal',        67),
(1, 18, 'goal',        80),
(1, 12, 'yellow_card', 45),
-- fixture 2: eastfield 0-0 west end
(2, 33, 'yellow_card', 55),
-- fixture 3: riverside 3-2 hilltop
(3, 49, 'goal',        12),
(3, 50, 'goal',        34),
(3, 48, 'goal',        71),
(3, 56, 'goal',        40),
(3, 60, 'goal',        88),
-- fixture 4: docklands 1-3 central park
(4, 68, 'goal',        19),
(4, 78, 'goal',        33),
(4, 79, 'goal',        60),
(4, 80, 'goal',        75),
(4, 62, 'yellow_card', 50),
-- fixture 5: northside 1-1 eastfield
(5, 8,  'goal',        55),
(5, 30, 'goal',        70),
-- fixture 6: southgate 2-0 riverside
(6, 18, 'goal',        28),
(6, 19, 'goal',        63),
-- fixture 9: northside 3-0 west end
(9, 10, 'goal',        15),
(9, 9,  'goal',        44),
(9, 8,  'goal',        82),
(9, 41, 'yellow_card', 37),
-- fixture 13: northside 1-0 riverside
(13, 9, 'goal',        58),
-- fixture 21: northside 4-2 docklands
(21, 10, 'goal',       11),
(21, 10, 'goal',       39),
(21, 9,  'goal',       55),
(21, 8,  'goal',       78),
(21, 68, 'goal',       20),
(21, 70, 'goal',       65),
(21, 63, 'red_card',   88);

-- Standings (manually calculated from rhome_team_idseason_idesults above)
insert into standing (team_id, season_id, played, won, drawn, lost, goals_for, goals_against, points) values
(1, 1, 7, 5, 1, 1, 14, 7,  16),
(2, 1, 7, 3, 1, 3,  9, 9,  10),
(3, 1, 7, 2, 3, 2,  7, 8,   9),
(4, 1, 7, 3, 2, 2, 10, 9,  11),
(5, 1, 7, 3, 1, 3,  8, 9,  10),
(6, 1, 7, 2, 2, 3,  9, 12,  8),
(7, 1, 7, 2, 1, 4,  8, 13,  7),
(8, 1, 7, 4, 1, 2, 11, 9,  13);