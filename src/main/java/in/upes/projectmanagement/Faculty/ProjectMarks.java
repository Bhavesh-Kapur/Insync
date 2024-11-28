package in.upes.projectmanagement.Faculty;

public class ProjectMarks {
    private int projectId;
    private String projectName;
    private int midtermMarks;
    private int endtermMarks;
    private int synopsisMarks;

    public ProjectMarks(int projectId, String projectName, int midtermMarks, int endtermMarks, int synopsisMarks) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.midtermMarks = midtermMarks;
        this.endtermMarks = endtermMarks;
        this.synopsisMarks = synopsisMarks;
    }

    // Getters and setters
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

    public int getMidtermMarks() {
        return midtermMarks;
    }

    public void setMidtermMarks(int midtermMarks) {
        this.midtermMarks = midtermMarks;
    }

    public int getEndtermMarks() {
        return endtermMarks;
    }

    public void setEndtermMarks(int endtermMarks) {
        this.endtermMarks = endtermMarks;
    }

    public int getSynopsisMarks() {
        return synopsisMarks;
    }

    public void setSynopsisMarks(int synopsisMarks) {
        this.synopsisMarks = synopsisMarks;
    }
}