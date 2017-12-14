

petrol_src = LOAD '/user/dpsashanka/pig/petrol.txt' USING PigStorage (',') as (distrbtr_id: chararray, distrbtr_name: chararray, amnt_in: chararray, amnt_out: chararray, volume_in: int, volume_out: int, year: int);

1)
A = GROUP petrol_src by distrbtr_name;
B = FOREACH A GENERATE group, SUM(petrol_src.volume_out);

2) 
A = FOREACH petrol_src GENERATE distrbtr_id,volume_out;
C = ORDER A by volume_out;
B = LIMIT C 10;

3)
A = FOREACH petrol_src GENERATE distrbtr_id,volume_out;
B = LIMIT C 10;
C = ORDER A by volume_out;

4)
A = FILTER petrol_src by ((volume_in - volume_out)>500);
B = FOREACH A GENERATE distrbtr_id, distrbtr_name, year;
C = GROUP B by year,distrbtr_id;





