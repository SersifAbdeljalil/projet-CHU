package models;
public class Section {
    private String nom;
    private String medecin;
    private int nombrePatients;

    public Section(String nom, String medecin, int nombrePatients) {
        this.nom = nom;
        this.medecin = medecin;
        this.nombrePatients = nombrePatients;
    }

    public String getNom() { return nom; }
    public String getMedecin() { return medecin; }
    public int getNombrePatients() { return nombrePatients; }
}