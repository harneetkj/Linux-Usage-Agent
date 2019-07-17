# SQL Solutions



# 1

select cpu_number,
id as host_id,
total_mem,
row_number()
over (partition by cpu_number
order by total_mem)
from host_info;

OR

select cpu_number, id as host_id, total_mem,
from host_info
group by id
order by total_mem


#2

SELECT host_info.id as host_id, host_info.hostname, host_info.total_mem as total_memory, avg(host_info.total_mem - host_usage.memory_free) as used_memory_percentage, (date_trunc('hour', host_usage."timestamp") + date_part('minute',host_usage."timestamp")::int / 5 * interval '5 min') as five_min_interval
FROM host_info
INNER JOIN host_usage ON host_usage.host_id = host_info.id 
GROUP BY five_min_interval, id;

