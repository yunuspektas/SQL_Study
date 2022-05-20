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


 -- 2) Veli Han'ın maaşına %20 zam yapınız.
    
    
 -- 3) Maaşı ortalamanın altında olanlara %20 zam yapınız.
    
                    
-- 4) calisanların isim ve cocuk_sayisi'ni listeyen sorguyu yazınız.
		
            
-- 5) calisanlar' ın  isim ve toplam_gelir'lerini gösteren bir sorgu yazınız. 
-- toplam_gelir = calisanlar.maas + aileler.ek_gelir 
   
-- 6) eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın  maaşına ek %10 aile yardım zammı yapınız. 
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
   