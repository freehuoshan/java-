--��ѧ������abs():����ֵ
--abs(��ֵ|�ֶ�)
select ABS(gprice),gname from goods

select ABS(-28.9)

--rand():����� �������������Χ�� 0< =num <1
--rand()

select RAND()*10

--round(��ֵ,����) ��round(2.55,1)  ��������
select ROUND(2.54787,1)

--��0-9֮��������

select ROUND(RAND()*9,0)

--3D��Ʊ
select ROUND(RAND()*9,0) as ��һ��,ROUND(RAND()*9,0) as �ڶ���,ROUND(RAND()*9,0) as ������

--ȡ��������ȡ��(ceiling())������ȡ��(floor())
select CEILING(99.000000001)

select FLOOR(1.99999999)
--sqrt():��ƽ��
--sqrt(��ֵ|�ֶ�)
select SQRT(4)



--��������Ʒ�ļ۸������ܺ�
select ROUND(SUM(gprice),0) from goods
--ƻ���������ǡ����������

select floor(SUM(gprice)*39) from goods where gname in('���������','������','ƻ��')


--�ַ���������
--1.left(����,n)  �����ȡ�ַ�����nλ
select LEFT(gname,2) from goods

--2.rigth(����,n)
select RIGHT(gname,2) from goods

--3,len():���ַ�����
select LEN('������������������ٳ�˯���ѣ�')
alter table shopper add constraint shopper_single check(len(single)<=100)

--4.lower����д��Сдת��   UPPER��Сд���дת��
select LOWER('ASDFGH')

insert into goods values(12,UPPER('coffee'),'ȸ��','2011-7-20',19.89,5)

select * from goods

--ltrim():ȥ����ߵĿո�

select * from goods where gname='ƻ��'

select * from goods where LTRIM(gname)='��Ƭ'

--rtrim():ȥ���ұߵĿո�
select * from goods where rtrim(gname)='ƻ��'
--ȥ���������ߵĿո�

select * from goods where ltrim(rtrim(gname))='ƻ��'

--replace(�ֶ�,��������,�滻�ֶ�) : �滻
select REPLACE(gfamous,'��ţ','����') from goods

update goods set gfamous=REPLACE(gfamous,'��ţ','����')
--reverse(�ֶ���)����ת
select REVERSE(gname) from goods

--substring(�ֶ���,��ʼλ��,����)����ȡ�ַ��� 
select SUBSTRING(gname,1,1) from goods


--T_sql���������
--����������declare @������ ��������
declare @name varchar(10)

--��ֵ��  ��ʽ�� set ������=ֵ
set @name='����'

--�����select ������ ����


--���ӣ�
declare @num int
set @num=(select COUNT(no) from shopper)
select @num ����

select * from score
select * from course

--�鿴����100�ֵĿγ�����
declare @c_no int,@c_name varchar(10)
set @c_no=(select cno from score where degree=100)
set @c_name=(select cname from course where cno=@c_no)
select @c_name  �γ�����

--��ѯ���������Ʒ���û�����

--��ѯ��������ɡ���Ʒ���û����ƣ�����ֻ��һ����������ɣ�