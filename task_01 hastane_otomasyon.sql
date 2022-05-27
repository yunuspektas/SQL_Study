/* ========================== HASTA PROJESI =================================*/   
create table if not exists hastaneler(    /* if not */
id char(5) primary key,
isim varchar(50),
sehir varchar(10),
ozel varchar(1)
-- ozel boolean default true

);  

insert into hastaneler values('H101','acıbadem hastanesi','istanbul','y');
insert into hastaneler values('H102','hazseki hastanesi','istanbul','n');
insert into hastaneler values('H103','medikol hastanesi','izmir','y');
insert into hastaneler values('H104','memorial hastanesi','ankara','y');

create table if not exists hastalar
(
kimlik_no varchar(11) primary key,
isim varchar(30),
teshis varchar(30)
);
insert into hastalar values ('12345678901','Ali Can','Gizli Seker');
insert into hastalar values ('45678901121','Ayşe Yılmaz','Hipertansiyon');
insert into hastalar values ('78901123451','Steve Job','Pankreatit');
insert into hastalar values ('12344321251','Tom Hanks','COVID19');


create table if not exists bolumler
(
bolum_id char(5) primary key,
bolum_adi varchar(30)
);

insert into bolumler values ('DHL','DAHILIYE');
insert into bolumler values ('KBB','KULAK-BURUN-BOGAZ');
insert into bolumler values ('NRJ','NOROLOJI');
insert into bolumler values ('GAST','GASTROLOJI');
insert into bolumler values ('KARD','KARDIOLOJI');
insert into bolumler values ('PSK','PSIKIYATRI');
insert into bolumler values ('GOZ','GOZ HASTALIKLARI');



create table if not exists hasta_kayitlar
(
kimlik_no char(5) primary key,
hast_isim varchar(30) default 'NONAME', -- default değeri noname
hastane_adi varchar(30) NULL, -- null olabilir demek
bolum_adi varchar(30) NULL,
teshis varchar(30) NULL
);

insert into hasta_kayitlar(kimlik_no) values('1111'); -- trick sadece girilecek field belirtilmiş
insert into hasta_kayitlar(kimlik_no) values('2222');
insert into hasta_kayitlar(kimlik_no) values('3333');

select * from hastaneler;
select * from hasta_kayitlar;
select * from hastalar;
select * from bolumler;






   