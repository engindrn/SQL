/*
DDL- DATA DEFINITION LANGUAGE
CREAT - ALTER- DROP
*/
--create -toblo oluşturma-

create table ogrenci(
ogr_no int,
ogr_isim varchar(30),
notlar real,        --ondalıklı sayılar için kulanılır
yas int,
adres varchar(50),
kayit_tarih date);

select * from ogrenci   /*bu table daki dataları getir dedik*/

--varolan table dan yeni bir table oluşturma tamamen yeni bir tablo sadece data türleri ve başlıkları as ogrenci table
create table ogr_notlari as select ogr_no, notlar from ogrenci;
/*yukardaki toblodan ogr_no ve notlar kısmını alarak ogr_notları adında yeni bir table oluşturduk*/

select * from ogr_notlari
