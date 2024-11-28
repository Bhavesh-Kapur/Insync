package in.upes.projectmanagement.Faculty;
public class mProject {
    private int projectId;
    private String projectName;
    private String projectDetails;
    private String semester;

    // Constructor
    public mProject(int projectId, String projectName, String semester) {
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

    public String getProjectDetails() {
        return projectDetails;
    }

    public void setProjectDetails(String projectDetails) {
        this.projectDetails = projectDetails;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }
}