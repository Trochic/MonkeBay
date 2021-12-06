<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Inscription</title>
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
            <label>Validation du mot de passe :</label>
            <input type="password" name="mdpverif" required/>


            <input type="submit" value="Valider"/>
        
        </form>

        <?php
        
        if($_POST['mdp'] == $_POST['mdpverif']){
            //verifier que l'utilisateur n'existe pas avec bdd
            //sinon ajouter nouvel utilisateur
            //message de confirmation d'inscription
        }
        else{
            echo("les mots de passe renseignés sont différents");
        }

        ?>
        
    </body>
</html>