import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTAbstractNum;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTNumbering;

import java.io.FileOutputStream;
import java.math.BigInteger;

public class WordWithBulletList {
    static String cTAbstractNumBulletXML =
            "<w:abstractNum xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\" w:abstractNumId=\"0\">"
                    + "<w:multiLevelType w:val=\"hybridMultilevel\"/>"
                    + "<w:lvl w:ilvl=\"0\" w:tentative=\"1\"><w:start w:val=\"1\"/><w:numFmt w:val=\"bullet\"/><w:lvlText w:val=\"\u2013\"/><w:lvlJc w:val=\"left\"/><w:pPr><w:ind w:left=\"720\" w:hanging=\"360\"/></w:pPr><w:rPr><w:rFonts w:ascii=\"Courier New\" w:hAnsi=\"Courier New\" w:cs=\"Courier New\" w:hint=\"default\"/></w:rPr></w:lvl>"
                    + "<w:lvl w:ilvl=\"1\"><w:start w:val=\"1\"/><w:numFmt w:val=\"bullet\"/><w:lvlText w:val=\"\uF06E\"/><w:lvlJc w:val=\"left\"/><w:pPr><w:ind w:left=\"1440\" w:hanging=\"360\"/></w:pPr><w:rPr><w:rFonts w:ascii=\"Wingdings\" w:hAnsi=\"Wingdings\" w:hint=\"default\"/></w:rPr></w:lvl>"
                    + "<w:lvl w:ilvl=\"2\" w:tentative=\"1\"><w:start w:val=\"1\"/><w:numFmt w:val=\"bullet\"/><w:lvlText w:val=\"\u26Ac\"/><w:lvlJc w:val=\"left\"/><w:pPr><w:ind w:left=\"2160\" w:hanging=\"360\"/></w:pPr><w:rPr><w:rFonts w:ascii=\"Courier New\" w:hAnsi=\"Courier New\" w:hint=\"default\"/></w:rPr></w:lvl>"
                    + "</w:abstractNum>";

    public static void main(String[] args) throws Exception {

        XWPFDocument document = new XWPFDocument();

        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun run=paragraph.createRun();
        run.setText("The List:");

        CTNumbering cTNumbering = CTNumbering.Factory.parse(cTAbstractNumBulletXML);

        CTAbstractNum cTAbstractNum = cTNumbering.getAbstractNumArray(0);

        XWPFAbstractNum abstractNum = new XWPFAbstractNum(cTAbstractNum);

        XWPFNumbering numbering = document.createNumbering();

        BigInteger abstractNumID = numbering.addAbstractNum(abstractNum);

        BigInteger numID = numbering.addNum(abstractNumID);

        for (int i = 0; i < 5; i++) {
            paragraph = document.createParagraph();
            paragraph.setNumID(numID);
            run = paragraph.createRun();
            run.setText("List item " + (i+1));
//            if (i < 4) paragraph.setSpacingAfter(0);
//            if (i == 0) {
//                for (int j = 0; j < 2; j++) {
//                    paragraph = document.createParagraph();
//                    paragraph.setNumID(numID);
//                    paragraph.getCTP().getPPr().getNumPr().addNewIlvl().setVal(BigInteger.valueOf(0));
//                    run = paragraph.createRun();
//                    run.setText("Sub list item " + (i+1) + " " + (char)(97+j));
//                    paragraph.setSpacingAfter(0);
//                }
//            }
//            if (i == 1 || i == 3) {
//                paragraph = document.createParagraph();
//                paragraph.setNumID(numID);
//                paragraph.getCTP().getPPr().getNumPr().addNewIlvl().setVal(BigInteger.valueOf(1));
//                run = paragraph.createRun();
//                run.setText("Sub list item " + (i+1) + " a");
//                paragraph.setSpacingAfter(0);
//            }
        }

        paragraph = document.createParagraph();
        run=paragraph.createRun();
        run.setText("Paragraph after the list.");

        FileOutputStream out = new FileOutputStream("CreateWordBulletOrDecimalList.docx");
        document.write(out);
        out.close();
        document.close();

        System.out.println("CreateWordBulletOrDecimalList written successully");
    }
}
