SQL> -- 视图
SQL> /*
SQL> 表，是物理概念
SQL> 视图， 一个定义
SQL>  视图，逻辑概念，视图中的数据都是从表中来
SQL>  视图从基表中获取数据
SQL>
SQL> --视图
SQL> --第一个视图： 员工号，姓名，月薪，年薪
SQL>  --视图本身不包含数据


选项：

WITH CHECK OPTION
WITH READ ONLY
*/
create view viewtest
as
create empno,ename,sal,sal*12 annlsal from emp;
;
create view viewtest
as
create empno,ename,sal,sal*12 annlsal from emp;


create view viewtest
as
select empno,ename,sal,sal*12 annlsal from emp;



SQL> --操作视图和操作表的方式相同
SQL> select * from viewtest;

EMPNO ENAME             SAL    ANNLSAL
---------- ---------- ---------- ----------
7369 SMITH             800       9600
7499 ALLEN            1600      19200
7521 WARD             1250      15000
7566 JONES            2975      35700
7654 MARTIN           1250      15000
7698 BLAKE            2850      34200
7782 CLARK            2450      29400
7788 SCOTT            3000      36000
7839 KING             5000      60000
7844 TURNER           1500      18000
7876 ADAMS            1100      13200

EMPNO ENAME             SAL    ANNLSAL
---------- ---------- ---------- ----------
7900 JAMES             950      11400
7902 FORD             3000      36000
7934 MILLER           1300      15600

已选择14行。

SQL> -- 视图的优点
SQL>
SQL> --优点：简化查询
SQL> --类似于java中的封住
SQL> --
SQL> --封装
SQL>
SQL>
SQL>
SQL> --视图不能提高性能
SQL> create or replace view view2
  2  as
  3  select empno,ename,sal,sal*12 annlsal,dname
       4  from emp e,dept d
5  where e.deptno=d.deptno
6  with read only;

视图已创建。

SQL> select * from view2;

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7782 CLARK            2450      29400 ACCOUNTING
7839 KING             5000      60000 ACCOUNTING
7934 MILLER           1300      15600 ACCOUNTING
7566 JONES            2975      35700 RESEARCH
7902 FORD             3000      36000 RESEARCH
7876 ADAMS            1100      13200 RESEARCH
7369 SMITH             800       9600 RESEARCH
7788 SCOTT            3000      36000 RESEARCH
7521 WARD             1250      15000 SALES
7844 TURNER           1500      18000 SALES
7499 ALLEN            1600      19200 SALES

EMPNO ENAME             SAL    ANNLSAL DNAME
---------- ---------- ---------- ---------- --------------
7900 JAMES             950      11400 SALES
7698 BLAKE            2850      34200 SALES
7654 MARTIN           1250      15000 SALES

已选择14行。

SQL> -- with check option
SQL> create view view3
  2  as
  3  select * from emp where deptno=10;

视图已创建。

SQL> insert into view3 values (**,10);
insert into view3 values (**,10)
*
第 1 行出现错误:
ORA-00936: 缺失表达式


SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10

7934 MILLER     CLERK           7782 23-1月 -82           1300
10


SQL> insert into view3 values ('1111','ki','clerk','7839','17-11月-81',11,2,10);

已创建 1 行。

SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
1111 ki         clerk           7839 17-11月-81             11          2
10

7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7934 MILLER     CLERK           7782 23-1月 -82           1300
10


SQL> insert into view3 values ('222','ki','clerk','7839','17-11月-81',11,2,20);

已创建 1 行。

SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
1111 ki         clerk           7839 17-11月-81             11          2
10

7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7934 MILLER     CLERK           7782 23-1月 -82           1300
10




SQL> create or replace view view3
  2  as
  3  select * from emp where deptno=10
4  with check option;

视图已创建。

SQL>
SQL> select * from view3;

EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
1111 ki         clerk           7839 17-11月-81             11          2
10

7782 CLARK      MANAGER         7839 09-6月 -81           2450
10

7839 KING       PRESIDENT            17-11月-81           5000
10


EMPNO ENAME      JOB              MGR HIREDATE              SAL       COMM
---------- ---------- --------- ---------- -------------- ---------- ----------
DEPTNO
----------
7934 MILLER     CLERK           7782 23-1月 -82           1300
10


SQL> insert into view3 values ('222','ki','clerk','7839','17-11月-81',11,2,20);
insert into view3 values ('222','ki','clerk','7839','17-11月-81',11,2,20)
*
第 1 行出现错误:
ORA-01402: 视图 WITH CHECK OPTION where 子句违规



SQL> create view dept_sal
  2  as
  3  select min(e.sal) minsal,max(e.sal) maxsal,avg(e.sal) avgsal
       4  from emp e,dept d
5  where e.deptno=d.deptno
6  group by e.deptno;

视图已创建。

SQL> select * from dept_sal;

MINSAL     MAXSAL     AVGSAL
---------- ---------- ----------
950       2850 1566.66667
11       3000 1814.33333
11       5000    2190.25

SQL> --视图中使用DML的约束很多
SQL>
SQL> --不在视图中使用insert update
  SQL>  delete 语句
2
SQL> --可以使用with read only选项评比对视图的DML操作
SQL>
SQL>
SQL> host cls
