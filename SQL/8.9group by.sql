select * from shopper

--��ѯ����۸����100��Ʒ���û���Ϣ
select * from shopper where no in(select no from goods where gprice>100)

select * from shopper where no in(2,4)

--��ѯ���������Ʒ���û���Ϣ
select * from shopper where no =(select top 1 no from goods order by gprice desc)

--��ѯ����������2011-5-8��2011-8-19��������Ʒ��Ϣ
select * from goods where date>'2011-5-8' and date<'2011-8-19'

--��ѯ�ֻ�����ǰ��λ��132���û���Ϣ
select * from shopper where phone like '132%'

----��ѯ��������ɡ���Ʒ���û���Ϣ
select * from shopper where no in (select no from goods where gname like '%����%')


--��ѯ�ܵ���Ʒ�۸��������ˡ�ƽ���۸���Ʒ��ͳ��
--�ۺϺ�����sum(�ֶ���) max(�ֶ���),min(�ֶ���)��avg���ֶ�������count(�ֶ���)

--��ѯ�ܵ���Ʒ�۸�
select SUM(gprice) as �ܵ���Ʒ�۸� from goods 

select min(gprice) as �۸� from goods

--��Ʒ��ƽ���۸�
select AVG(gprice) as ƽ���۸� from goods

--��ѯ�û��ĸ���
select COUNT(no) as ���� from shopper

--��������ѧ����ƽ���ɼ�
--student��ѧ����������
--student������������Ƕ���
--��ѯ�γ̱����ж��ٸ�ѡ�μ�¼

select  AVG(gprice),date from goods group by date


--���飺group by   һ���ϾۺϺ����϶�
--��ʽ��select �ۺϺ���,�ֶ��� from ���� [where ����] group by �ֶ��� [having ����]

select * from goods
--��ѯ��Ʒ���и���Ʒ�Ƶ�ƽ���۸�
select AVG(gprice) as ƽ���۸�,gfamous from goods group by gfamous

--��ѯ��Ʒ���и���Ʒ�Ƶ��ܼ۸񳬹�100
select sum(gprice) as ƽ���۸�,gfamous from goods group by gfamous having sum(gprice)<100

--��ѯ��Ʒ��������������2011-7-1֮�����Ʒ�Ƶ�ƽ���۸�
--������֮���ٹ��˾�����having,         where���ȹ����ٷ���

select AVG(gprice) as ƽ���۸�,gfamous from goods where date>'2011-7-1' group by gfamous


--��������ѯ��ÿ�ſγ̵���߷�          score��scno,degree,cno��
select MAX(degree) as ��߷� ,cno from score group by cno

--select MAX(degree) as ��߷� ,score.cno ,cname  from score 
--inner join course on score.cno=course.cno group by course.cname


--��ѯstudent����ÿ���Ա��ƽ���������28
select AVG(sage) as ƽ������,ssex from students group by ssex having AVG(sage)>23

--��ѯstudent���и������ŵ���Ա����
select COUNT(sno) as ���� ,sdepart from students group by sdepart

--���ں���
--getdate():���ϵͳ��ǰ����  
--datepart():��ʽ��dateadd(part,number,date)  part:year,month,day,hour,minute,second
--number����������+����   ��������+����    date:ָ�������ڣ��ֶ�

--datediff(part,start,end)

insert into  goods values(11,'��Ƭ','�Ϻü�',GETDATE(),3.0,4)


select * from goods

select dateadd(day,4,date) from goods

update goods set date=dateadd(day,4,date)  where gno=2

update goods set date=DATEADD(YEAR,-2,date) where gno=11

select * from students
select * from goods

update students set sbrithday=DATEADD(YEAR,-10,sbrithday) where sno=1



--datediff(part,start,end)

select DATEDIFF(YEAR,sbirthday,GETDATE()) from student where sno=4
select * from student

update students set sage=DATEDIFF(YEAR,sbrithday,GETDATE())

--�ܽ᣺
--1.�ۺϺ�����5��
--2.group by:���顣���磺������ÿ������
--3.���ں�����getdate(),dateadd(),datediff()

use studb
select * from score 
select * from course
select * from student
update score set con=5 where scno=5
insert into course values('java',4)
insert into student values ('����','��',21,'1982-05-18','13869548569','3G')
insert into student values ('����','��',28,'1975-05-28','13869512365','3G')
insert into student values ('����','��',21,'1982-05-18','13869564643','3G')
begin
declare @score float
set @score=(select degree from score where cno=(select cno from course where sno=4))
if(@score>95)
print '�䷢����'
else
print '���䷢����'
end
--  ͨ��if����else if������else if ����else�ṹʵ�ֶԷ����ĵȼ����֣�-90���ţ�-80������-60���ϸ񣬷��򣬲�)

  begin 
declare @i int,@s int
set @s=0
set @i=1
  while(@i<=100)
  begin
   set @s=@s+@i
   set @i=@i+1
  end
  print @



  begin 
declare @good varchar(20),@price float,@num int,@id int
set @id=2
set @good=(select gname from ��� where id=@id)
set @price=(select gprice from ��� where id=@id)
set @num=4
insert into ������ values(@good,@price,@num,@id)
if(@@ERROR=0)

  print '���۳ɹ���'

else
print '����ʧ�ܣ�'
   --Ƕ��i
    if(@@ROWCOUNT!=0)
  update ��� set gnumber=gnumber-@num where id=@id
  --print '�����³ɹ�'

end

 
