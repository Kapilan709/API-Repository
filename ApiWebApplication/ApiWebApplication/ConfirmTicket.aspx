<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmTicket.aspx.cs" Inherits="ApiWebApplication.ConfirmTicket" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"  lang="en">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Confirm Ticket</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/animate.css">
  <link href="css/prettyPhoto.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet" />
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXa2J0Q1kTZBt3Cu6CObj9b7EIjgQ0uUQ&callback=initMap">
    </script>
   <%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>--%>
    <script type="text/javascript">
        var markers = [
        <asp:Repeater ID="rptMarkers" runat="server">
        <ItemTemplate>
                 {
                    "lat": '<%# Eval("Latitude") %>',
                    "lng": '<%# Eval("Longitude") %>'
                }
        </ItemTemplate>
        <SeparatorTemplate>
            ,
        </SeparatorTemplate>
        </asp:Repeater>
        ];
        </script>
        <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
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
              <a href="HomePage"><h1><span>Com</span>pany</h1></a>
            </div>
          </div>

          <div class="navbar-collapse collapse">
            <div class="menu">
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="contact.html" class="active">Contact</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </header>
  <form runat="server">
      <section id="contact-page">
    <div class="container" style="background-image: url(../images/Img1.jpg); padding:100px;">
      <div class="center">
        <h2>Drop Your Message</h2>
        <p></p>
      </div>
        <div class="row contact-wrap">
        <div class="status alert alert-success" style="display: none"></div>
        <div class="col-md-6 col-md-offset-3">
          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
         <form action="" method="post" role="form" class="contactForm"> 
             
            <div class="form-group">
                <asp:TextBox ID="txtName" class="form-control" placeholder="Concert Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" runat="server"></asp:TextBox>
              <div class="validation"></div>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtEmail" class="form-control"  placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDate"  class="form-control"  placeholder="Date" data-rule="minlen:4" runat="server"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:TextBox ID="txtTime"  class="form-control"  placeholder="Time" data-rule="minlen:4" runat="server"></asp:TextBox>
            </div>
             <div class="form-group">
               <asp:DropDownList runat="server" ID="ddltctType" AutoPostBack="true" CssClass="form-control search_box">
                <asp:listitem value="1">Adult</asp:listitem>
                <asp:listitem value="2">Child</asp:listitem>
                <asp:listitem value="3">Handicaped</asp:listitem>
                <asp:listitem value="4">Scenior citizen</asp:listitem>
            </asp:DropDownList>
            </div>
             <div class="form-group">
               <asp:DropDownList runat="server" ID="ddlQuantity" AutoPostBack="true" CssClass="form-control search_box">
                <asp:listitem value="1">Quantity</asp:listitem>
                <asp:listitem value="2">1</asp:listitem>
                <asp:listitem value="3">2</asp:listitem>
                <asp:listitem value="4">3</asp:listitem>
                <asp:listitem value="5">4</asp:listitem>
                <asp:listitem value="6">5</asp:listitem>
            </asp:DropDownList>
            </div>
             <div class="form-group">
                <asp:TextBox ID="txtRate"  class="form-control"  placeholder="Rate" data-rule="minlen:4" runat="server"></asp:TextBox>
            </div>

            <div class="text-center">
                <asp:button ID="btnSubmit" text="Submit" class="btn btn-primary btn-lg" required="required" runat="server"/>
                <asp:button ID="btnCancel" text="Cancel" class="btn btn-primary btn-lg" required="required" runat="server"/>
            </div>
             <div style="height:20px;">

             </div>
              <div id="dvMap" style="width: 500px; height: 500px">
                </div>
          </form>
        </div>
      </div>
      <!--/.row-->
    </div>
    <!--/.container-->
  </section>
     
  </form>
  

  <!--/#contact-page-->
</body>
  </html>
