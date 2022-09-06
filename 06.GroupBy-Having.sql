/*
-- GROUP BY -- HAVİNG --
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır
having group by ardından filtreleme için kullanılır
*/

CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
select name, sum(salary) AS "Total Salary"
from workers
group by name
having sum(salary)>2500;  ----*****"GROUP BY" DAN SONRA WHERE KULLANILMAZ

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun
select state,count(state) as number_of_employees    --birinci state tabloya şehir isimleri getirmesi için yazdık
from workers
group by state
having count(state)>1;

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state, max(salary) from workers
group by state
having max(salary)<3000;

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, min(salary) as min_salary
from workers
group by company  
having min(salary)>2000;

--Tekrarsız isimleri çağırın.
select distinct name from workers;     ---****DISTINCT clause, çsğırılan terimlerden tekrarlı olanların sadece birini vrr

select name, count(name)from workers    --hangi isimden kaç tane onu çağırdık
group by name

--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name, company    ---nameyi görmek için çağırıdk sıralamk için aşağıda company i kullandık
from workers
order by length(company);          ---length methodu

----concate() fonksiyonu birden fazla sutun veya string degerini birlestirmek icin kullanilir*******
--1.yol 
--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
select CONCAT(name,' ',state) as name_and_state
from workers
order by length (CONCAT(name,state))    --- yada order bu length(name)+ length(state);

--2.YOL
select name || ' ' || state || length(name) + length(state)    --|| concat yerine kulllanılabilir
from workers
order by length(name)+ length(state)

