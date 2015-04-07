<!-- ####################################################################################################### -->
    <%
    name = request.form("adminname")
    pass = request.form("adminpass")

    if name="" or pass="" then
        response.Redirect("loginfailed.asp?err=2")
    else
        response.expires=-1
        sql="SELECT ID,upass FROM users WHERE users.uname='" & name & "';"

        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider=Application("dbProvider")
        url = Server.Mappath("../data/main.mdb")
        conn.Open(url)
        set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql,conn
        
        if rs.EOF then
            response.Redirect("loginfailed.asp?err=1")
        else
            do until rs.EOF
                for each x in rs.Fields
                    if x.name="ID" then
                        uid=x.value
                    elseif x.name="upass" then
                        if x.value=pass then
                            session("login_name")=name
                            session("islogin")="yes"
                            conn.Execute "UPDATE visitors SET acountname='"&name&"',acountid="&uid&" WHERE ID="&Session("vid"), , adCmdText + adExecuteNoRecords
                            response.Redirect("../panel/index.asp")
                        else
                            response.Redirect("loginfailed.asp?err=1")
                        end if
                    end if
                next
                rs.MoveNext
            loop
        end if
    end if
    rs.Close
    conn.Close
    %>
