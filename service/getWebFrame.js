const cheerio = require('cheerio');
const request = require('request');
const Iconv = require('iconv-lite');


exports.getList = function(req, res) {
  var res = res;
  var req = req;
  var url = 'http://caibaojian.com/c/news';
  console.log(url);
  request({
    url: url,
    encoding: null,
  }, function(error, response, body) {
    var links = [];
    if (response && response.statusCode == 200) {
      var body = Iconv.decode(body, 'utf-8');
      console.log(body)
      $ = cheerio.load(body);
      $('#content article ').each(function() {
        var title = $(this).find('.entry-title span').text();
        var description = $(this).find('.entry-content p').text();
        var href = $(this).find('.read-more').attr('href');
        var date = $(this).find('.entry-date').text();
        var tmp = {
          title: title,
          id: parseInt(title),
          description: description,
          date: date,
          url: href,
        };
        links.push(tmp);
      });
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