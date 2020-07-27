Select count(*) as total from flights;

Select origin, avg(ArrDelay) as avg_arrDelay, avg(DepDelay) as avg_depDelay from flights
Group by Origin; 

Select origin,
colyear,
colMonth,
avg(ArrDelay) as avg_arrDelay 
from flights
group by origin,
		colyear,
	colmonth
order by Origin, colyear, colmonth;


Select usairports.city,
colyear,
colMonth,
avg(ArrDelay) as avg_arrDelay 
from flights
left join usairports on usairports.iata = flights.origin
group by usairports.city,
		colyear,
	colmonth
order by usairports.city, colYear, colMonth;


select uniquecarrier, colyear, colMonth, sum(cancelled) as total_cancelled
from flights
join usairports on usairports.iata = flights.origin
where cancelled !=0
group by UniqueCarrier,
colyear,
colMonth
order by total_cancelled desc;

select TailNum, sum(Distance) as total_distance
from usairlineflights2.flights
where TailNum != "NA" and TailNum != "#?NOMBRE?"
group by TailNum
order by total_distance desc
Limit 10;

select uniquecarrier, avg(ArrDelay) as avg_arrDelay
from flights
where arrDelay >10.00
group by UniqueCarrier
order by avg_arrDelay desc
;