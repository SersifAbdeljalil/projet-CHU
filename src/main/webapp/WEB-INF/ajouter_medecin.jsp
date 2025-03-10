<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un médecin</title>
    <style type="text/css">
        /* Style global */
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('images/background.jpg'); /* Image de fond */
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            background-color: #000;
        }

        /* Section principale */
        .main-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 800px;
            background-color: #000A6C; /* Fond bleu clair */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Section gauche : Logo */
        .left-section {
            width: 40%;
            text-align: center;
        }

        .left-section img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        /* Section droite : Formulaire */
        .right-section {
            width: 60%;
            color: #fff;
        }

        .right-section h2 {
            margin-bottom: 20px;
            font-size: 1.5em;
        }

        .right-section form {
            display: flex;
            flex-direction: column;
            align-items: center; /* Centre les éléments du formulaire */
        }

        label {
            margin-bottom: 8px;
            font-size: 1.1em;
            width: 90%; /* Aligne les labels avec les inputs */
        }

        input, textarea {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 1em;
        }

        textarea {
            resize: vertical;
        }

        button {
            width: 50%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 1em;
            background-color: #FFA500; /* Couleur du bouton */
            border: none;
            cursor: pointer;
            text-align: center;
            align-items: center;
        }

        button:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>

<div class="main-section">
    <div class="left-section">
        <img src="images/logo.png" alt="Logo">
    </div>
    <div class="right-section">
        <h2>Ajouter un médecin</h2>

        <form action="./MedecinServlet" method="post">
            <input type="hidden" name="action" value="ajouter">

            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required><br>

            <label for="specialite">Spécialité :</label>
            <input type="text" id="specialite" name="specialite" required><br>

            <label for="telephone">Téléphone :</label>
            <input type="text" id="telephone" name="telephone" required><br>

            <button type="submit">Ajouter</button>
        </form>
    </div>
</div>

</body>
</html>
