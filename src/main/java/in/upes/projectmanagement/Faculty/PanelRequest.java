package in.upes.projectmanagement.Faculty;

public class PanelRequest {
    private int requestId;
    private String senderName;

    public PanelRequest(int requestId, String senderName) {
        this.requestId = requestId;
        this.senderName = senderName;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }
}