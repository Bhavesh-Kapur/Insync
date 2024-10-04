package com.project.chatbox;

public class Message {
    private String userId;
    private String teamId;
    private String message;

    public Message(String userId, String teamId, String message) {
        this.userId = userId;
        this.teamId = teamId;
        this.message = message;
    }

    // Getter and Setter methods
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
