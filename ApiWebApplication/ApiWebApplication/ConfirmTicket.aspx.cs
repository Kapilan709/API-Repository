using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Net;
using System.IO;
using WebService.Models;
using ApiWebApplication.Repositories;
using System.Xml.Linq;

namespace ApiWebApplication
{
    public partial class ConfirmTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData();
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }

        }
        private DataTable GetData()
        {
            string location; string latitude; string longitude;

            //string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //SqlCommand cmd = new SqlCommand(query);
            //using (SqlConnection con = new SqlConnection(conString))
            //{
            //    using (SqlDataAdapter sda = new SqlDataAdapter())
            //    {
            //        cmd.Connection = con;

            //        sda.SelectCommand = cmd;
            //        using (DataTable dt = new DataTable())
            //        {
            //            sda.Fill(dt);
            //            return dt;
            //        }
            //    }
            //}
            StringBuilder sb = new StringBuilder();
            sb.Append("https://maps.googleapis.com/maps/api/geocode/json?address=");
            sb.Append("Phoenix+Park+Avnue");
            sb.Append("&key=AIzaSyDXa2J0Q1kTZBt3Cu6CObj9b7EIjgQ0uUQ");
            //string url = sb.ToString();


            string address = "Phoenix park";
            string requestUri = string.Format("https://maps.googleapis.com/maps/api/geocode/xml?address={0}&key=AIzaSyDXa2J0Q1kTZBt3Cu6CObj9b7EIjgQ0uUQ", Uri.EscapeDataString(address));

            WebRequest request = WebRequest.Create(requestUri);
            WebResponse response = request.GetResponse();
            XDocument xdoc = XDocument.Load(response.GetResponseStream());

            XElement result = xdoc.Element("GeocodeResponse").Element("result");
            XElement locationElement = result.Element("geometry").Element("location");
            XElement lat = locationElement.Element("lat");
            XElement lng = locationElement.Element("lng");


            location = (string)locationElement;
            latitude = (string)lat;
            longitude = (string)lng;


            DataTable dtLocation = new DataTable();
            //dtLocation.Columns.Add("Name", typeof(string));
            dtLocation.Columns.Add("Latitude", typeof(string));
            dtLocation.Columns.Add("Longitude", typeof(string));
            dtLocation.Rows.Add(latitude, longitude);
            return dtLocation;
        }
    }
}