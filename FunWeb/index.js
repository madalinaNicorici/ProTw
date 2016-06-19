var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var request = require('request');

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
	
	//making a room
	socket.on('create room',function(msg)
	{	
		var room; 
		var un;
		request.post('http://localhost/ProTw/FunWeb/rooms/room/', {form:{name:msg["name"],room_password:msg["room_password"],player1:msg["player1"]}}, function(err,httpResponse,body){
			body=JSON.parse(body);
			//console.log(body["message"]);
			room=body.message; 
			//socket.join(room);
			client.get("http://localhost/ProTw/FunWeb/users/user/"+msg["player1"], function (data, response) 
			{
				un=data;
				var username=un["message"]["username"];
				msg["id_room"]=room;
				console.log(username);
				io.emit('show room',msg,username,room);
			});
		});
	});
	
	//joining a room
 
	socket.on( 'join', function ( room,user,rn ) {
        // Join the room.
        socket.join( room );
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user, function (data, response) 
			{
				var username=data.message.username;
				//console.log(data);
				io.emit('joined',username,rn);
				io.sockets.in( room ).emit( 'ready');
			});
    });
 
	socket.on( 'authenticate', function ( room,user,pass,rn ) {
        // Join the room.
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user, function (data, response) 
			{
				var username=data.message.username;
				//console.log(data);
				client.get("http://localhost/ProTw/FunWeb/rooms/room/"+room, function (date, response) 
				{
					var userpass=date.message.room_password;
					console.log(userpass);
					console.log(pass);
					if(pass==userpass){
						socket.join( room );
						io.emit('joined',username,rn);
						io.sockets.in( room ).emit( 'ready');
					}
					else io.emit('rejected',"");
				});
			});
    });
   
   //playing the game
	socket.on('play', function(msg)
	{
		client.delete("http://localhost/ProTw/FunWeb/rooms/room/"+msg, function (date, response) 
		{
			var x=date;
			if(x.status=="success")
			console.log(x);
			io.sockets.in( msg ).emit('play', newdata.message);
			var x = Math.floor((Math.random() * 160) + 1);
			client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) 
			{
				newdata=data;
			});
			setTimeout(function(){io.sockets.in( msg ).emit('emit again',msg);return false;
			},10000);
		});
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