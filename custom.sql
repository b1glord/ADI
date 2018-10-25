--- start dota pvp sql files 
--USE ragnarok;    (Gerekirse Kullanacagım)
--
-- Table structure for table `pvpladder`
--

CREATE TABLE IF NOT EXISTS `pvpladder` (
  char_id int(11) not null default '0' primary key,
  name varchar(30) not null default '',
  streaks smallint(6) unsigned not null default '0',
  kills smallint(6) unsigned not null default '0',
  deaths smallint(6) unsigned not null default '0',
  streaktime datetime
) engine = MyISAM;

--
-- Table structure for table `ownladder`
--

CREATE TABLE IF NOT EXISTS `ownladder` (
  guild_id int(11) not null default '0' primary key,
  name varchar(24) not null default '',
  currentown smallint(6) unsigned not null default '0',
  highestown smallint(6) unsigned not null default '0',
  owntime datetime
) engine = MyISAM; 
--- End Dota pvp Sql Files

CREATE TABLE  `vote_point` (
 `account_id` int( 11 ) NOT NULL DEFAULT  '0',
 `point` int( 11 ) NOT NULL DEFAULT  '0',
 `last_vote1` int( 11 ) NOT NULL DEFAULT  '0',
 `last_vote2` int( 11 ) NOT NULL DEFAULT  '0',
 `last_vote3` int( 11 ) NOT NULL DEFAULT  '0',
 `last_vote4` int( 11 ) NOT NULL DEFAULT  '0',
 `last_vote5` int( 11 ) NOT NULL DEFAULT  '0',
 `date` TEXT NOT NULL ,
PRIMARY KEY (  `account_id` )
) engine = MyISAM;
