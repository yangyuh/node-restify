var err = require("../config/err");
var sql = require("../config/dbapi.js");

var dbapi = sql.dbapi();
var errObj = err.errObj();


exports.DataApi = function(params, callback) {
  var result = new Object();
  var params_data = initParams(params);

  // 先从数据库查出接口名和sql语句
  var api_name = params_data.api_name;
  var get_apiSql = 'SELECT select_sql,api_name FROM apis WHERE api_name = "' + api_name + '"';
  console.log(get_apiSql)
  dbapi.sqlQuery(get_apiSql, function(data, err) {
    console.log(data)
    if (data.aaData.length > 0) {
      // 根据接口名称查询sql
      var get_DataSql = data.aaData[0].select_sql;
      dbapi.sqlQuery(get_DataSql, function(data, err) {
        callback && callback(data)
      });
    } else {
      callback && callback(api_name + ' is not find')
    }
  });
}

// 初始化传参
function initParams(params) {
  var params_data = new Object();
  params_data.api_name = params.api;

  var result = {
    state: 0,
    msg: 'nodata',
    aaData: []
  };
  params_data.result = result;

  params_data.params = new Object();
  for (name in params) {
    var params_name = name.trim();
    var val = params[name].trim();
    params_data.params[params_name] = val;
  }
  return params_data;
}