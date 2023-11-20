create database legonego;


-- 윈도우 노트북 한글 인코딩 안될 때 사용
ALTER DATABASE legonego DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use legonego;

SHOW TABLES;
-- ==========================================================
CREATE TABLE ROLE(
                     role_id INT PRIMARY KEY AUTO_INCREMENT,
                     role VARCHAR(255) DEFAULT NULL
);

SELECT * FROM ROLE;

INSERT INTO ROLE VALUES (DEFAULT, 'ADMIN');
INSERT INTO ROLE VALUES (DEFAULT, 'TEACHER');
INSERT INTO ROLE VALUES (DEFAULT, 'USER');
-- ========================================= 안쓸듯 ===============================================
CREATE TABLE user(
                     user_id INT PRIMARY KEY AUTO_INCREMENT,
                     active INT DEFAULT 0,
                     login_id VARCHAR(255) NOT NULL,
                     user_name VARCHAR(255) NOT NULL,
                     password VARCHAR(300) NOT NULL
);

SELECT * FROM USER;

DROP TABLE USER;

-- ========================================= 안쓸듯 ===============================================

-- ==========================================================
CREATE TABLE euser (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(20) NOT NULL,
                       password VARCHAR(300) NOT NULL,
                       username VARCHAR(50) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       address VARCHAR(300),
                       tel VARCHAR(20),
                       regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
                       lev VARCHAR(20) DEFAULT 'USER',
                       act VARCHAR(20) DEFAULT 'JOIN',
                       pt INT DEFAULT 0, -- 포인트
                       CONSTRAINT unique_name UNIQUE (name), -- 동명이인 방지
                       CONSTRAINT unique_id UNIQUE (id), -- id 중복 방지
                       CONSTRAINT unique_email UNIQUE (email) -- 이메일 중복 방지
);



-- 회원 테이블 더미 데이터
insert into euser values(DEFAULT, 'admin', '1234', '관리자', 'admin@legonego.com', '서울 구로구', '010-1234-5678', DEFAULT, 'ADMIN', default, DEFAULT);
insert into euser values(DEFAULT, 'sirious920', '1234', '오레오', 'sirious920@naver.com', '서울 관악구', '010-1234-5678', DEFAULT, 'ADMIN', default, DEFAULT);
insert into euser values(DEFAULT, 'test1', '1234', '테스트1', 'test1@edu.com', '서울 관악구', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
insert into euser values(DEFAULT, 'test2', '1234', '테스트2', 'test2@edu.com', '서울 관악구', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
insert into euser values(DEFAULT, 'test3', '1234', '테스트3', 'test3@edu.com', '서울 관악구', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);

UPDATE euser SET PASSWORD='$2a$10$3WCl8X4BUzOItXcQBWov3OqmoSCdX9Z1yy6fsM7wt/xIn515RpHa6';  -- 암호화 공통으로 박아 넣기

COMMIT;

SELECT * FROM euser;

-- ==========================================================

CREATE TABLE user_role(
                          user_id INT NOT NULL,
                          role_id INT NOT NULL,
                          PRIMARY KEY (user_id, role_id)
);

INSERT INTO user_role VALUES ( 1, 1);

SELECT * FROM user_role;

-- ==========================================================

CREATE TABLE notice(
                       no INT PRIMARY KEY AUTO_INCREMENT,
                       title VARCHAR(300) NOT NULL,
                       content VARCHAR(1000) NOT NULL,
                       author INT,
                       regdate DATETIME DEFAULT CURRENT_TIME,
                       cnt INT DEFAULT 0,
                       FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목5  입니다.','여기는 샘플 글 5의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목6  입니다.','여기는 샘플 글 6의 내용입니다.',1,DEFAULT, DEFAULT);

INSERT INTO notice VALUES (DEFAULT,'테1','테1 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테2','테2 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테3','테3 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테4','테4 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테5','테5 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테6','테6 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테7','테7 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테8','테8 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테9','테9 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테10','테10 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테11','테11 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테12','테12 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테13','테13 내용',1,DEFAULT, DEFAULT);

SELECT * FROM notice;

COMMIT;

-- ==========================================================

CREATE TABLE faq (
                     fno INT PRIMARY KEY AUTO_INCREMENT,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);


INSERT INTO faq VALUES (DEFAULT,'테1','테1 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테2','테2 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테3','테3 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테4','테4 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테5','테5 내용', DEFAULT);

SELECT * FROM faq;

COMMIT;

-- ==========================================================

-- 댓글 처리
CREATE TABLE COMMENT(
                        cno INT PRIMARY KEY AUTO_INCREMENT, -- 댓글 번호
                        author VARCHAR(20) NOT NULL, -- 댓글 작성자
                        content VARCHAR(500) NOT NULL, -- 댓글 내용
                        regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 댓글 등록일
                        par INT(10) NOT NULL -- 해당 후기 번호
);


INSERT INTO comment VALUES(
                              DEFAULT,
                              '이나현',
                              '좋은 정보 감사합니다!',
                              DEFAULT,
                              '6'
                          );

INSERT INTO comment VALUES(
                              DEFAULT,
                              '권은빈',
                              '우왕~ 참고할게욧!',
                              DEFAULT,
                              '6'
                          );

INSERT INTO comment VALUES(
                              DEFAULT,
                              '이서진',
                              '스마트해법 짱ㅋ',
                              DEFAULT,
                              '6'
                          );

INSERT INTO comment VALUES(
                              DEFAULT,
                              '안유빈',
                              '허허,,, 그렇군요,,,',
                              DEFAULT,
                              '6'
                          );

INSERT INTO comment VALUES(
                              DEFAULT,
                              '오레오',
                              '엥',
                              DEFAULT,
                              '6'
                          );

DESC comment;
SELECT * FROM comment;
COMMIT;

-- ==========================================================

-- 상품 구매 후기
CREATE table review(
                       no INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content VARCHAR(2000) NOT NULL,
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0,
                       id VARCHAR(50)
);

DESC review;
SELECT * FROM review;
COMMIT;

CREATE TABLE free(
                     fno INT PRIMARY KEY AUTO_INCREMENT,
                     title VARCHAR(300) NOT NULL,
                     content VARCHAR(1000) NOT NULL,
                     author INT,
                     regdate DATETIME DEFAULT CURRENT_TIME,
                     cnt INT DEFAULT 0,
                     FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

-- ==============================================================================================================================

CREATE TABLE product (
                         pno INT PRIMARY KEY AUTO_INCREMENT,
                         pname VARCHAR(200) NOT NULL,
                         content varchar(1000),
                         category VARCHAR(255),
                         seller VARCHAR(100) NOT NULL,
                         price INT not null DEFAULT 0,
                         addr VARCHAR(200),
                         image int,
                         createAt timestamp not null default current_timestamp,
                         baseAt timestamp not null default current_timestamp,
                         status VARCHAR(50) DEFAULT 'SALE',
                         visited INT DEFAULT 0
);

-- 테스트 DB
INSERT INTO product VALUES(DEFAULT, '상품1', '상품4 내용', 'A_1', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품2', '상품1 내용', 'A_2', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품3', '상품1 내용', 'A_3', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품4', '상품1 내용', 'A_4', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품5', '상품2 내용', 'B_1', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품6', '상품2 내용', 'B_2', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품7', '상품2 내용', 'B_3', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품8', '상품2 내용', 'B_4', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품9', '상품2 내용', 'C_1', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품10', '상품3 내용', 'C_2', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품11', '상품2 내용', 'C_3', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);
INSERT INTO product VALUES(DEFAULT, '상품12', '상품2 내용', 'C_4', 'sirious920', 15000, '신림동', 1, DEFAULT, DEFAULT, 'SALE', DEFAULT);

DESC product;

SELECT * FROM product;

COMMIT;

-- ==============================================================================================================================
-- 채팅방
CREATE TABLE chat (
                      rno int PRIMARY KEY AUTO_INCREMENT,       -- 고유 번호
                      userId VARCHAR(20) NOT NULL,            -- member.id
                      pno INT NOT NULL,                       -- product.pno
                      status VARCHAR(50) DEFAULT 'ON',        -- ON(진행), OFF(차단)
                      UNIQUE (userId, pno)                    -- memId와 pno를 묶어서 UNIQUE 제약 설정
);

desc chat;

SELECT * from chat;

commit;

-- 채팅 메시지
CREATE TABLE chatMessage(
                            cno int PRIMARY KEY AUTO_INCREMENT,         -- 채팅 번호
                            type VARCHAR(20) NOT NULL,                  -- 채팅 타입: ENTER, TALK, LEAVE, NOTICE
                            rno INT NOT NULL,                           -- 채팅방 번호
                            messagesender VARCHAR(20) NOT NULL,         -- 송신자
                            message VARCHAR(2000) NOT NULL,             -- 채팅 메시지
                            status VARCHAR(50) DEFAULT 'UNREAD',        -- 읽음 여부
                            time TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- 채팅 발송 시간
);

desc chatMessage;

SELECT * from chatMessage;

commit;

-- ==============================================================================================================================
-- 상품 카테고리
CREATE TABLE category(
                         cate VARCHAR(50) NOT NULL PRIMARY KEY, 	-- 카테고리 코드
                         cname VARCHAR(100) NOT NULL
);

-- 초딩 잼민이들
INSERT INTO category VALUES('A_1', '초등국어');
INSERT INTO category VALUES('A_2', '초등수학');
INSERT INTO category VALUES('A_3', '초등영어');
INSERT INTO category values('A_4', '초등탐구');

-- 중등 잼민이들
INSERT INTO category VALUES('B_1', '중등국어');
INSERT INTO category VALUES('B_2', '중등수학');
INSERT INTO category VALUES('B_3', '중등영어');
INSERT INTO category values('B_4', '중등탐구');

-- 고딩 성숙한 잼민이들
INSERT INTO category VALUES('C_1', '중등국어');
INSERT INTO category VALUES('C_2', '중등수학');
INSERT INTO category VALUES('C_3', '중등영어');
INSERT INTO category values('C_4', '중등탐구');

DESC category;

SELECT * FROM category;

COMMIT;

-- ==============================================================================================================================

CREATE TABLE bookbuy(
                        bbno INT PRIMARY KEY AUTO_INCREMENT,
                        title VARCHAR(300) NOT NULL,
                        content VARCHAR(1000) NOT NULL,
                        author INT,
                        regdate DATETIME DEFAULT CURRENT_TIME,
                        cnt INT DEFAULT 0,
                        FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

INSERT INTO bookbuy VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'샘플 글 제목5  입니다.','여기는 샘플 글 5의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'샘플 글 제목6  입니다.','여기는 샘플 글 6의 내용입니다.',1,DEFAULT, DEFAULT);

desc bookbuy

select * from bookbuy

-- ==============================================================================================================================

CREATE TABLE booksell(
                         bsno INT PRIMARY KEY AUTO_INCREMENT,
                         title VARCHAR(300) NOT NULL,
                         content VARCHAR(1000) NOT NULL,
                         author INT,
                         regdate DATETIME DEFAULT CURRENT_TIME,
                         cnt INT DEFAULT 0,
                         FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

INSERT INTO booksell VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'샘플 글 제목5  입니다.','여기는 샘플 글 5의 내용입니다.',1,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'샘플 글 제목6  입니다.','여기는 샘플 글 6의 내용입니다.',1,DEFAULT, DEFAULT);

desc booksell

select * from booksell

-- ==============================================================================================================================
--
CREATE TABLE qna(
                    qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
                    title VARCHAR(100) NOT NULL,   					-- 제목
                    content VARCHAR(10000) NOT NULL,   				-- 내용`
                    author VARCHAR(16),   								-- 작성자
                    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
                    lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
                    par INT DEFAULT 0
);