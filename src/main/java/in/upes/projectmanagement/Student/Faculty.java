package in.upes.projectmanagement.Student;

public class Faculty {
    private int profid;
    private String name;
    private String program;

    // Constructor
    public Faculty(int profid, String name, String program) {
        this.profid = profid;
        this.name = name;
        this.program = program;
    }

    // Getters
    public int getProfid() {
        return profid;
    }

    public String getName() {
        return name;
    }

    public String getProgram() {
        return program;
    }
}