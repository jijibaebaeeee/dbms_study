-- 테이블 생성(DDL)
CREATE TABLE TBL_MEMBER(
	MEMBER_ID NUMBER,
	MEMBER_NAME VARCHAR2(100),
	MEMBER_AGE NUMBER(3)
);


SELECT * FROM tbl_member;

-- 데이터 추가
INSERT INTO TBL_MEMBER 
values(1, '배지수', 26);

INSERT INTO TBL_MEMBER 
values(2, '신짱구', 5);

INSERT INTO TBL_MEMBER
values(3, '신짱아', 2);

DELETE FROM TBL_MEMBER
WHERE member_name = '배지수';

INSERT INTO TBL_MEMBER(MEMBER_ID,MEMBER_NAME)
VALUES(4, '유리');

INSERT INTO TBL_MEMBER(MEMBER_AGE)
VALUES(5);

-- 데이터 수정 UPDATE
UPDATE TBL_MEMBER 
SET MEMBER_AGE = 5;

UPDATE TBL_MEMBER 
SET MEMBER_ID = 1
WHERE MEMBER_ID = 25;

UPDATE TBL_MEMBER 
SET MEMBER_AGE = 2
WHERE MEMBER_NAME = '신짱아';

-- 값삭제
SELECT * FROM tbl_member;

DELETE FROM TBL_MEMBER
WHERE MEMBER_age = 5;

DELETE FROM TBL_MEMBER;








-- 학생 테이블 생성
CREATE TABLE TBL_STUDENT(
--	컬럼명 데이터타입
	STUDENT_NUMBER NUMBER,
	STUDENT_NAME VARCHAR2(1000),
	STUDENT_MATH NUMBER,
	STUDENT_ENG NUMBER,
	STUDNET_KOR NUMBER,
	STUDNET_GRADE VARCHAR2(100)
);


SELECT * FROM TBL_STUDENT ts ;

/*학생 테이블에 데이터 추가
 * 학생번호 이름 수학 영어 국어
 * 1. 김철수 90 90 90
 * 2. 홍길동 70 25 55
 * 3. 이유리 89 91 77
 * 4. 김웅이 48 100 100
 * 5. 신짱구 50 10 NULL
 * */

INSERT INTO TBL_STUDENT(STUDENT_NUMBER ,STUDENT_NAME, STUDENT_MATH, STUDENT_ENG, STUDNET_KOR)
VALUES(1, '김철수', 90, 90, 90);

--INSERT INTO TBL_STUDENT(STUDENT_NUMBER ,STUDENT_NAME, STUDENT_MATH, STUDENT_ENG, STUDNET_KOR)
VALUES(2, '홍길동', 70, 25, 55);

--INSERT INTO TBL_STUDENT(STUDENT_NUMBER ,STUDENT_NAME, STUDENT_MATH, STUDENT_ENG, STUDNET_KOR)
VALUES(3, '이유리', 89, 91, 77);

--INSERT INTO TBL_STUDENT(STUDENT_NUMBER ,STUDENT_NAME, STUDENT_MATH, STUDENT_ENG, STUDNET_KOR)
VALUES(4, '김웅이', 48, 100, 100);

INSERT INTO TBL_STUDENT(STUDENT_NUMBER ,STUDENT_NAME, STUDENT_MATH, STUDENT_ENG)
VALUES(5, '신짱구', 50, 10);

SELECT * FROM TBL_STUDENT;

DELETE FROM TBL_STUDENT
WHERE STUDENT_NUMBER = 5;

-- 전체 학생의 이름과 평균점수 조회하기(별칭도 추가)

--INSERT INTO tbl
SELECT student_name 이름, (student_math + student_eng + STUDNET_KOR)/3 평균점수
FROM TBL_STUDENT;

SELECT * FROM TBL_STUDENT;

-- NVL(컬럼명, 기본값) : NULL값을 특정 값으로 변경
-- NVL은 기존 타입의 값이 있기 때문에 타입을 변경하게 되면 하나의 컬럼에 두개의 타입이 존재하게된다.
SELECT student_name 이름, NVL(Studnet_kor, 0) 국어점수, NVL(STUDNET_GRADE, '미정') 학점 
FROM TBL_STUDENT;

-- NVL2(컬럼명, 값1, 값2) : NULL 여부에 따라 NULL이 아니면 값1, NULL이면 값2
-- 하나의 컬럼에는 하나의 타입의 값만 들어갈 수 있다. 따라서 NULL인 값과 NULL이 아닌 값이 모두 문자이므로 가능하다
SELECT student_name 이름, NVL2(STUDNET_KOR, '점수있음', '점수없음') 국어점수
--SELECT student_name 이름, NVL2(STUDNET_KOR, '점수있음', 0) 국어점수 -> 기존의 테이블에 KOR 열은 숫자가 저장되어 있으므로. NULL 일때 숫자 0은 처리가 된다.?
--																  VARCHAR2와 NUMBER가 있으면 VARCHAR2가 먼저?  NVL2(STUDNET_KOR, 0, '점수 없음') <- 얘도 VARCHAR2 + NUMBER인데.
--																										 그러면 제일 먼저 만나는 놈의 타입으로 컬럼이 바뀌나보다로 생각하자

-- NULLIF(컬럼명, 값1) : 특정값과 같으면 NULL로 변경
SELECT student_name 이름, nullIF(STUDNET_KOR, 100)
FROM TBL_STUDENT;

-- NULLIF(컬럼1, 컬럼2) : 두 컬럼의 값이 같으면 NULL로 변경, 값이 다르면 기존 값 출력
SELECT student_name 이름, NULLIF (student_math, student_eng)
FROM TBL_STUDENT;

-- COALESCE(값1, 값2, 값3) : NULL이 아닌 첫번째 값을 반환
SELECT STUDENT_NAME 이름, COALESCE (studnet_kor, student_eng, student_math, 0) AS 첫번째점수
FROM TBL_STUDENT;

SELECT * FROM TBL_STUDENT;

FROM TBL_STUDENT;


-- 수정 UPDATE

--UPDATE 테이블명
--SET 컬럼명 = 값
--WHERE 행을 찾을 조건

--★★★★★★★★★★
UPDATE TBL_STUDENT 
SET STUDNET_KOR = nvl(STUDNET_KOR, 0)
--WHERE 절이 필요없다.

--학생의 평균점수를 구하고 학점 수정하기
-- A : 90점 이상
-- B : 80점 이상 90점 미만
-- C : 50점 이상 80점 미만
-- F : 50점 미만
--BETWEEN AND? -> 불가능. 미만있음

-- ROUND(값, 자리수) : ROUND 함수는 소수점을 반올림하여 특정 소수점 까지만 표현할 수 있다.
-- ROUND(평균점수 구하는 공식 >= 90) 

UPDATE TBL_STUDENT
SET STUDNET_GRADE = 'A'
WHERE (student_math + student_eng + STUDNET_KOR) / 3 >= 90;

SELECT * FROM TBL_STUDENT;

UPDATE TBL_STUDENT
SET STUDNET_GRADE = 'B'
WHERE (student_math + student_eng + STUDNET_KOR) / 3 < 90 AND 
	(student_math + student_eng + STUDNET_KOR) / 3 >= 80;


UPDATE TBL_STUDENT
SET STUDNET_GRADE = 'C'
WHERE (student_math + student_eng + STUDNET_KOR) / 3 < 80 AND 
	(student_math + student_eng + STUDNET_KOR) / 3 >= 50;

UPDATE TBL_STUDENT
SET STUDNET_GRADE = 'F'
WHERE (student_math + student_eng + STUDNET_KOR) / 3 < 50;




SELECT * FROM TBL_STUDENT;

-- Q1. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 50점미만이 아니고 -> 모든과목이 50점 이상이고
-- 학점이 B이상인 학생만 학생번호, 이름, 학점으로 별칭 붙여서 출력하기

-- Q2. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 30점 미만이면 테이블에서 삭제하기
--								모든 과목이 30점 이상이 아닌 학생을 삭제하기

--Q1
SELECT student_number 학생번호, student_name 이름, studnet_grade 학점
FROM TBL_STUDENT
WHERE (STUDENT_MATH >= 50 AND STUDENT_ENG >= 50 AND STUDENT_KOR >= 50) AND 
	STUDNET_GRADE = 'B' OR STUDNET_GRADE = 'A';
	

--Q2
DELETE FROM TBL_STUDENT
WHERE NOT (student_math >= 30 AND student_eng >= 30 AND student_kor >=30);

SELECT * FROM TBL_STUDENT;






