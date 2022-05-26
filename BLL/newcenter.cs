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
	/// ҵ���߼���newcenter ��ժҪ˵����
	/// </summary>
	public class newcenter
	{
		private readonly Inewcenter dal=DataAccess.Createnewcenter();
		public newcenter()
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
		public bool Exists(int nid)
		{
			return dal.Exists(nid);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.newcenter model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(CAI.SHOP.Model.newcenter model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int nid)
		{
			
			dal.Delete(nid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.newcenter GetModel(int nid)
		{
			
			return dal.GetModel(nid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.newcenter GetModelByCache(int nid)
		{
			
			string CacheKey = "newcenterModel-" + nid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(nid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.newcenter)objModel;
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
		public List<CAI.SHOP.Model.newcenter> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.newcenter> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.newcenter> modelList = new List<CAI.SHOP.Model.newcenter>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.newcenter model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.newcenter();
					if(dt.Rows[n]["nid"].ToString()!="")
					{
						model.nid=int.Parse(dt.Rows[n]["nid"].ToString());
					}
					model.newtitle=dt.Rows[n]["newtitle"].ToString();
					model.newcontact=dt.Rows[n]["newcontact"].ToString();
					if(dt.Rows[n]["newshijian"].ToString()!="")
					{
						model.newshijian=DateTime.Parse(dt.Rows[n]["newshijian"].ToString());
					}
					if(dt.Rows[n]["hittime"].ToString()!="")
					{
						model.hittime=int.Parse(dt.Rows[n]["hittime"].ToString());
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

