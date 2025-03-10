<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Section" %>
<html>
<head>
    <title>Détails de la Section</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <%
            Section section = (Section) request.getAttribute("section");
            if (section != null) {
        %>
            <h2>Détails de la Section : <%= section.getNom() %></h2>
            <p><strong>Médecin Responsable :</strong> <%= (section.getMedecin() != null) ? section.getMedecin() : "Aucun" %></p>
            <p><strong>Nombre de Patients :</strong> <%= section.getNombrePatients() %></p>
        <% } else { %>
            <div class="alert alert-danger">Section non trouvée.</div>
        <% } %>
        <a href="sections" class="btn btn-secondary">Retour</a>
    </div>
</body>
</html>