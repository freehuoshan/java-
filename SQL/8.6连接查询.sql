use studb

select * from student
select * from course

--�����ӣ�inner join....on
--��ʽ��select ����1������2��...���� n from ��1 inner join ��2 on ��1.����=��2.����
--��⣺on ��1.����=��2.����   ----�������ϵ

--��ѯѧ��ѡ������Щ�γ�
select sname,stel,cname from student inner join course on student.sno=course.sno

--��ı���
select sname,stel,cname from student  s inner join course  c on s.sno=c.sno

--��ѯ������20-25֮���ѧ��ѡ������Щ�γ�
select sname,stel,cname from student  s inner join course  c on s.sno=c.sno 
where s.sage  between 20 and 25

--�еı��� as
select sname as ѧ������,stel as ��ϵ��ʽ ,cname as ѡ���γ� from student  s inner join course  c on s.sno=c.sno 
where s.sage  between 20 and 25


--��ѯÿ�ſγ̵ķ���course��score����ʾ���γ������γ̷���
select cname as �γ���,degree as ���� from course c inner join score s on c.cno=s.cno
--�������
--��ʽ����ʽ��select ����1������2��...���� n from ��1 inner join ��2 on ��1.����=��2.���� inner join ��3 on ��[1,2].����=��3.����
--��ѯѧ��ѡ���Ŀγ̿��˶��ٷ�  ��ʾ��ѧ��ѧ�ţ��������γ���������
select s.sno,sname,cname,degree from student s inner join course c on s.sno=c.sno 
inner join score sc on c.cno=sc.cno

update score set cno=2 where scon=6
--��ѯ�ܿ������Ŀγ̿��˶��ٷ֣�Ҫ����ʾ��ѧ��ѧ�š�ѧ���������γ���������
select s.sno,sname,cname,degree from student s inner join course c on s.sno=c.sno 
inner join score sc on c.cno=sc.cno where sname like '[��,��]%'


--������:�������Ӻ���������
--������:left join...on  �����ӣ�right join....on
--��ʽ:select ����1������2,....����n from ��1 left join ��2 on ��1.����=��2.����

--ѧ��ѡ���γ�
--null�Ĳ�ѯʹ�ø�ʽ: where �ֶ� is [not] null
select student.sno,sname,cname from student left join course on student.sno=course.sno where cname is not null

--��������
select student.sno,sname,cname from course right join student on student.sno=course.sno





