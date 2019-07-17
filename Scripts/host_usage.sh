etup arguments
psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5




host_id=$(cat ~/host_id)
timestamp=$(vmstat -t |tail -1 |awk '{print $18,$19}')
memory_free=$(vmstat --unit M |tail -1 |awk '{print $4}')
cpu_idel=$(vmstat --unit M |tail -1 |awk '{print $15}')
cpu_kernel=$(vmstat --unit M |tail -1 |awk '{print $14}')
disk_io=$(vmstat -d |tail -1 |awk '{print $10}')
aa=$(df -BM | tail -6 | head -1 | awk '{print $4}')
disk_available=$(echo $aa | sed s'/M//')

#Step 2 Construct insert statment
insert_stmt=$(cat <<-END
INSERT INTO host_usage ("timestamp",host_id,memory_free,cpu_idel,cpu_kernel,disk_io,disk_available)
VALUES('${timestamp}',${host_id},${memory_free},${cpu_idel},${cpu_kernel},${disk_io},${disk_available});
END
)
echo $insert_stmt

#Step 3:Execute INSERT statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmt"
sleep 1
