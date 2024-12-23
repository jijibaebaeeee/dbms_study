SELECT * FROM EMPLOYEES;

--1. 모든 직원의 정보를 조회(단, 이름은 FIRST_NAME과 LAST_NAME을 띄어쓰기로 연결한 값을 이름이라는 별칭으로 표시)
SELECT first_name || ' ' || last_name 이름, EMPLOYEE_ID, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID 
FROM EMPLOYEES;


--2. 모든 직원의 이름(FIRST_NAME)과 급여(SALARY)를 조회
SELECT first_name 이름, salary 급여
FROM EMPLOYEES;

--3. 급여가 5000 이상인 직원들의 EMPLOYEE_ID, FIRST_NAME, SALARY를 조회
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >= 5000;

--4. 현재 날짜와 10일 후의 날짜를 조회(오라클 제공하는 기본 테이블 사용) -> +a 2시간, 30분 ,12시간 30분뒤의 날짜를 조회
SELECT SYSDATE, sysdate + 10
FROM dual;

--5. DEPARTMENT_ID가 50인 직원들의 이름과 부서번호를 조회
SELECT first_name ||' '|| last_name 이름, department_id 부서번호
FROM employees
WHERE DEPARTMENT_ID = 50;

--6. LAST_NAME이 'King'인 직원의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE last_name = 'King';

--7. SALARY가 NULL이 아닌 직원들의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE salary IS NULL;

--8. 직원 테이블의 모든 직책(JOB_ID)을 중복 없이 조회
SELECT DISTINCT job_id
FROM EMPLOYEES;

--9. 급여가 3000에서 7000 사이인 직원의 FIRST_NAME, SALARY를 조회
SELECT first_name, salary
FROM EMPLOYEES
WHERE salary BETWEEN 3000 AND 7000;

--10. 이름의 네 번째 문자가 'e'인 직원의 이름을 조회
SELECT first_name
FROM EMPLOYEES
WHERE first_name LIKE '___e%'

--11. JOB_ID가 'IT_PROG' 또는 'SA_REP'인 직원들의 이름과 직책을 조회
SELECT first_name ||' '|| last_name 이름, JOB_ID 직책
FROM EMPLOYEES
WHERE job_id = 'IT_PROG' OR JOB_ID = 'SA_REP'

--12. 이름(FIRST_NAME)이 'A'로 시작하는 직원들의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%'

--13. SALARY가 10000 이상이고 DEPARTMENT_ID가 90인 직원의 이름과 급여를 조회
SELECT first_name ||' '|| last_name 이름, salary 급여
FROM EMPLOYEES
WHERE salary >= 10000 AND DEPARTMENT_ID = 90;

--14. SALARY가 5000 이하이거나 DEPARTMENT_ID가 30인 직원의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE SALARY <= 5000 OR DEPARTMENT_ID = 30;

--15. LAST_NAME의 두 번째 문자가 'a'인 직원의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE last_name LIKE '_a%'

--16. SALARY를 기준으로 내림차순 정렬한 후 직원의 이름과 급여를 조회
SELECT first_name ||' '|| last_name 이름, salary 급여
FROM EMPLOYEES
ORDER BY 급여 DESC;

--17. 직원의 급여에 10%를 더한 값을 BONUS라는 별칭으로 조회
SELECT first_name ||' '|| last_name 이름, salary * 1.1 BONUS
FROM EMPLOYEES

--18. SALARY가 6000 이상인 직원의 급여와 COMMISSION_PCT를 기준으로 정렬(급여는 내림차순, 커미션은 오름차순)
SELECT first_name ||' '|| last_name 이름, salary 급여, COMMISSION_PCT 
FROM EMPLOYEES
WHERE salary >= 6000 
ORDER BY SALARY DESC, COMMISSION_PCT ASC;

--19. 이름이 'A'로 시작하고 급여가 10000 이상인 직원들의 이름과 급여를 조회
SELECT first_name ||' '|| last_name 이름, salary 급여
FROM EMPLOYEES
WHERE first_name LIKE 'A%' AND salary >= 10000;

--20. 급여가 10000 이상 15000 이하이고, 부서 ID가 80 또는 90인 직원들의 이름, 급여, 부서 ID를 조회
SELECT first_name || ' ' || last_name 이름, salary 급여, department_id "부서 ID"
FROM EMPLOYEES e 
WHERE (salary BETWEEN 10000 AND 15000) AND (DEPARTMENT_ID = 80 OR DEPARTMENT_ID = 90)

--21. 입사일(HIRE_DATE)로부터 정확히 1년 후의 날짜를 계산하여 입사 1년 후라는 별칭으로 출력
SELECT hire_date 입사일, hire_date + 1*365 "입사 1년 후"
FROM EMPLOYEES



-- Q1. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 50점미만이 아니고 -> 모든과목이 50점 이상이고
-- 학점이 B이상인 학생만 학생번호, 이름, 학점으로 별칭 붙여서 출력하기

-- Q2. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 30점 미만이면 테이블에서 삭제하기
--								모든 과목이 30점 이상이 아닌 학생을 삭제하기

--Q1
SELECT student_number 학생번호, student_name 이름, studnet_grade 학점
FROM TBL_STUDENT
WHERE (STUDENT_MATH >= 50 AND STUDENT_ENG >= 50 AND STUDENT_KOR >= 50) AND 
	(STUDNET_GRADE = 'B' OR STUDNET_GRADE = 'A');
	

--Q2
DELETE FROM TBL_STUDENT
WHERE NOT (student_math >= 30 AND student_eng >= 30 AND student_kor >=30);

SELECT * FROM TBL_STUDENT;

SELECT SYSDATE 
FROM DUAL;

