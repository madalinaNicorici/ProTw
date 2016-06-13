function startClient() {
	var socket = io();
	$('#start').click(function(){
		socket.emit('chat message', $('').val());
		$('').val('');
		return false;
	});
	var i=0;
	socket.on('chat message', function(msg){
		if(i==0){
			$('#messages').empty();
			$('#messages').append($('<h4>'+msg+'</h4>'));
			i++;
		}
		else{
			$('#messages').append($('<input type="radio" name="greetings" value="' + i + '">'+msg+'</input><br>'));
		i++;
		if(i==5)i=0;
		}
	});
}
	