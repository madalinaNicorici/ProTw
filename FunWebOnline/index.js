var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

var Client = require('node-rest-client').Client;
var client = new Client();
var newdata;
	
var x = Math.floor((Math.random() * 160) + 1);
client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) {
	newdata=data;
});

app.get('/', function(req, res){
  res.sendfile('index.html');
});

io.on('connection', function(socket){
  socket.on('chat message', function(msg){
    io.emit('chat message', escapeHtml(newdata.message.q_body));
    io.emit('chat message', escapeHtml(newdata.message.answer_r));
    io.emit('chat message', escapeHtml(newdata.message.answer_w1));
    io.emit('chat message', escapeHtml(newdata.message.answer_w2));
    io.emit('chat message', escapeHtml(newdata.message.answer_w3));
	var x = Math.floor((Math.random() * 160) + 1);
client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) {
	newdata=data;
});
  });
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});

function escapeHtml(text) {
  return text
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;");
}