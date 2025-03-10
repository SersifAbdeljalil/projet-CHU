<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="models.RendezVous" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Rendez-vous</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --success-color: #4caf50;
            --warning-color: #ff9800;
            --danger-color: #f44336;
            --text-primary: #333;
            --text-secondary: #666;
            --background-light: #f8f9fa;
            --background-white: #ffffff;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --border-radius: 12px;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-light);
            color: var(--text-primary);
            line-height: 1.6;
            height: 100%;
            width: 100%;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background-color: var(--background-white);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }

        header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-button {
            display: flex;
            align-items: center;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            padding: 10px 16px;
            border-radius: var(--border-radius);
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .back-button i {
            margin-right: 8px;
            font-size: 0.9rem;
        }

        h1 {
            color: var(--primary-color);
            font-size: 2.2rem;
            font-weight: 600;
            margin-bottom: 10px;
            flex-grow: 1;
            text-align: center;
        }

        .table-container {
            max-height: 500px;
            overflow-y: auto;
            border-radius: var(--border-radius);
            border: 1px solid #eee;
            margin-top: 20px;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }

        th {
            background-color: var(--primary-color);
            color: white;
            padding: 15px;
            text-align: left;
            position: sticky;
            top: 0;
            z-index: 10;
            font-weight: 500;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        tr:nth-child(even) {
            background-color: rgba(67, 97, 238, 0.03);
        }

        tr:hover {
            background-color: rgba(67, 97, 238, 0.07);
            transition: background-color 0.2s ease;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .action-btn {
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            transition: all 0.2s ease;
        }

        .action-btn i {
            margin-right: 5px;
        }

        .edit-btn {
            background-color: rgba(76, 201, 240, 0.1);
            color: var(--accent-color);
        }

        .edit-btn:hover {
            background-color: var(--accent-color);
            color: white;
        }

        .delete-btn {
            background-color: rgba(244, 67, 54, 0.1);
            color: var(--danger-color);
        }

        .delete-btn:hover {
            background-color: var(--danger-color);
            color: white;
        }

        .add-button {
            background-color: var(--success-color);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
        }

        .add-button i {
            margin-right: 8px;
        }

        .add-button:hover {
            background-color: #3d8b40;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .empty-message {
            text-align: center;
            padding: 30px;
            color: var(--text-secondary);
            font-style: italic;
        }

        footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            color: var(--text-secondary);
            font-size: 0.9rem;
            border-top: 1px solid #eee;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
                margin: 20px auto;
            }

            header {
                flex-direction: column;
                align-items: flex-start;
            }

            .back-button {
                margin-bottom: 15px;
            }

            h1 {
                font-size: 1.8rem;
                text-align: left;
            }

            th, td {
                padding: 10px;
            }

            .actions {
                flex-direction: column;
                gap: 5px;
            }

            .action-btn {
                width: 100%;
                justify-content: center;
            }

            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <a href="AccueilAdmin.jsp" class="back-button">
                <i class="fas fa-arrow-left"></i>
                <span>Retour</span>
            </a>
            <h1>Liste des Rendez-vous</h1>
        </header>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Téléphone</th>
                        <th>Date & Heure</th>
                        <th>Médecin</th>
                        <th>Statut</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Récupérer la liste des rendez-vous depuis la requête
                        List<RendezVous> rendezVousList = (List<RendezVous>) request.getAttribute("rendezVousList");

                        if (rendezVousList != null && !rendezVousList.isEmpty()) {
                            for (RendezVous rdv : rendezVousList) {
                    %>
                    <tr>
                        <td><%= rdv.getId() %></td>
                        <td><%= rdv.getNom() %></td>
                        <td><%= rdv.getPrenom() %></td>
                        <td><%= rdv.getTelephone() %></td>
                        <td><%= new SimpleDateFormat("dd/MM/yyyy HH:mm").format(rdv.getDateHeure()) %></td>
                        <td><%= rdv.getMedecinNom() %></td>
                        <td>
                            <span class="status-badge <%= rdv.isStatut() ? "status-done" : "status-pending" %>">
                                <%= rdv.isStatut() ? "Consulté" : "En attente" %>
                            </span>
                        </td>
                        <td class="actions">
                            <form action="RendezVousAdminServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="marquerConsulte">
                                <input type="hidden" name="rdvId" value="<%= rdv.getId() %>">
                                <button type="submit" class="action-btn edit-btn">
                                    <i class="fas fa-check"></i> Consulté
                                </button>
                            </form>
                            <form action="RendezVousAdminServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="supprimerRendezVous">
                                <input type="hidden" name="rdvId" value="<%= rdv.getId() %>">
                                <button type="submit" class="action-btn delete-btn" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce rendez-vous ?');">
                                    <i class="fas fa-trash-alt"></i> Supprimer
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="empty-message">
                            <i class="fas fa-calendar-alt" style="font-size: 2rem; margin-bottom: 10px; display: block;"></i>
                            Aucun rendez-vous trouvé.
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <footer>
            <p>&copy; 2025 - Système de Gestion Médicale</p>
        </footer>
    </div>
</body>
</html>