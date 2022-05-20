-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak
-- İşçiler tablosuna 4 kayıt ekleyin
-- Konsoldaki tabloya bakın



-- Veli Han'ın maaşını en yüksek maaştan yüzde 20 daha azına artırin


-- Ali Can'ın maaşını en düşük maaştan yüzde 30 daha fazla düşürun


-- Maaş ortalama maaştan düşükse maaşları 1000 artırın


-- Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşit artırın



CREATE TABLE people 
(

    ssn CHAR (9),
    name VARCHAR(50),
    address VARCHAR(80)

);

DROP TABLE PEOPLE;


INSERT INTO PEOPLE VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO PEOPLE VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO PEOPLE VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO PEOPLE (ssn, address) VALUES (456789012, 'Michigan');
INSERT INTO PEOPLE (ssn, address) VALUES (567890123, 'California');
INSERT INTO PEOPLE (ssn, name) VALUES (567890123, 'California');




-- Boş adları "ad daha sonra eklenecek" olarak değiştirin


-- Boş adresleri 'Adres daha sonra eklenecek' olarak değiştirin


-- people tablosunda 'Daha sonra eklenecek' tüm boş değerleri değiştirin -- COALESCE ALANLARA GİDER VE BOŞ DEĞERLERİ İKİNCİ PARAMETREYE DEĞİŞTİRİN


