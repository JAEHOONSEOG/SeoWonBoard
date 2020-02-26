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

-- Board Table
create table seowonhm.tsn_board (
 bno INT NOT NULL AUTO_INCREMENT,
 title VARCHAR(200) NOT NULL,
 content TEXT NULL,
 writer VARCHAR(50) NOT NULL,
 regdate TIMESTAMP NOT NULL DEFAULT now(),
 viewcnt INT DEFAULT 0,
 PRIMARY KEY (bno)
);

-- reply Table
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