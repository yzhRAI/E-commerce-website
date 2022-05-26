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
	/// ҵ���߼���orders ��ժҪ˵����
	/// </summary>
	public class orders
	{
		private readonly Iorders dal=DataAccess.Createorders();
		public orders()
		{}
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int oid)
		{
			return dal.Exists(oid);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.orders model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int Update(CAI.SHOP.Model.orders model)
		{
		return	dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public int Delete(int oid)
		{
			
		return	dal.Delete(oid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.orders GetModel(int oid)
		{
			
			return dal.GetModel(oid);
		}

       
		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.orders GetModelByCache(int oid)
		{
			
			string CacheKey = "ordersModel-" + oid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(oid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.orders)objModel;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
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
		public List<CAI.SHOP.Model.orders> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.orders> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.orders> modelList = new List<CAI.SHOP.Model.orders>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.orders model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.orders();
					if(dt.Rows[n]["oid"].ToString()!="")
					{
						model.oid=int.Parse(dt.Rows[n]["oid"].ToString());
					}
					model.orderid=dt.Rows[n]["orderid"].ToString();
					model.username=dt.Rows[n]["username"].ToString();
					if(dt.Rows[n]["userid"].ToString()!="")
					{
						model.userid=int.Parse(dt.Rows[n]["userid"].ToString());
					}
					model.shouhuoname=dt.Rows[n]["shouhuoname"].ToString();
					model.address=dt.Rows[n]["address"].ToString();
					model.postcode=dt.Rows[n]["postcode"].ToString();
					model.telephone=dt.Rows[n]["telephone"].ToString();
					model.songhuofs=dt.Rows[n]["songhuofs"].ToString();
					model.fukuanfs=dt.Rows[n]["fukuanfs"].ToString();
					if(dt.Rows[n]["dingdanfeel"].ToString()!="")
					{
						model.dingdanfeel=int.Parse(dt.Rows[n]["dingdanfeel"].ToString());
					}
					if(dt.Rows[n]["dingdanshijian"].ToString()!="")
					{
						model.dingdanshijian=DateTime.Parse(dt.Rows[n]["dingdanshijian"].ToString());
					}
					if(dt.Rows[n]["dingdantotal"].ToString()!="")
					{
						model.dingdantotal=decimal.Parse(dt.Rows[n]["dingdantotal"].ToString());
					}
					model.beizhu=dt.Rows[n]["beizhu"].ToString();
					if(dt.Rows[n]["djifen"].ToString()!="")
					{
						model.djifen=int.Parse(dt.Rows[n]["djifen"].ToString());
					}
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

