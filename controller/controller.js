exports.controller = function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json;charset=utf-8');
  var params = req.params

  // 目录 
  var directories = params.service
  var service = require("../service/" + directories + ".js")
  service.DataApi(params, function(data) {
    console.log(data)
    res.send(data)
  })
}






exports.test = function(req, res, next) {
  res.send('GET success');
}

exports.test_post = function(req, res, next) {

  // post、get请求都能用req.params接收参数
  var password = req.params.password
  var userInfo = {
    username: 'yangyh',
    password: 666666
  }
  var result = {}
  if (password == userInfo.password) {
    result.Issuccess = 0
  } else {
    result.Issuccess = 1
  }
  res.send(result);
}