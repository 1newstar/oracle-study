-- 抽取时间
SELECT
  EXTRACT(YEAR FROM SYSDATE)  AS yy,
  EXTRACT(MONTH FROM SYSDATE) AS mm,
  EXTRACT(DAY FROM SYSDATE)   AS dd
FROM DUAL;