using Models.EF;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    public class ProductModel
    {
        private ShopDbContext context = null;

        public ProductModel()
        {
            context = new ShopDbContext();
        }

        public List<PRODUCT> ListAll()
        {
            var list = context.Database.SqlQuery<PRODUCT>("ProductList").ToList();
            return list;
        }
        public List<PRODUCT> AllProduct()
        {
            var list = context.Database.SqlQuery<PRODUCT>("ProductAll").ToList();
            return list;
        }

        public List<PRODUCT> ListGiayDa()
        {
            var list = context.Database.SqlQuery<PRODUCT>("Product1").ToList();
            return list;
        }

        public List<PRODUCT> ListGiayTheThao()
        {
            var list = context.Database.SqlQuery<PRODUCT>("Product2").ToList();
            return list;
        }

        public List<PRODUCT> ListLifeStyle()
        {
            var list = context.Database.SqlQuery<PRODUCT>("Product3").ToList();
            return list;
        }
        public List<PRODUCT> ListBoots()
        {
            var list = context.Database.SqlQuery<PRODUCT>("Product4").ToList();
            return list;
        }

        public int Create(string ProductName, string ProductDescription, string ImageLink, string Category, decimal ProductPice)
        {
            object[] param =
            {
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@ProductDescription", ProductDescription),
                new SqlParameter("@ImageLink", ImageLink),
                new SqlParameter("@Category", Category),
                new SqlParameter("@ProductPice", ProductPice)
            };
            int res = context.Database.ExecuteSqlCommand("Sp_Product_Insert @ProductName, @ProductDescription, @ImageLink, @Category, @ProductPice", param);
            return res;
        }

        public int Edit(int id, string ProductName, string ProductDescription, string ImageLink, string Category, decimal ProductPice)
        {
            object[] parameters =
            {
                new SqlParameter("@id", id),
                new SqlParameter("@ProductName", ProductName),
                new SqlParameter("@ProductDescription", ProductDescription),
                new SqlParameter("@ImageLink", ImageLink),
                new SqlParameter("@Categoryid", Category),
                new SqlParameter("@ProductPice", ProductPice)
            };
            int res2 = context.Database.ExecuteSqlCommand("Sp_Product_Insert @id @ProductName, @ProductDescription, @ImageLink, @Category, @ProductPice", parameters);
            return res2;
        }

        public int Delete(int id)
        {
            object[] parameters =
            {
                new SqlParameter("@id", id),
            };
            int res = context.Database.ExecuteSqlCommand("Sp_Product_Delete @id", parameters);
            return res;
        }
    }

}
