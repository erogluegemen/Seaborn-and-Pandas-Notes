/*
Data Manipülasyon Komutları:

- SELECT: Veritabanındaki tablolardan kayıtları çeker.
- INSERT: Tabloya yeni kayıt ekler.
- UPDATE: Bir tablodaki kaydın bir ya da daha fazla alanını güncelleri değiştirir. 
- DELETE: Bir tablodan kayıt siler.
- TRUNCATE: Tablonun içini boşaltır.

Veritabanı Manipülasyon Komutları:

- CREATE: Bir veritabanı nesnesini oluşturur.
- ALTER: Bir veritabanı nesnesinin özelliği değiştirir.
- DROP: Bir veritabanı nesnesini siler.
*/

USE ETRADE 
SELECT CUSTOMERNAME FROM CUSTOMERS
-- Kolon ismi iki kelimeyse (İSİM SOYİSİM gibi), çağırılırken [İSİM SOYİSİM] diye köşeli parantez ile çağırılır.

INSERT INTO CUSTOMERS
(CUSTOMERNAME, CITY, BIRTHDATE, DISTRICT, GENDER)
VALUES
('Alkan Canbakış', 'Istanbul', '2001-08-30', 'Beykoz', 'E')


SELECT * FROM CUSTOMERS

UPDATE CUSTOMERS
SET NATION='TR', AGE=DATEDIFF(YEAR, CUSTOMERS.BIRTHDATE, GETDATE())


-- DELETE FROM CUSTOMERS -- Where koşulu verilmediği sürece tabloyu tamamen siler.

-- TRUNCATE TABLE CUSTOMERS 
/*
Truncate komutu tablonun içini boşaltır. Başlangıçtaki haline getirir. 
Delete komutunda 100 verilik bi tabloyu sildikten sonra yeni veri ekleyince 101den başlar.
Truncate komutunda ise tekrarda resetler ve 1den başlar.
*/


SELECT * FROM CUSTOMERS
WHERE CUSTOMERNAME='Zeynep Çağla Baykan' OR CUSTOMERNAME='Egemen Eroğlu'
/*
= Eşittir
<> Eşit değildir
> Büyüktür
< Küçüktür
>= Büyük eşittir
<= Küçük eşittir
BETWEEN Arasındadır
LIKE İle başlar, ile biter, içerir
NOT LIKE İle başlamaz, ile bitmez, içermez
IN İçindedir
NOT IN İçinde değildir
*/

UPDATE CUSTOMERS SET DISTRICT='Bağcılar' WHERE DISTRICT='Güngören'

-- DISTINCT: Tekrar eden satırları tekilleştirmek amacıyla kullanılır.

SELECT DISTINCT CITY FROM CUSTOMERS -- Istanbul


SELECT * FROM CUSTOMERS
ORDER BY CUSTOMERNAME ASC, DISTRICT, GENDER, AGE -- DESC / ASC


SELECT TOP 3 * FROM CUSTOMERS


SELECT 
CITY,
MAX(AGE) AS MAX_AGE, 
MIN(AGE) AS MIN_AGE,
COUNT(*) AS COUNT_AGE,
SUM(AGE) AS SUM_AGE,
AVG(AGE) AS AVG_AGE
FROM CUSTOMERS

GROUP BY CITY


SELECT *,
CONVERT(datetime,BIRTHDATE) AS BDAY2
FROM CUSTOMERS WHERE CITY = 'ISTANBUL'
ORDER BY BIRTHDATE



-- ALIAS
SELECT
CUSTOMERNAME AS MUSTERIADI,
CITY AS SEHIR,
BIRTHDATE DOGUMGUNU, -- AS yazmasak da olur
GENDER CİNSİYET
FROM CUSTOMERS
