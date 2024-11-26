package in.upes.projectmanagement.Faculty;

// Class representing a project
public class mProject {
    private int projectId;
    private String projectName;
    private String semester;

    public mProject(int projectId, String projectName, String semester) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.semester = semester;
    }

    public int getProjectId() {
        return projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public String getSemester() {
        return semester;
    }
}