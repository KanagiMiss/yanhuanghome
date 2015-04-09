<%
ConnectionString = Application("connectionString")

Set Connection = Server.CreateObject("ADODB.Connection")
Set RecordSet = Server.CreateObject("ADODB.Recordset")

Connection.Open ConnectionString

Sql = "SELECT top 1 content FROM tips ORDER BY Rnd(-(1000*ID)*Time())"

RecordSet.Open Sql, Connection, 3, 3

Response.Write(RecordSet("content"))

RecordSet.Close
Connection.Close

Set RecordSet = Nothing
Set Connection = Nothing
%>
