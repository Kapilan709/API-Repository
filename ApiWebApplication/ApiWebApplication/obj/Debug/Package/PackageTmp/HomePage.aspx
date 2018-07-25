<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ApiWebApplication.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <style type="text/css">
        .Gridview
        {
        font-family:Verdana;
        font-size:10pt;
        font-weight:normal;
        color:black;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="height:200px; width:100%;  background-color:black">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblName" Text="Name:"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="height:100px; width:100%; align-content:center;">
                <tr>
                    <td style="width:40%">

                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblCity" Text="Where"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlCity" OnSelectedIndexChanged="selectedChangeCity" AutoPostBack="true">
                            <asp:listitem value="1">Dublin</asp:listitem>
                            <asp:listitem value="2">Cork</asp:listitem>
                            <asp:listitem value="3">Galway</asp:listitem>
                            <asp:listitem value="4">Limerick</asp:listitem>
                            <asp:listitem value="5">Dundalk</asp:listitem>
                            <asp:listitem value="6">Bray</asp:listitem>
                            <asp:listitem value="7">Athlone</asp:listitem>
                            <asp:listitem value="8">Wexford</asp:listitem>
                        </asp:DropDownList>
                        <asp:Label runat="server" ID="Label1" Text="When"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlDate">
                            <asp:listitem value="1">Today</asp:listitem>
                            <asp:listitem value="2">Tomorrow</asp:listitem>
                            <asp:listitem value="3">Next week</asp:listitem>
                            <asp:listitem value="4">Next Month</asp:listitem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
            <div id="panel" style="height: 500px; background-color: White; padding: 10px; overflow: auto">
                <%--<asp:GridView ID="gvDetails" AllowPaging="true" PageSize="5" 
                 runat="server"></asp:GridView> --%>
               <asp:GridView ID="gvDetails" runat="server" AllowPaging="true" PageSize="5"
                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8" 
                   ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                    <asp:Label ID="Name" runat="server" Text='<%#Eval("Name") %>'/>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                    <asp:Label ID="City" runat="server" Text='<%#Eval("City") %>'/>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Venue">
                    <ItemTemplate>
                    <asp:Label ID="Venue" runat="server" Text='<%#Eval("Venue") %>'/>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                    <asp:Label ID="DateTime" runat="server" Text='<%#Eval("DateTime") %>'/>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time">
                    <ItemTemplate>
                    <asp:Label ID="Time" runat="server" Text='<%#Eval("Time") %>'/>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
    </form>
</body>
</html>
