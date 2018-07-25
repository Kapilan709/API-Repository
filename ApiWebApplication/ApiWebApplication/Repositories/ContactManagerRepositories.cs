using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;
using WebService.Models;
using System.Net;
using System.IO;

namespace ApiWebApplication.Repositories
{
    public class ContactManagerRepositories
    {
        public static async Task<bool> SaveContact(ContactService contact)
        {
            var client = new HttpClient();
            var JsonContent = JsonConvert.SerializeObject(contact);
            var httpContent = new StringContent(JsonContent, Encoding.UTF8, "application/json");
            var response = await client.PostAsync("http://localhost:59152/SaveContact", httpContent);

            string strResponsw = response.ToString();
            var responseString = await response.Content.ReadAsStringAsync();
            if (responseString == "false")
            {
                return false;
            } 
            else
            {
                return true;
            }
        }

        public static async Task<bool> FilterItem(ContactService contact)
        {
            var client = new HttpClient();
            var JsonContent = JsonConvert.SerializeObject(contact);
            var httpContent = new StringContent(JsonContent, Encoding.UTF8, "application/json");
            var response = await client.PostAsync("http://localhost:59152/SaveContact", httpContent);
            var responseString = await response.Content.ReadAsStringAsync();
            if (responseString == "false")
            {
                return false;
            }
            else
            {
                
                return true;
            }
        }

        
    }
}