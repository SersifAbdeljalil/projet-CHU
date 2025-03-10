package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import dao.ServiceDAO;
import database.Singleton;

@WebServlet("/ServiceServlet")
public class ServiceServlet extends HttpServlet {
    private ServiceDAO serviceDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = Singleton.getInstance().getConnection();
            serviceDAO = new ServiceDAO(conn);
            System.out.println("ServiceDAO initialisé avec succès");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error initializing ServiceDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "group";  // Par défaut, afficher les groupes
        }

        try {
            System.out.println("Action demandée: " + action);
            switch (action) {
                case "list":
                    listServices(request, response);
                    break;
                case "group":
                    viewGroups(request, response);
                    break;
                case "new":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteService(request, response);
                    break;
                default:
                    viewGroups(request, response);
                    break;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "create":
                    createService(request, response);
                    break;
                case "update":
                    updateService(request, response);
                    break;
                default:
                    viewGroups(request, response);
                    break;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }

    private void listServices(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Service> services = serviceDAO.getAllServices();
        System.out.println("Nombre de services récupérés: " + services.size());
        request.setAttribute("services", services);
        request.getRequestDispatcher("service-list.jsp").forward(request, response);
    }

    private void viewGroups(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        try {
            List<ServiceComposite> groupes = serviceDAO.getAllGroupes();
            System.out.println("Nombre de groupes récupérés: " + groupes.size());
            request.setAttribute("groupes", groupes);
            request.getRequestDispatcher("service-groups.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Erreur lors de la récupération des groupes", e);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<ServiceComposite> groupes = serviceDAO.getAllGroupes();
        request.setAttribute("groupesDisponibles", groupes);
        request.getRequestDispatcher("service-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        
        if ("group".equals(type)) {
            ServiceComposite groupe = serviceDAO.getGroupeById(id);
            request.setAttribute("groupe", groupe);
        } else {
            Service service = serviceDAO.getServiceById(id);
            request.setAttribute("service", service);
            List<ServiceComposite> groupes = serviceDAO.getAllGroupes();
            request.setAttribute("groupesDisponibles", groupes);
        }
        
        request.getRequestDispatcher("service-form.jsp").forward(request, response);
    }

    private void createService(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        String parentId = request.getParameter("parentId");
        boolean isGroup = Boolean.parseBoolean(request.getParameter("isGroup"));
        Integer chefId = request.getParameter("chefId") != null && !request.getParameter("chefId").isEmpty()
                ? Integer.parseInt(request.getParameter("chefId"))
                : null;

        if (isGroup) {
            ServiceComposite groupe = new ServiceComposite(0, nom, description, type);
            groupe.setChefId(chefId);
            serviceDAO.creerGroupe(groupe, chefId);
            System.out.println("Groupe créé: " + groupe.getNom());
        } else {
            Service service = new Service(0, nom, description, type);
            service.setChefId(chefId);
            if (parentId != null && !parentId.isEmpty()) {
                ServiceComposite parent = serviceDAO.getGroupeById(Integer.parseInt(parentId));
                service.setParent(parent);
            }
            serviceDAO.creerService(service, chefId);
            System.out.println("Service créé: " + service.getNom());
        }

        response.sendRedirect("ServiceServlet?action=" + (isGroup ? "group" : "list"));
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        String parentId = request.getParameter("parentId");
        boolean isGroup = Boolean.parseBoolean(request.getParameter("isGroup"));
        Integer chefId = request.getParameter("chefId") != null && !request.getParameter("chefId").isEmpty()
                ? Integer.parseInt(request.getParameter("chefId"))
                : null;

        if (isGroup) {
            ServiceComposite groupe = new ServiceComposite(id, nom, description, type);
            groupe.setChefId(chefId);
            serviceDAO.updateGroupe(groupe, chefId);
        } else {
            Service service = new Service(id, nom, description, type);
            service.setChefId(chefId);
            if (parentId != null && !parentId.isEmpty()) {
                ServiceComposite parent = serviceDAO.getGroupeById(Integer.parseInt(parentId));
                service.setParent(parent);
            }
            serviceDAO.updateService(service, chefId);
        }

        response.sendRedirect("ServiceServlet?action=" + (isGroup ? "group" : "list"));
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");

        if ("group".equals(type)) {
            serviceDAO.deleteGroupe(id);
            response.sendRedirect("ServiceServlet?action=group");
        } else {
            serviceDAO.deleteService(id);
            response.sendRedirect("ServiceServlet?action=list");
        }
    }
}