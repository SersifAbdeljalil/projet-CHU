package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Section;
import database.Singleton;

@WebServlet("/sections")
public class SectionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sectionNom = request.getParameter("nom"); // Récupérer le nom de la section
        ArrayList<Section> sections = new ArrayList<>();

        try {
            Connection conn = Singleton.getInstance().getConnection(); // Utilisation du Singleton

            String sql;
            PreparedStatement stmt;
            
            if (sectionNom != null && !sectionNom.isEmpty()) {
                // Si un nom est fourni, récupérer uniquement cette section
                sql = "SELECT s.nom AS section, m.nom AS medecin, COUNT(p.id) AS nombre_patients " +
                      "FROM sections s " +
                      "LEFT JOIN medecins m ON s.medecin_id = m.id " +
                      "LEFT JOIN patients p ON p.section_id = s.id " +
                      "WHERE s.nom = ? " +
                      "GROUP BY s.id, s.nom, m.nom";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, sectionNom);
            } else {
                // Sinon, récupérer toutes les sections
                sql = "SELECT s.nom AS section, m.nom AS medecin, COUNT(p.id) AS nombre_patients " +
                      "FROM sections s " +
                      "LEFT JOIN medecins m ON s.medecin_id = m.id " +
                      "LEFT JOIN patients p ON p.section_id = s.id " +
                      "GROUP BY s.id, s.nom, m.nom";
                stmt = conn.prepareStatement(sql);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                sections.add(new Section(rs.getString("section"), rs.getString("medecin"), rs.getInt("nombre_patients")));
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Vérifier si c’est une requête de détail ou générale
        if (sectionNom != null && !sectionNom.isEmpty() && !sections.isEmpty()) {
            request.setAttribute("section", sections.get(0)); // Envoyer seulement la première section
            request.getRequestDispatcher("./detailsSection.jsp").forward(request, response);
        } else {
            request.setAttribute("sections", sections);
            request.getRequestDispatcher("./sections.jsp").forward(request, response);
        }
    }
}