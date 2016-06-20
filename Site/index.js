var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var request = require('request');

var Client = require('node-rest-client').Client;
var client = new Client();
var newdata;
var scores=[];
var users=[];
var rooms=[];
var scores_copy=[];
var info=[];
	
var x = Math.floor((Math.random() * 160) + 1);
client.get("http://localhost/ProTw/FunWeb/questions/question/"+x, function (data, response) {
	newdata=data;
});

app.get('/', function(req, res){
  res.sendfile('index.html');
});

io.on('connection', function(socket)
{
	var info=[];
    scores=[];
    users=[];
    rooms=[];
    scores_copy=[];
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
				io.sockets.in( room ).emit( 'ready',username,room);
			});
    });
 
	//check password
	socket.on( 'authenticate', function ( room,user,pass,rn ) {
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user, function (data, response) 
			{
				var username=data.message.username;
				client.get("http://localhost/ProTw/FunWeb/rooms/room/"+room, function (date, response) 
				{
					var userpass=date.message.room_password;
					if(pass==userpass){
						socket.join( room );
						io.emit('joined',username,rn);
						io.sockets.in( room ).emit( 'ready',username,room);
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
	
	//right answer event
	socket.on('right ans', function(user_id,room_id){
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user_id, function (data, response) 
			{
				var username=data.message.username;
				io.sockets.in( room_id ).emit( 'right ans',username,user_id);
			});
	});
	
	//wrong answer event
	socket.on('wrong ans', function(user_id,room_id){
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user_id, function (data, response) 
			{
				var username=data.message.username;
				io.sockets.in( room_id ).emit( 'wrong ans',username,user_id);
			});
	});
	
	//return the order of the users
	socket.on('return score',function(user_id,score,room)
	{
		client.get("http://localhost/ProTw/FunWeb/users/user/"+user_id, function (data, response) 
		{
			var aux;
			var username=data.message.username;
			var results;
			var x;
			users.push(username);
			scores_copy.push(score);
			if (scores.indexOf(score)==-1)
				scores.push(score);
			rooms.push(room);
			scores.sort();
			var k=0;
			var arrayLength = scores.length;
			var copyLength=scores_copy.length;
			for (var i = arrayLength-1; i >= 0; i--) {
				for (var j = copyLength-1; j >= 0; j--) {
					if(scores[i]==scores_copy[j]){
						if(rooms[j]==room){
							if(aux!=scores_copy[j])
							k++;
							x="Utilizatorul "+users[j]+" este pe locul "+k+".\n";
							info.push(x);
							aux=scores_copy[j];
						}
					}
				}
			}
			console.log(users);
			io.sockets.in( room ).emit('getWinner',info);
		});
	});
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});