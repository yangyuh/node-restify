exports.controller = function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Content-Type', 'application/json;charset=utf-8');
  var params = req.params

  // 目录 
  var directories = params.service
  var service = require("../service/" + directories + ".js")
  service.DataApi(params, function(data) {
    res.send(data)
  })
}
/***/
exports.crawler = function(req, res, next) {
  var params = req.params
  var directories = params.service
  var service = require("../service/" + directories + ".js")
  service.getList(req, res)
}