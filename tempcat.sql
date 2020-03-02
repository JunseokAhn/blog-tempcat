
--회원 정보 테이블
create table tempcat_member (
	id			varchar2(20) primary key,	--회원ID
	pw      	varchar2(20) not null,		--비밀번호
	name		varchar2(20) not null,		--이름
	nickname	varchar2(20),				--닉네임
	email		varchar2(100),				--이메일
	inputdate date default sysdate, 		--아이디 생성일
    logindate date default sysdate
);

--게시판 본문 글 테이블
create table tempcat_notice(
	noticenum	number primary key,			--글번호
	id			varchar2(20) not null, 		--작성자ID
	title		varchar2(200) not null,		--제목
	contents	varchar2(2000) not null, 	--내용
	inputdate	date default sysdate, 		--작성일,
	hits		number default 0,			--조회수
	originalfile	varchar2(200),			--첨부파일 원래이름
	savedfile		varchar2(100),			--첨부파일 저장된 이름
    foreign key (id) REFERENCES tempcat_member (id) on delete cascade
);
--게시판 글 번호에 사용할 시퀀스
create sequence tempcat_notice_seq;
