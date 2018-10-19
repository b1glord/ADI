--- start dota pvp sql files 
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

