import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTPageMar;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSectPr;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class IAFGenerator {
    public static String logo = "logo_cap.png";
    public static String output = "IAF.docx";

    public static void main(String[] args) throws IOException, InvalidFormatException, URISyntaxException {

        XWPFDocument document = new XWPFDocument();

        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(750L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(750L));
        pageMar.setBottom(BigInteger.valueOf(1440L));

        XWPFParagraph image = document.createParagraph();
        image.setAlignment(ParagraphAlignment.LEFT);
        XWPFRun imageRun = image.createRun();
        imageRun.setTextPosition(20);
        Path imagePath = Paths.get(ClassLoader.getSystemResource(logo).toURI());
        imageRun.addPicture(Files.newInputStream(imagePath),
                XWPFDocument.PICTURE_TYPE_PNG, imagePath.getFileName().toString(),
                Units.toEMU(200), Units.toEMU(50)
        );

        XWPFParagraph title = document.createParagraph();
        title.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun run = title.createRun();
        run.setText("Capgemini FS GBU\n");
        run.addBreak();
        run.setText("Interview Evaluation Form for Software Professionals\n");
        run.addBreak();
        run.setText("(To be filled by technical panel)\n");
        run.setBold(true);
        run.setFontFamily("Calibri");
        run.setFontSize(10);

        XWPFParagraph info = document.createParagraph();
        info.setAlignment(ParagraphAlignment.LEFT);
        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("Note: ");
        run.setBold(true);
        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("Fields marked with * are mandatory");
        run.addBreak(); run.addBreak();

        //Interview Mode
        run.setText("Interview Mode:  ");
        run.setText("[ ] Walk-in");
        run.addTab();
        run.setText("[ ] In Person");
        run.addTab();
        run.setText("[ ] Telephonic");
        run.addTab();
        run.setText("[ ] Webcam");
        run.addTab();
        run.setText("[X] Video Conferencing");
        run.addBreak(); run.addBreak();

        //Interview Round
        run.setText("Interview Round: ");
        run.setText("[X] L1 Interview");
        run.addTab();
        run.setText("[ ] L2 Interview");
        run.addTab();
        run.setText("[ ] L3 Interview");
        run.addTab();
        run.setText("Interview Date     ");
        run.setText("Dec 28, 2022");
        run.addBreak(); run.addBreak();

        //Position + Location
        run.setText("Position Applied For   ");
        run.setText("Automation Tester");
        run.addTab(); run.addTab(); run.addTab(); run.addTab();
        run.setText("Interview Location ");
        run.setText("Conference From Home");
        run.addBreak(); run.addBreak();

        //Candidate name
        run.setText("Candidate Full Name   ");
        run.setText("TRAN HOANG LONG");
        run.addTab(); run.addTab(); run.addTab(); run.addTab();
        run.setText("Referred by       ");
        run.setText("");
        run.addBreak(); run.addBreak();

        //Interview full panel
        run.setText("Interview Full Panel  ");
        run.setText("Hien LE, Duc NGUYEN, Long TRAN");
        run.addTab(); run.addTab();
        run.setText("Panel Designation ");
        run.setText("SM, M, SC");
        run.addBreak(); run.addBreak();

        //Interview full panel
        run.setText("Recruiter     ");
        run.setText("Yen, NGUYEN");
        run.addBreak(); run.addBreak();

        //Skills Assessment header
        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("TECHNICAL SKILLS CAPABILITIES RATING (e.g. 1 - Low, 5 - High)");
        run.addTab();
        run.setText("PERSONALITY ASSESSMENT RATING (e.g. 1 - Low, 5 - High)");
        run.setBold(true);
        run.addBreak(); run.addBreak();

        //Skill List
        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("Java");
        run.addTab(); run.addTab(); run.addTab();
        run.setText("[ ] 1 [ ] 2 [ ] 3 [X] 4 [ ] 5 [ ] NA");
        run.addTab(); run.addTab();

        run.setText("Communication ");
        run.addTab(); run.addTab();
        run.setText("[ ] 1 [ ] 2 [ ] 3 [X] 4 [ ] 5 [ ] NA");
        run.addBreak(); run.addBreak();

        run.setText("Manual testing");
        run.addTab(); run.addTab();
        run.setText("[ ] 1 [X] 2 [ ] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addTab(); run.addTab();

        run.setText("Comprehensive Clarity ");
        run.addTab();
        run.setText("[ ] 1 [ ] 2 [ ] 3 [X] 4 [ ] 5 [ ] NA");
        run.addBreak(); run.addBreak();

        run.setText("Automation testing");
        run.addTab();
        run.setText("[ ] 1 [ ] 2 [X] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addTab(); run.addTab();

        run.setText("Initiative / Drive");
        run.addTab(); run.addTab();
        run.setText("[ ] 1 [ ] 2 [X] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addBreak(); run.addBreak();

        run.setText("English Communication");
        run.addTab();
        run.setText("[X] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addTab(); run.addTab();

        run.setText("Business Manners");
        run.addTab();
        run.setText("[ ] 1 [ ] 2 [ ] 3 [ ] 4 [X] 5 [ ] NA");
        run.addBreak(); run.addBreak();

        run.setText("BDD");
        run.addTab(); run.addTab(); run.addTab();
        run.setText("[ ] 1 [X] 2 [ ] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addTab(); run.addTab();

        run.setText("Flexibility / Openness");
        run.addTab();
        run.setText("[ ] 1 [ ] 2 [X] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addBreak(); run.addBreak();

        run.setText("Performance testing");
        run.addTab();
        run.setText("[X] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addTab(); run.addTab();

        run.setText("People Management");
        run.addTab();
        run.setText("[X] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5 [ ] NA");
        run.addBreak(); run.addBreak();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setBold(true);
        run.setText("Strength (This field is mandatory regardless of decision or status)");
        run.addBreak(); run.addBreak(); run.addBreak();

        run.setText("Area of Concern (This field is mandatory regardless of decision or status)");
        run.addBreak(); run.addBreak(); run.addBreak();

        run.setText("Additional Information (This field is mandatory regardless of decision or status)");
        run.addBreak(); run.addBreak(); run.addBreak();

        run.setText("Panel Recommendation:");
        run.addBreak();
        run.setText("Decision");
        run.addTab(); run.addTab(); run.addTab();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("[X] Offer"); run.addTab(); run.addTab(); run.setText("[ ] Reject"); run.addTab(); run.addTab(); run.setText("[ ] Hold"); run.addTab(); run.addTab(); run.setText("[ ] Next Round");
        run.addBreak(); run.addBreak();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setBold(true);
        run.setText("Candidate Offered Designation");
        run.addBreak(); run.addBreak();

        run.setText("Candidate Offered Role");
        run.addBreak(); run.addBreak();

        run.setText("Entry Level");
        run.addTab(); run.addTab();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("[ ] High"); run.addTab(); run.addTab(); run.setText("[X] Medium"); run.addTab(); run.addTab(); run.setText("[ ] Entry");
        run.addBreak(); run.addBreak();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setBold(true);
        run.setText("Overall Rating");
        run.addTab(); run.addTab();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setText("[ ] Outstanding"); run.addTab(); run.setText("[ ] Above Average"); run.addTab(); run.addTab(); run.setText("[X] Average"); run.addTab(); run.setText("[ ] Below Average or satisfactory");
        run.addBreak(); run.addBreak();

        run = info.createRun();
        run.setFontSize(10);
        run.setFontFamily("Calibri");
        run.setBold(true);
        run.setText("Offer Letter Details");
        run.addBreak(); run.addBreak();
        run.setText("[X] I confirm that there have been no other commitments or promises made during the hiring process such as onsite opportunity, promotion and salary hike within specified time frame by anyone involved in the hiring process.");
        run.addBreak(); run.addBreak();
        run.setText("[ ]  I confirm that there have been the following commitments or promises made during the hiring process.");
        run.addBreak(); run.addBreak(); run.addBreak(); run.addBreak(); run.addBreak(); run.addBreak();

        run.setText("Panel Signature");



        FileOutputStream out = new FileOutputStream(output);
        document.write(out);
        out.close();
        document.close();
    }
}
