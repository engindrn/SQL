--Personel isminde bir tablo olusturalim- DDL data definiation language
create table personel(
pers_id int,
    isim varchar(30),
    sehir varchar(30),
    maas int,
    sirket varchar(20),
    adres varchar(50)
);
select * from personel;

--Varolan personel tablosundan pers_id, sehir, adres, field'larina sahip personel_adres adinda yeni bir tablo olusturalim

create table personel_adres as select pers_id,sehir,adres from personel; 

select * from personel

select * from personel_adres;



--DML --> Data Manupulation Lang.
--  INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri guncelleme ve silme islemlerinde kullanilan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES('1001','Ali Can',25);
INSERT into student VALUES('1002','Veli Can',35);
INSERT into student VALUES('1003','Ayse Can',45);
INSERT into student VALUES('1004','Derya Can',55);

--Tablo'ya parcali veri ekleme
insert into student (st_name,age) values ('Murat Can',65);



--DQL --> Data Query Lang.
--SELECT

select *from student;            -- seçme işlemi * ile yapılırsa bütün datayı getirir
select st_name from student;     --sadece table dan st_name sutununu aldık
--SELECT komutu WHERE kosulu
SELECT * from student where age>35;    -- student table ından yaşi 35 üzeri olanları seçtik



--TCL - Transaction Control Lang.
--Begin - Savepoint - rollbback - commit
--Transaction veri tabani sistemlerinde bir islem basladiginda baslar ve islem bitince sona ere
--Bu islemler veri tabani olustrma , veri silme, veri guncelleme, veriyi geri getirme gibbi islemler olabilir
CREATE TABLE ogrenciler2
(
id serial,             --serial dedik yani veri satısına göre sıralı ekleyecek bu yüzden eklemeyi default yapmalıyız
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);
Begin;
insert into ogrenciler2 values (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 values (default,'Canan Gul','Ayse Sen',90.5);
savepoint x;       --savepointe isim verdik
insert into ogrenciler2 values (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 values (default,'Ahmet Sen','Ayse Can',65.5);

ROLLBACK TO x;   --datalarımızın ilk haline  x e dönmek için.  yani savepoint sonrası eklediğimiz datalar gitti

SELECT * from ogrenciler2;

commit;

--Transaction kullaniminda serial data turu kullanimi tavsiye edilmez 
--savepoint'den sonra ekledigimiz veride sayac mantigi ile calistigi icin 
--sayac'da en son hangi sayida kaldiysa oradan devam eder
--Not:PostgreSQL'de Transaction kullanimi icin Begin komutu ile baslariz sonrasinda tekrar yanlis bir 
--veriyi duzeltmek veya bizim icin onemli verilerden sonra ekleme yapabilmek icin 'SAVEPOINT save_point_adi'
--komutunu kullaniriz ve bu savepoint'e donebilmek icin'ROLLBACK TO save_point_adi' komutunu kullaniriz
--ve rollback calistirildiginda savepoint yazdigimiz satirin ustundeki verileri
--tabloda bize verir ve son olarak Transaction'i sonlandirmak icin mutlaka 'COMMIT' komutunu kullaniriz.
--MySQL'de transaction olmadan da kullanilir


--DML - DELETE -
--DELETE FROM tablo_adi    --> Tablo'nun tum icerigini siler
--Veriyi secerek silmek icin WHERE kosulu kullanilir
--DELETE FROM tablo_adi WHERE sutun_adi=veri   --->Tablo'daki istedigimiz veriyi siler


CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(128, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;
select * from ogrenciler where id=126;

-- Soru : id'si 127 olan öğrenciyi siliniz
DELETE FROM ogrenciler WHERE id=127;

-- Soru : ismi Kemal Yasa olan satırı siliniz
DELETE FROM ogrenciler WHERE isim='Kemal Yasa';

-- Soru : ismi Nesibe Yılmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler WHERE isim='Nesibe Yilmaz'or isim= 'Mustafa Bak';

-- soru : ismi Ali Can ve id'si 123 olan kaydı siliniz
DELETE FROM ogrenciler WHERE isim='Ali Can'or id= 123;

--tablodaki tüm dataları silelim
delete from ogrenciler

--DELETE - TRUNCATE -->
-- TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
-- Ancak, seçmeli silme yapamaz

TRUNCATE TABLE ogrenciler

-- DDL - Data Definition Lang.
-- CREATE - ALTER - DROP

-- ALTER TABLE --
-- ALTER TABLE tabloda ADD, TYPE(MODIFY), SET, RENAME veya DROP COLUMNS işlemleri için kullanılır

--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--select * from personel;  ismini aşağıda değiştirdik artık yeni isimle çağırdık
select * from personel;

-- Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
alter table personel add cinsiyet varchar(20), add yas int;

--Personel tablosundan sirket field'ini siliniz
alter table personel drop column sirket

-- Personel tablosundaki sehir sutununun adını ulke olarak değiştirelim
alter table personel rename column sehir to ulke

--personl tablosunun adını isciler olarak degistiriniz
alter table personel rename to isciler

-- DDL - DROP komutu -- tamamını siler istersek yukardan tekrar çağırırız personeli dikkat ismi değiştik onuda çağır
DROP table isciler;



