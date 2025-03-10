<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Section" %>
<html>
<head>
    <title>Sections de l'Hôpital</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Liste des Sections</h2>
        <div class="row">
            <%
                try {
                    ArrayList<Section> sections = (ArrayList<Section>) request.getAttribute("sections");

                    if (sections != null && !sections.isEmpty()) {
                        for (Section section : sections) {
            %>
            <div class="col-md-4">
                <div class="card shadow-lg p-3 mb-5 bg-body rounded">
                    <div class="card-body">
                        <h5 class="card-title"><%= section.getNom() %></h5>
                        <p class="card-text"><strong>Médecin Responsable :</strong> <%= (section.getMedecin() != null) ? section.getMedecin() : "Aucun" %></p>
                        <p class="card-text"><strong>Nombre de Patients :</strong> <%= section.getNombrePatients() %></p>
                        <a href="detailsSection.jsp?nom=<%= java.net.URLEncoder.encode(section.getNom(), "UTF-8") %>" class="btn btn-primary">Voir Détails</a>
                    </div>
                </div>
            </div>
            <%
                        }
                    } else {
            %>
            <div class="col-12 text-center">
                <p class="alert alert-warning">Aucune section trouvée.</p>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <div class="col-12 text-center">
                <p class="alert alert-danger">Une erreur s'est produite lors du chargement des sections.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>