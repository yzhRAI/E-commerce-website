using System;
using System.Reflection;
using System.Configuration;
namespace CAI.SHOP.DALFactory
{
	/// <summary>
    /// Abstract Factory pattern to create the DAL。
    /// 如果在这里创建对象报错，请检查web.config里是否修改了<add key="DAL" value="Maticsoft.SQLServerDAL" />。
	/// </summary>
	public sealed class DataAccess
	{
        private static readonly string AssemblyPath = ConfigurationManager.AppSettings["DAL"];        
		public DataAccess()
		{ }

        #region CreateObject 

		//不使用缓存
        private static object CreateObjectNoCache(string AssemblyPath,string classNamespace)
		{		
			try
			{
				object objType = Assembly.Load(AssemblyPath).CreateInstance(classNamespace);	
				return objType;
			}
			catch//(System.Exception ex)
			{
				//string str=ex.Message;// 记录错误日志
				return null;
			}			
			
        }
		//使用缓存
		private static object CreateObject(string AssemblyPath,string classNamespace)
		{			
			object objType = DataCache.GetCache(classNamespace);
			if (objType == null)
			{
				try
				{
					objType = Assembly.Load(AssemblyPath).CreateInstance(classNamespace);					
					DataCache.SetCache(classNamespace, objType);// 写入缓存
				}
				catch//(System.Exception ex)
				{
					//string str=ex.Message;// 记录错误日志
				}
			}
			return objType;
		}
        #endregion

        #region CreateSysManage
        public static CAI.SHOP.IDAL.ISysManage CreateSysManage()
		{
			//方式1			
			//return (CAI.SHOP.IDAL.ISysManage)Assembly.Load(AssemblyPath).CreateInstance(AssemblyPath+".SysManage");

			//方式2 			
			string classNamespace = AssemblyPath+".SysManage";	
			object objType=CreateObject(AssemblyPath,classNamespace);
            return (CAI.SHOP.IDAL.ISysManage)objType;		
		}
		#endregion
             
        
   
		/// <summary>
		/// 创建admin数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Iadmin Createadmin()
		{

			string ClassNamespace = AssemblyPath +".admin";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iadmin)objType;
		}

		/// <summary>
		/// 创建city_table数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Icity_table Createcity_table()
		{

			string ClassNamespace = AssemblyPath +".city_table";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Icity_table)objType;
		}

		/// <summary>
		/// 创建d_users数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Id_users Created_users()
		{

			string ClassNamespace = AssemblyPath +".d_users";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Id_users)objType;
		}

		/// <summary>
		/// 创建deliver_country数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ideliver_country Createdeliver_country()
		{

			string ClassNamespace = AssemblyPath +".deliver_country";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ideliver_country)objType;
		}

		/// <summary>
		/// 创建gonggao数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Igonggao Creategonggao()
		{

			string ClassNamespace = AssemblyPath +".gonggao";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Igonggao)objType;
		}

		/// <summary>
		/// 创建help1数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ihelp1 Createhelp1()
		{

			string ClassNamespace = AssemblyPath +".help1";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ihelp1)objType;
		}

		/// <summary>
		/// 创建help2数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ihelp2 Createhelp2()
		{

			string ClassNamespace = AssemblyPath +".help2";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ihelp2)objType;
		}

		/// <summary>
		/// 创建leibie数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ileibie Createleibie()
		{

			string ClassNamespace = AssemblyPath +".leibie";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ileibie)objType;
		}

		/// <summary>
		/// 创建leibiex数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ileibiex Createleibiex()
		{

			string ClassNamespace = AssemblyPath +".leibiex";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ileibiex)objType;
		}

		/// <summary>
		/// 创建newcenter数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Inewcenter Createnewcenter()
		{

			string ClassNamespace = AssemblyPath +".newcenter";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Inewcenter)objType;
		}

		/// <summary>
		/// 创建orderdetail数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Iorderdetail Createorderdetail()
		{

			string ClassNamespace = AssemblyPath +".orderdetail";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iorderdetail)objType;
		}

		/// <summary>
		/// 创建orders数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Iorders Createorders()
		{

			string ClassNamespace = AssemblyPath +".orders";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iorders)objType;
		}

		/// <summary>
		/// 创建product数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Iproduct Createproduct()
		{

			string ClassNamespace = AssemblyPath +".product";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iproduct)objType;
		}

		/// <summary>
		/// 创建productliuyan数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Iproductliuyan Createproductliuyan()
		{

			string ClassNamespace = AssemblyPath +".productliuyan";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iproductliuyan)objType;
		}

		/// <summary>
		/// 创建pxiaoxi数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ipxiaoxi Createpxiaoxi()
		{

			string ClassNamespace = AssemblyPath +".pxiaoxi";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ipxiaoxi)objType;
		}

		/// <summary>
		/// 创建shoucang数据层接口
		/// </summary>
		public static CAI.SHOP.IDAL.Ishoucang Createshoucang()
		{

			string ClassNamespace = AssemblyPath +".shoucang";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ishoucang)objType;
		}

}
}