using Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ThucTapNhom.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Product()
        {
            var iplCate = new ProductModel();
            var model = iplCate.AllProduct();
            return View(model);
        }
        public ActionResult GiayDa()
        {
            var iplCate = new ProductModel();
            var model = iplCate.ListGiayDa();
            return View(model);
        }
        public ActionResult GiayTheThao()
        {
            var iplCate = new ProductModel();
            var model = iplCate.ListGiayTheThao();
            return View(model);
        }
        public ActionResult GiayLifeStyle()
        {
            var iplCate = new ProductModel();
            var model = iplCate.ListLifeStyle();
            return View(model);
        }
        public ActionResult GiayBoots()
        {
            var iplCate = new ProductModel();
            var model = iplCate.ListBoots();
            return View(model);
        }

    }
}