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
	/// ҵ���߼���gonggao ��ժҪ˵����
	/// </summary>
	public class gonggao
	{
		private readonly Igonggao dal=DataAccess.Creategonggao();
		public gonggao()
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
		public bool Exists(int gid)
		{
			return dal.Exists(gid);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.gonggao model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(CAI.SHOP.Model.gonggao model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int gid)
		{
			
			dal.Delete(gid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.gonggao GetModel(int gid)
		{
			
			return dal.GetModel(gid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.gonggao GetModelByCache(int gid)
		{
			
			string CacheKey = "gonggaoModel-" + gid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(gid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.gonggao)objModel;
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
		public List<CAI.SHOP.Model.gonggao> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.gonggao> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.gonggao> modelList = new List<CAI.SHOP.Model.gonggao>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.gonggao model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.gonggao();
					if(dt.Rows[n]["gid"].ToString()!="")
					{
						model.gid=int.Parse(dt.Rows[n]["gid"].ToString());
					}
					model.gtitle=dt.Rows[n]["gtitle"].ToString();
					model.gcontent=dt.Rows[n]["gcontent"].ToString();
					if(dt.Rows[n]["gdate"].ToString()!="")
					{
						model.gdate=DateTime.Parse(dt.Rows[n]["gdate"].ToString());
					}
					if(dt.Rows[n]["gfeel"].ToString()!="")
					{
						model.gfeel=int.Parse(dt.Rows[n]["gfeel"].ToString());
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

