<!-- ####################################################################################################### -->
    <%
    name = request.form("adminname")
    pass = request.form("adminpass")

    if name="" or pass="" then
        response.Redirect("loginfailed.asp?err=2")
    else
        response.expires=-1
        sql="SELECT upass FROM users WHERE users.uname='" & name & "';"

        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.ACE.OLEDB.12.0"
        url = Server.Mappath("../data/main.mdb")
        conn.Open(url)
        set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql,conn
        
        if rs.EOF then
            response.Redirect("loginfailed.asp?err=1")
        else
            do until rs.EOF
                for each x in rs.Fields
                    if x.name="upass" then
                        if x.value=pass then
                            session("login_name")=name
                            session("islogin")="yes"
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

    %>
