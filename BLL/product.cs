using System;
using System.Data;
using System.Collections.Generic;
using LTP.Common;
using CAI.SHOP.Model;
using CAI.SHOP.DALFactory;
using CAI.SHOP.IDAL;
namespace CAI.SHOP.BLL
{
	/// <summary>
	/// ҵ���߼���product ��ժҪ˵����
	/// </summary>
	public class product
	{
        private readonly Iproduct dal =DataAccess.Createproduct();
		public product()
		{}
		#region  ��Ա����

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

     
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int pid)
		{
			return dal.Exists(pid);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.product model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(CAI.SHOP.Model.product model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int pid)
		{
			
			dal.Delete(pid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.product GetModel(int pid)
		{
			
			return dal.GetModel(pid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.product GetModelByCache(int pid)
		{
			
			string CacheKey = "productModel-" + pid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(pid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.product)objModel;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
            
			return dal.GetList(strWhere);
		}

        public DataSet GetTwoList(string orderid)
        {

            return dal.GetTwoList(orderid);
        }
		/// <summary>
		/// ���ǰ��������
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.product> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.product> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.product> modelList = new List<CAI.SHOP.Model.product>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.product model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.product();
					if(dt.Rows[n]["pid"].ToString()!="")
					{
						model.pid=int.Parse(dt.Rows[n]["pid"].ToString());
					}
					if(dt.Rows[n]["classid"].ToString()!="")
					{
						model.classid=int.Parse(dt.Rows[n]["classid"].ToString());
					}
					if(dt.Rows[n]["classxid"].ToString()!="")
					{
						model.classxid=int.Parse(dt.Rows[n]["classxid"].ToString());
					}
					model.productname=dt.Rows[n]["productname"].ToString();
					model.productintroduce=dt.Rows[n]["productintroduce"].ToString();
					model.productchu=dt.Rows[n]["productchu"].ToString();
					model.productimage=dt.Rows[n]["productimage"].ToString();
					if(dt.Rows[n]["masterprice"].ToString()!="")
					{
						model.masterprice=decimal.Parse(dt.Rows[n]["masterprice"].ToString());
					}
					if(dt.Rows[n]["hotprice"].ToString()!="")
					{
						model.hotprice=decimal.Parse(dt.Rows[n]["hotprice"].ToString());
					}
					if(dt.Rows[n]["newproduct"].ToString()!="")
					{
						model.newproduct=int.Parse(dt.Rows[n]["newproduct"].ToString());
					}
					model.guige=dt.Rows[n]["guige"].ToString();
					model.productguanjian=dt.Rows[n]["productguanjian"].ToString();
					if(dt.Rows[n]["adddate"].ToString()!="")
					{
						model.adddate=DateTime.Parse(dt.Rows[n]["adddate"].ToString());
					}
					if(dt.Rows[n]["pkc"].ToString()!="")
					{
						model.pkc=int.Parse(dt.Rows[n]["pkc"].ToString());
					}
					if(dt.Rows[n]["sl"].ToString()!="")
					{
						model.sl=int.Parse(dt.Rows[n]["sl"].ToString());
					}
					if(dt.Rows[n]["hittimes"].ToString()!="")
					{
						model.hittimes=int.Parse(dt.Rows[n]["hittimes"].ToString());
					}
					if(dt.Rows[n]["jifen"].ToString()!="")
					{
						model.jifen=int.Parse(dt.Rows[n]["jifen"].ToString());
					}
					model.zenpin=dt.Rows[n]["zenpin"].ToString();
					modelList.Add(model);
				}
			}
			return modelList;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  ��Ա����
	}
}

