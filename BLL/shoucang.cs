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
	/// ҵ���߼���shoucang ��ժҪ˵����
	/// </summary>
	public class shoucang
	{
		private readonly Ishoucang dal=DataAccess.Createshoucang();
		public shoucang()
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
		public bool Exists(int sid)
		{
			return dal.Exists(sid);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.shoucang model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(CAI.SHOP.Model.shoucang model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public int Delete(int sid)
		{
			
		return	dal.Delete(sid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.shoucang GetModel(int sid)
		{
			
			return dal.GetModel(sid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.shoucang GetModelByCache(int sid)
		{
			
			string CacheKey = "shoucangModel-" + sid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(sid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.shoucang)objModel;
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
		public List<CAI.SHOP.Model.shoucang> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.shoucang> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.shoucang> modelList = new List<CAI.SHOP.Model.shoucang>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.shoucang model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.shoucang();
					if(dt.Rows[n]["sid"].ToString()!="")
					{
						model.sid=int.Parse(dt.Rows[n]["sid"].ToString());
					}
					if(dt.Rows[n]["pid"].ToString()!="")
					{
						model.pid=int.Parse(dt.Rows[n]["pid"].ToString());
					}
					model.username=dt.Rows[n]["username"].ToString();
					if(dt.Rows[n]["shoutime"].ToString()!="")
					{
						model.shoutime=DateTime.Parse(dt.Rows[n]["shoutime"].ToString());
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

