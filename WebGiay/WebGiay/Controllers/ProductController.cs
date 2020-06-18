using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebGiay.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult ProductItem()
        {
            return View();
        }
    }
}