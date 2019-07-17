

<h1 id="introduction">Linux Clustering Monitoring agent</h1>
<h2> Introduction</h2>
<p>This monitoring agent can be helpful for Infrastructure managers to keep track of hardwares and resource usage. We persist the data in a RDBMS. </p>
<h1 id="java-grep-app" Design</h1>

![Architecture](C:%5CUsers%5CDefault.DESKTOP-UG8FM9U%5CDownloads%5Clinux.png)
<p>The app searches for a text pattern recursively in a given directory, and output matched lines to a file .</p>
<h2 id="usage">Usage</h2>
<h3> Tables </h3>
<h3>  host_info </h3> 

<p> Each record contains hardware information about a single machine</p>
 <h3> host_usage</h3>
<p> Holds periodic information about resource usage. Each record holds a host id which is used as a foreign key to host_info.</p>
<h3> Scripts</h3>
<h3> host_info.sh</h3>
<p>Obtains data from the current machine and inserts the values into the PUBLIC.host_info table.</p>
<h3>host_usage.sh</h3>
<p>Obtains resource information from the current machine and inserts the values into the PUBLIC.host_usage table.
</p>
<h3>init.sql</h3>
<p>Runs the DDL commands which defines the schema and generates the tables.</p>

<h2> Limitations</h2>
<p> 
1)  Adjust timestamps to fit to a universal time zone.

2) Measure available disk space than just the root directory.
</p>
> Written with [StackEdit](https://stackedit.io/).

> Written with [StackEdit](https://stackedit.io/).
