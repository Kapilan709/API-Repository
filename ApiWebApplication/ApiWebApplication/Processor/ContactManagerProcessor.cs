using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;
using ApiWebApplication.Repositories;
using WebService.Models;
namespace ApiWebApplication.Processor
{
    public class ContactManagerProcessor
    {
        public static async Task<bool> ProcessorContact(ContactService cantactNew)
        {
            return await ContactManagerRepositories.SaveContact(cantactNew);
        }
    }
}