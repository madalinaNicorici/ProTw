<?php
	// Function to validate against any email injection attempts
	function IsInjected($str)
	{
		$injections = array('(\n+)','(\r+)','(\t+)','(%0A+)','(%0D+)','(%08+)','(%09+)');
		$inject = join('|', $injections);
		$inject = "/$inject/i";
		if(preg_match($inject,$str))
			{
				return true;
			}
			else
			{
				return false;
			}
	}
	if(isset($_POST['submit']))
	{
		
		$name = $_POST['contact-name'];
		$visitor_email = $_POST['contact-email'];
		$message = $_POST['contact-message'];
		$errInje = "";
		if(IsInjected($visitor_email))
		{
			$errInje = "Bad email value!";		
		}
		$to = "madutz_si_punct@yahoo.com";
		$email_from = $visitor_email;
		$headers = "From: $email_from \r\n";

		$email_subject = "New Form submission";
		$email_body = "You have received a new message from the user $name. Here is the message:\n $message \n";

		//Send the email!
		if(!$errInje)
		{
			if(mail($to,$email_subject,$email_body,$headers))
			{
				$result='<div class="alert alert-success">Thank You! I will be in touch</div>';
			}
			else 
			{
				$result='<div class="alert alert-danger">Sorry there was an error sending your message. Please try again later</div>';
			}
			header('Location: user_logged.html');
		}
	}  
?> 