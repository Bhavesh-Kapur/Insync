package in.upes.projectmanagement.Faculty;

public class Professor {
    private int profId;
    private String profName;
    private String program;

    // Constructor
    public Professor(int profId, String profName, String program) {
        this.profId = profId;
        this.profName = profName;
        this.program = program;
    }

    // Getters and Setters
    public int getProfId() {
        return profId;
    }

    public void setProfId(int profId) {
        this.profId = profId;
    }

    public String getProfName() {
        return profName;
    }

    public void setProfName(String profName) {
        this.profName = profName;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
}