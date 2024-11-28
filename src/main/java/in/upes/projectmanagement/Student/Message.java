package in.upes.projectmanagement.Student;

import com.google.protobuf.Timestamp;

public class Message {
    private int profId;
    private String message;
    private java.sql.Timestamp timestamp;

    public Message(int profId, String message, java.sql.Timestamp timestamp2) {
        this.profId = profId;
        this.message = message;
        this.timestamp = timestamp2;
    }

    public int getProfId() {
        return profId;
    }

    public String getMessage() {
        return message;
    }

    public java.sql.Timestamp getTimestamp() {
        return timestamp;
    }
}