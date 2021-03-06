-- Memeber Table
create table seowonhm.tsn_member(
userid varchar(50) not null,
userpw varchar(50) not null,
username varchar(50) not null,
email varchar(100),
regdate timestamp default now(),
updatedate timestamp default now(),
primary key(userid)
);

-- Category Table
create table seowonhm.mst_category (
 bno INT NOT NULL AUTO_INCREMENT,
 category VARCHAR(255) NOT NULL,
 regdate TIMESTAMP NOT NULL DEFAULT NOW(),
 PRIMARY KEY(bno)
);

-- Board Table
create table seowonhm.tsn_board (
 bno INT NOT NULL AUTO_INCREMENT,
 category VARCHAR(255) NOT NULL,
 title VARCHAR(200) NOT NULL,
 content TEXT NULL,
 writer VARCHAR(50) NOT NULL,
 regdate TIMESTAMP NOT NULL DEFAULT now(),
 viewcnt INT DEFAULT 0,
 PRIMARY KEY (bno)
);

-- reply Table
-- drop table seowonhm.tsn_reply;
create table seowonhm.tsn_reply (
 rno INT NOT NULL AUTO_INCREMENT,
 bno INT NOT NULL DEFAULT 0,
 replytext VARCHAR(1000) NOT NULL,
 replyer VARCHAR(50) NOT NULL,
 regdate TIMESTAMP NOT NULL DEFAULT NOW(),
 updatedate TIMESTAMP NOT NULL DEFAULT NOW(),
 PRIMARY KEY(rno),
 CONSTRAINT fk_board FOREIGN KEY(bno) references seowonhm.tsn_board(bno)
 );

-- user Table
create table seowonhm.tsn_user(
 uid varchar(50) NOT NULL,
 upw varchar(50) NOT NULL,
 uname varchar(100) NOT NULL,
 upoint int NOT NULL DEFAULT 0,
 primary key(uid)
);

-- message Table
create table seowonhm.tsn_message(
 mid int NOT NULL AUTO_INCREMENT,
 targetid varchar(50) NOT NULL,
 sender varchar(50) NOT NULL,
 message text NOT NULL,
 opendate timestamp,
 senddate timestamp NOT NULL DEFAULT NOW(),
 primary key(mid),
 constraint fk_usertarget foreign key(targetid) references seowonhm.tsn_user(uid),
 constraint fk_usersender foreign key(targetid) references seowonhm.tsn_user(uid)
);

-- attach Table
create table seowonhm.tsn_attach(
 fullName varchar(150) NOT NULL,
 bno int NOT NULL,
 regdate timestamp default NOW(),
 primary key(fullName),
 constraint fk_board_attach foreign key(bno) references seowonhm.tsn_board(bno)
);