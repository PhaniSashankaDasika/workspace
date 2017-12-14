
movies = LOAD '/user/dpsashanka/pig/movies_list.csv' USING PigStorage(',') as (id,name,year,rating,duration);

movies_rating_greaterthan_three = filter movies by (float)rating >3.0;
movies_in_order = order movies by year;
movies_name_year_rating = FOREACH movies_in_order generate name,year,rating ;
movies_after_1980 = filter movies_name_year_rating by (int)year >1980;

STORE movies_after_1980 into '/user/dpsashanka/pig/movies_after_1980';

