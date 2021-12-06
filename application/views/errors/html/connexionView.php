<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Connexion</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="HTML, CSS, XML, JavaScript">
        <meta name="chloe fournier" content="IUT de Lannion">
    </head>

    <body>
    <form id="formulaireConnexion" method="post" action="connexionModel.php">


        <label>Identifiant :</label>
        <input type="text" name="identifiant" required/>
        <br>

        <label>Mot de passe :</label>
        <input type="password" name="mdp" required/>
        <br>

        <input type="submit" value="Valider"/>
    
    </body>
</html>