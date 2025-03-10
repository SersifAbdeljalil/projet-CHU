package dao;

import java.sql.*;
import java.util.*;
import models.*;

public class ServiceDAO {
    private Connection connection;

    public ServiceDAO(Connection connection) {
        this.connection = connection;
    }

    public void creerService(Service service, Integer chefId) throws SQLException {
        String sql = "INSERT INTO services (nom, description, type, parent_id, chef_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, service.getNom());
            pstmt.setString(2, service.getDescription());
            pstmt.setString(3, service.getType());
            if (service.getParent() != null) {
                pstmt.setInt(4, service.getParent().getId());
            } else {
                pstmt.setNull(4, Types.INTEGER);
            }
            pstmt.setObject(5, chefId);
            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                service.setId(rs.getInt(1));
            }
        }

        // Mettre à jour le chef de service avec le service_id
        if (chefId != null) {
            String updateChefSql = "UPDATE chefs_service SET service_id = ? WHERE id = ?";
            try (PreparedStatement updateChefStmt = connection.prepareStatement(updateChefSql)) {
                updateChefStmt.setInt(1, service.getId());
                updateChefStmt.setInt(2, chefId);
                updateChefStmt.executeUpdate();
            }
        }
    }

    public void creerGroupe(ServiceComposite groupe, Integer chefId) throws SQLException {
        String sql = "INSERT INTO service_groupes (nom, description, type, chef_id) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, groupe.getNom());
            pstmt.setString(2, groupe.getDescription());
            pstmt.setString(3, groupe.getType());
            pstmt.setObject(4, chefId);
            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                groupe.setId(rs.getInt(1));
            }
        }

        // Mettre à jour le chef de groupe avec le groupe_id
        if (chefId != null) {
            String updateChefSql = "UPDATE chefs_service SET groupe_id = ? WHERE id = ?";
            try (PreparedStatement updateChefStmt = connection.prepareStatement(updateChefSql)) {
                updateChefStmt.setInt(1, groupe.getId());
                updateChefStmt.setInt(2, chefId);
                updateChefStmt.executeUpdate();
            }
        }
    }

    public Service getServiceById(int id) throws SQLException {
        String sql = "SELECT * FROM services WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Service service = new Service(
                    rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getString("description"),
                    rs.getString("type")
                );
                service.setChefId(rs.getObject("chef_id", Integer.class));
                return service;
            }
        }
        return null;
    }

    public ServiceComposite getGroupeById(int id) throws SQLException {
        String sql = "SELECT * FROM service_groupes WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                ServiceComposite groupe = new ServiceComposite(
                    rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getString("description"),
                    rs.getString("type")
                );
                groupe.setChefId(rs.getObject("chef_id", Integer.class));
                return groupe;
            }
        }
        return null;
    }

    public List<Service> getAllServices() throws SQLException {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT s.*, g.nom AS parent_nom " +
                     "FROM services s " +
                     "LEFT JOIN service_groupes g ON s.parent_id = g.id";  // Jointure pour récupérer le groupe parent
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Service service = new Service(
                    rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getString("description"),
                    rs.getString("type")
                );
                service.setChefId(rs.getObject("chef_id", Integer.class));

                // Charger le groupe parent
                if (rs.getObject("parent_id") != null) {
                    ServiceComposite parent = new ServiceComposite(
                        rs.getInt("parent_id"),
                        rs.getString("parent_nom"),  // Nom du groupe parent
                        null,  // Description non chargée ici
                        null   // Type non chargé ici
                    );
                    service.setParent(parent);
                    System.out.println("Service ID: " + service.getId() + ", Parent: " + parent.getNom());
                } else {
                    System.out.println("Service ID: " + service.getId() + ", Parent: Aucun");
                }

                services.add(service);
            }
        }
        return services;
    }

    public List<ServiceComposite> getAllGroupes() throws SQLException {
        List<ServiceComposite> groupes = new ArrayList<>();
        String sql = "SELECT * FROM service_groupes";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ServiceComposite groupe = new ServiceComposite(
                    rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getString("description"),
                    rs.getString("type")
                );
                groupe.setChefId(rs.getObject("chef_id", Integer.class));
                groupes.add(groupe);
            }
        }
        return groupes;
    }

    public void updateService(Service service, Integer chefId) throws SQLException {
        String sql = "UPDATE services SET nom = ?, description = ?, type = ?, parent_id = ?, chef_id = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, service.getNom());
            pstmt.setString(2, service.getDescription());
            pstmt.setString(3, service.getType());
            if (service.getParent() != null) {
                pstmt.setInt(4, service.getParent().getId());
            } else {
                pstmt.setNull(4, Types.INTEGER);
            }
            pstmt.setObject(5, chefId);
            pstmt.setInt(6, service.getId());
            pstmt.executeUpdate();
        }

        // Mettre à jour le chef de service avec le service_id
        if (chefId != null) {
            String updateChefSql = "UPDATE chefs_service SET service_id = ? WHERE id = ?";
            try (PreparedStatement updateChefStmt = connection.prepareStatement(updateChefSql)) {
                updateChefStmt.setInt(1, service.getId());
                updateChefStmt.setInt(2, chefId);
                updateChefStmt.executeUpdate();
            }
        }
    }

    public void updateGroupe(ServiceComposite groupe, Integer chefId) throws SQLException {
        String sql = "UPDATE service_groupes SET nom = ?, description = ?, type = ?, chef_id = ? WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, groupe.getNom());
            pstmt.setString(2, groupe.getDescription());
            pstmt.setString(3, groupe.getType());
            pstmt.setObject(4, chefId);
            pstmt.setInt(5, groupe.getId());
            pstmt.executeUpdate();
        }

        // Mettre à jour le chef de groupe avec le groupe_id
        if (chefId != null) {
            String updateChefSql = "UPDATE chefs_service SET groupe_id = ? WHERE id = ?";
            try (PreparedStatement updateChefStmt = connection.prepareStatement(updateChefSql)) {
                updateChefStmt.setInt(1, groupe.getId());
                updateChefStmt.setInt(2, chefId);
                updateChefStmt.executeUpdate();
            }
        }
    }

    public void deleteService(int id) throws SQLException {
        // Récupérer le chef associé au service
        String getChefSql = "SELECT chef_id FROM services WHERE id = ?";
        try (PreparedStatement getChefStmt = connection.prepareStatement(getChefSql)) {
            getChefStmt.setInt(1, id);
            ResultSet rs = getChefStmt.executeQuery();
            if (rs.next()) {
                Integer chefId = rs.getObject("chef_id", Integer.class);
                if (chefId != null) {
                    // Mettre à jour le chef de service pour retirer l'association
                    String updateChefSql = "UPDATE chefs_service SET service_id = NULL WHERE id = ?";
                    try (PreparedStatement updateChefStmt = connection.prepareStatement(updateChefSql)) {
                        updateChefStmt.setInt(1, chefId);
                        updateChefStmt.executeUpdate();
                    }
                }
            }
        }

        // Supprimer le service
        String sql = "DELETE FROM services WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public void deleteGroupe(int id) throws SQLException {
        // Récupérer le chef associé au groupe
        String getChefSql = "SELECT chef_id FROM service_groupes WHERE id = ?";
        try (PreparedStatement getChefStmt = connection.prepareStatement(getChefSql)) {
            getChefStmt.setInt(1, id);
            ResultSet rs = getChefStmt.executeQuery();
            if (rs.next()) {
                Integer chefId = rs.getObject("chef_id", Integer.class);
                if (chefId != null) {
                    // Mettre à jour le chef de groupe pour retirer l'association
                    String updateChefSql = "UPDATE chefs_service SET groupe_id = NULL WHERE id = ?";
                    try (PreparedStatement updateChefStmt = connection.prepareStatement(updateChefSql)) {
                        updateChefStmt.setInt(1, chefId);
                        updateChefStmt.executeUpdate();
                    }
                }
            }
        }

        // Supprimer le groupe
        String sql = "DELETE FROM service_groupes WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    private void checkServiceDependencies(int serviceId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM services WHERE parent_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, serviceId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                throw new SQLException("Cannot delete service: it has dependent services");
            }
        }
    }

    private void checkGroupDependencies(int groupId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM services WHERE parent_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, groupId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                throw new SQLException("Cannot delete group: it contains services");
            }
        }
    }
}