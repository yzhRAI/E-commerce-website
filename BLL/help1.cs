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
	/// 业务逻辑类help1 的摘要说明。
	/// </summary>
	public class help1
	{
		private readonly Ihelp1 dal=DataAccess.Createhelp1();
		public help1()
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
		public bool Exists(int hid)
		{
			return dal.Exists(hid);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(CAI.SHOP.Model.help1 model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public void Update(CAI.SHOP.Model.help1 model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(int hid)
		{
			
			dal.Delete(hid);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public CAI.SHOP.Model.help1 GetModel(int hid)
		{
			
			return dal.GetModel(hid);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中。
		/// </summary>
		public CAI.SHOP.Model.help1 GetModelByCache(int hid)
		{
			
			string CacheKey = "help1Model-" + hid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(hid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.help1)objModel;
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
		public List<CAI.SHOP.Model.help1> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<CAI.SHOP.Model.help1> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.help1> modelList = new List<CAI.SHOP.Model.help1>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.help1 model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.help1();
					if(dt.Rows[n]["hid"].ToString()!="")
					{
						model.hid=int.Parse(dt.Rows[n]["hid"].ToString());
					}
					model.hename=dt.Rows[n]["hename"].ToString();
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

