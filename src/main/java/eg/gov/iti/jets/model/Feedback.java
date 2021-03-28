package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "FEEDBACK")
@Getter
@Setter
@NoArgsConstructor
public class Feedback implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "FEEDBACK_ID")
    private int feedbackId;

    @Column(name = "SENDER_NAME")
    private String senderName;

    @Column(name = "SENDER_EMAIL")
    private String senderEmail;

    @Column(name = "FEEDBACK_SUBJECT")
    private String subject;

    @Column(name = "FEEDBACK_MESSAGE")
    private String message;


}
