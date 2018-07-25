<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ApiWebApplication.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                    <td>Phone Number:</td>
                    <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Note:</td>
                    <td><asp:TextBox ID="txtNote" runat="server"></asp:TextBox></td>
                    <td><asp:Button ID="btnSave" runat="server" Text="Save Button" OnClick="onClickSave"/></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
