using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Models.DAO;
using Models.EF;

namespace ThucTapNhom.Areas.Admin.Controllers
{
    public class PRODUCTsController : Controller
    {
        private ShopDbContext db = new ShopDbContext();

        // GET: Admin/Product/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Product/Create
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Create(PRODUCT collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ProductModel();
                    int res = model.Create(collection.ProductName, collection.ProductDescription, collection.ShowImage_1, collection.CategoryID, collection.ProductPrice);
                    if (res > 0)
                        return RedirectToAction("Product","Home");
                    else
                    {
                        ModelState.AddModelError("", "Them moi err");
                    }
                }
                return View(collection);
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Product/Edit/5
        [HttpGet]
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Product/Edit/5
        [HttpPost]

        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, PRODUCT collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ProductModel();
                    int res1 = model.Edit(id, collection.ProductName, collection.ProductDescription, collection.ShowImage_1, collection.CategoryID, collection.ProductPrice);
                    if (res1 > 0)
                        return RedirectToAction("Product","Home");
                    else
                    {
                        ModelState.AddModelError("", "Edit err");
                    }
                }
                return View(collection);
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Product/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/Product/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ProductModel();
                    int res = model.Delete(id);
                    if (res > 0)
                        return RedirectToAction("Product","Home");
                    else
                    {
                        ModelState.AddModelError("", "Delete err");
                    }
                }
                return View(collection);
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PRODUCT pRODUCT = db.PRODUCTs.Find(id);
            if (pRODUCT == null)
            {
                return HttpNotFound();
            }
            return View(pRODUCT);
        }

    }
}
