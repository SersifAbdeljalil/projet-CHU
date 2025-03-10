<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Batiment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Liste des Bâtiments</title>
    <style type="text/css">
        /* Style global */
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 80%;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 20px;
        }

        a:hover {
            text-decoration: underline;
        }

        .table-container {
            max-height: 400px; /* Hauteur maximale pour la table */
            overflow-y: auto; /* Activer le scroll vertical */
            border: 1px solid #ddd; /* Bordure autour de la table */
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 1em;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            position: sticky; /* Fixe l'en-tête au sommet pendant le scroll */
            top: 0;
            z-index: 1;
        }

        td {
            text-align: center;
            padding: 10px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions a {
            margin: 0 10px;
            color: #ff9800;
            font-weight: bold;
            text-decoration: none;
        }

        .actions a:hover {
            color: #e68900;
        }

        .actions a.delete {
            color: #e63946;
        }

        .actions a.delete:hover {
            color: #d12c2f;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            table {
                font-size: 0.9em;
            }
        }
        button {
             /* Reduce the width of the button */
            padding: 8px; /* Reduce the padding of the button */
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 1em;
            background-color: #FFA500; /* Button color */
            border: none;
            cursor: pointer;
            text-align: center; /* Center the text inside the button */
        }

        button:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Liste des Bâtiments</h1>
    
    <div class="table-container">
        <table>
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Taille</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <%
                // Récupérer la liste des bâtiments depuis la session
                List<Batiment> batiments = (List<Batiment>) session.getAttribute("batiments");

                if (batiments != null && !batiments.isEmpty()) {
                    for (Batiment batiment : batiments) {
            %>
            <tr>
                <td><%= batiment.getId() %></td>
                <td><%= batiment.getType() %></td>
                <td><%= batiment.getTaille() %></td>
                <td><%= batiment.getDescription() %></td>
                <td class="actions">
                    <a href="./BatimentServlet?action=modifierForm&id=<%= batiment.getId() %>">Modifier</a>
                    <a href="BatimentServlet?action=supprimer&id=<%= batiment.getId() %>" onclick="return confirm('Voulez-vous vraiment supprimer ce bâtiment ?');" class="delete">Supprimer</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">Aucun bâtiment trouvé.</td>
            </tr>
            <%
                }
            %>
        </table>
        
    </div>
         <form action="ajouter_batiment.jsp" method="GET">
                       <button type="submit">Ajouter un bâtiment</button>
                      </form>          
</div>
                     
</body>
</html>
