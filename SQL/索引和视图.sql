--�����set ֻ��ʵ�ֵ�����ֵ��select
declare @i int,@a int
--set @a=6
--set @i=3
select @i=80,@a=10
print @i/@a


--�����ͬ�����ͣ�@age,@name
declare @age int,@name varchar(10)
select @age=18,@name='����'
print '�ҽ�'+@name+'�����ǣ�'+convert(varchar(10),@age)

--ת��������convert(����,����),"+"�����ַ�
--if������else��case������when������then������end
--��ʽ��case [����]
--      when  ����  then  ���
---     when  ����  then  ���
--      else  ���
--      end

--while��ʽ��  while(����)
--             begin
--               t-sql���
--             end


--��������һ������ṹ���ýṹ�ܹ��ṩ��һ�л��߶���Ϊ�������п��ٲ��ҵ�������
-- ����������1.�������ϴ�ʱ   2.��ѯ���ʱ��    
--  ȱ�㣺�����в��룬���²���ʱ��Ӱ���ٶ�
--���ࣺ�ۼ��������Ǿۼ�������Ψһ�������������
--B-��������
--�ۼ��������еĴ洢������������˳����ȫ��ͬ
--���磺��ʶ�У�����
--�ص㣺һ�ű���ֻ����һ���ۼ�����
--����������1.���������ķ��ظ���  2.ʹ�����������һ����Χ�Ĳ�ѯ��>,<,<=��
--          3.���ش��ͽ�����Ĳ�ѯ  4.����ʹ�����ӣ�join��

--�����﷨��create clustered index ������ on ��(�ֶ���)

--�ֶ�����1.where���澭�����ֵ��ֶ�  2.���ֶβ������ж���ظ�ֵ  3. ����ж���ֶ���where���棬����where������ȱ�����

--�鿴������exec sp_help ����

exec sp_help shop

create clustered index index_date on shop(date)

--�Ǿۼ��������еĴ洢������������˳����ȫ��ͬ
--һ�ű��п����ж���Ǿۼ�������������Ŀ¼
--�﷨��create nonclustered index ������ on ����(�ֶ���)

create nonclustered index index_gname on shop(name)
exec sp_help shop

--Ψһ������������Ĭ�ϴ���Ψһ����
--��ʽ��create unique index ������ on ����(�ֶ�)

 create unique index index_tel on student(stel)
 
 
 --�������
 create index index_aa on student(sname,sage)
 
 exec sp_help student
 
 --ɾ������
 --��ʽ��drop index ����.������
 drop index student.index_tel
 
 
 --��ͼ��view   ���������
 --���ã�����ʵ�ַ����ѯ
 select sname,cname,degree from student  s left join course  c on s.sno=c.sno left join score sc on c.cno=sc.cno
 where cname is not null
 
 
 --��ʽ��create view ��ͼ��
 --      as
 --      sql���
 
 
 create view view_stu
 as
 select sname,cname,degree from student  s left join course  c on s.sno=c.sno left join score sc on c.cno=sc.cno
 where cname is not null
 go
 
 --�鿴��ͼ  ��ʽ��exec sp_helptext ��ͼ��
 exec sp_helptext view_stu
 
 --���ʹ����ͼ
 select sname,cname  from view_stu
 
 --�޸���ͼ
 --alter view ��ͼ��
 --as
 --sql���
 
 
alter view aa
as
select * from student where sno in (select sno from course where cname='java')


exec sp_helptext aa


select * from aa


--ɾ����ͼ

 --��ʽ��drop view ��ͼ��
 drop view aa
 
 
 --�ܽ᣺�������ͼ    ����create  �޸� alter   ɾ�� drop
 
 
 select * from view_stu_course
 
 
 
 
 
 
 
 
 
