-- SELECT : 테이블에서 데이터를 조회할 때 사용하는 명령어
-- hr 계정 내에 존재하는 employees 테이블 
-- 107행, 11개의 컬렴(열)으로 이루어져있다
-- 107명의 직원 데이터를 저장해 놓은 연습용 테이블

-- SELECT 컬럼명 FROM 테이블명;
-- 해당 테이블에서 특정 컬럼을 선택해서 조회하겠다는 의미


SELECT first_name FROM HR.EMPLOYEES;
SELECT first_name FROM EMPLOYEES;
-- HR 계정을 작성하는 이유는 여러 계정에 같은 이름의 테이블 이름이 존재할 수 있기 때문이다.
-- 지금 로그인한 계정의 테이블의 우선순위가 높기 때문에 일반적으로 계정명을 생략이 가능하다.


SELECT * FROM EMPLOYEES;

-- 아래 두개의 결과는 다르다(select 뒤에 작성된 컬럼명 대로 Result 테이블에 표시된다)
SELECT first_name, LAST_NAME FROM EMPLOYEES;
SELECT LAST_NAME, first_name FROM EMPLOYEES;

-- 사원의 이름(first_name) 성(last_name), 급여(salary)를 조회하기
SELECT first_name, last_name, salary FROM EMPLOYEES;


-- 정렬해서 조회하기
-- ORDER BY절
-- 사원의 이름, 성, 급여를 급여 낮은 순서부터 조회하기

SELECT first_name, last_name, salary -- 2) first_name, last_name, salary컬럼을 조회하는데
FROM EMPLOYEES  -- 1) EMPLOYEES 테이블에서
ORDER BY salary ASC; -- 3) salary의 오름차순으로 정렬해서
-- ASC : 오름차순(ascending) 앞글자 3글자만 따서 ASC로 사용한다.

-- DESC : 내림차순(descending) 앞글자 4글자를 따서 DESC로 사용한다.

SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

SELECT * FROM employees;

-- 문자의 정렬(first_name)
SELECT first_name
FROM EMPLOYEES
ORDER BY first_name ASC; -- A -> Z

SELECT FIRST_NAME 
FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;



-- 날짜의 정렬(hire_date)
SELECT hire_date
FROM EMPLOYEES
ORDER BY hire_date ASC; -- 예전 -> 최신 순
						-- ASC 생략가능.

SELECT hire_date
FROM EMPLOYEES
ORDER BY hire_date desc; -- 최신 -> 예전


SELECT * FROM EMPLOYEES;


-- ORDER BY절의 컬럼명은 조회하는 컬럼명과 일치하지 않아도 가능하다(해당 테이블에 있는 컬럼이라면)
-- 중복 정렬도 가능하다
-- **ORDER BY 절에는 테이블에만 있는 컬럼이면 뭐든지 가능하다
SELECT first_name, salary
FROM EMPLOYEES
ORDER BY first_name, SALARY;


-- 사원 테이블에서 직급을 조회하기
SELECT job_id
FROM EMPLOYEES;

-- select 다음에 DISTINCT 넣으면 중복제거 가능하다.
-- DISTINCT : 해당 컬럼에서 중복되는 값을 제거한다.

SELECT DISTINCT job_id
FROM EMPLOYEES;


-- 컬럼을 여러개 넣을 때의 DISTINCT
-- 여러 컬럼을 동시에 작성할 경우 두개의 컬럼이 모두 중복되는 경우에만 중복처리한다.(중복을 제거한다.)
SELECT DISTINCT job_id, hire_date
FROM EMPLOYEES;


-- 별칭 붙여 조회하기
SELECT first_name AS "이름", last_name AS "성", salary AS "봉급", employee_id AS "사원 번호"
FROM EMPLOYEES;

-- AS 키워드 생략가능, 별칭에 띄어쓰기가 있으면 "" 생략 불가능
SELECT first_name 이름, last_name 성, salary 봉급, employee_id "사원 번호"
FROM EMPLOYEES;

-- 사원의 이름(first_name), 성(last_name), 봉급을 조회하는데 봉급 내림차순으로 별칭사용하여 조회하기
-- 쿼리문 작성시 순서 1) 조회할 컬럼 생각 -> 별칭 부여 -> 테이블 생각 -> 정렬 생각
-- 쿼리문 실행 순서 FROM -> SELECT -> ORDER BY
SELECT first_name 이름, last_name 성, salary 봉급
FROM EMPLOYEES
ORDER BY 봉급 DESC;


SELECT * FROM EMPLOYEES;



