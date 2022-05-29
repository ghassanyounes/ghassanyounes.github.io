<?php 
$secret_file = fopen("priv.info","r");
$secret=fread($secret_file,filesize("priv.info"));
fclose($secret_file);

$errors = '';
$myemail = 'ghassan@ghassanyounes.com';//<-----Put Your email address here.

$submission_ready = false;

if(empty($_POST['name'])  || 
   empty($_POST['email']) || 
   empty($_POST['message']))
{
    $errors .= "\n Error: all fields are required";
}

$name = $_POST['name']; 
$email_address = $_POST['email']; 
$message = $_POST['message']; 

if (!preg_match(
"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i", 
$email_address))
{
    $errors .= "\n Error: Invalid email address";
}

if( empty($errors) && && isset($_POST['token_response']) )
{
  $url='https://www.google.com/recaptcha/api/siteverify';
  $recaptcha_response=$_POST['token_response'];

  $request = file_get_contents($url . '?secret=' . $secret . '&response=' . $recaptcha_response);
  $response = json_decode($request);

  if($response->success==true && $response->score >= 0.5){
    $to = $myemail; 
    $email_subject = "Contact form submission: $name";
    $email_body = "You have received a new message. ".
    " Here are the details:\n Name: $name \n Email: $email_address \n Message \n $message"; 
    
    $headers = "From: $myemail\n"; 
    $headers .= "Reply-To: $email_address";
    
    mail($to,$email_subject,$email_body,$headers);
    //redirect to the 'thank you' page
    header('Location: ../contact-form-submitted.html');
  } else {
    echo'<script language="javascript">';
    echo'alert("Error. Humanoid not detected.")';
    echo'</script>';
  }
} 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
	<title>Contact form handler</title>
</head>

<body>
<!-- This page is displayed only if there is some error -->
<?php
$secret_file = fopen("priv.info","r");
$secret=fread($secret_file,filesize("priv.info"));
fclose($secret_file);
echo nl2br($errors);
echo'<script language="javascript">';
echo'alert("Error. Humanoid not detected")';
echo'</script>';
?>
<p>Error. Captcha not verified.</p>

</body>
</html>