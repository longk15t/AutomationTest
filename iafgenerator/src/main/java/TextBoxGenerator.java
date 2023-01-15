import com.microsoft.schemas.office.word.STWrapType;
import com.microsoft.schemas.vml.CTGroup;
import com.microsoft.schemas.vml.CTRect;
import com.microsoft.schemas.vml.CTShape;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;
import org.w3c.dom.Node;

import java.io.FileOutputStream;
import java.math.BigInteger;

public class TextBoxGenerator {

    static String cTAbstractNumBulletXML =
            "<w:abstractNum xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\" w:abstractNumId=\"0\">"
                    + "<w:multiLevelType w:val=\"hybridMultilevel\"/>"
                    + "<w:lvl w:ilvl=\"0\" w:tentative=\"1\"><w:start w:val=\"1\"/><w:numFmt w:val=\"bullet\"/><w:lvlText w:val=\"\u2013\"/><w:lvlJc w:val=\"left\"/><w:pPr><w:ind w:left=\"720\" w:hanging=\"360\"/></w:pPr><w:rPr><w:rFonts w:ascii=\"Courier New\" w:hAnsi=\"Courier New\" w:cs=\"Courier New\" w:hint=\"default\"/></w:rPr></w:lvl>"
                    + "<w:lvl w:ilvl=\"1\"><w:start w:val=\"1\"/><w:numFmt w:val=\"bullet\"/><w:lvlText w:val=\"\uF06E\"/><w:lvlJc w:val=\"left\"/><w:pPr><w:ind w:left=\"1440\" w:hanging=\"360\"/></w:pPr><w:rPr><w:rFonts w:ascii=\"Wingdings\" w:hAnsi=\"Wingdings\" w:hint=\"default\"/></w:rPr></w:lvl>"
                    + "<w:lvl w:ilvl=\"2\" w:tentative=\"1\"><w:start w:val=\"1\"/><w:numFmt w:val=\"bullet\"/><w:lvlText w:val=\"\u26Ac\"/><w:lvlJc w:val=\"left\"/><w:pPr><w:ind w:left=\"2160\" w:hanging=\"360\"/></w:pPr><w:rPr><w:rFonts w:ascii=\"Courier New\" w:hAnsi=\"Courier New\" w:hint=\"default\"/></w:rPr></w:lvl>"
                    + "</w:abstractNum>";

    public static void main(String[] args) throws Exception {

        String textBoxWidth = "530pt";
        String textBoxHeight = "150pt";

        XWPFDocument doc = new XWPFDocument();
        CTSectPr sectPr = doc.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar = sectPr.addNewPgMar();
        pageMar.setLeft(BigInteger.valueOf(750L));
        pageMar.setTop(BigInteger.valueOf(1440L));
        pageMar.setRight(BigInteger.valueOf(750L));
        pageMar.setBottom(BigInteger.valueOf(1440L));

        XWPFParagraph paragraph = doc.createParagraph();
        XWPFRun run = paragraph.createRun();
        run.setText("The Body text on top of below textbox ");
        run.addBreak();

        CTGroup ctGroup = CTGroup.Factory.newInstance();

        CTRect ctRect = ctGroup.addNewRect();
        ctRect.addNewWrap().setType(STWrapType.SQUARE);
        ctRect.setStyle("position:absolute"
                        + ";width:" + textBoxWidth
                        + ";height:" + textBoxHeight
                        + ";left:0;text-align:left;margin-left:.8pt;margin-top:23.2pt"
        );

        CTTxbxContent ctTxbxContent = ctRect.addNewTextbox().addNewTxbxContent();

        CTNumbering cTNumbering = CTNumbering.Factory.parse(cTAbstractNumBulletXML);
        CTAbstractNum cTAbstractNum = cTNumbering.getAbstractNumArray(0);
        XWPFAbstractNum abstractNum = new XWPFAbstractNum(cTAbstractNum);
        XWPFNumbering numbering = doc.createNumbering();
        BigInteger abstractNumID = numbering.addAbstractNum(abstractNum);
        BigInteger numID = numbering.addNum(abstractNumID);

        ctTxbxContent.addNewP().addNewR().addNewT().setStringValue(" -  Lorem ipsam et justo duo dolores a sanctus est Lorem ipsum dolor sit amet.");
        ctTxbxContent.addNewP().addNewR().addNewT().setStringValue(" -  Simply dummy text of the printingndustry. Lthe 1500s, when an unknown printer took a galley of type and scrambled it to make a type specim");
        ctTxbxContent.addNewP().addNewR().addNewT().setStringValue(" -  It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.");
        ctTxbxContent.addNewP().addNewR().addNewT().setStringValue(" -  There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable");

        Node ctGroupNode = ctGroup.getDomNode();
        CTPicture ctPicture = CTPicture.Factory.parse(ctGroupNode);
        run = paragraph.createRun();
        CTR cTR = run.getCTR();
        cTR.addNewPict();
        cTR.setPictArray(0, ctPicture);
        run.addBreak();

        run = paragraph.createRun();
        run.setText("The Body text under above textbox ");
        run.addBreak();

        FileOutputStream out = new FileOutputStream("WordTextBox.docx");
        doc.write(out);
        out.close();
    }
}
