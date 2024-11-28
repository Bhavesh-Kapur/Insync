package in.upes.projectmanagement.Faculty;

public class Faculty {
    private int profId;
    private String name;

    // Constructor
    public Faculty(int profId, String name) {
        this.profId = profId;
        this.name = name;
    }

    // Getters and Setters
    public int getProfId() {
        return profId;
    }

    public void setProfId(int profId) {
        this.profId = profId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Optional: Override toString for better logging/debugging
    @Override
    public String toString() {
        return "Faculty{" +
               "profId=" + profId +
               ", name='" + name + '\'' +
               '}';
    }
}