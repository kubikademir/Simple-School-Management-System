<?php 
	session_start();
	if (isset($_SESSION['username']) ) {
		if ($_SESSION['auth'] == 0) {
			header('location:root.php');
		}elseif ($_SESSION['auth'] == 1) {
			header('location:user.php');
		}
		
	}

 ?>

<!DOCTYPE html>
<html lang="tr">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <link rel="stylesheet" href="style.css">
	<title>ACM368 Project</title>

</head>
<body style="background-color: #D9DADF">
<center>
    <p><i>ACM368 School Management System Project</i></p>
    <h1 style="color:black";>~ GİRİŞ EKRANI ~</h1>


			<form class="action_page.php" action="login.php" method="POST" >
<br>
                <div class="container">
                    <label for="username">Kullanıcı Adı</label>
                    <form method="post">
                        <input type="text" name="username" autocomplete="off" class="input[type=text]" id="username" placeholder="*****" required>
			    	</div>

			  	<div class="container">
			    	<label for="password">Şifre</label>
			      		<input type="password" name="password" autocomplete="off" class="input[type=password]" id="password" placeholder="*****" required>
			    	</div>

			  	<div class="container2">
                    <button type="submit" style="width: 100%";><b>Giriş Yap</b></button>
			    	</div>

			</form>

    <p class="ex1">Kubilay Kaan Demir</p>
    <p class="ex2">20201308010</p>



        <button onclick="document.getElementById('id01').style.display='block'" class="button1">Kullanıcı Adı ve Şifreler İçin Tıkla</button>
        <div id="id01" class="modal">

            <form class="modal-content animate" action="/action_page.php" method="post">

                <table>
                    <tr>

                        <th><br>İsim</th>
                        <th><br>Kullanıcı Adı</th>
                        <th><br>Şifre</th>

                    </tr>
                    <tr>
                        <td>   <br>Admin</td>
                        <td>   <br>admin</td>
                        <td>   <br>admin</td>
                    </tr>
                    <tr>
                        <td>   <br>ACM368</td>
                        <td>   <br>user1</td>
                        <td>   <br>user368</td>
                    </tr>
                    <tr>
                        <td>   <br>STAT411</td>
                        <td>   <br>user2</td>
                        <td>   <br>user411</td>
                    </tr>
                    <tr>
                        <td>   <br>HTR302</td>
                        <td>   <br>user3</td>
                        <td>   <br>user302</td>
                    </tr>
                    <tr>
                </table>


            </form>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>



    </center>
</body>
</html>