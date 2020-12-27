# novnc

1. Copy your own servers.conf file.
<pre>
cp etc/servers.conf.example etc/servers.conf
</pre>

2. update etc/servers.conf for your vncservers.

3. Add ssl certificate files to etc/ssl (optional)
<pre>
etc/ssl/fullchain.pem
etc/ssl/privkey.pem
</pre>

4. start up novnce service.
<pre>
docker-compose up -d
</pre>
