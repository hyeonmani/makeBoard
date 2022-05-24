CREATE TABLE member(
    id varchar2(20) primary key,
    pwd varchar2(20)
);

CREATE TABLE board(
    id varchar2(20),
    bno int PRIMARY KEY,
    title varchar2(50),
    content varchar2(2000),
    regdate date default sysdate,
    updatedate date default sysdate,
    CONSTRAINT pk_board PRIMARY KEY(bno),
    CONSTRAINT fk_id FOREIGN KEY(id) references member(id) on delete cascade
);

create sequence board_seq increment by 1 start with 1 minvalue 1;

commit; 

-----------------더미용 쿼리문-----------------

insert into member values('aa', 111);
insert into member values('bb', 111);

insert into board(bno, title, id, content) values (board_seq.nextval, '테스트용', 'aa', '테스트를 위한 게시글');
insert into board(bno, title, id, content) values (board_seq.nextval, '테스트용', 'bb', '테스트를 위한 게시글');

insert into board(bno, title, id, content)(select board_seq.nextval, title, id, content from board);