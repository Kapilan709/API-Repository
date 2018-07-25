<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ApiWebApplication.HomePage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Concerts</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/animate.css">
  <link href="css/prettyPhoto.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .Gridview
        {
        font-family:Verdana;
        font-size:10pt;
        font-weight:normal;
        color:black;
        }

        .Grid {background-color: #fff; margin: 5px 0 10px 0; border: solid 1px #525252; border-collapse:collapse; font-family:Calibri; color: #474747;}

        .Grid td {

              padding: 2px;

              border: solid 1px #c1c1c1; }

        .Grid th  {

              padding : 4px 2px;

              color: #fff;

              background: #363670 url(Images/grid-header.png) repeat-x top;

              border-left: solid 1px #525252;

              font-size: 0.9em; }

        .Grid .alt {

              background: #fcfcfc url(Images/grid-alt.png) repeat-x top; }

        .Grid .pgr {background: #363670 url(Images/grid-pgr.png) repeat-x top; }

        .Grid .pgr table { margin: 3px 0; }

        .Grid .pgr td { border-width: 0; padding: 0 6px; border-left: solid 1px #666; font-weight: bold; color: #fff; line-height: 12px; }  

        .Grid .pgr a { color: Gray; text-decoration: none; }

        .Grid .pgr a:hover { color: #000; text-decoration: none; }

        </style>
</head>

<body>
 <header>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
            <div class="navbar-brand">
              <a href="HomePage"><h1><span>CCONCERT</span>PLANNER</h1></a>
            </div>
          </div>

          <div class="navbar-collapse collapse" align="right">
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="#signin">Contact</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </header>


    <form id="form1" runat="server">
     <!--   <div>
            <table style="height:200px; width:100%;  background-color:black">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblName" Text="Name:"></asp:Label>
                    </td>
                </tr>
            </table> -->
           
 <section id="main-slider" class="no-margin" >
    <div class="carousel slide">
      <div class="carousel-inner">
        <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
          <div class="container">
            <div class="row slide-margin">
              <div class="col-sm-6" align="center">
                <div class="carousel-content">
                  <h2 class="animation animated-item-1">Search for <span>Concert</span></h2>
 
                    <table style="height:100px; width:100%; align-content:center;">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblCity" Text="Where"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlCity" OnSelectedIndexChanged="selectedChangeCity" AutoPostBack="true" CssClass="form-control search_box">
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
                        <asp:Label runat="server" ID="Label1" Text="When" OnSelectedIndexChanged="selectedChangeDate"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlDate" CssClass="form-control search_box">
                            <asp:listitem value="1">Today</asp:listitem>
                            <asp:listitem value="2">Tomorrow</asp:listitem>
                            <asp:listitem value="3">Next week</asp:listitem>
                            <asp:listitem value="4">Next Month</asp:listitem>
                        </asp:DropDownList>
               </td>     
                </tr>
            </table>

                    <asp:Button CssClass="btn-slide animation animated-item-3" ID="btn" runat="server" Text="Search" OnClick="onClickSearch"/>
                    
		        </div>
              </div>
                <div class="col-sm-6 hidden-xs animation animated-item-4">
                <div class="slider-img">
                  <img src="images/slider/img3.png" class="img-responsive">
                </div>
              </div>

            </div>
          </div>
        </div>
        <!--/.item-->
      </div>
      <!--/.carousel-inner-->
    </div>
    <!--/.carousel-->
  </section>
  <!--/#main-slider-->
            <div id="panel" style="height: 500px; vertical-align:central; background-color: White; padding: 10px; overflow: auto">
                <table>
                    <tr>
                        <td style="width:28%">

                        </td>
                        <td style="width:1500px">
                            <asp:GridView ID="gvDetails" runat="server" AllowPaging="true" PageSize="5"
                                AutoGenerateColumns="false" CssClass="Grid" HeaderStyle-BackColor="#61A6F8" 
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
                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Width="75px" Height="50px" ImageUrl="images/ticket.png"  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
    </form>
</body>
</html>



