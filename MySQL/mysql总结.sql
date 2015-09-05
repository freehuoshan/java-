

��������
	ԭ���ԣ���������������γ���һ���߼���Ԫ������ִֻ�����е�һ����
	һ���ԣ���������ִ��֮ǰ��֮��������һ�µġ�
	�����ԣ�һ�����������һ��������û��Ӱ�졣
	�����ԣ���������ɹ�ִ�е�������ʱ����Ч�������ݿ��б����ü�¼������

������
    SET FOREIGN_KEY_CHECKS=0;

    DROP TABLE IF EXISTS user;
    CREATE TABLE user (
        id int(50) NOT NULL auto_increment,
        username varchar(50) default NULL,
        password varchar(50) default NULL,
        PRIMARY KEY  (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

    DROP TABLE IF EXISTS user_info;
    CREATE TABLE user_info (
        id int(11) NOT NULL auto_increment,
        user_id int(11) default NULL,
        address varchar(500) default NULL,
        c_date date default NULL,
        PRIMARY KEY  (id),
        KEY fk_user_ui (user_id),
        KEY ui_c_date_index (c_date),
        CONSTRAINT fk_user_ui FOREIGN KEY (user_id) REFERENCES user (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

����
    delimiter /   �޸Ķ����
	CREATE DATABASE menagerie;     �������ݿ�
	show databases;		��ʾ���еĿ�
	user test;	ѡ���
	show tables;	��ʾ���еı�
	DESCRIBE tablename;   ��ʾ��Ķ�����Ϣ
	select version(); ��ʾ�汾��Ϣ
	select CURRENT_DATE;	��ʾ��ǰ����
	select curdate();
	select now();	��ʾ��ǰ����ʱ��
	select user();	��ʾ��ǰ��¼�û�
	SELECT DISTINCT owner FROM pet;	ȥ���ظ���
	SELECT DATABASE();	��ǰѡ�еĿ�
	select @a:= username from user where id = 1;	��usernameֵ��������@a

�Զ��庯��
    DROP FUNCTION IF EXISTS hello;
    CREATE FUNCTION hello(s varchar(20)) RETURNS varchar(1000)
    BEGIN
         declare t varchar(1000) default '';
         declare id1 int;
         declare username1 varchar(50);
         declare no_more_departments int;

         declare cur1 cursor
         for
            select id,username from test;

         DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_departments=1;
         open cur1;

          REPEAT
               FETCH cur1 INTO id1, username1;
               if (no_more_departments is null) then
                set t = concat(t,';',id1,'-',username1);
               end if;
          until no_more_departments END REPEAT;

         close cur1;
         RETURN t;
    END;
    ����
    select hello('') t from dual

�洢����
    delimiter //
    CREATE PROCEDURE p1 (OUT param1 INT)
    BEGIN
      SELECT COUNT(*) INTO param1 FROM t;
    END

    ����
    call p1(@a);
    select @a

��ͼ
    CREATE VIEW v AS SELECT * FROM user;
    ����
    select * from v

������

	CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));
	CREATE TRIGGER ins_sum BEFORE INSERT ON account
	FOR EACH ROW SET @sum = @sum + NEW.amount;

	ʹ�ñ���OLD��NEW���ܹ������봥��������صı��е��С�OLD.col_name�ڸ��»�ɾ����֮ǰ�������������е�1�С�NEW.col_name�ڸ�����֮�����ý�Ҫ��������е�1�л������е�1�С�

root����Զ�̵�¼
    UPDATE mysql.user SET Host='%' WHERE Host='localhost';
    GRANT ALL PRIVILEGES ON *.* TO root@"%" ;
    FLUSH PRIVILEGES;

�ַ����ຯ��

    CHARSET(str) //�����ַ����ַ���
    CONCAT (string2  [,... ]) //�����ִ�
    INSTR (string ,substring ) //����substring�״���string�г��ֵ�λ��,�����ڷ���0
    LCASE (string2 ) //ת����Сд
    LEFT (string2 ,length ) //��string2�е������ȡlength���ַ�
    LENGTH (string ) //string����
    LOAD_FILE (file_name ) //���ļ���ȡ����
    LOCATE (substring , string  [,start_position ] ) ͬINSTR,����ָ����ʼλ��
    LPAD (string2 ,length ,pad ) //�ظ���pad����string��ͷ,ֱ���ִ�����Ϊlength
    LTRIM (string2 ) //ȥ��ǰ�˿ո�
    REPEAT (string2 ,count ) //�ظ�count��
    REPLACE (str ,search_str ,replace_str ) //��str����replace_str�滻search_str
    RPAD (string2 ,length ,pad) //��str����pad����,ֱ������Ϊlength
    RTRIM (string2 ) //ȥ����˿ո�
    STRCMP (string1 ,string2 ) //���ַ��Ƚ����ִ���С,
    SUBSTRING (str , position  [,length ]) //��str��position��ʼ,ȡlength���ַ�,
    TRIM([[BOTH|LEADING|TRAILING] [padding] FROM]string2) //ȥ��ָ��λ�õ�ָ���ַ�
    UCASE (string2 ) //ת���ɴ�д
    RIGHT(string2,length) //ȡstring2���length���ַ�
    SPACE(count) //����count���ո�

��ѧ�ຯ��

    ABS (number2 ) //����ֵ
    BIN (decimal_number ) //ʮ����ת������
    CEILING (number2 ) //����ȡ��
    CONV(number2,from_base,to_base) //����ת��
    FLOOR (number2 ) //����ȡ��
    FORMAT (number,decimal_places ) //����С��λ��
    HEX (DecimalNumber ) //תʮ������
    LEAST (number , number2  [,..]) //����Сֵ
    MOD (numerator ,denominator ) //����
    POWER (number ,power ) //��ָ��
    RAND([seed]) //�����
    ROUND (number  [,decimals ]) //��������,decimalsΪС��λ��]
    SIGN (number2 ) //���ط���,������0
    SQRT(number2) //��ƽ��

����ʱ���ຯ��

    ADDTIME (date2 ,time_interval ) //��time_interval�ӵ�date2
    CONVERT_TZ (datetime2 ,fromTZ ,toTZ ) //ת��ʱ��
    CURRENT_DATE (  ) //��ǰ����
    CURRENT_TIME (  ) //��ǰʱ��
    CURRENT_TIMESTAMP (  ) //��ǰʱ���
    DATE (datetime ) //����datetime�����ڲ���
    DATE_ADD (date2 , INTERVAL d_value d_type ) //��date2�м������ڻ�ʱ��
    DATE_FORMAT (datetime ,FormatCodes ) //ʹ��formatcodes��ʽ��ʾdatetime
    DATE_SUB (date2 , INTERVAL d_value d_type ) //��date2�ϼ�ȥһ��ʱ��
    DATEDIFF (date1 ,date2 ) //�������ڲ�
    DAY (date ) //�������ڵ���
    DAYNAME (date ) //Ӣ������
    DAYOFWEEK (date ) //����(1-7) ,1Ϊ������
    DAYOFYEAR (date ) //һ���еĵڼ���
    EXTRACT (interval_name  FROM date ) //��date����ȡ���ڵ�ָ������
    MAKEDATE (year ,day ) //�����꼰���еĵڼ���,�������ڴ�
    MAKETIME (hour ,minute ,second ) //����ʱ�䴮
    MONTHNAME (date ) //Ӣ���·���
    NOW (  ) //��ǰʱ��
    SEC_TO_TIME (seconds ) //����ת��ʱ��
    STR_TO_DATE (string ,format ) //�ִ�ת��ʱ��,��format��ʽ��ʾ
    TIMEDIFF (datetime1 ,datetime2 ) //����ʱ���
    TIME_TO_SEC (time ) //ʱ��ת����]
    WEEK (date_time [,start_of_week ]) //�ڼ���
    YEAR (datetime ) //���
    DAYOFMONTH(datetime) //�µĵڼ���
    HOUR(datetime) //Сʱ
    LAST_DAY(date) //date���µ��������
    MICROSECOND(datetime) //΢��
    MONTH(datetime) //��
    MINUTE(datetime) //��

�Ż�
    in ->  exists
        select * from A where cc in (select cc from B)
        select * from A where exists(select cc from B where cc=A.cc)

����
    ����һ����
        d:\mysql\bin>mysqldump -u root -p db_name > f:\1.sql

    ����һ�����µĶ����
        d:\mysql\bin>mysqldump -u root -p db_name table1 table2 > f:\1.sql

    ���ݶ����
        d:\mysql\bin>mysqldump -u root -p -B db_name1 db_name2 > f:\1.sql

    ����������
        d:\mysql\bin>mysqldump -u root -p -A > f:\1.sql

��ԭ
    d:\mysql\bin>mysql -u root -p db_name < f:\1.sql

    mysql> use dbname;
    mysql>source f:\1.sql;

�������
	insert into ttt (num) select t2.num from ttt t2 where t2.id = 2













