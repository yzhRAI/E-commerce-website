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
	/// ҵ���߼���productliuyan ��ժҪ˵����
	/// </summary>
	public class productliuyan
	{
		private readonly Iproductliuyan dal=DataAccess.Createproductliuyan();
		public productliuyan()
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
		public bool Exists(int lid)
		{
			return dal.Exists(lid);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.productliuyan model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(CAI.SHOP.Model.productliuyan model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int lid)
		{
			
			dal.Delete(lid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.productliuyan GetModel(int lid)
		{
			
			return dal.GetModel(lid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.productliuyan GetModelByCache(int lid)
		{
			
			string CacheKey = "productliuyanModel-" + lid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(lid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.productliuyan)objModel;
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
		public List<CAI.SHOP.Model.productliuyan> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.productliuyan> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.productliuyan> modelList = new List<CAI.SHOP.Model.productliuyan>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.productliuyan model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.productliuyan();
					if(dt.Rows[n]["lid"].ToString()!="")
					{
						model.lid=int.Parse(dt.Rows[n]["lid"].ToString());
					}
					if(dt.Rows[n]["pid"].ToString()!="")
					{
						model.pid=int.Parse(dt.Rows[n]["pid"].ToString());
					}
					model.liuname=dt.Rows[n]["liuname"].ToString();
					if(dt.Rows[n]["liutime"].ToString()!="")
					{
						model.liutime=DateTime.Parse(dt.Rows[n]["liutime"].ToString());
					}
					model.liuzhu=dt.Rows[n]["liuzhu"].ToString();
					model.liuhui=dt.Rows[n]["liuhui"].ToString();
					model.huifutime=dt.Rows[n]["huifutime"].ToString();
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

