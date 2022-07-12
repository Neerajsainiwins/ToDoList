using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Extensions.Configuration;

namespace ToDoList.Data.ToDoListGenericRepository
{
     public class GenericRepository
    {
        private readonly IConfiguration _configuration;
        public GenericRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        private IDbConnection CreateConnection()
        {
            string cn = _configuration["ConnectionStrings:DefaultConnection"];
            return new SqlConnection(cn);
        }
        /// <summary>
        /// Return the collection of T type
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        protected async Task<IEnumerable<T>> CollectionsAsync<T>(string sql, object parameters = null)
        {
            using (var connection = CreateConnection())
            {
                var QueryResponse = await connection.QueryAsync<T>(sql: sql, param: parameters, commandType: CommandType.StoredProcedure);
                
                return QueryResponse;
            }
        }
        /// <summary>
        /// Return the single row
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        protected async Task<T> SingleAsync<T>(string sql, object parameters = null)
        {
            using (var connection = CreateConnection())
            {
                var QueryResponse = await connection.QuerySingleAsync<T>(sql: sql, param: parameters, commandType: CommandType.StoredProcedure);
                return QueryResponse;
            }
        }
        /// <summary>
        /// Used to perform insert, update, delete
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        protected async Task<T> CommandAsync<T>(string sql, object parameters = null)
        {
            using (var connection = CreateConnection())
            {
                var QueryResponse = await connection.QuerySingleAsync<T>(sql: sql, param: parameters, commandType: CommandType.StoredProcedure);
                return QueryResponse;
            }
        }
       protected async Task ExecuteScalarAsync(string sql)
       {
           using (var connection = CreateConnection())
            {

                await connection.ExecuteScalarAsync(sql, commandType: CommandType.StoredProcedure);
                
            }
       }
    }

}