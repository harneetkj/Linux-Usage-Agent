CREATE TABLE PUBLIC.host_info
(
id SERIAL NOT NULL,
hostname VARCHAR NOT NULL,
cpu_number INT2 NOT NULL,
cpu_architecture VARCHAR NOT NULL,
cpu_model VARCHAR NOT NULL,
cpu_mhz FLOAT8 NOT NULL,
12_cache INT4 NOT NULL,
"timestamp" TIMESTAMP NULL,
total_mem INT4 NULL,
CONSTRAINT host_info_pk PRIMARY KEY(id),
CONSTRAINT host_info_un UNIQUE (hostname)
);

INSERT INTO host_info (id, hostname, cpu_number, cpu_architecture,cpu_model, cpu_mhz, 12_cache, "timestamp", total_mem)VALUES(1,'jrvs-remote-desktop-centos8-6.us-centrall-a.cspry-framework-236416.internal',1,'x86_64','Intel(R) Xeon(R) CPU @2.30GHz', 2300,256,'2019-05-29 17:49:53.000', 601324); 
