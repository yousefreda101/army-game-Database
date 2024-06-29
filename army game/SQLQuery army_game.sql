use master;
create database army_game
on
(
NAME =army_dat,
FILENAME ='D:\sql\army game\army.mdf',
size=5MB,
maxsize=50MB,
filegrowth=5MB
)
log ON(
	NAME =army_log,
	filename = 'D:\sql\army game\army.ldf',
	size =5MB,
	maxsize= 25MB,
	filegrowth=5MB);


use army_game;
go
create schema army_schema;

create table army_schema.inventory(
inventory_ID int identity(1,1),
item_name varchar(20),
quantity varchar(20),
location varchar(20),
constraint inventory_PK primary key (inventory_ID)
);

create table army_schema.player(
player_ID int identity(1,1),
Name varchar(20),
Branch varchar(20),
start_date date,
Rank varchar(20),
inventory_ID int,
constraint player_pk primary key (player_ID),
constraint inventory_player_FK foreign key (inventory_ID)
references army_schema.inventory (inventory_ID)
);
create table army_schema.Missions(
Mission_ID int identity(1,1),
Description text,
Status varchar(20),
start_date date,
end_date date,
location varchar(30)
constraint Missions_pk primary key (Mission_ID),
);

create table army_schema.player_mission(
ID int primary key identity(1,1),
Mission_ID int references army_schema.Missions(Mission_ID),
player_ID int references army_schema.player(player_ID),
);

create table army_schema.Equipment(
Equipment_ID int identity(1,1),
Type varchar(20),
Quantity varchar(20),
Condition varchar(20),
Location  varchar(20),
constraint Equipment_PK primary key (Equipment_ID),
Mission_ID int references army_schema.Missions(Mission_ID),
player_ID int references army_schema.player(player_ID)
);
create table army_schema.mission_qeuipment(
ID int primary key identity(1,1),
Equipment_ID int references army_schema.Equipment(Equipment_ID),
Mission_ID int references army_schema.Missions(Mission_ID),
);

create table Incidents_Reports(
Incident_ID int identity(1,1),
Type varchar(20),
Description text,
Date_Time date,
player_ID int references army_schema.player(player_ID),
);



=============================================================
create table players
(
	player_id int identity ,
	Player_name varchar(20) not null ,
	Rank_player varchar(10) not null ,
	constraint PK_Players primary key (player_id)
);

create table mission 
(
mission_id int identity not null ,
mission_name varchar(10) not null ,
Start_date date ,
End_date   date ,
player_id int ,
constraint PK_mission primary key (mission_id),
constraint Player_FK_Mission foreign key (player_id)
references players (player_id)
);

insert into players ( player_name , Rank_player)
values( 'Ahmed' , '**') ,( 'Saed' , '**') ,( 'kaled' , '**') ;

insert into mission ( mission_name )
values( '34443' ) ,( '7887' ) ,( 'kaled') ;

select player_name , Rank_player  ,mission_name 
from players p inner join mission m 
on p.player_id = m.player_id;


select player_name , Rank_player  ,mission_name 
from players p right join mission m 
on p.player_id = m.player_id;

select player_name , Rank_player  ,mission_name 
from players p left join mission m 
on p.player_id = m.player_id;