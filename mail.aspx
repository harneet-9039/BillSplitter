<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mail.aspx.cs" Inherits="mail" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>To : </td>
                <td>
                    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Subject:      </td>
                <td>
                    <asp:TextBox ID="txtsubject" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Message:
                </td>
                <td>
                    <asp:TextBox ID="txtmessage" runat="server" TextMode="MultiLine" Height="99px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Bttn_Send" runat="server" Text="Send" OnClick="Bttn_Send_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
