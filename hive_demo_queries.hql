/*creation of tables to monitor petrol usage and utilisation
db name: saphada_db
*/

create external table petrol(
distrbtr_id int,
distrbtr_name string,
amnt_in string,
amnt_out string,
volume_in int,
volume_out int,
year int)
row format delimited
fields terminated by ','
stored as textfile ;

load data local inpath '/home/dpsashanka/hive/petrol.txt' overwrite into table petrol;


Scenarios:

1)In real life what is the total amount of petrol in volume sold by every distributor?
A) select distrbtr_name,sum(volume_out) from petrol group by distrbtr_name;

2)Which are the top 10 distributors ID’s for selling petrol and also display the amount of petrol sold in volume by them individually?
A) select distrbtr_id,volume_out from petrol order by volume_out desc limit 10;

3)Find real life 10 distributor name who sold petrol in the least amount.
A) select distrbtr_name,volume_out from petrol order by volume_out limit 10;

4) List all distributors who have this difference, along with the year and the difference which they have in that year.
A) select distrbtr_id, distrbtr_name, year from petrol where (volume_in
-volume_out)>500 group by year,distrbtr_name,distrbtr_id;

############################################################################################################################################################


/*scenario- 2
Olympic*/

create external table olympic(
Athlete_name string,
age int,
country string,
year int,
closing_date string,
sport string,
gold_medals int,
silver_medals int,
bronze_medals int,
total_medals int)
row format delimited
fields terminated by ','
stored as textfile ;

load data local inpath '/home/dpsashanka/hive/olympic_data.csv' overwrite into table olympic;

ALTER TABLE olympic    
set serde 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = '\t');

Scenarios:

1. Using the dataset list the total number of medals won by each country in swimming.
A) select country, sum(total_medals) as medals from olympic where sport='Swimming' group by country;

2. Display real life number of medals India won year wise.
A) select Sum(total_medals), year from olympic where country = 'India' group by year;

3. Find the total number of medals each country won display the name along with total medals.
A) select country, sum(total_medals) from olympic group by country;

4. Find the real life number of gold medals each country won.
A) select country, sum(gold_medals) from olympic group by country;

5. Which country got medals for Shooting, year wise classification?
A) select country,year, sum(gold_medals), sum(silver_medals), sum(bronze_medals), sum(total_medals) from olympic where sport='Shooting' group by country, year;