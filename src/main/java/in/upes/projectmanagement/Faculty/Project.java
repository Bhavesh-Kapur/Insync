package in.upes.projectmanagement.Faculty;

public class Project {
    private int projectId;
    private String projectName;
    private int semester; // Added semester field

    // Constructor with semester
    public Project(int projectId, String projectName, int semester) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.semester = semester;
    }

    // Getters and Setters
    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
}