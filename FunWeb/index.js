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
	first_question=0;
	//making a room
	socket.on('create room',function(msg)
	{	
		var room; 
		var un;
		request.post('http://localhost/ProTw/FunWeb/rooms/room/', {form:{name:msg["name"],room_password:msg["room_password"],player1:msg["player1"]}}, function(err,httpResponse,body){
			body=JSON.parse(body);
			room=body.message; 
			client.get("http://localhost/ProTw/FunWeb/users/user/"+msg["player1"], function (data, response) 
			{
				un=data;
				var username=un["message"]["username"];
				msg["id_room"]=room;
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
				io.emit('joined',username,rn);
				io.sockets.in( room ).emit( 'ready',room);
			});
    });
 
	socket.on( 'authenticate', function ( room,user,pass,rn ) {
        // Join the room.
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user, function (data, response) 
			{
				var username=data.message.username;
				client.get("http://localhost/ProTw/FunWeb/rooms/room/"+room, function (date, response) 
				{
					var userpass=date.message.room_password;
					if(pass==userpass){
						socket.join( room );
						io.emit('joined',username,rn);
						io.sockets.in( room ).emit( 'ready',user,room);
					}
					else io.emit('rejected',"");
				});
			});
    });
   
   //playing the game
	socket.on('play', function(room)
	{
		io.emit('delete room',room);
		client.delete("http://localhost/ProTw/FunWeb/rooms/room/"+room, function (date, response) 
		{
			var x = Math.floor((Math.random() * 160) + 1);
			client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) 
			{
				newdata=data;
				io.sockets.in( room ).emit('play', newdata.message);
				setTimeout(function(){io.sockets.in( room ).emit('emit again',room);return false;
				},10000);
			});
		});
	});
	
	socket.on('right ans', function(user_id,room_id){
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user_id, function (data, response) 
			{
				var username=data.message.username;
				io.sockets.in( room_id ).emit( 'right ans',username,user_id);
			});
	});
	
	socket.on('wrong ans', function(user_id,room_id){
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user_id, function (data, response) 
			{
				var username=data.message.username;
				io.sockets.in( room_id ).emit( 'wrong ans',username,user_id);
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