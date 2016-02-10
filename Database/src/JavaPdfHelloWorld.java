import java.io.FileNotFoundException;
import java.io.FileOutputStream;
 






import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.TruckRental.dao.ConnectionClass;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
 
public class JavaPdfHelloWorld
{
   public static void main(String[] args)
   {
	   Font blueFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL, new CMYKColor(255, 0, 0, 0));
	   Font redFont = FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD, new CMYKColor(0, 255, 0, 0));
	   Font yellowFont = FontFactory.getFont(FontFactory.COURIER, 14, Font.BOLD, new CMYKColor(0, 0, 255, 0));
      Document document = new Document();
      try
      {
    	  Connection conn =ConnectionClass.OpenConnection();
    	  PreparedStatement pstmt=conn.prepareStatement("");
         PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("HelloWorld.pdf"));
         document.open();
         Paragraph chapterTitle = new Paragraph("Truck Rent Reciept", redFont);
         chapterTitle.setAlignment(Element.ALIGN_CENTER);
         document.add(new Chunk(new LineSeparator()));
         document.add(new Paragraph("A Hello World PDF document."));
         document.add(new Chunk("A Hello World PDF document."));
         document.close();
         writer.close();
      } catch (DocumentException e)
      {
         e.printStackTrace();
      } catch (FileNotFoundException e)
      {
         e.printStackTrace();
      } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
}