use studb
--��ѯ��ͬѧѡ���Ŀγ̣�Ҫ����ʾ��ѧ��������ѧ�š��γ������绰
select sname,s.sno,cname,stel from student s inner join course c on s.sno=c.sno where s.ssex='��'

--��ѯ�������20Ůͬѧѡ���Ŀγ��Լ��ÿγ̵Ŀ��Է�����Ҫ����ʾ��ѧ��������ѧ�š��γ���������
select sname,s.sno,cname,degree from student s inner join course c on s.sno=c.sno 
inner join score sc on sc.cno=c.cno where s.sage>20 and s.ssex='Ů'

--��ȫ���� full join .....on
--�൱���������������ӵĽ��

select * from student left join course on student.sno=course.sno

create table stu
(
id int primary key,
name varchar(10) not null
)
insert into stu values(1,'��˴'),(2,'���㻨'),(3,'��ΰ'),(4,'���'),(5,'��У') 

create table sco
(
 id int primary key,
 java float,
 sql float,
 sid int,
 date datetime
)
insert into sco values(5,50,86,9,'2011-6-18')

select * from stu
select * from sco

--������
select * from stu left join sco on stu.id=sco.sid

select * from stu right join sco on stu.id=sco.sid
--��ȫ����(�鿴���ű��зֱ���ֵĿ�ֵ)

select * from stu full join sco on stu.id=sco.sid


--Ƕ�ײ�ѯ���Ӳ�ѯ��
--û��ѡ���γ̵�ѧ��������ѧ��
--1.��������
select s.sname,s.sno from student s left join course  c on s.sno=c.sno where c.cname is null
--2.�Ӳ�ѯ����ʾ���ֶζ���һ�ű�ʱ�����Կ���ʹ���Ӳ�ѯ��
--��ʽ��select �ֶ�����...�ֶ��� from ����1 where �ֶ� =/like/in/> (select �ֶ� from ����2 [where ����])
select sname,sno from student where sno  not in(select sno from course)
--ע�⣺where ������ֶ��� ������ Ƕ�ײ�ѯ�е��ֶ����������ֶ�������һ��


--��ѯѡ��java�ε�ѧ��������ѧ�ţ��Ӳ�ѯ��
--1.ѡ��java�ε�ѧ��   select sno from course where cname='java'
--2.��student�����ҳ���Ӧ��: select sname,sno from student where sno in (1,2,3,4,5)

select sname,sno from student where sno in (select sno from course where cname='java')

--��ѯѡ��Ӣ��ε�ѧ������\ѧ��\�ֻ�����
--��ѯ��������90�ֵĿγ����Ϳγ̱��













