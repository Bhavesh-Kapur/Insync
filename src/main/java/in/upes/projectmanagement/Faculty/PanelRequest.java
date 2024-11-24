package in.upes.projectmanagement.Faculty;

public class PanelRequest {
    private int requestId; // Invite ID (common for both Panel and Mentor invites)
    private int teamId;    // Team ID (used for Mentor invites)
    private String teamName; // Team name (used for Mentor invites or as sender name for Panel)
    private String requestType; // Type of request (Panel or Mentor)

    // Constructor for Panel invite
    public PanelRequest(int requestId, String senderName, String requestType) {
        this.requestId = requestId;
        this.teamId = 0; // Default value for panel invites
        this.teamName = senderName;
        this.requestType = requestType;
    }

    // Constructor for Mentor invite
    public PanelRequest(int requestId, int teamId, String teamName, String requestType) {
        this.requestId = requestId;
        this.teamId = teamId;
        this.teamName = teamName;
        this.requestType = requestType;
    }

    // Getters and Setters
    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    @Override
    public String toString() {
        return "PanelRequest{" +
                "requestId=" + requestId +
                ", teamId=" + teamId +
                ", teamName='" + teamName + '\'' +
                ", requestType='" + requestType + '\'' +
                '}';
    }
}