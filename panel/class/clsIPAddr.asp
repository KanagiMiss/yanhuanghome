<%
' ------------------------------------------------------------------------------
Class IPAddr
' ------------------------------------------------------------------------------
	private internal_strIpAddr		' ip address
	private internal_strIploc	    ' ip location
    private internal_strISP         ' ip isp
	private internal_nIpNum	        ' ip number
' ------------------------------------------------------------------------------
	Private Sub Class_Initialize()
        internal_nIpNum = 0
        internal_strIploc = ""
        internal_strISP = ""
        internal_strIpAddr = ""
	End Sub
' ------------------------------------------------------------------------------
	Private Sub Class_Terminate()

	End Sub
' ------------------------------------------------------------------------------
	Public Property Get IpAddressString
        IpAddressString = internal_strIpAddr
	End Property
' ------------------------------------------------------------------------------
	Public Property Get IpAddressNumber
        IpAddressNumber = internal_nIpNum
	End Property
' ------------------------------------------------------------------------------
    Public Property Get IpAddrLocation
        IpAddrLocation = internal_strIploc
	End Property
' ------------------------------------------------------------------------------
	Public Property Get IpAddrISP
        IpAddrISP = internal_strISP
	End Property
' ------------------------------------------------------------------------------
	Public Property Let IpAddress(ByVal ipaddr) 'initialize by ip addres string
        Dim i, pos, PrevPos, num
        If ipaddr = "" Then
        internal_nIpNum = 0
        Else
        For i = 1 To 4
            pos = InStr(PrevPos + 1, ipaddr, ".", 1)
            If i = 4 Then 
                pos = Len(ipaddr) + 1
            End If
            num = Int(Mid(ipaddr, PrevPos + 1, pos - PrevPos - 1))
            PrevPos = pos
            internal_nIpNum = ((num Mod 256) * (256 ^ (4 - i))) + internal_nIpNum
        Next
        End If
        Call FetchIpAddressLocation()
	End Property
' ------------------------------------------------------------------------------
	Private Sub FetchIpAddressLocation()  'fetch ip location
        Dim ConnectionString,Connection,RecordSet
        ConnectionString = Application("ipConnectionString")
        Set Connection = Server.CreateObject("ADODB.Connection")
        Set RecordSet = Server.CreateObject("ADODB.Recordset")

        Connection.Open ConnectionString

        Sql = "SELECT TOP 1 Country,Location FROM iplocal WHERE StartIPNum<"&internal_nIpNum&" AND EndIPNum>"&internal_nIpNum&" ORDER BY ID ASC"

        RecordSet.Open Sql, Connection, 3, 3

        If Not RecordSet.EOF Then
            internal_strIploc = RecordSet("Country")
            internal_strISP = RecordSet("Location")
        Else
            internal_strIploc = RecordSet("N/A")
            internal_strISP = RecordSet("N/A")
        End If

        RecordSet.Close
        Connection.Close

        Set RecordSet = Nothing
        Set Connection = Nothing
	End Sub
' ------------------------------------------------------------------------------
End Class
' ------------------------------------------------------------------------------
%>