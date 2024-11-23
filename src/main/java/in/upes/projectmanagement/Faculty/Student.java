package in.upes.projectmanagement.Faculty;

public class Student {
    private int studentId;
    private String studentName;
    private int semester;

    // Constructor
    public Student(int studentId, String studentName, int semester) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.semester = semester;
    }

    // Getters and Setters
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
}