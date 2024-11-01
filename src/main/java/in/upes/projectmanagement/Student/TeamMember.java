package in.upes.projectmanagement.Student;


public class TeamMember {
    private String name;
    private int sapId;
    private int semester;
    private String program;

    public TeamMember(String name, int sapId, int semester, String program) {
        this.name = name;
        this.sapId = sapId;
        this.semester = semester;
        this.program = program;
    }

    public String getName() {
        return name;
    }

    public int getSapId() {
        return sapId;
    }

    public int getSemester() {
        return semester;
    }

    public String getProgram() {
        return program;
    }
}