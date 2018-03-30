var restify = require('restify');
var controller = require('./controller/controller')

var server = restify.createServer();
var server_port = 5500;

server.use(restify.acceptParser(server.acceptable));
server.use(restify.queryParser());
server.use(restify.bodyParser({
  mapParams: true
}));
server.use(restify.dateParser());
server.use(restify.jsonp());
server.use(restify.gzipResponse());
// 处理跨域
server.use(restify.CORS());

// 路由配置 
server.get('/api/:service/:api', controller.controller);
server.post('/api/:service/:api', controller.controller);

server.get('/api/:service', controller.crawler);


server.listen(server_port, function() {
  console.log('server start at ' + server_port);
});