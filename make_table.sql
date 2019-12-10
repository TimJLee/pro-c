/* ���� �̸����� �̹� �����ϴ� ���̺��� ���� �� �����Ƿ� ������ ���̺��� �������ش�. */
DROP TABLE account cascade constraint;
DROP TABLE item cascade constraint;
DROP TABLE service cascade constraint;
DROP TABLE customer cascade constraint;
DROP TABLE branch cascade constraint;
DROP TABLE product cascade constraint;


/* servece table ����=> �����Ǵ� ���̺��� �ݵ�� ���� ������ �־���Ѵ�. */

create table service(
s_date date not null,
s_join varchar2(3) not null,
constraint service_pk primary key(s_date,s_join));

/* *** ���������� ����, s_date primary key, s_join varchar2(3) primary key �� �ϸ� ������ ���� ������ ���.
 ORA-02260: ���̺��� �ϳ��� �⺻ Ű�� ���� �� �ֽ��ϴ�. => ������ �츮�� ���ϴ� ���� primary key �� �ΰ� �� ���� �ƴ϶�, �ΰ��� �÷��� �ϳ��� primary key �� ����ϴ� ���̸�.(�̰͸� ����) �� ��ɾ �ٷ�
constraint service_pk primary key(s_date,s_join)); �� ���̴�!*****
�׷��� �� primary key �� fk �� ���� �� ���� �Ʒ� customer table ���� �ּ�ó�� �Ȱ�ó�� �ϸ� �ȵǰ�, 
constraint ac_dajo_fk foreign key(c_s_date,c_s_join) references service(s_date,s_join)); �̷��� 
�ؾ��Ѵ�. */

// customer table ���� 

create table customer(
c_no decimal(7) not null,
c_name varchar2(5) not null,
c_addr varchar2(20) not null,
c_phone varchar2(16) not null,
c_email varchar2(15),
c_s_date date not null,
c_s_join varchar2(3) not null,
constraint ac_no_pk primary key(c_no),
constraint ac_dajo_fk foreign key(c_s_date,c_s_join) references service(s_date,s_join));

//constraint ac_da_fk foreign key(c_s_date) references service(s_date),
//constraint ac_jo_fk foreign key(c_s_join) references service(s_join));


//product table ����

create table product(
p_no decimal(7) not null,
p_date date not null,
p_left varchar2(5) not null,
p_comp varchar2(10) not null,
p_s_date date not null,
p_s_join varchar2(3) not null,
constraint ac_no_pk1 primary key(p_no,p_date),
constraint ac_dajo_fk1 foreign key(p_s_date,p_s_join) references service(s_date,s_join));

//constraint ac_da_fk1 foreign key(p_s_date) references service(s_date),
//constraint ac_jo_fk1 foreign key(p_s_join) references service(s_join));

//delivery table ����
create table delivery(
d_no decimal(7) not null,
d_name varchar2(10) not null,
constraint ac_noname_pk2 primary key(d_no,d_name));
//constraint ac_no_pk2 primary key(d_no),
//constraint ac_name_pk2 primary key(d_name));

//buying table ����

create table buying(
b_c_no decimal(7) not null,
b_p_no decimal(7) not null,
b_p_date date not null,
constraint ac_buy_pk primary key(b_c_no,b_p_no,b_p_date),
constraint ac_cno_fk3 foreign key(b_c_no) references customer(c_no),
constraint ac_pnodate_fk3 foreign key(b_p_no,b_p_date) references product(p_no,p_date));

//constraint ac_pno_fk3 foreign key(b_p_no) references product(p_no),
//constraint ac_pdate_fk3 foreign key(b_p_date) references product(p_date));

//whodeliver table ����

create table whodeliver(
w_d_no decimal(7) not null,
w_d_name varchar2(10) not null,
w_p_no decimal(7) not null,
w_p_date date not null,
constraint ac_whodeliv_pk4 primary key(w_d_no,w_d_name,w_p_no,w_p_date),
constraint ac_don_fk4 foreign key(w_d_no,w_d_name) references delivery(d_no,d_name),
constraint ac_pno_fk4 foreign key(w_p_no,w_p_date) references product(p_no,p_date));

insert into service
values(to_date('2019-10-28','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2018-10-28','yyyy-mm-dd'),'no');
insert into service
values(to_date('2017-10-28','yyyy-mm-dd'),'no');
insert into service
values(to_date('2016-10-28','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2015-10-28','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2001-05-13','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2002-06-09','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2003-07-17','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2004-08-23','yyyy-mm-dd'),'yes');
insert into service
values(to_date('2005-09-30','yyyy-mm-dd'),'yes');


insert into customer
values(1,'ljy','seoul','010-9462-1234','email@em.com',to_date('2019-10-28','yyyy-mm-dd'),'yes');

insert into customer
values(2,'kjw','seoul','010-2231-1234','email2@em.com',to_date('2018-10-28','yyyy-mm-dd'),'no');

insert into customer
values(3,'ydj','seoul','010-1342-1234','email3@em.com',to_date('2017-10-28','yyyy-mm-dd'),'no');

insert into customer
values(4,'njw','seoul','010-2341-1234','email4@em.com',to_date('2016-10-28','yyyy-mm-dd'),'yes');

insert into customer
values(5,'joke','yongin','010-3215-1234','email5@em.com',to_date('2015-10-28','yyyy-mm-dd'),'yes');



insert into product
values(100,to_date('2017-09-13','yyyy-mm-dd'),'left','samsung',to_date('2001-05-13','yyyy-mm-dd'),'yes');

insert into product
values(101,to_date('2018-11-11','yyyy-mm-dd'),'left','lg',to_date('2002-06-09','yyyy-mm-dd'),'yes');

insert into product
values(102,to_date('2017-09-08','yyyy-mm-dd'),'left','kisa',to_date('2003-07-17','yyyy-mm-dd'),'yes');

insert into product
values(103,to_date('2017-09-13','yyyy-mm-dd'),'empty','etri',to_date('2004-08-23','yyyy-mm-dd'),'yes');

insert into product
values(104,to_date('2015-03-01','yyyy-mm-dd'),'left','kist',to_date('2005-09-30','yyyy-mm-dd'),'yes');


insert into delivery
values(1011,'coupang');

insert into delivery
values(1012,'CJ����');

insert into delivery
values(1013,'koybo');

insert into delivery
values(1014,'timsmarket');

insert into delivery
values(1015,'kingdragon');


insert into buying
values(1,100,to_date('2017-09-13','yyyy-mm-dd'));

insert into buying
values(2,101,to_date('2018-11-11','yyyy-mm-dd'));

insert into buying
values(3,102,to_date('2017-09-08','yyyy-mm-dd'));

insert into buying
values(4,103,to_date('2017-09-13','yyyy-mm-dd'));

insert into buying
values(5,104,to_date('2015-03-01','yyyy-mm-dd'));


insert into whodeliver
values(1011,'coupang',100,to_date('2017-09-13','yyyy-mm-dd'));

insert into whodeliver
values(1012,'CJ����',101,to_date('2018-11-11','yyyy-mm-dd'));

insert into whodeliver
values(1013,'koybo',102,to_date('2017-09-08','yyyy-mm-dd'));

insert into whodeliver
values(1014,'timsmarket',103,to_date('2017-09-13','yyyy-mm-dd'));

insert into whodeliver
values(1015,'kingdragon',104,to_date('2015-03-01','yyyy-mm-dd'));


product, delivery , whodeliver

select p.p_no,p.p_comp,wh.w_d_name,wh.w_p_date
from product p, delivery d, whodeliver wh
where wh.w_p_date in (select w_p_date from whodeliver where w_p_date='17/09/13')
group by p.p_no,p.p_comp,wh.w_d_name,wh.w_p_date;