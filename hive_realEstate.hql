
CREATE EXTERNAL TABLE IF NOT EXISTS realEstate (street string, city string, zip int, state string, bed int, baths int, sq_ft int, type string, sale_date string, price int, latitude int, longitude int) row format delimited fields terminated by ',' stored as textfile;

LOAD DATA LOCAL INPATH '/home/dpsashanka/data/real_estate.csv' overwrite into table realEstate;


1)	City wise list all the Condos which is not less than ten thousand.
A.	select city from realEstate where price > 10000 and type = "Condo" group by city;

2)	In GALT city which residential type has more than 800sq__ft. Display their respective details street,sq__ft,sale_date,city.
A.	SELECT street, sq_ft, sale_date, city from realEstate WHERE city="GALT" and type="Residential" and sq_ft > 800;

3)	Which is the cheapest Condo in CA. name the city,street and price for the Condo.
A.	select city, street, price from realEstate where type = "Condo" order by price limit 1;

4)	List top 5 residency details which lie in the budget of 60000-120000, an area more than 1450, sold after 17th may, min bedroom 3 and, min bathroom 2.
A.	select * from realEstate where (price >= 60000 and price <= 120000) and sq_ft > 1450 and bed>=3 and baths>=2 and sale_date = "MAY 17" order by price limit 5;

5)	separate list of residential apartments with more than 2 beds. Also include columns in following order City,Baths,Sq_feet,Price,flat_type,Beds respectively
A.	select city, baths, sq_ft, price, type as flat_type, bed from realEstate where bed > 2;

or
A.	
create external table if not exists requiredApartmnts (city string, baths int, sq_ft int, price int) partitioned by (type string,bed int) row format delimited fields terminated by ',' stored as textfile;

insert into table requiredApartmnts partition(type,bed) select city, baths, sq_ft, price, type, bed from realEstate where bed > 2 and type = "Residential";