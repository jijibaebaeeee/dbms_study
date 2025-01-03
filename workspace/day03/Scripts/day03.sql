-- 2. DDL

CREATE TABLE TBL_USER(
	USER_NAME VARCHAR2(100),
	USER_AGE NUMBER
);

SELECT * FROM TBL_USER;
SELECT * FROM TBL_MY_USER;

-- 테이블명 수정
--ALTER TABLE 테이블명 RENAME TO 새로운 테이블명;
--ALTER TABLE TBL_USER RENAME TO TBL_MY_USER;


-- 컬럼명 수정
-- ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 새로운컬럼명;
ALTER TABLE TBL_MY_USER RENAME COLUMN USER_NAME TO user_nickname;

-- 컬럼 타입 수정
-- ALTER TABLE 테이블명 MODIFY(컬럼명 자료형(용량));
ALTER TABLE TBL_MY_USER MODIFY(USER_NICKNAME VARCHAR2(500));

-- 컬럼 추가
-- ALTER TABLE 테이블명 ADD(컬럼명 자료형(용량));
ALTER TABLE TBL_MY_USER ADD(USER_GENDER CHAR(1));
ALTER TABLE TBL_MY_USER ADD(USER_HOBBY VARCHAR2(100));

SELECT * FROM  TBL_MY_USER;

-- 데이터 삽입 INSERT INTO
INSERT INTO TBL_MY_USER
VALUES('짱구', 5, 'M', '액션가면보기');

-- 컬럼 삭제
ALTER TABLE TBL_MY_USER DROP COLUMN USER_GENDER;

SELECT * FROM  TBL_MY_USER;

INSERT INTO TBL_MY_USER
values('철수', 5, '공부하기');

-- 데이터 전부 삭제 TRUNCATE
TRUNCATE TABLE TBL_MY_USER;

-- DELETE -> DML 트랜잭션으로 롤백이 가능

DELETE FROM TBL_MY_USER;

-- 테이블 삭제
DROP TABLE TBL_MY_USER;



-- [실습] 자동차 테이블 생성 TBL_CAR
-- 자동차 번호 NUMBER 숫자
-- 자동차 이름 NAME 문자(1000)
-- 자동차 브랜드 BRAND 문자(1000)
-- 출시 날짜 RELEASEDATE
-- 색상 COLOR 문자(1000)
-- 가격 PRICE 숫자

CREATE TABLE TBL_CAR(
	CAR_NUMBER NUMBER CONSTRAINT PK_CAR PRIMARY KEY,
	CAR_NAME VARCHAR2(1000),
	CAR_BRAND VARCHAR2(1000),
	CAR_RELEASEDATE DATE,
	CAR_COLOR VARCHAR2(1000),
	CAR_PRICE NUMBER
);

SELECT * FROM TBL_CAR;

INSERT INTO TBL_CAR
VALUES();

ALTER TABLE TBL_CAR RENAME COLUMN CAR_PIRCE TO CAR_PRICE;

DROP TABLE TBL_MEMBER;
DROP TABLE TBL_STUDENT;
DROP TABLE TBL_CAR;


--제약 조건 추가
--ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건이름(PK_테이블명) PRIMARY KEY(컬럼명);
ALTER TABLE TBL_CAR  ADD CONSTRAINT PK_CAR PRIMARY KEY(CAR_NUMBER);
--TBL_CAR 테이블 수정하겠다/ 추가할거야 제약조건을 이름은 PK_CAR고/ 해당 컬럼은 CAR_NUMBER
-- ALTER TABLE TBL_CAR : TBL_CAR 테이블을 수정하겠다 
-- ADD : 추가하다
-- CONSTRAINT : 제약조건
-- PK_CAR PRIMARY KEY(CAR_NUMBER) : PK_CAR 이름으로 PRIMARY KEY라는(PK) 제약조건을 CAR_NUMBER 컬럼에

-- 제약 조건 해지
ALTER TABLE TBL_CAR DROP CONSTRAINT PK_CAR;

ALTER TABLE TBL_CAR ADD 

DROP TABLE TBL_CAR;


-- 동물 테이블 TBL-ANIMAL
-- 고유번호 NUMBER
-- 종류 KIND
-- 나이 AGE
-- 먹이 FEED
-- 1. 테이블 조회 후 TBL_ANIMAL 테이블의 제약조건 및 관계도 확인
-- 2. 제약조건 추가 테이블 생성 후 추가(PK)
-- 3. 컬럼 추가 성별(GENDER 문자(1))
-- 4. 컬럼 이름 수정(고유번호) NUMBER -> ID로 변경
-- 5. 컬럼 삭제(먹이)
-- 6. 컬럼 수정(종류컬럼을 자료형 NUMBER로 설정)


CREATE TABLE TBL_ANIMAL(
	ANIMAL_NUMBER NUMBER,
	ANIMAL_KIND VARCHAR2(2),
	ANIMAL_AGE NUMBER,
	ANIMAL_FEED VARCHAR2(100)
);

-- 열을 건드는 순간 ALTER 연결 (열 추가, 열 삭제, 열 타입 변경, 열 제약조건 추가 삭제 등...)
ALTER TABLE TBL_ANIMAL ADD CONSTRAINT ANIMAL_NUM PRIMARY KEY(ANIMAL_NUMBER);

ALTER TABLE TBL_ANIMAL ADD(ANIMAL_GENDER CHAR(1));

ALTER TABLE TBL_ANIMAL RENAME COLUMN ANIMAL_NUMBER TO ANIMAL_ID;

ALTER TABLE TBL_ANIMAL DROP COLUMN ANIMAL_FEED;

ALTER TABLE TBL_ANIMAL MODIFY(ANIMAL_KIND NUMBER);

SELECT * FROM TBL_ANIMAL;


-- <제약조건 변경해주기> ★★★
-- 오라클에서는 RENAME CONSTRAINT 
--ALTER TABLE TBL_ANIMAL RENAME CONSTRAINT ANIMAL_ID PRIMARY KEY()

INSERT INTO TBL_ANIMAL
VALUES(1, 1, 5, 'F');

--INSERT INTO TBL_ANIMAL 
--VALUES(NULL, 1, 5, 'F'); -- ANIMAL_ID가 PK라서 NULL을 허용하지 않음

--INSERT INTO TBL_ANIMAL 
--VALUES(1, 1, 5, 'F'); -- ANIMAL_ID가 PK라서 중복을 허용하지 않음

DROP TABLE TBL_ANIMAL;
DROP TABLE TBL_CAR;

-- FK 설정
-- 학교 테이블
CREATE TABLE TBL_SCHOOL(
	SCHOOL_NUMBER NUMBER CONSTRAINT PK_SCHOOL PRIMARY KEY,
	SCHOOL_NAME VARCHAR2(1000)
);

SELECT * FROM TBL_SCHOOL;

-- 학생 테이블
CREATE TABLE TBL_STUDENT(
	STUDENT_NUMBER NUMBER,
	STUDENT_NAME VARCHAR2(1000),
	STUDENT_AGE NUMBER,
	SCHOOL_NUMBER NUMBER,
	CONSTRAINT PK_STUDENT PRIMARY KEY(STUDENT_NUMBER),
	CONSTRAINT FK_STUDENT FOREIGN KEY(SCHOOL_NUMBER) REFERENCES TBL_SCHOOL(SCHOOL_NUMBER)
);


SELECT * FROM TBL_SCHOOL;

SELECT * FROM TBL_STUDENT;

DROP TABLE TBL_STUDENT;



DROP TABLE TBL_ANIMAL;

ALTER TABLE TBL_ANIMAL DROP CONSTRAINT ANI_NUM;

ALTER TABLE TBL_ANIMAL ADD CONSTRAINT ANI_NUM PRIMARY KEY(TBL_ANIMAL);


-- 상위 테이블의 값부터 채워준다.
INSERT INTO TBL_SCHOOL
--VALUES(1, 'DBMS 고등학교');
--VALUES(2, 'JAVA 고등학교');
VALUES(3, 'PYTHON 고등학교');


-- 하위 테이블의 값을 채워준다.
INSERT INTO TBL_STUDENT
--VALUES(1, '김철수', 17, 5); -- 오류 발생! FK인 SCHOOL_NUMBER에 존재하지 않는 값을 저장하려하면 오류가 발생한다.
--VALUES(1, '김철수', 17, 1);
--VALUES(2, '신유리', 17, 1);
--VALUES(3, '신짱구', 18, 2);
VALUES(4, '최영', 19, 3);

-- 제약조건 UK(UNIQUE) -> 고유한 값이지만 NULL 허용
-- 학생테이블 STU
CREATE TABLE TBL_STU(
	STU_NUMBER NUMBER,
	STU_NAME VARCHAR2(1000),
	STU_MAJOR VARCHAR2(100),
	STU_ID NUMBER,
	STU_GENDER CHAR(1) DEFAULT 'M' NOT NULL CONSTRAINT CHECK_GEN CHECK(STU_GENDER = 'M' OR STU_GENDER = 'W'),
	CONSTRAINT PK_STU PRIMARY KEY(STU_NUMBER),
	CONSTRAINT UK_STU UNIQUE(STU_ID)
);


-- STU_GENDER CHAR(1) DEFAULT 'M' NOT NULL CHECK(STU_GENDER = 'M' OR STU_GENDER = 'W')
-- DEFAULT 'M' : 데이터가 들어오지 않으면 'M'이 기본값으로 들어가게 설정한다. 
-- NOT NULL : 디폴트값을 'M'로 설정했으니 NULL값을 강제로 넣는 것을 막기위해 사용하는 제약조건
-- CHECK(STU_GENDER = 'M' OR STU_GENDER = 'W') 이 컬럼의 값은 M 또는 W만 들어오도록 하는 제약조건

DROP TABLE TBL_STU;

SELECT * FROM TBL_STU;

INSERT INTO TBL_STU(STU_NUMBER, STU_NAME, STU_MAJOR, STU_ID)
VALUES(1, '짱구', NULL, '1111');

INSERT INTO TBL_STU
--VALUES(2, '철수', '컴공', '222', 'M');
VALUES(3, '유리', '컴공', '333', 'W');


-- 조합키
-- PK를 두개의 컬럼으로 조합하여 설정하는 것을 의미
CREATE TABLE TBL_FLOWER(
	FLOWER_NAME VARCHAR2(1000),
	FLOWER_COLOR VARCHAR2(1000),
	FLOWER_PRICE NUMBER,
	CONSTRAINT PK_FLOWER PRIMARY KEY(FLOWER_NAME, FLOWER_COLOR)
);

INSERT INTO TBL_FLOWER
VALUES('튤립', '노랑', 9000);
INSERT INTO TBL_FLOWER
VALUES('튤립', '빨강', 9000);
INSERT INTO TBL_FLOWER
VALUES('튤립', '파랑', 9000);

SELECT * FROM TBL_FLOWER;

INSERT INTO TBL_FLOWER
VALUES('해바라기', '노랑', 9000);
INSERT INTO TBL_FLOWER
VALUES('해바라기', '빨강', 9000);
INSERT INTO TBL_FLOWER
VALUES('해바라기', '파랑', 9000);


CREATE TABLE TBL_USER(
	USER_NUM NUMBER,
	USER_NAME VARCHAR2(1000),
	USER_AGE NUMBER,
	USER_PHONE_NUM VARCHAR2(1000),
	USER_ADDRESS VARCHAR2(1000),
	CONSTRAINT PK_USER PRIMARY KEY(USER_NUM)
);

CREATE TABLE TBL_BOOK(
	BOOK_NUM NUMBER,
	BOOK_NAME VARCHAR2(1000),
	BOOK_GENRE NUMBER,
	CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_NUM)
);

CREATE TABLE TBL_CHECK(
	USER_NUM NUMBER,
	BOOK_NUM NUMBER,
	CONSTRAINT FK_USER FOREIGN KEY(USER_NUM) REFERENCES TBL_USER(USER_NUM),
	CONSTRAINT FK_BOOK FOREIGN KEY(BOOK_NUM) REFERENCES TBL_BOOK(BOOK_NUM)
);

ALTER TABLE TBL_CHECK ADD CONSTRAINT PK_COM PRIMARY KEY(USER_NUM, BOOK_NUM);

CREATE SEQUENCE SEQ_USER;

INSERT INTO TBL_USER
--VALUES(SEQ_USER.NEXTVAL, '짱구', 5);
VALUES(SEQ_USER.NEXTVAL, '철수', 5);



