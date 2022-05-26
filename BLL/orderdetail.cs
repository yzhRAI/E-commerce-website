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
	/// 业务逻辑类orderdetail 的摘要说明。
	/// </summary>
	public class orderdetail
	{
		private readonly Iorderdetail dal=DataAccess.Createorderdetail();
		public orderdetail()
		{}
		#region  成员方法

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int detailid)
		{
			return dal.Exists(detailid);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(CAI.SHOP.Model.orderdetail model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public void Update(CAI.SHOP.Model.orderdetail model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(int detailid)
		{
			
			dal.Delete(detailid);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public CAI.SHOP.Model.orderdetail GetModel(int detailid)
		{
			
			return dal.GetModel(detailid);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中。
		/// </summary>
		public CAI.SHOP.Model.orderdetail GetModelByCache(int detailid)
		{
			
			string CacheKey = "orderdetailModel-" + detailid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(detailid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.orderdetail)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<CAI.SHOP.Model.orderdetail> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<CAI.SHOP.Model.orderdetail> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.orderdetail> modelList = new List<CAI.SHOP.Model.orderdetail>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.orderdetail model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.orderdetail();
					if(dt.Rows[n]["detailid"].ToString()!="")
					{
						model.detailid=int.Parse(dt.Rows[n]["detailid"].ToString());
					}
					if(dt.Rows[n]["pid"].ToString()!="")
					{
						model.pid=int.Parse(dt.Rows[n]["pid"].ToString());
					}
					if(dt.Rows[n]["shuliang"].ToString()!="")
					{
						model.shuliang=int.Parse(dt.Rows[n]["shuliang"].ToString());
					}
					model.orderid=dt.Rows[n]["orderid"].ToString();
					if(dt.Rows[n]["producttotail"].ToString()!="")
					{
						model.producttotail=decimal.Parse(dt.Rows[n]["producttotail"].ToString());
					}
					modelList.Add(model);
				}
			}
			return modelList;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  成员方法
	}
}

