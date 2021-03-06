using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace FormsAuthenticateProject
{
    public class DatabaseObject
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
        private SqlConnection connection;
        private DataSet dataSet;
        private SqlDataAdapter adapter;
        public SqlCommand cmd { private get; set; }
        public Exception error { get; private set; }

        public DatabaseObject(string storedProcedure)
        {
            connection = new SqlConnection(connectionString);
            dataSet = new DataSet();
            adapter = new SqlDataAdapter();
            cmd = new SqlCommand(storedProcedure, connection);
            cmd.CommandType = CommandType.StoredProcedure;
        }

        public DataSet GetTableRecords()
        {
            adapter.SelectCommand = cmd;

            try
            {
                connection.Open();
                adapter.Fill(dataSet);
                return dataSet;
            }
            catch
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public int AddUser(string email, string lastName, string firstName, string phoneNumber,
            string password, int secretQuestionID, string secretAnswer, int roleID, int status)
        {
            var hashedPassword = HelperMethods.HashStringToBytes(password, email);
            var hashedSecretAnswer = HelperMethods.HashStringToBytes(secretAnswer, email);

            adapter.InsertCommand = cmd;
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@LastName", lastName);
            cmd.Parameters.AddWithValue("@FirstName", firstName);
            cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
            cmd.Parameters.AddWithValue("@Password", hashedPassword);
            cmd.Parameters.AddWithValue("@SecretQuestionID", secretQuestionID);
            cmd.Parameters.AddWithValue("@SecretAnswer", hashedSecretAnswer);
            cmd.Parameters.AddWithValue("@RoleID", roleID);
            cmd.Parameters.AddWithValue("@Status", status);

            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }
        public int UpdateCustomer(int customerNumber, string email, string lastName, string firstName, string phoneNumber,
           string password, int secretQuestionID, string secretAnswer, int roleID, bool status)
        {
            if (password.Length > 0)
            {
                var hashedPassword = HelperMethods.HashStringToBytes(password, email);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);

            }
            if (secretAnswer.Length > 0)
            {
                var hashedSecretAnswer = HelperMethods.HashStringToBytes(secretAnswer, email);
                cmd.Parameters.AddWithValue("@SecretAnswer", hashedSecretAnswer);
            }

            adapter.UpdateCommand = cmd;
            cmd.Parameters.AddWithValue("@CustomerID", customerNumber);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@LastName", lastName);
            cmd.Parameters.AddWithValue("@FirstName", firstName);
            cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
            cmd.Parameters.AddWithValue("@SecretQuestionID", secretQuestionID);
            cmd.Parameters.AddWithValue("@RoleID", roleID);
            cmd.Parameters.AddWithValue("@Status", status);

            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }
        public int VerifyRecoveryCredentials(string email, int secretQuestionID, string secretAnswer)
        {
            var hashedSecretAnswer = HelperMethods.HashStringToBytes(secretAnswer, email);

            adapter.SelectCommand = cmd;
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@SecretQuestionID", secretQuestionID);
            cmd.Parameters.AddWithValue("@SecretAnswer", hashedSecretAnswer);

            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }
        public int ChangePassword(string email, string password)
        {
            var hashedNewPassword = HelperMethods.HashStringToBytes(password, email);

            adapter.UpdateCommand = cmd;
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", hashedNewPassword);

            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteNonQuery();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }
        public DataSet VerifyLogin(string email, string password)
        {
            var hashedNewPassword = HelperMethods.HashStringToBytes(password, email);

            adapter.SelectCommand = cmd;
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", hashedNewPassword);

            try
            {
                connection.Open();
                adapter.Fill(dataSet);
                return dataSet;
            }
            catch
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet LoadTable()
        {
            adapter.SelectCommand = cmd;
            try
            {
                connection.Open();
                adapter.Fill(dataSet);
                return dataSet;
            }
            catch (Exception ex)
            {
                error = ex;
                return null;
            }
            finally
            {
                connection.Close();
            }
        }
        public int AddToTable(string description, bool status)
        {
            adapter.InsertCommand = cmd;
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@Status", status);

            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }

        public DataSet LoadTableWithParams(params string[] arguments)
        {
            for (int i = 0; i < arguments.Length; i++)
            {
                cmd.Parameters.AddWithValue(arguments[i], arguments[i + 1]);
                i++;
            }
            adapter.SelectCommand = cmd;
            try
            {
                connection.Open();
                adapter.Fill(dataSet);
                return dataSet;
            }
            catch (Exception ex)
            {
                error = ex;
                return null;
            }
            finally
            {
                connection.Close();
            }
        }
        public int InsertWithParams(params string[] arguments)
        {
            for (int i = 0; i < arguments.Length; i++)
            {
                // adds any number of parameters, even number being the parameter in SQL and odd being the value
                cmd.Parameters.AddWithValue(arguments[i], arguments[i + 1]);
                i++;
            }
            adapter.InsertCommand = cmd;
            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }
        public decimal Get_Price(string id)
        {
            adapter.SelectCommand = cmd;
            var parsed = int.TryParse(id, out var numberID);
            var identity = parsed ? numberID : 0;
            cmd.Parameters.AddWithValue("@Identity", identity);


            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (decimal)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return 0M;
            }
            finally
            {
                connection.Close();
            }
        }
        public int Update_Shipping(int invoice)
        {
            adapter.InsertCommand = cmd;
            cmd.Parameters.AddWithValue("@Invoice", invoice);

            try
            {
                cmd.Prepare();
                connection.Open();
                var result = (Int32)cmd.ExecuteScalar();
                return result;
            }
            catch (Exception ex)
            {
                error = ex;
                return -1;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}