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
  res.sendfile('socket_client.html');
});

io.on('connection', function(socket)
{
	var info=[];
    scores=[];
    users=[];
    rooms=[];
    scores_copy=[];
	first_question=0;
	
	//showing the existing rooms when user is connecting
	var rooms_in_db=1;
	client.get("http://localhost/ProTw/FunWeb/rooms/room/"+rooms_in_db, function (date, response)
	{
		while(date.status=="success"){
			client.get("http://localhost/ProTw/FunWeb/rooms/room/"+rooms_in_db, function (date, response)
			{
				if(date.status=="success"){
					var room_status=date.message.status;
					if(room_status=='active'){
						io.emit('show initial rooms',date.message.room_id,date.message.name,date.message.room_password,date.message.player1,date.message.player2,date.message.player3,date.message.player4);
					}
					rooms_in_db++;
				}
			});
		}
	});
	
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
	socket.on('return score',function(uid,score,room)
	{
		client.get("http://localhost/ProTw/FunWeb/users/user/"+uid, function (data, response) 
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
			var scoremax=20;
			var arrayLength = scores.length;
			var copyLength=scores_copy.length;
			for (var i = arrayLength-1; i >= 0; i--) {
				for (var j = copyLength-1; j >= 0; j--) {
					if(scores[i]==scores_copy[j]){
						if(rooms[j]==room){
							if(aux!=scores_copy[j]){
								k++; scoremax-=5;
							}
							x=users[j]+" - locul "+k+" - "+scoremax*10+" de puncte.\n";
							info.push(x);
							aux=scores_copy[j];
							request.post('http://localhost/ProTw/FunWeb/scores/score/', {form:{user_id:uid,quiz_id:1,result:scoremax}}, function(err,httpResponse,body){
							});
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