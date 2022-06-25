CREATE SCHEMA `mysqldb` ;
use mysqldb;
-- birden fazla database varsa "use" komutu ile kullanacağımız database'i seçiyoruz

create table student (id varchar(4), st_name varchar(30), age int);
-- student table olusturduk  -- başlıların değişken tiplerini tanımladık


-- VERİ GİRİŞİ
insert into student values('1001', 'Ali Can', '25');
insert into student values('1002', 'Veli Can', '35');
insert into student values('1003', 'Ayşe Can', '45');
insert into student values('1004', 'Derya Can', '55');

select * from student;

-- PARÇALI VERİ GİRİŞİ
insert into student (st_name,age) values('Murat Can', '35');

drop table student;
-- student tablosunu siler


----------------------------------------------------------------------------------

use mysqldb;
create table ogrenciler(
id int, isim varchar(45),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values('120', 'Ali Can', 'Ankara', '75');
insert into ogrenciler values('121', 'Veli Mert', 'Trabzon', '85');
insert into ogrenciler values('122', 'Ayşe Tan', 'Bursa', '65');
insert into ogrenciler values('123', 'Derya Soylu', 'Istanbul', '95');
insert into ogrenciler values('124', 'Yavuz Bal', 'Ankara', '80');

select * from ogrenciler;

/*
Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
SELECT ile birlikte WHERE komutu kullanılır.
SELECT sutun1, sutun2 ....
FROM tablo adı WHERE koşul
*/

-- SORU01: Sınav notu 80'den büyük olan öğrencilerin bilgileri listele
select * from ogrenciler where sinav_notu>80;

-- SORU02: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
select isim, adres from ogrenciler where adres = 'Ankara';


-- SELECT - BETWEEN
create table personel
(
id char(4),
isim varchar(50),
maas int
);


insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel;

-- BETWEEN belirttiğiniz 2 veri arasındaki bilgileri listeler
-- BETWEEN de; belirttigini degerler de, listelemeye dahildir.

/*
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
Bir tanesi gerçekleşmez ise listelemez.
SELECT * FROM matematik sinav1 > 50 AND sinav2 > 50
Hem sinav1 hemde sinav2 alanı, 50'de büyük olan kayıtları listeler.
OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir.
SELECT * FROM matematik sinav1 > 50 OR sinav2 > 50
Hem sinav1 veya sinav2 alanı, 50'de büyük olan kayıtları listeler.
*/

-- SORU04: id'si 1002 ile 1005 arasında olan personel bilgilerini listele
-- 1. YOL
select * from personel where id between '1002' and '1005';

-- 2. YOL
select * from personel where id>='1002' and id<='1005';

-- SORU05: Derya Soylu ile Yavuz Bal arasındaki personel bilgilerini listele
select * from personel where isim between 'Derya Soylu' and 'Yavuz Bal';

-- SORU06: Maaşı 70000 ve ismi Sena olan personeli listele
select * from personel where maas=70000 or isim= 'Sena Beyaz';

/*
IN: Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutla
 yazabilme imkanı verir.

 SELECT sutun1, sutun2 ....
 FROM tablo_adı
 where sutun_adı IN (deger1, deger2)
*/

-- SORU07: id'si 1001,1002 ve 1004 olan prsonel bilgilerini listele
-- 1. YOL
select * from personel where id = '1001' or id = '1002' or id = '1004';

-- 2. YOL
select * from personel where id in(1001,1002,1004);

-- SORU08: Maaşı sadece 70000 100000 olan personeli listele
select * from personel where maas in(70000,100000);
-- Farklı sutunlar için IN kullanılamaz.

/*
SELECT - LIKE
LIKE: Sorgulama yaparken belirli patternleri kullanabilmezi sağlar
SELECT sutun1, sutun2, ...
FROM tablo_adı WHERE sutünN LIKE pattern
PATTERN İÇİN
% -> 0 veya daha fazla karakteri belirtir.
_ -> Tek bir karakteri belirtir.
*/

-- SORU09: İsmi A harfi ile başlayan personeli listele
select * from personel where isim like 'A%';

-- SORU10: İsmi N harfi ile biten personeli listele
select * from personel where isim like '%N';

-- SORU11: İsminin 2. harfi E olan personeli listeleyin
select * from personel where isim like '_E%';

-- SORU12: İsminin 2. harfi E olup diğer harflerinde Y olan personel
select * from personel where isim like '_E%Y%';

-- SORU13: İsminde A harfi olmayan personeli listeleyin
select * from personel where isim not like '%A%';

-- SORU14: Maaşı 6 haneli olan personeli listeleyin
select * from personel where maas like '______';

-- SORU15: 1. harfi A ve 7. harfi A olan personeli listeleyin
select * from personel where isim like 'A_____A%';



/* ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.
     -- 'c' => case-sentisitive demektir
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, 'pattern[] ', 'c' ] )

/* ========================================================================== */



CREATE TABLE kelimeler
(
id int UNIQUE,
kelime VARCHAR(50) NOT NULL,
harf_sayisi int
);

    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);

select * from kelimeler;

-- SORU16: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat ederek listeleyiniz
-- VEYA işlemi için | karakteri kullanılır.
select * from kelimeler where regexp_like(kelime, 'at|ot', 'c');
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'at|ot', 'c');

-- SORU17: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
select * from kelimeler where regexp_like(kelime, 'at|ot', 'i');
select * from kelimeler where regexp_like(kelime, 'at|ot');
-- 'i' kullanmamza gerek yok. Default olarak geliyor zaten


-- SORU18: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat etmeksizin listeleyeniz
-- Başlangıcı göstermek için ^ karakteri kullanılır.
select * from kelimeler where regexp_like(kelime, '^ho|^hi');


-- SORU18: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat etmeksizin listeleyeniz.
-- Bitişi göstermek için $ karakteri kullanılır.
select * from kelimeler where regexp_like(kelime, 't$|m');
select * from kelimeler where regexp_like(kelime, 't$|m$');


-- SORU19: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like(kelime, 'h[a-zA-Z0-9]t');
select * from kelimeler where regexp_like(kelime, 'h[a-z:A-Z:0-9]t', 'c');
select * from kelimeler where regexp_like(kelime, 'h[a-z,A-Z,0-9]t', 'c');

-- SORU19A: h ile başlayıp t ile biten 4 harfli kelimeleri (h ile t küçük harfli olanlari) listeleyeniz
select * from kelimeler where regexp_like (kelime, 'h[a-z,A-Z,0-9][a-z,A-Z,0-9]t', 'c');


-- SORU20: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select * from kelimeler where regexp_like(kelime, 'h[a|i]t');
select * from kelimeler where regexp_like(kelime, 'h[ai]t');


-- SORU21: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, 'i|e|m');
select * from kelimeler where regexp_like(kelime, '[mie]');


-- SORU22: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime, '^a|^s');
select * from kelimeler where regexp_like(kelime, '^[as]');


-- SORU23: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime,'[o][o]');
select * from kelimeler where regexp_like(kelime,'[o]{2}');


-- SORU24: içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where regexp_like(kelime,'[o][o][o][o]');
select * from kelimeler where regexp_like(kelime,'[o]{4}');


-- SORU25: ilk harfi s veya b , 3. harfi l olan ve 5 harfli olan kelimelerin küçük harfe dikkat ederek listeleyiniz.
select * from kelimeler where regexp_like(kelime, '[sb][a-z]l[a-z][a-z]', 'c');




-- ===================== CONSTRAINTS - KISITLAMALAR ======================================
/*
    NOT NULL	- Bir Sütunun  NULL içermemesini yani boş olmamasını sağlar.
    UNIQUE		- Bir sütundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar.
    PRIMARY KEY	- Bir sütünün NULL içermemesini ve sütundaki verilerin
                  BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
    FOREIGN KEY	- Başka bir tablodaki Primary Key’i referans göstermek için kullanılır.
                  Böylelikle, tablolar arasında ilişki kurulmuş olur.
                  foreign ve primary ile tablolar birbirine bağlamadan da, id leri ayni olan
                  satirlarda işlem yap diyebiliriz, böylelikle
                  ayni field verilebilir, parent child ilişkisi olmamiş olur
-- ========================================================================================*/


 CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', null, 5000, '2018-04-14'); -- 2. kez null benzersizlik kstlamasn bozmaz
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- maas null olmaz
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- zaten Can var. UNQUE olmalI
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- integer olmal
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- id tekrar
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- primary key null olmaz

select * from calisanlar;


-- KISITLAMALAR (  FOREIGN KEY)

CREATE TABLE adresler
(
adres_id CHAR(5),
sokak VARCHAR(50),
cadde VARCHAR(30),
sehir VARCHAR(15),
CONSTRAINT id_clsnlr FOREIGN KEY(adres_id) REFERENCES calisanlar(id)
-- (solda tablo seçiliyken üstteki info dan ismi kontrol edebilirsin)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from adresler;

select * from calisanlar;

SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;


drop table calisanlar;
-- calisanlar tablosunu silmeyecek çünkü
-- CONSTRAINT id_clsnlr FOREIGN KEY(adres_id) REFERENCES calisanlar(id)
-- komutu ile calişanların idleri ile adres id leri birbirine bağladık.
-- bağlanti tablolarda child silinmeden parent silinmez

drop table adresler;
-- adresler table silebiliyoruz.



delete from calisanlar where id = 10002; -- parent
-- bağlant olduğu için silemiyoruz.

delete from adresler where adres_id= 10002; -- child


/*============================== ON DELETE CASCADE =============================
  Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliğini aktif hale getirebiliriz.

  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli

==============================================================================*/

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

select * from talebeler;

CREATE TABLE notlar
( talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade);

-- on delete cascade sayesinde
-- parent taki silinen bir kayıt ile ilişkili olan tüm child kayıtlarınısiler.
-- cascade yoksa önce child temizlenir sonra parent


INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

-- FK ile birleştirilen tablolardaki tüm verileri çekmek için
-- JOIN İşlemi yapmak gerekir. Bu konuyu sonra göreceğiz.
SELECT * FROM talebeler, notlar WHERE talebeler.id = notlar.talebe_id;

delete from notlar where talebe_id='123';-- child
-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri silinir. parent taki veri silinmez.

delete from talebeler where id='126';-- parent
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.

select * from talebeler;
select * from notlar;



/* ============================== DELETE ===================================
DELETE FROM tablo_adı;  Tablonun tüm içerğini siler.
DELETE FROM tablo_adı WHERE sutun_adi = veri; Tabloda istediğiniz veriyi girer.
*/

CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;



--    DELETE FROM ogrenciler;     -- Tüm verileri sil.
--    ROLLBACK TO  ABC;  -- Silinen Verileri geri getir.
--    SELECT * FROM ogrenciler;

/* =============================================================================
         Seçerek silmek için WHERE Anahtar kelimesi kullanılabilir.
===============================================================================*/

-- SORU1: id'si 124 olan ogrenciyi siliniz.
DELETE FROM ogrenciler WHERE id = 124;
select * from ogrenciler;


-- SORU2: ismi Kemal Yasa olan satırını siliniz.
delete from ogrenciler where isim = 'Kemal Yasa';


-- SORU3: ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler where isim = 'Nesibe Yilmaz|Mustafa Bak';
DELETe FROM ogrenciler WHERE isim = 'Nesibe Yilmaz' or isim='Mustafa Bak';
DELETe FROM ogrenciler WHERE isim in('Nesibe Yilmaz', 'Mustafa Bak');


-- SORU4: İsmi Ali Can ve id'si 123 olan kaydı siliniz.
delete from ogrenciler where isim = 'Ali Can' and id =123;


-- SORU5: id 'si 126'dan büyük olan kayıtları silelim.
delete from ogrenciler where id> 126;
select * from ogrenciler;


-- SORU6: id'si 123, 125 veya 126 olanları silelim.
delete from ogrenciler where id=123 or id=125 or id=126;
delete from ogrenciler where id in(123,125,126);


-- SORU7:  TABLODAKİ TÜM KAYITLARI SİLELİM..
delete from ogrenciler;
drop table ogrenciler;



CREATE TABLE ogrenciler
(
id CHAR(3),
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);
savepoint abc;

-- savepoint komutuyla tabloları yanlışlıkla silinmeye karşı korumaya almış oluyoruz

-- savepoint sikintisi varsa -> SET autocommit=0;
-- ayarlar sql execution auto commit tiki kaldr

select * from ogrenciler;

delete from ogrenciler;

drop table ogrenciler;
-- drop ile silersek olusturduumuz savepoint'ide silmiş oluruz.
-- yani verileri geri getiremeyiz

rollback to abc;
-- rollback komutu ile silinen verileri geri getiriyoruz.


/* ======================== DELETE - TRUNCATE - DROP ============================

  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
    Ancak, seçmeli silme yapamaz.
    TRUNCATE TABLE where ...... OLMAZ
*/

TRUNCATE TABLE ogrenciler;
-- tablodaki verileri siler

drop table ogrenciler;
-- tabloyu siler

delete from ogrenciler;
-- tablodaki verileri siler

/* 2-) DELETE komutu beraberinde WHERE cümleciği kullanılabilir. TRUNCATE ile kullanılmaz.

-- TRUNCATE komutu tablo yapısını değiştirmeden,
-- tablo içinde yer alan tüm verileri tek komutla silmenizi sağlar.

3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylıkla geri alınabilir.

4-) Truncate ile silinen veriler geri alınması daha zordur. Ancak Transaction yöntemi ile geri alınması mümkün olabilir.

5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da siler.



-- UPDATE - SET

use batch60_61;

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

select * from tedarikciler;

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * FROM tedarikciler;

SELECT * FROM urunler;

select * from tedarikciler , urunler where tedarikciler.vergi_no = urunler.ted_vergino;

-- SYNTAX
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...
-- WHERE koşul;

-- SORU1: vergi_no’su 102 olan tedarikcinin (firma) ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler set firma_ismi = 'Vestel' where vergi_no=102;
select * from tedarikciler;

--  SORU2: Tedarikciler tablosundaki tüm firma isimlerini 'CASPER' olarak güncelleyeniz.
update tedarikciler set firma_ismi = 'CASPER';


-- SORU3: vergi_no’su 101 olan tedarikcinin ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler set firma_ismi = 'casper' where vergi_no=101;
update tedarikciler set irtibat_ismi = 'Ali Veli' where vergi_no=101;

-- yukardaki kodu aşağdaki şekilde birleştirip tek satr olarak yazabiliriz.
update tedarikciler set firma_ismi = 'casper', irtibat_ismi='Ali Veli' where vergi_no=101;


-- SORU4: firma_ismi casper olan tedarikcinin irtibat_ismini 'Bill Gates' olarak güncelleyiniz.
update tedarikciler
set irtibat_ismi = 'Bill Gates'
where firma_ismi='casper';

update tedarikciler set irtibat_ismi = 'Bill Gates' where vergi_no=101;


-- SORU5: urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler
set urun_isim = 'Telefon'
where urun_isim='Phone';
select * from urunler;


-- SORU6: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id 1 arttrn.
update urunler set urun_id = urun_id+1 where urun_id > 1004;
SELECT * FROM urunler;

-- SORU7: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler set urun_id = urun_id + ted_vergino;
SELECT * FROM urunler;



--  SORU8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci  tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
-- 8. soruyu çözmeden önce, tabloları eski haline getireceğiz.
update urunler set urun_isim = (select firma_ismi from tedarikciler where irtibat_ismi = 'Adam Eve')
where musteri_isim='Ali Bak';

-- (select firma_ismi from tedarikciler where irtibat_ismi = 'Adam Eve') -> Apple'i bu satir ile almş olduk.
SELECT * FROM urunler;


 -- SORU9: Laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
update urunler
set musteri_isim = (select irtibat_ismi from tedarikciler where firma_ismi = 'Apple')
where urun_isim = 'Laptop'


/*=============================== ALTER TABLE =========================================

    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin kullanılır.
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de kullanılır.

=======================================================================================*/

use batch60_61;
CREATE TABLE personel
(
	id int PRIMARY KEY,
	isim VARCHAR(50),
	sehir VARCHAR(50),
	maas int,
	sirket VARCHAR(20)
);


INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');

select * from personel;

-- SORU1: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan yeni bir sutun ekleyiniz.
alter table personel
add ulke_ismi varchar(20) default 'Türkiye';

-- SORU2: personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz.
alter table personel add (cinsiyet varchar(20), yas int);

-- SORU3: personel tablosundan sirket sutununu siliniz.
alter table personel drop column sirket;

-- SORU4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak degistiriniz.
alter table personel rename column ulke_ismi to ulke_adi;

-- SORU5: personel tablosunun adini isciler olarak degistiriniz.
alter table personel rename to isciler;

select * from isciler;

-- SORU6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz.
alter table isciler modify ulke_adi varchar(30) not null;

alter table isciler add constraint check (maas >=3000);

INSERT INTO isciler VALUES(456715056, 'Veli Sahin', 'Ankara', 3000, 'Mercedes');
INSERT INTO isciler VALUES(456715057, 'Veli Sahin', 'Ankara', 2000, 'Mercedes');
INSERT INTO isciler VALUES(456715037, 'Veli Sahin', 'Ankara', 5000, 'Mercedes');


--  ============================= SUBQUERIES ====================================
--  SORGU içinde çalişan SORGUYA SUBQUERY (ALT SORGU) denilir.

use batch60_61;

CREATE TABLE calisanlar
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar;
select * from markalar;


-- SORU1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim, maas, isyeri from calisanlar
where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);

-- Yukardaki sorgu aslnda aşağdaki 2 sorgunun birleştirilmiş halidier.
-- select marka_isim from markalar where calisan_sayisi>15000;
-- select isim, maas, isyeri from calisanlar where isyeri in ('LCWaikiki', 'Pierre Cardin');


-- SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
select isim, maas, sehir from calisanlar
where isyeri in (select marka_isim from markalar where marka_id > 101 );

-- Yukardaki sorgu aslnda aşağdaki 2 sorgunun birleştirilmiş halidir.
-- 'Adidas', 'LCWaikiki' --->  select marka_isim from markalar where marka_id > 101;
-- select isim, maas, sehir from calisanlar where isyeri in ('Adidas', 'LCWaikiki');



-- SORU3: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id, calisan_sayisi from markalar
where marka_isim in (select isyeri from calisanlar where sehir = 'Ankara');

-- Yukardaki sorgu aslnda aşağdaki 2 sorgunun birleştirilmiş halidir.
-- 'Vakko', 'Adidas', 'Pierre Cardin'. ----> select isyeri from calisanlar where sehir = 'Ankara';
-- select marka_id, calisan_sayisi from markalar where marka_isim in ('Vakko', 'Adidas', 'Pierre Cardin');


/* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde kullanilabilir.
    Ancak, Sorgu tek bir değer döndürüyor olmalidir.
    SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmammalı
==============================================================================*/

-- SORU4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi, (select sum(maas) from calisanlar where marka_isim = isyeri) as toplam_maas from markalar;
-- (select sum(maas) from calisanlar where marka_isim = isyeri) buradan dönen sonucu isimlendirmek için
-- sorgunun sonuna direk isim yazlr
-- veya as diyerek isim yazlr.


-- SORU5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi , (select round(avg(maas)) from calisanlar where marka_isim = isyeri ) as ort_maas from markalar;
-- round() -> virgülden sonraki saylar yuvarlyor.
-- round(avg(maas))
-- round(avg(maas),2) yazarsak da noktadan sonra 2 hanegelir.
select marka_isim, calisan_sayisi, (select round(avg(maas), 2) from calisanlar where marka_isim = isyeri ) as ort_maas from markalar;


-- SORU6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi, (select max(maas) from calisanlar where marka_isim = isyeri) as max_maas  from markalar;
select marka_isim, calisan_sayisi, (select min(maas) from calisanlar where marka_isim = isyeri) as min_maas  from markalar;

-- max ve min maas bir arada olsun
select marka_isim, calisan_sayisi, (select max(maas) from calisanlar where marka_isim = isyeri) as max_maas,
(select min(maas) from calisanlar where marka_isim = isyeri) as min_maas
  from markalar;


-- SORU7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, (select count(sehir) from calisanlar where marka_isim=isyeri) as sehir_sayisi
from markalar;
-- count(sehir) sehirleri sayar

/*=========================== EXISTS, NOT EXIST ================================
	EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer olarak,
	EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
	bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.

	EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür.
    EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek
    için kullanılır.

    Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE
    değer döndürür. Aksi takdirde, FALSE değer döndürecektir.

    Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır

    SYTAX:
    SELECT kolan_ismi
	FROM tablo_ismi
	WHERE [NOT] EXISTS (
    SELECT kolon_ismi
    FROM tablo_ismi
    WHERE koşul
);
==============================================================================*/

use batch60_61;

CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

CREATE TABLE nisan
(
	urun_id int ,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

   /* -----------------------------------------------------------------------------
  SORU1: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
 -----------------------------------------------------------------------------*/
-- 1. YOL
select urun_id, musteri_isim
from mart
where exists
(select urun_id
from nisan
where mart.urun_id = nisan.urun_id);

-- 2. YOL
select urun_id, musteri_isim from mart where urun_id in (select urun_id from nisan where mart.urun_id = nisan.urun_id);


/* -----------------------------------------------------------------------------
SORU2: Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
-----------------------------------------------------------------------------*/
select urun_isim, musteri_isim
from nisan as nisan_tablo
where exists
(select urun_isim
from mart as mart_tablo
where nisan_tablo.urun_isim=mart_tablo.urun_isim);


/*  SORU3: Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve   bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 -----------------------------------------------------------------------------*/
select urun_isim, musteri_isim
from nisan as nisan_tablo
where not exists
(select urun_isim
from mart as mart_tablo
where nisan_tablo.urun_isim = mart_tablo.urun_isim);



/*===================== IS NULL, IS NOT NULL, COALESCE ========================

    IS NULL, ve IS NOT NULL, BOOLEAN operatörleridir. Bir ifadenin NULL olup
    olmadığını kontrol ederler.

    COALESCE (Birleştirmek) ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.

    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)

==============================================================================*/

CREATE TABLE insanlar
(
	ssn CHAR(9), -- Social Security Number
	isim VARCHAR(50),
	adres VARCHAR(50)
);

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar;

-- isim i null olanlari sorgula
select * from insanlar where isim is null;


-- isim null olmayanlar
select * from insanlar where isim is not null;


-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar set isim = 'NO NAME' where isim is null;
select * from insanlar;


-- soruyu çözmeden önce tabloyu eski haline döndürün
update insanlar set isim = null where isim= 'NO NAME';

/*
SORU4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayalım.
            çoklu değişimde ve  WHERE isim IS NULL or adres is null....;
            gibi ifade yazmamak için. coalesce=birleşmek
*/

update insanlar
set isim = coalesce(isim, 'Henuz isim girilmedi'),
	adres = coalesce(adres, 'Henuz adres girilmedi'),
    ssn = coalesce(ssn, 'No SSN');

select * from insanlar;







/*================================ ORDER BY  ===================================
   ORDER BY cümleciği bir SORGU deyimi içerisinde belli bir SUTUN’a göre
   SIRALAMA yapmak için kullanılır.

   Syntax
   -------
	ORDER BY sutun_adi ASC (ASCENDING)   -- ARTAN, DEFAULT
	ORDER BY sutun_adi DESC (DESCENDING)  -- AZALAN
==============================================================================*/

CREATE TABLE kisiler
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50),
soyisim VARCHAR(50),
maas int,
adres VARCHAR(50)
);

INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');

INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

select * from kisiler;

-- SORU1: kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
select * from kisiler order by adres;
select * from kisiler order by adres asc;
select * from kisiler order by adres desc;
-- asc ye gerek yok. default olarak yapyor zaten

-- SORU2: kisiler tablosunu maaşı büyükten küçüğe göre sırala.
select * from kisiler order by maas desc;


-- SORU3: ismi Mine olanları, maas a göre AZALAN sırada sorgulayınız.
select * from kisiler where isim = 'Mine' order by maas desc;


-- SORU4: soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
select * from kisiler where soyisim='bulut'order by maas;
select * from kisiler where soyisim='bulut'order by maas desc;


-- ***************************** LİMİT **********************************
select * from kisiler;

-- listeden ilk 10 veriyi getir
select * from kisiler limit 10;

-- 10. veriden sonraki 2 veriyi al (11 ve 12)
select * from kisiler limit 10, 2;
-- 10 -> 10 dan sonraki al. 10 dahil değil. 2 - > 2 tane değeri getir.
-- yani 11. ve 12. değer

select * from kisiler where id >10 limit 2;


--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyen sorguyu yazınız.
select * from kisiler order by maas desc limit 3;

/* Oracle SQL Çözümü
select * from kisiler order by maas desc
fetch next 3 rows only;
*/


-- MAAŞ'a göre sıralamada 4. 5.  6. kişilerin bilgilerini listeleyen sorguyu yazınız.
select * from kisiler order by maas desc limit 3,3;
-- ilk, 3 rakami: 4. değeri al diyor.
-- ikinci 3 rakamda: 3 tane değeri getir. yani 4. 5. ve 6. kişiler.


/* Oracle SQL Çözümü
select * from kisiler order by maas desc
OFFSET 3 ROWS			--> ilk 3 kaydı atladık
FETCH NEXT 3 ROWS ONLY;	--> sonraki 3 kisiyi getir
*/