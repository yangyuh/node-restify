const cheerio = require('cheerio');
const request = require('request');
const Iconv = require('iconv-lite');


exports.getList = function(req, res) {
  var res = res;
  var req = req;
  var url = 'http://ytltzs.cn/index.html';
  console.log(url);
  request({
    url: url,
    encoding: null,
  }, function(error, response, body) {
    var links = [];
    if (response && response.statusCode == 200) {
      var body = Iconv.decode(body, 'utf-8');
      $ = cheerio.load(body);
      console.log(body)
      res.send({
        code: 200,
        data: links,
        msg: '',
      });
    } else {
      res.send({
        code: 404,
        msg: '网络好像有，点问题',
      });
    }
  })
}