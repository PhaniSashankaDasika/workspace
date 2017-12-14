
olympic_src = LOAD '/user/dpsashanka/pig/olympic_data.txt' USING PigStorage(',') as (Athlete_name: chararray, age: int, country: chararray, year: int, closing_date: chararray, sport: chararray, gold_medals: int, silver_medals: int, bronze_medals: int, total_medals: int);
A = filter olympic_src by sport == 'Swimming';
B = group A by country;
C = FOREACH B generate SUM(A.total_medals),B.country;











Invalid field projection. Projected field [petrol_src] does not exist in schema: group:chararray,A:bag{:tuple(Athlete_name:chararray,age:int,country:chararray,year:int,closing_date:chararray,sport:chararray,gold_medals:int,silver_medals:int,bronze_medals:int,total_medals:int)}.
Details at logfile: /home/dpsashanka/pig_1512038619794.log
