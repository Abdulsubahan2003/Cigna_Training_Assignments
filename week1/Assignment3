DECLARE
  P NUMBER:=100;
  R NUMBER:=200;
  T NUMBER:=30;
  SI NUMBER;
BEGIN
  SI:=(P*R*T)/100;
  DBMS_OUTPUT.PUT_LINE('Simple Interest = ' || SI);
END;

--2

DECLARE
 emp_name VARCHAR(50);
 salary NUMBER;
 bonus NUMBER;
BEGIN
 emp_name:='max';
 salary:=60000;
 IF salary > 50000 THEN
 
 bonus:=0.10*salary;
 DBMS_OUTPUT.PUT_LINE('HIGH SALARY EMPLOYEE and bonus is '||bonus);
 ELSE
 DBMS_OUTPUT.PUT_LINE('LOW SALARY EMPLOYEE and bonus is '||bonus);
 bonus:=0.15*salary;
 END IF;
END;

--3

DECLARE 
 v_dept dept%ROWTYPE;
BEGIN
 SELECT * INTO v_dept FROM dept where Deptno=2;
 DBMS_OUTPUT.PUT_LINE ('the name of the department is '||v_dept.Dname||' and the Location is '||v_dept.Loc );
END;

--4.

DECLARE 
 TYPE avg_table IS TABLE OF NUMBER
 INDEX BY VARCHAR(50);
 
 v_marks avg_table;
 avg_calc NUMBER:=0;
 total_mark NUMBER(10,2):= 0;
 v_count NUMBER:=0;
 v_key VARCHAR(50);
BEGIN
 v_marks('surya'):= 80;
 v_marks('paavan'):= 85;
 v_marks('ekchith'):= 82;
 v_marks('fayaz'):= 81;
 v_marks('aden'):= 80;
 
 v_key := v_marks.FIRST;
 
 WHILE v_key IS NOT NULL LOOP
  total_mark:=total_mark + v_marks(v_key);
  v_count:=v_count + 1;
  v_key:=v_marks.next(v_key);
 END LOOP;
 avg_calc:=total_mark/v_count;
 DBMS_OUTPUT.PUT_LINE('THE TOTAL MARKS OBTAINED BY THE STUDENTS ARE '||total_mark);
 DBMS_OUTPUT.PUT_LINE('THE AVERAGE MARKS OBTAINED NY THE STUDENTS ' ||avg_calc);
 
END;


--5
--SET SERVEROUTPUT ON;
ACCEPT country CHAR PROMPT 'Enter the Country name: '
DECLARE
 TYPE country_capital_table is TABLE OF VARCHAR2(50)
 INDEX BY VARCHAR2(50);
 
 country_capital country_capital_table;
 v_country varchar(50);
BEGIN
 country_capital('India'):='New delhi'; 
 country_capital('USA'):='Washington DC';
 country_capital('Russia'):='Moscow';
 country_capital('Pakistan'):='Islamabad';
 country_capital('UAE'):='Abu dhabi';
 country_capital('Japan'):='Tokyo';
 
 v_country:='&country';
 IF country_capital.EXISTS(v_country) THEN
  DBMS_OUTPUT.PUT_LINE('The capital of ' || v_country ||' is ' || country_capital(v_country) || '.');
 ELSE
  DBMS_OUTPUT.PUT_LINE('COUNTRY NOT FOUND');
 END IF;

END;
