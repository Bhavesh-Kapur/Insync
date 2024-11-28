package in.upes.projectmanagement.Faculty;
public class PanelMarks {
    private int teamId;
    private int synopsisMarks;
    private int midMarks;
    private int endMarks;

    public PanelMarks(int teamId, int synopsisMarks, int midMarks, int endMarks) {
        this.teamId = teamId;
        this.synopsisMarks = synopsisMarks;
        this.midMarks = midMarks;
        this.endMarks = endMarks;
    }

    public int getTeamId() {
        return teamId;
    }

    public int getSynopsisMarks() {
        return synopsisMarks;
    }

    public int getMidMarks() {
        return midMarks;
    }

    public int getEndMarks() {
        return endMarks;
    }
}