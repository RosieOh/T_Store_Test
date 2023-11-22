create database team55;


-- 윈도우 노트북 한글 인코딩 안될 때 사용
ALTER DATABASE team55 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use team55;

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
insert into euser values(DEFAULT, 'admin', '1234', '관리자', 'admin@legonego.com', '서울 구로구 1', '010-1234-5678', DEFAULT, 'ADMIN', default, DEFAULT);
insert into euser values(DEFAULT, 'sirious920', '1234', '오레오', 'sirious920@naver.com', '서울 관악구1', '010-1234-5678', DEFAULT, 'TEACHER', default, DEFAULT);
insert into euser values(DEFAULT, 'xogns920', '1234', '오레오', 'sfsdfsfs@naver.com', '서울 관악구2', '010-1234-5678', DEFAULT, 'TEACHER', default, DEFAULT);
insert into euser values(DEFAULT, 'test1', '1234', '테스트1', 'test1@edu.com', '서울 관악구 3', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
insert into euser values(DEFAULT, 'test2', '1234', '테스트2', 'test2@edu.com', '서울 관악구 4', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
insert into euser values(DEFAULT, 'test3', '1234', '테스트3', 'test3@edu.com', '서울 관악구 5', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
INSERT INTO euser VALUES(DEFAULT, 'sksmsdlskgus', '1234', '이나현', 'dlskgus@edu.com', '서울 관악구 6', '010-1234-5679', DEFAULT, 'TEACHER', default, DEFAULT);


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


INSERT INTO faq VALUES (DEFAULT,'[스미싱] 알 수 없는 번호로 채팅 메시지를 받았어요.','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);

INSERT INTO faq VALUES (DEFAULT,'[배송일정] 주문한 상품은 언제 배송되나요?','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);


INSERT INTO faq VALUES (DEFAULT,'[상품파손] 배송 받은 상품이 파손되었어요.','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);

INSERT INTO faq VALUES (DEFAULT,'[배송완료미수령] 상품을 받지 못했는데 배송완료로 확인됩니다.','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);

INSERT INTO faq VALUES (DEFAULT,'[취소] 배송 전 주문을 취소했는데, 상품이 배송됐습니다.','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);

INSERT INTO faq VALUES (DEFAULT,'[분쟁처리] 분쟁처리절차는 어떻게 되나요?','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);

INSERT INTO faq VALUES (DEFAULT,'[세금계산서] 세금계산서를 발급받고 싶어요','※ 피싱 및 스미싱 사기에 주의하시기 바랍니다.
<br>
－티셀파 및 티셀파 직원 사칭 포함, 티셀파의 배송과 관련이 없는 메시지 (예: 주식종목, 재난후원 등)

<br/>
<br/>
010-7329-7484(티셀파 공식 번호)로 발송되었는지 확인해주시기 바랍니다. 다른 번호로 티셀파 관련 문자를 수신한 경우, 절대 문자 내 링크를 클릭하거나 해당 번호로 연락하지 마시고 쿠팡 고객센터로 연락해주시기 바랍니다.



티셀파 고객센터
<br/><br/>
• 전화번호 : 010-7329-7484
<br/>
• 운영시간 : 365일 24시간 연중무휴
<br/>
• 전화 문의가 어려우신 경우, 채팅 상담 또는 에 의견을 남겨주시기 바랍니다.

<br/><br/>

※ 휴대폰 소액결제 내역을 확인하고 통신사에 소액결제 사용중지를 요청하시기 바랍니다.
<br/>
※ 만약 링크를 클릭하여 피해가 발생하였다면, 아래 신고 기관으로 신고하시기 바랍니다.

 <br/><br/>

[신고기관]
<br/>
ECRM 경찰청 사이버범죄 신고시스템
<br/>
• (국번 없이) 182
<br/>
• KISA 인터넷 침해 대응센터
<br/>
• (국번 없이) 118
<br/>
• KISA 불법스팸 대응센터
<br/>
• (국번 없이) 118', DEFAULT);

SELECT * FROM faq;

COMMIT;

DROP TABLE faq;
-- ==========================================================
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
                        visit INT DEFAULT 0,
                        FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

INSERT INTO bookbuy VALUES (DEFAULT,'리액트 200제 구매원합니다.','리액트 200제 구매원합니다.<br/><br/> 희망 가격 12,000원 <br/><br/>선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'자바 웹을 다루는 기술  구매원합니다.','자바 웹을 다루는 기술 구매원합니다.<br/><br/> 희망 가격 : 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'스프링 부트 퀵스타트 구매원합니다.','스프링 부트 퀵스타트 구매원합니다.<br/><br/> 희망 가격: 12,000원<br/><br/>선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'Do it HTML5+CSS3 웹 표준의 정석 구매원합니다.','Do it HTML5+CSS3 웹 표준의 정석  구매 원합니다.<br/><br/> 희망 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'실전 스프링 부트 (기본 개념부터 실무 베스트 프랙티스, 그리고 GraalVM, GraphQL, R소켓 등 최신 기술까지) 구매원합니다.','실전 스프링 부트 (기본 개념부터 실무 베스트 프랙티스, 그리고 GraalVM, GraphQL, R소켓 등 최신 기술까지) 구매원합니다.<br/><br/> 희망 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'코딩 자율학습 스프링 부트 3 자바 백엔드 개발 입문 (만들면서 배우는 친절한 백엔드 개발 자습서) 구매원합니다.','코딩 자율학습 스프링 부트 3 자바 백엔드 개발 입문 (만들면서 배우는 친절한 백엔드 개발 자습서) 구매원합합니다.<br/><br/> 희망 가가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'스프링 부트 3 백엔드 개발자 되기: 자바 편 (JPA + OAuth2 + JWT + AWS와 배우는 스프링 부트 3 자바 백엔드 입문자를 위한 풀 패키지) 구매원합니다.','스프링 부트 3 백엔드 개발자 되기: 자바 편 (JPA + OAuth2 + JWT + AWS와 배우는 스프링 부트 3 자바 백엔드 입문자를 위한 풀 패키지) 구매원합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'코드로 배우는 리액트 (회사에서 개발할 때 쓰는 리액트와 스프링 부트) 구매원합니다.','코드로 배우는 리액트 (회사에서 개발할 때 쓰는 리액트와 스프링 부트) 구매원합니다.<br/><br/> 희망 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'스프링 부트 2.0 (마이크로서비스와 리액티브 프로그래밍) 구매원합니다.','	스프링 부트 2.0 (마이크로서비스와 리액티브 프로그래밍) 구매원매합니다.<br/><br/>희망 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'스타트 스프링 부트 (초급 개발자들을 위한 가볍고 넓은 스프링 부트) 판매합니다.','스타트 스프링 부트 (초급 개발자들을 위한 가볍고 넓은 스프링 부트) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'스프링 부트 하루만에 배우기 (스프링 부트로 개발하는 웹 서비스 기초) 판매합니다.','스프링 부트 하루만에 배우기 (스프링 부트로 개발하는 웹 서비스 기초)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'배워서 바로 쓰는 스프링 부트 2 (DB 액세스부터 도커를 활용한 개발까지, 실무에 바로 써먹는 스프링 부트 2 마스터하기) 판매합니다.','배워서 바로 쓰는 스프링 부트 2 (DB 액세스부터 도커를 활용한 개발까지, 실무에 바로 써먹는 스프링 부트 2 마스터하기) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'스프링 부트 핵심 가이드 (스프링 부트를 활용한 애플리케이션 개발 실무) 판매합니다.','스프링 부트 핵심 가이드 (스프링 부트를 활용한 애플리케이션 개발 실무) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'모던 리액트 Deep Dive (리액트의 핵심 개념과 동작 원리부터 Next.js까지, 리액트의 모든 것) 판매합니다.','모던 리액트 Deep Dive (리액트의 핵심 개념과 동작 원리부터 Next.js까지, 리액트의 모든 것)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'우아한 타입스크립트 with 리액트 (배달의민족 개발 사례로 살펴보는 우아한형제들의 타입스크립트와 리액트 활용법) 판매합니다.','	우아한 타입스크립트 with 리액트 (배달의민족 개발 사례로 살펴보는 우아한형제들의 타입스크립트와 리액트 활용법)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'리액트 16 (리액트를 사용한 고급 웹앱 클라이언트 제작)판매합니다.','리액트 16 (리액트를 사용한 고급 웹앱 클라이언트 제작) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'리액트 (반응을 바꾸면 세상이 달라진다) 판매합니다.','리액트 (반응을 바꾸면 세상이 달라진다) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'리액트를 다루는 기술 (입문부터 대규모 애플리케이션까지 한 권으로) 판매합니다.','리액트를 다루는 기술 (입문부터 대규모 애플리케이션까지 한 권으로)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'리액트 교과서 (React, JSX, Redux, GraphQL, Jest, 서버 사이드 렌더링) 판매합니다.','리액트 교과서 (React, JSX, Redux, GraphQL, Jest, 서버 사이드 렌더링)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'리액트 인 액션 (기초부터 제대로 배우는) 판매합니다.','리액트 인 액션 (기초부터 제대로 배우는)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO bookbuy VALUES (DEFAULT,'프로 리액트 (React.js를 이용한 모던 프런트엔드 구축)석 판매합니다.','프로 리액트 (React.js를 이용한 모던 프런트엔드 구축) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);

desc bookbuy

select * from bookbuy;


DROP TABLE bookbuy;
-- ==============================================================================================================================

CREATE TABLE booksell(
                         bsno INT PRIMARY KEY AUTO_INCREMENT,
                         title VARCHAR(300) NOT NULL,
                         content VARCHAR(1000) NOT NULL,
                         author INT,
                         regdate DATETIME DEFAULT CURRENT_TIME,
                         visit INT DEFAULT 0,
                         FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

INSERT INTO booksell VALUES (DEFAULT,'리액트 200제 판매합니다.','리액트 200제 판매합니다.<br/><br/> 가격 12,000원 <br/><br/>선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'자바 웹을 다루는 기술  판매합니다.','자바 웹을 다루는 기술 판매합니다.<br/><br/> 가격 : 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'스프링 부트 퀵스타트 판매합니다.','스프링 부트 퀵스타트  판매합니다.<br/><br/> 가격: 12,000원<br/><br/>선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'Do it HTML5+CSS3 웹 표준의 정석 판매합니다.','Do it HTML5+CSS3 웹 표준의 정석  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'실전 스프링 부트 (기본 개념부터 실무 베스트 프랙티스, 그리고 GraalVM, GraphQL, R소켓 등 최신 기술까지) 판매합니다.','실전 스프링 부트 (기본 개념부터 실무 베스트 프랙티스, 그리고 GraalVM, GraphQL, R소켓 등 최신 기술까지) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'코딩 자율학습 스프링 부트 3 자바 백엔드 개발 입문 (만들면서 배우는 친절한 백엔드 개발 자습서) 판매합니다.','코딩 자율학습 스프링 부트 3 자바 백엔드 개발 입문 (만들면서 배우는 친절한 백엔드 개발 자습서) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'스프링 부트 3 백엔드 개발자 되기: 자바 편 (JPA + OAuth2 + JWT + AWS와 배우는 스프링 부트 3 자바 백엔드 입문자를 위한 풀 패키지) 판매합니다.','스프링 부트 3 백엔드 개발자 되기: 자바 편 (JPA + OAuth2 + JWT + AWS와 배우는 스프링 부트 3 자바 백엔드 입문자를 위한 풀 패키지) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'코드로 배우는 리액트 (회사에서 개발할 때 쓰는 리액트와 스프링 부트) 판매합니다.','코드로 배우는 리액트 (회사에서 개발할 때 쓰는 리액트와 스프링 부트) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'스프링 부트 2.0 (마이크로서비스와 리액티브 프로그래밍) 판매합니다.','	스프링 부트 2.0 (마이크로서비스와 리액티브 프로그래밍) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'스타트 스프링 부트 (초급 개발자들을 위한 가볍고 넓은 스프링 부트) 판매합니다.','스타트 스프링 부트 (초급 개발자들을 위한 가볍고 넓은 스프링 부트) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'스프링 부트 하루만에 배우기 (스프링 부트로 개발하는 웹 서비스 기초) 판매합니다.','스프링 부트 하루만에 배우기 (스프링 부트로 개발하는 웹 서비스 기초)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'배워서 바로 쓰는 스프링 부트 2 (DB 액세스부터 도커를 활용한 개발까지, 실무에 바로 써먹는 스프링 부트 2 마스터하기) 판매합니다.','배워서 바로 쓰는 스프링 부트 2 (DB 액세스부터 도커를 활용한 개발까지, 실무에 바로 써먹는 스프링 부트 2 마스터하기) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'스프링 부트 핵심 가이드 (스프링 부트를 활용한 애플리케이션 개발 실무) 판매합니다.','스프링 부트 핵심 가이드 (스프링 부트를 활용한 애플리케이션 개발 실무) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'모던 리액트 Deep Dive (리액트의 핵심 개념과 동작 원리부터 Next.js까지, 리액트의 모든 것) 판매합니다.','모던 리액트 Deep Dive (리액트의 핵심 개념과 동작 원리부터 Next.js까지, 리액트의 모든 것)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'우아한 타입스크립트 with 리액트 (배달의민족 개발 사례로 살펴보는 우아한형제들의 타입스크립트와 리액트 활용법) 판매합니다.','	우아한 타입스크립트 with 리액트 (배달의민족 개발 사례로 살펴보는 우아한형제들의 타입스크립트와 리액트 활용법)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'리액트 16 (리액트를 사용한 고급 웹앱 클라이언트 제작)판매합니다.','리액트 16 (리액트를 사용한 고급 웹앱 클라이언트 제작) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'리액트 (반응을 바꾸면 세상이 달라진다) 판매합니다.','리액트 (반응을 바꾸면 세상이 달라진다) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'리액트를 다루는 기술 (입문부터 대규모 애플리케이션까지 한 권으로) 판매합니다.','리액트를 다루는 기술 (입문부터 대규모 애플리케이션까지 한 권으로)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'리액트 교과서 (React, JSX, Redux, GraphQL, Jest, 서버 사이드 렌더링) 판매합니다.','리액트 교과서 (React, JSX, Redux, GraphQL, Jest, 서버 사이드 렌더링)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'리액트 인 액션 (기초부터 제대로 배우는) 판매합니다.','리액트 인 액션 (기초부터 제대로 배우는)  판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);
INSERT INTO booksell VALUES (DEFAULT,'프로 리액트 (React.js를 이용한 모던 프런트엔드 구축)석 판매합니다.','프로 리액트 (React.js를 이용한 모던 프런트엔드 구축) 판매합니다.<br/><br/> 가격: 12,000원<br/><br/> 선 채팅 후 네고주세요.',2,DEFAULT, DEFAULT);

desc booksell;

select * from booksell;

DROP TABLE booksell;

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


