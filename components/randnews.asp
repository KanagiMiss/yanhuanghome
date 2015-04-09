<%
Dim Connection
Dim RecordSet
Dim ConnectionString

ConnectionString = Application("connectionString")

Set Connection = Server.CreateObject("ADODB.Connection")
Set RecordSet = Server.CreateObject("ADODB.Recordset")

Connection.Open ConnectionString

Sql = "SELECT top 1 ID,ntitle,nabstract FROM news ORDER BY Rnd(-(1000*ID)*Time())"

RecordSet.Open Sql, Connection, 3, 3

Response.Write("<p><strong>"&RecordSet("ntitle")&"</strong></p>")
Response.Write("<p>"&RecordSet("nabstract")&"...</p>")
Response.Write("<p class='readmore'><a href='showpage.asp?type=news&id="&RecordSet("ID")&"'>继续阅读 &raquo;</a></p>")

RecordSet.Close
Connection.Close

Set RecordSet = Nothing
Set Connection = Nothing
%>