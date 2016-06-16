var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

var Client = require('node-rest-client').Client;
var client = new Client();
var newdata;
var scores=[];
	
var x = Math.floor((Math.random() * 160) + 1);
client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) {
	newdata=data;
});

app.get('/', function(req, res){
  res.sendfile('index.html');
});

io.on('connection', function(socket)
{
	scores=[];
  socket.on('chat message', function(msg)
	{
		io.emit('chat message', newdata.message);
		var x = Math.floor((Math.random() * 160) + 1);
		client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) 
		{
			newdata=data;
		});
		setTimeout(function(){io.emit('emit again',"");return false;
		},6000);
	});
	socket.on('return score',function(msg)
	{
		scores.push(msg);
		io.emit('getWinner',scores.toString());
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