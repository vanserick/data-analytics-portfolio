`---KPI 1 — Average Traffic Volume Per Hour`  
`SELECT t1.hour, round(AVG(t1.traffic_volume), 2) AS average_traffic_volume`  
``FROM `alien-isotope-466916-d0`.`transport_flow`.`passenger_flow` AS t1``  
`GROUP BY t1.hour`  
`ORDER BY average_traffic_volume desc ;`


`---KPI 2 — Peak vs Non-Peak Traffic`  
`SELECT`  
 `t1.is_peak_hour, ROUND(AVG(t1.traffic_volume), 2) AS average_traffic_volume,`  
 `sum(traffic_volume) AS total_traffic_volume`  
``FROM `alien-isotope-466916-d0`.`transport_flow`.`passenger_flow` AS t1``  
`GROUP BY t1.is_peak_hour`  
`ORDER BY t1.is_peak_hour;`


`---KPI 3 — Traffic by Day of Week`  
`SELECT`  
 `t1.day_of_week,`  
 `ROUND(AVG(t1.traffic_volume), 2) AS average_traffic_volume,`  
 `SUM(t1.traffic_volume) AS total_traffic_volume,`  
 `t1.week_day_num`  
``FROM `alien-isotope-466916-d0`.`transport_flow`.`passenger_flow` AS t1``  
`GROUP BY t1.day_of_week, t1.week_day_num`  
`ORDER BY average_traffic_volume desc;`


`-- traffic by month`  
`SELECT`  
 `t1.month,`  
 `ROUND(AVG(t1.traffic_volume), 2) AS average_traffic_volume,`  
 `SUM(t1.traffic_volume) AS total_traffic_volume`  
`FROM`  
 `` `alien-isotope-466916-d0`.`transport_flow`.`passenger_flow` AS t1 ``  
`GROUP BY`  
 `t1.month`  
`ORDER BY`  
 `average_traffic_volume desc;`


`-- Percentage of Traffic During Peak Hours`  
`SELECT`  
`round(`  
 `( SUM(CASE`  
       `WHEN t1.is_peak_hour THEN t1.traffic_volume`  
       `ELSE 0`  
   `END`  
     `) / SUM(t1.traffic_volume)) * 100, 2) AS peak_traffic_percentage,`  
`FROM`  
 `` `alien-isotope-466916-d0`.`transport_flow`.`passenger_flow` AS t1; ``

