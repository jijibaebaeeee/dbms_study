/* PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수 검색 */
SELECT PLAYER_NAME 선수명, WEIGHT 몸무게
FROM PLAYER
WHERE WEIGHT BETWEEN 70 AND 80;

/* PLAYER 테이블에서 TEAM_ID가 'K03'이고 HEIGHT가 180 미만인 선수 검색 */
SELECT PLAYER_NAME 선수명, TEAM_ID 팀ID, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K03' AND HEIGHT < 180;

/* PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수 검색 */
SELECT TEAM_ID 팀ID, NICKNAME 닉네임
FROM PLAYER
WHERE TEAM_ID = 'K06' AND NICKNAME = '제리';

/* PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름 검색 */
SELECT PLAYER_NAME 선수명, HEIGHT 키, WEIGHT 몸무게
FROM PLAYER
WHERE HEIGHT >= 170 AND WEIGHT >= 80;

/* STADIUM 테이블에서 SEAT_COUNT가 30000초과이고 41000이하인 경기장 검색 */
SELECT SEAT_COUNT 좌석
FROM STADIUM
WHERE SEAT_COUNT > 30000 AND SEAT_COUNT <= 41000;

/* PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07'이고 포지션은 'MF'인 선수 검색 */
SELECT PLAYER_NAME 선수명, TEAM_ID 팀ID, POSITION 포지션
FROM PLAYER
WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07') AND POSITION = 'MF';

/* PLAYER 테이블에서 POSITION이 NULL인 선수 검색 */
SELECT PLAYER_NAME 선수명, POSITION 포지션
FROM PLAYER
WHERE POSITION IS NULL;

/* PLAYER 테이블에서 NICKNAME이 NULL인 선수를 '없음'으로 변경하여 조회하기 */
SELECT PLAYER_NAME 선수명, NVL(NICKNAME, '없음') 닉네임
FROM PLAYER;

/* PLAYER 테이블에서 NATION이 등록되어 있으면 '등록', 아니면 '미등록'으로 검색 */
SELECT PLAYER_NAME 선수명, NVL2(NATION, '등록', '미등록') NATION_등록여부
FROM PLAYER;

/* PLAYER 테이블에서 POSITION이 NULL인 선수를 '미정'으로 변경 후 검색 */
SELECT PLAYER_NAME 선수명, NVL(POSITION, '미정') POSITION
FROM PLAYER
--WHERE POSITION = '미정';

SELECT * FROM PLAYER;
SELECT * FROM STADIUM;


SELECT POSITION FROM PLAYER
WHERE POSITION = NULL;



/* PLAYER 테이블에서 포지션 종류 검색 */
SELECT DISTINCT POSITION 
FROM PLAYER;

/* PLAYER 테이블에서 몸무게가 80이상인 선수들의 평균 키가 180초과인 포지션 검색 */
SELECT POSITION 포지션, WEIGHT 몸무게, HEIGHT 키
FROM PLAYER
WHERE WEIGHT >= 80 AND 
	HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT AVG(HEIGHT) FROM PLAYER;

/* EMPLOYEES 테이블에서 JOB_ID별///// 평균 SALARY가 10000미만인 JOB_ID 검색 JOB_ID는 알파벳 순으로 정렬(오름차순) */
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) < 10000
ORDER BY JOB_ID;

SELECT AVG(SALARY) FROM EMPLOYEES;
SELECT * FROM EMPLOYEES;

/* PLAYER_ID가 2007로 시작하는 선수들 중 POSITION별 평균 키를 조회 */
SELECT POSITION 포지션, ROUND(AVG(HEIGHT),2) 평균키
FROM PLAYER
--WHERE PLAYER_ID LIKE '2007%'
WHERE PLAYER_ID LIKE '___9%'
GROUP BY POSITION;

/* 선수들 중 포지션이 DF 선수들의 평균 키를 TEAM_ID 별로 조회하고 평균 키 오름차순으로 정렬하기 */
SELECT TEAM_ID 팀ID,ROUND(AVG(HEIGHT), 2) 평균키
FROM PLAYER
WHERE POSITION = 'DF'
GROUP BY TEAM_ID
ORDER BY 평균키;

/* 포지션이 MF인 선수들의 입단연도 별 평균 몸무게, 평균 키를 구한다.*/
-- * 칼럼명은 입단연도, 평균 몸무게, 평균 키 로 표시한다.
-- * 입단연도를 오름차순으로 정렬한다.
-- * 단, 평균 몸무게는 70 이상 그리고 평균 키는 160 이상인 입단연도만 조회
SELECT * FROM PLAYER; 

SELECT JOIN_YYYY 입단연도, ROUND(AVG(WEIGHT),2) "평균 몸무게", ROUND(AVG(HEIGHT),2) "평균 키"
FROM PLAYER
WHERE POSITION = 'MF'
GROUP BY JOIN_YYYY
HAVING AVG(WEIGHT) >= 70 AND AVG(HEIGHT) >= 160
ORDER BY 입단연도;


/* PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 중 POSITION이
 * 'GK'인 선수를 조회하기 SUB쿼리 사용하기 */
-- 1. 메인쿼리
SELECT * FROM PLAYER;

-- 2. 서브쿼리
(SELECT PLAYER_ID 
		FROM PLAYER
		WHERE POSITION = 'GK'
			AND TEAM_ID = 'K01');

-- 3. 합치기
SELECT P.PLAYER_ID, P.PLAYER_NAME, P.TEAM_ID, P.POSITION
FROM PLAYER p 
	JOIN
		(SELECT PLAYER_ID 
		FROM PLAYER
		WHERE POSITION = 'GK'
			AND TEAM_ID = 'K01') P2
ON P.PLAYER_ID = P2.PLAYER_ID;
			

/* PLAYER 테이블에서 평균 몸무게보다 더 많이 나가는 선수들 검색 (조건에 서브쿼리 사용) */
SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, WEIGHT 몸무게, (SELECT ROUND(AVG(WEIGHT),2) FROM PLAYER) 평균몸무게조회용
FROM PLAYER
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);

/* PLAYER 테이블에서 정남일 선수가 소속된 팀의 선수들 조회*/
-- 1. 메인쿼리
SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, WEIGHT 몸무게, HEIGHT 키
FROM PLAYER
 
-- 2. 서브쿼리
SELECT  PLAYER_ID
FROM PLAYER
WHERE TEAM_ID = 정남일 선수의 팀

-- 3. 합치기
SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, WEIGHT 몸무게, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID 
				FROM PLAYER
				WHERE PLAYER_NAME = '정남일');

--/* PLAYER 테이블에서 평균 키보다 작은 선수 조회*/ ★★★ 질문 웨.. AVG(HEIGHT) 로는 안되었던거지!? 도배하면 되잖아
SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, WEIGHT 몸무게, HEIGHT 키, (SELECT ROUND(AVG(HEIGHT),2) FROM PLAYER) 평균키확인용		
FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER);
				
			
/*SCHEDULE 테이블에서 경기 일정이 
 * 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회*/
--
SELECT * FROM SCHEDULE;
--
--SELECT *
--FROM SCHEDULE
--WHERE SCHE_DATE BETWEEN '20120501' AND '20120502';

-- 1. 메인쿼리
SELECT * FROM SCHEDULE;

--2. 서브쿼리
SELECT *
FROM SCHEDULE
WHERE SCHE_DATE = '20120501' OR SCHE_DATE = '20120502'

--3. 합치기
SELECT S.STADIUM_ID, S.SCHE_DATE, S.GUBUN, S.HOMETEAM_ID, S.AWAYTEAM_ID, S.HOME_SCORE, S.AWAY_SCORE, SC.SCHE_DATE
FROM SCHEDULE S 
	JOIN
		(SELECT STADIUM_ID, SCHE_DATE
		FROM SCHEDULE 
		WHERE SCHE_DATE = '20120501' OR SCHE_DATE = '20120502')SC
	ON S.STADIUM_ID = SC.STADIUM_ID
	WHERE S.SCHE_DATE = SC.SCHE_DATE;

 /* EMPLOYEE 테이블
 * 핸드폰번호가 515로 시작하는 사원들의
 * JOB_ID별 SALARY 평균을 구한다.
 * 조회 컬럼은 부서, 평균 급여 로 표시한다.
 * 평균 급여가 높은 순으로 정렬한다.
 */
SELECT * FROM EMPLOYEES;

SELECT JOB_ID 부서, ROUND(AVG(SALARY),2) "평균 급여"
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '515%'
GROUP BY JOB_ID
ORDER BY "평균 급여" DESC;

SELECT PHONE_NUMBER FROM EMPLOYEES; --폰번호확인용

-- 메인쿼리
SELECT JOB_ID 부서, ROUND(AVG(SALARY),2) "평균 급여"
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY "평균 급여" DESC;

-- 서브쿼리
SELECT JOB_ID
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '515%'

--합치기
SELECT E.JOB_ID 부서, AVG(E.SALARY) "평균 급여"
FROM EMPLOYEES E
	JOIN
		(SELECT JOB_ID
		FROM EMPLOYEES
		WHERE PHONE_NUMBER LIKE '515%')EC
	ON E.JOB_ID = EC.JOB_ID
GROUP BY E.JOB_ID
ORDER BY AVG(E.SALARY) DESC;


/* COMMISSION_PCT 별 평균 급여를 조회한다.
 * COMMISSION_PCT 를 오름차순으로 정렬하며 
 * HAVING절을 사용하여 NULL은 제외한다.*/

SELECT COMMISSION_PCT 값, ROUND(AVG(SALARY),2)
FROM EMPLOYEES
GROUP BY COMMISSION_PCT
HAVING COMMISSION_PCT IS NOT NULL
ORDER BY COMMISSION_PCT;

















