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
	/// ҵ���߼���pxiaoxi ��ժҪ˵����
	/// </summary>
	public class pxiaoxi
	{
		private readonly Ipxiaoxi dal=DataAccess.Createpxiaoxi();
		public pxiaoxi()
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
        /// ��ѯ����
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public int dscount(string username)
        {
            return dal.dscount(username);
        
        }
		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.pxiaoxi model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(CAI.SHOP.Model.pxiaoxi model)
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
		public CAI.SHOP.Model.pxiaoxi GetModel(int pid)
		{
			
			return dal.GetModel(pid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.pxiaoxi GetModelByCache(int pid)
		{
			
			string CacheKey = "pxiaoxiModel-" + pid;
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
			return (CAI.SHOP.Model.pxiaoxi)objModel;
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
		public List<CAI.SHOP.Model.pxiaoxi> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.pxiaoxi> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.pxiaoxi> modelList = new List<CAI.SHOP.Model.pxiaoxi>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.pxiaoxi model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.pxiaoxi();
					if(dt.Rows[n]["pid"].ToString()!="")
					{
						model.pid=int.Parse(dt.Rows[n]["pid"].ToString());
					}
					model.pcontent=dt.Rows[n]["pcontent"].ToString();
					model.pfeel=dt.Rows[n]["pfeel"].ToString();
					model.userid=dt.Rows[n]["userid"].ToString();
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

