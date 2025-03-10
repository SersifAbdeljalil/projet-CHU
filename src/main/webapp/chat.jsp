<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.ServiceMediator" %>
<html>
<head>
    <title>Discussion entre chefs de service</title>
    <style>
        .chat-container { max-width: 800px; margin: 0 auto; }
        .message { margin: 10px 0; padding: 10px; border: 1px solid #ddd; }
        .message-sent { background-color: #e3f2fd; }
        .message-received { background-color: #f5f5f5; }
    </style>
</head>
<body>
    <div class="chat-container">
        <h2>Discussion entre chefs de service</h2>
        
        <% 
            String currentChef = request.getParameter("chefNom");
            ServiceMediator mediator = (ServiceMediator) application.getAttribute("mediator");
            List<String> availableChefs = null;
            if (mediator != null && currentChef != null) {
                availableChefs = mediator.getAvailableChefs(currentChef);
            }
        %>
        
        <!-- Sélection du chef actuel -->
        <form id="userSelectForm">
            <label>Connecté en tant que :</label>
            <select name="chefNom" onchange="this.form.submit()">
                <option value="">Sélectionnez votre nom</option>
                <option value="Dr. Alice" <%= "Dr. Alice".equals(currentChef) ? "selected" : "" %>>Dr. Alice</option>
                <option value="Dr. Bob" <%= "Dr. Bob".equals(currentChef) ? "selected" : "" %>>Dr. Bob</option>
                <option value="Dr. Charlie" <%= "Dr. Charlie".equals(currentChef) ? "selected" : "" %>>Dr. Charlie</option>
            </select>
        </form>
        
        <!-- Formulaire d'envoi de message -->
        <% if (currentChef != null && !currentChef.isEmpty()) { %>
            <form action="MediateurServlet" method="post">
                <input type="hidden" name="expediteur" value="<%= currentChef %>">
                
                <label>Envoyer à :</label>
                <select name="destinataire" required>
                    <option value="">Choisir un destinataire</option>
                    <% if (availableChefs != null) {
                        for (String chef : availableChefs) { %>
                            <option value="<%= chef %>"><%= chef %></option>
                    <%  }
                    } %>
                </select>
                
                <input type="text" name="message" placeholder="Votre message" required>
                <button type="submit">Envoyer</button>
            </form>
            
            <!-- Affichage des messages -->
            <div class="messages">
                <h3>Messages :</h3>
                <% 
                    List<String> messages = mediator.getMessagesForChef(currentChef);
                    for (String msg : messages) {
                        boolean isSent = msg.contains(currentChef + " →");
                %>
                    <div class="message <%= isSent ? "message-sent" : "message-received" %>">
                        <%= msg %>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>