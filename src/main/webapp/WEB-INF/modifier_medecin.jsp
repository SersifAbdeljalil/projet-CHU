<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="models.Medecin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Modifier un médecin</title>
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
            justify-content: center;
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
            text-align: center;
        }

        .right-section form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-bottom: 8px;
            font-size: 1.1em;
            width: 90%;
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
            background-color: #FFA500;
            border: none;
            cursor: pointer;
            text-align: center;
        }

        button:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>

<%
    // Récupérer les données du médecin à modifier depuis la session
    Medecin medecin = (Medecin) session.getAttribute("medecin");
    if (medecin == null) {
        out.println("<p style='color: red;'>Aucune donnée disponible pour ce médecin.</p>");
    } else {
%>

<div class="main-section">
    <div class="left-section">
        <img src="images/logo.png" alt="Logo">
    </div>
    <div class="right-section">
        <h2>Modifier un médecin</h2>
        <form method="post" action="./MedecinServlet">
            <input type="hidden" name="action" value="modifier">
            <input type="hidden" name="id" value="<%= medecin.getId() %>">   
            <label for="nom">Nom :</label>
            <input type="text" name="nom" value="<%= medecin.getNom() %>" required><br>

            <label for="specialite">Spécialité :</label>
            <input type="text" name="specialite" value="<%= medecin.getSpecialite() %>" required><br>


            <button type="submit">Modifier</button>
            <button type="button" onclick="window.location.href='liste_medecin.jsp'" style="background-color: #f44336; color: black; padding: 10px 20px;">Annuler</button>
            
        </form>
    </div>
</div>

<%
    }
%>

</body>
</html>
