function gotoMulti()
{
	location.href = "../../assets/form-parts/multi_player.html";	
}
function openPlayMulti(){
	//deschide a doua pagina
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("playsingle").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "http://localhost/chat/index.html", true);
	xhttp.send();
	/*
	// TO DO folosit variabile globale,sesiuni
	//cere intrebarile pentru quiz
	var getquiz = new ajaxRequest()
	
	getquiz.onreadystatechange=function()
	{
		
		if (getquiz.readyState==4)
		{
			if (getquiz.status==200 || window.location.href.indexOf("http")==-1)
			{
				var jsonresp = JSON.parse(getquiz.responseText)
				questions = jsonresp.message.questions_list.split(",");
				quiz_id=jsonresp.message.quiz_id;
				getQuestion();
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
	
	getquiz.open("GET", "../../quizzes/quiz/"+localStorage.user_id, true)
	getquiz.setRequestHeader("X-API-Key", "123456")
	getquiz.send()*/
}