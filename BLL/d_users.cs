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
	/// ҵ���߼���d_users ��ժҪ˵����
	/// </summary>
	public class d_users
	{
		private readonly Id_users dal=DataAccess.Created_users();
		public d_users()
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
		public bool Exists(int uid)
		{
			return dal.Exists(uid);
		}
        /// <summary>
        /// ��֤��½
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool Exists(string username, string password)
        {

            return dal.Exists(username, password);
        
        }

        /// <summary>
        /// ��֤�û���
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public bool Exists(string username)
        {

            return dal.Exists(username);

        }

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(CAI.SHOP.Model.d_users model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int Update(CAI.SHOP.Model.d_users model)
		{
		return	dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int uid)
		{
			
			dal.Delete(uid);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public CAI.SHOP.Model.d_users GetModel(int uid)
		{
			
			return dal.GetModel(uid);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public CAI.SHOP.Model.d_users GetModelByCache(int uid)
		{
			
			string CacheKey = "d_usersModel-" + uid;
			object objModel = LTP.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(uid);
					if (objModel != null)
					{
						int ModelCache = LTP.Common.ConfigHelper.GetConfigInt("ModelCache");
						LTP.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (CAI.SHOP.Model.d_users)objModel;
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
		public List<CAI.SHOP.Model.d_users> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<CAI.SHOP.Model.d_users> DataTableToList(DataTable dt)
		{
			List<CAI.SHOP.Model.d_users> modelList = new List<CAI.SHOP.Model.d_users>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				CAI.SHOP.Model.d_users model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new CAI.SHOP.Model.d_users();
					if(dt.Rows[n]["uid"].ToString()!="")
					{
						model.uid=int.Parse(dt.Rows[n]["uid"].ToString());
					}
					model.username=dt.Rows[n]["username"].ToString();
					model.truename=dt.Rows[n]["truename"].ToString();
					model.password=dt.Rows[n]["password"].ToString();
					model.question=dt.Rows[n]["question"].ToString();
					model.answer=dt.Rows[n]["answer"].ToString();
					model.email=dt.Rows[n]["email"].ToString();
					model.sex=dt.Rows[n]["sex"].ToString();
					if(dt.Rows[n]["regdate"].ToString()!="")
					{
						model.regdate=DateTime.Parse(dt.Rows[n]["regdate"].ToString());
					}
					model.lastloginip=dt.Rows[n]["lastloginip"].ToString();
					if(dt.Rows[n]["logintimes"].ToString()!="")
					{
						model.logintimes=int.Parse(dt.Rows[n]["logintimes"].ToString());
					}
					if(dt.Rows[n]["userjifen"].ToString()!="")
					{
						model.userjifen=int.Parse(dt.Rows[n]["userjifen"].ToString());
					}
					model.QQ=dt.Rows[n]["QQ"].ToString();
					if(dt.Rows[n]["lastlogintime"].ToString()!="")
					{
						model.lastlogintime=DateTime.Parse(dt.Rows[n]["lastlogintime"].ToString());
					}
					model.IDCARD=dt.Rows[n]["IDCARD"].ToString();
					model.Address=dt.Rows[n]["Address"].ToString();
					model.Telephone=dt.Rows[n]["Telephone"].ToString();
					model.Postcode=dt.Rows[n]["Postcode"].ToString();
					if(dt.Rows[n]["Usertype"].ToString()!="")
					{
						model.Usertype=int.Parse(dt.Rows[n]["Usertype"].ToString());
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

