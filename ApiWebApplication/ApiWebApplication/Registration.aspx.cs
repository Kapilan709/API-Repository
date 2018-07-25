using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;
using WebService.Models;
using ApiWebApplication.Processor;
using WebService.Models;

namespace ApiWebApplication
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onClickSave(object sender, EventArgs e)
        {
            ConcertDetails lstConcert = new ConcertDetails();
            lstConcert.City = ddlCity.Text.ToString();
            lstConcert.Date = ddlDate.Text.ToString();
            FilterItem(lstConcert);
        }

        public async Task<bool> InsertContact()
        {
            var Contact = new ContactService();
            Contact.Name = txtName.Text;
            Contact.PhoneNumber = txtPhone.Text;
            Contact.Note = txtNote.Text;

            var success = await ContactManagerProcessor.ProcessorContact(Contact);
            if (success == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public  List<ConcertDetails> FilterItem(ConcertDetails concertList)
        {
            List<ConcertDetails> lstconcerts = new List<ConcertDetails>();

            try
            {
                var client = new HttpClient();
                var JsonContent = JsonConvert.SerializeObject(concertList);
                var httpContent = new StringContent(JsonContent, Encoding.UTF8, "application/json");
                var response = client.PostAsync("http://localhost:59152/FilterItem", httpContent).Result;
                var resultContent = response.Content.ReadAsStringAsync().Result;
                lstconcerts = JsonConvert.DeserializeObject<List<ConcertDetails>>(resultContent);
                

                GridView1.DataSource = lstconcerts;
                GridView1.DataBind();
                //var responseString = await response.Content.ReadAsStringAsync();
                //lstconcerts = response.ToList();
                return lstconcerts;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}