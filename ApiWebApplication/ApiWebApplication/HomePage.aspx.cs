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

namespace ApiWebApplication
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void selectedChangeCity(Object sender, EventArgs e)
        {
            try
            {
                LoadGridView();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public void selectedChangeDate(Object sender, EventArgs e)
        {
            try
            {
                LoadGridView();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void onClickSearch(Object sender, EventArgs e)
        {
            try
            {
                LoadGridView();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> LoadGridView()
        {
            var Contact = new ConcertDetails();
            Contact.City = ddlCity.Text.ToString();
            Contact.Date = ddlDate.Text.ToString();
            //var success = await ContactManagerProcessor.ProcessorContact(Contact);
            var success = true;
            if (success == true)
            {
                var _returnList = WebService.Repositories.ContactRepository.GetFilterItemNew(Contact);
                gvDetails.DataSource = _returnList;
                gvDetails.DataBind();

                return true;
            }
            else
            {
                return false;
            }
        }
    }
}