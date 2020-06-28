using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ThucTapNhom.Controllers
{
    public class LoginController : Controller
    {
        ShopDbContext _db = new ShopDbContext();
        // GET: Login
        public ActionResult Index()
        {
            if (Session["idUser"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        //GET: Register

        public ActionResult Register()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(USER _user)
        {
            if (ModelState.IsValid)
            {
                var check = _db.USERs.FirstOrDefault(s => s.UserUsername == _user.UserUsername);
                if (check == null)
                {
                    _db.Configuration.ValidateOnSaveEnabled = false;
                    _db.USERs.Add(_user);
                    _db.SaveChanges();
                    return RedirectToAction("Index","Home");
                }
                else
                {
                    ViewBag.error = "UserName already exists";
                    return View();
                }


            }
            return View();


        }

        public ActionResult Login()
        {
            return View();
        }



        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string UserUsername, string UserPassword)
        {
            if (ModelState.IsValid)
            {

                var data = _db.USERs.Where(s => s.UserUsername.Equals(UserUsername) && s.UserPassword.Equals(UserPassword)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["FullName"] = data.FirstOrDefault().UserName;
                    Session["UserName"] = data.FirstOrDefault().UserUsername;
                    Session["idUser"] = data.FirstOrDefault().UserId;
                    return RedirectToAction("Index","Home");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }


        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
    }

}