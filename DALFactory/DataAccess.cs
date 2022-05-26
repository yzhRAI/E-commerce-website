using System;
using System.Reflection;
using System.Configuration;
namespace CAI.SHOP.DALFactory
{
	/// <summary>
    /// Abstract Factory pattern to create the DAL��
    /// ��������ﴴ�����󱨴�����web.config���Ƿ��޸���<add key="DAL" value="Maticsoft.SQLServerDAL" />��
	/// </summary>
	public sealed class DataAccess
	{
        private static readonly string AssemblyPath = ConfigurationManager.AppSettings["DAL"];        
		public DataAccess()
		{ }

        #region CreateObject 

		//��ʹ�û���
        private static object CreateObjectNoCache(string AssemblyPath,string classNamespace)
		{		
			try
			{
				object objType = Assembly.Load(AssemblyPath).CreateInstance(classNamespace);	
				return objType;
			}
			catch//(System.Exception ex)
			{
				//string str=ex.Message;// ��¼������־
				return null;
			}			
			
        }
		//ʹ�û���
		private static object CreateObject(string AssemblyPath,string classNamespace)
		{			
			object objType = DataCache.GetCache(classNamespace);
			if (objType == null)
			{
				try
				{
					objType = Assembly.Load(AssemblyPath).CreateInstance(classNamespace);					
					DataCache.SetCache(classNamespace, objType);// д�뻺��
				}
				catch//(System.Exception ex)
				{
					//string str=ex.Message;// ��¼������־
				}
			}
			return objType;
		}
        #endregion

        #region CreateSysManage
        public static CAI.SHOP.IDAL.ISysManage CreateSysManage()
		{
			//��ʽ1			
			//return (CAI.SHOP.IDAL.ISysManage)Assembly.Load(AssemblyPath).CreateInstance(AssemblyPath+".SysManage");

			//��ʽ2 			
			string classNamespace = AssemblyPath+".SysManage";	
			object objType=CreateObject(AssemblyPath,classNamespace);
            return (CAI.SHOP.IDAL.ISysManage)objType;		
		}
		#endregion
             
        
   
		/// <summary>
		/// ����admin���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Iadmin Createadmin()
		{

			string ClassNamespace = AssemblyPath +".admin";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iadmin)objType;
		}

		/// <summary>
		/// ����city_table���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Icity_table Createcity_table()
		{

			string ClassNamespace = AssemblyPath +".city_table";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Icity_table)objType;
		}

		/// <summary>
		/// ����d_users���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Id_users Created_users()
		{

			string ClassNamespace = AssemblyPath +".d_users";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Id_users)objType;
		}

		/// <summary>
		/// ����deliver_country���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ideliver_country Createdeliver_country()
		{

			string ClassNamespace = AssemblyPath +".deliver_country";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ideliver_country)objType;
		}

		/// <summary>
		/// ����gonggao���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Igonggao Creategonggao()
		{

			string ClassNamespace = AssemblyPath +".gonggao";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Igonggao)objType;
		}

		/// <summary>
		/// ����help1���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ihelp1 Createhelp1()
		{

			string ClassNamespace = AssemblyPath +".help1";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ihelp1)objType;
		}

		/// <summary>
		/// ����help2���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ihelp2 Createhelp2()
		{

			string ClassNamespace = AssemblyPath +".help2";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ihelp2)objType;
		}

		/// <summary>
		/// ����leibie���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ileibie Createleibie()
		{

			string ClassNamespace = AssemblyPath +".leibie";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ileibie)objType;
		}

		/// <summary>
		/// ����leibiex���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ileibiex Createleibiex()
		{

			string ClassNamespace = AssemblyPath +".leibiex";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ileibiex)objType;
		}

		/// <summary>
		/// ����newcenter���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Inewcenter Createnewcenter()
		{

			string ClassNamespace = AssemblyPath +".newcenter";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Inewcenter)objType;
		}

		/// <summary>
		/// ����orderdetail���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Iorderdetail Createorderdetail()
		{

			string ClassNamespace = AssemblyPath +".orderdetail";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iorderdetail)objType;
		}

		/// <summary>
		/// ����orders���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Iorders Createorders()
		{

			string ClassNamespace = AssemblyPath +".orders";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iorders)objType;
		}

		/// <summary>
		/// ����product���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Iproduct Createproduct()
		{

			string ClassNamespace = AssemblyPath +".product";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iproduct)objType;
		}

		/// <summary>
		/// ����productliuyan���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Iproductliuyan Createproductliuyan()
		{

			string ClassNamespace = AssemblyPath +".productliuyan";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Iproductliuyan)objType;
		}

		/// <summary>
		/// ����pxiaoxi���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ipxiaoxi Createpxiaoxi()
		{

			string ClassNamespace = AssemblyPath +".pxiaoxi";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ipxiaoxi)objType;
		}

		/// <summary>
		/// ����shoucang���ݲ�ӿ�
		/// </summary>
		public static CAI.SHOP.IDAL.Ishoucang Createshoucang()
		{

			string ClassNamespace = AssemblyPath +".shoucang";
			object objType=CreateObject(AssemblyPath,ClassNamespace);
			return (CAI.SHOP.IDAL.Ishoucang)objType;
		}

}
}