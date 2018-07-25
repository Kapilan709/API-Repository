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
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblCity" Text="Where"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlCity" AutoPostBack="true" CssClass="form-control search_box">
                            <asp:listitem value="1">Dublin</asp:listitem>
                            <asp:listitem value="2">Cork</asp:listitem>
                            <asp:listitem value="3">Galway</asp:listitem>
                            <asp:listitem value="4">Limerick</asp:listitem>
                            <asp:listitem value="5">Dundalk</asp:listitem>
                            <asp:listitem value="6">Bray</asp:listitem>
                            <asp:listitem value="7">Athlone</asp:listitem>
                            <asp:listitem value="8">Wexford</asp:listitem>
                        </asp:DropDownList>
	</td>
	<td>
                        <asp:Label runat="server" ID="Label1" Text="When"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlDate" CssClass="form-control search_box">
                            <asp:listitem value="1">Today</asp:listitem>
                            <asp:listitem value="2">Tomorrow</asp:listitem>
                            <asp:listitem value="3">Next week</asp:listitem>
                            <asp:listitem value="4">Next Month</asp:listitem>
                        </asp:DropDownList>
               </td>     
                </tr>
            </table>
        </div>
        <div>  
       <asp:GridView ID="GridView1" AllowPaging="true" runat="server"></asp:GridView>  
  
   </div>  
    </form>
</body>
</html>
