﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPCRoom
{
    public class DBHelper
    {
        private static SqlConnection conn = new SqlConnection();
        public static SqlDataAdapter da;
        public static DataSet ds;
        public static DataTable dt;

        private static void ConnectDB()
        {
            // 외부 PC 연결 후 DB 사용
            try
            {
                string connect = string.Format("Data Source={0};" +
                "Initial Catalog = {1};" +
                "Persist Security Info = True;" +
                "User ID=User1;Password=1234",
                "192.168.0.95,1433", "MYDB");
                conn = new SqlConnection(connect);
                conn.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Console.WriteLine("connect Fail");
            }

            // 집에서 할 경우


        }

        public static void selectQuery()
        {
            try
            {
                ConnectDB(); // DB연결
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;  // 어디에 커맨드 보낼지 지정
                cmd.CommandText = "select * from PCRoom";

                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds, "PCRoom");
                dt = ds.Tables[0];
            }
            catch (Exception e)
            {
                System.Windows.Forms.MessageBox.Show(e.Message + "select");
                // DataManager.pringLog(e.StackTrace);
                return;

            }
            finally
            {
                conn.Close(); // DB연결 해제
            }

        }


        public static void userAddQuery(string user_id, string user_name)
        {
            string sqlcommand = "";
            
            
            sqlcommand = "insert into PCRoom(user_id, name) values (@p1,@p2)";


            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@p1", user_id);
                cmd.Parameters.AddWithValue("@p2", user_name);

                // DB에 저장하는 명령어
                cmd.CommandText = sqlcommand;
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {

            }
            finally
            {
                conn.Close();
            }
        }







        }
}
