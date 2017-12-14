/* NYSE 2014 records to display */

CREATE TABLE nyse_2014 (
stock_symbol STRING,
stock_date STRING,
stock_price_open FLOAT,
stock_price_high FLOAT,
stock_price_low FLOAT,
stock_price_close FLOAT,
stock_volume INT)
row format delimited
fields terminated by ','
STORED AS TEXTFILE;

hadoop fs -copyFromLocal '/home/dpsashanka/data/nyse_2014.csv' '/user/dpsashanka/data'

LOAD DATA LOCAL INPATH '/user/dpsashanka/data/nyse_2014.csv' overwrite into TABLE nyse_2014;

/* total number of records present*/
SELECT count(*) from nyse_2014; -------->>>>>>  145126 row(s)

/* show the records having stock closing price more than stock opening price*/
SELECT stock_symbol,stock_date from nyse_2014 where (stock_price_close>stock_price_open);  ------->>  67454 row(s)

/* display symbol of the stocks along with its volume and stock price difference*/
select stock_symbol, stock_volume, (stock_price_close-stock_price_open) as value_difference from nyse_2014;

/*display the stock records along with price variation */
select stock_symbol, (stock_price_high-stock_price_low) as price_variation from nyse_2014;

/*display the stock records along with price_variation and price_difference which have more variation than difference*/*/
select stock_symbol, (stock_price_high-stock_price_low) as price_variation, (stock_price_close-stock_price_open) as price_difference from nyse_2014 where (stock_price_high-stock_price_low)>(stock_price_close-stock_price_open); ------->> 128286 row(s)

