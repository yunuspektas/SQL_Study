/* 
1) 
calisanlar tablosu --> id, isim, maas 
'1001', 'Ahmet Aslan', 7000
'1002', 'Mehmet Yılmaz' ,12000
'1003', 'Meryem ', 7215
'1004', 'Veli Han', 5000

      aileler tablosu --> id, cocuk_sayisi, ek_gelir
'1001', 4, 2000
'1002', 2, 1500
'1003', 1, 2200
'1004', 3, 2400

 create ediniz
*/

create table calisanlar (
id char(4),
isim varchar(50),
maas int(5),
constraint id_pk primary key (id)
);
insert into calisanlar values ( '1001', 'Ahmet Aslan', 7000);
insert into calisanlar values ( '1002', 'Mehmet Yılmaz' ,12000);
insert into calisanlar values ('1003', 'Meryem ', 7215);
insert into calisanlar values ('1004', 'Veli Han', 5000);

select * from calisanlar;

create table aileler (
id char(4),
cocuk_sayisi varchar(20),
ek_gelir int(20),
constraint id_fk foreign key (id) references calisanlar (id)
);

insert into aileler values ('1001', 4, 2000);
insert into aileler values ('1002', 2 ,1500);
insert into aileler values ('1003', 1, 2200);
insert into aileler values ('1004', 3, 2400);

select * from aileler;
SET SQL_SAFE_UPDATES = 0;


 -- 2) Veli Han'ın maaşına %20 zam yapınız.
 update calisanlar set maas = maas*1.2 where isim='Veli Han';   
select avg(maas) from calisanlar;
    
 -- 3) Maaşı ortalamanın altında olanlara %20 zam yapınız.
 update calisanlar set maas = maas*1.2  WHERE maas < (select *  from (SELECT AVG(maas) FROM calisanlar) yeni);
          -- bu soruda cevap kısmına alias olarak bir isim ( bu örnekde "yeni" yazıldı) eklemez isek hata alıyoruz
                    
-- 4) calisanların isim ve cocuk_sayisi'ni listeyen sorguyu yazınız.
select isim,aileler.cocuk_sayisi from calisanlar where id=aileler.id;
		
            
-- 5) calisanlar' ın  isim ve toplam_gelir'lerini gösteren bir sorgu yazınız. 
-- toplam_gelir = calisanlar.maas + aileler.ek_gelir 
   
-- 6) eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın  maaşına ek %10 aile yardım zammı yapınız. 
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
   