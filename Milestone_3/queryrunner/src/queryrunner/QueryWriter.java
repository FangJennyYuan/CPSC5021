package queryrunner;
import java.io.*;

public class QueryWriter
{
   public static String writeToCSV(String filename, String[] header, 
         String[][] results) throws FileNotFoundException
   {
      File file;
      boolean uniqueFilename = true;
      do
      {
         // Check if file already exists
         file = new File(filename);
         if (file.exists())
         {
            // If so, update filename so as not to overwrite existing file
            filename = MARKER + filename;
            uniqueFilename = false;
         }
         else
            uniqueFilename = true;
      } while (!uniqueFilename);
      PrintWriter outputFile = new PrintWriter(file);
      
      // Print column headers
      for (int i = 0; i < header.length; i++)
      {
         outputFile.print(header[i]);
         outputFile.print(DELIMITER);
      }
      outputFile.println();
      
      // Print query results
      for (int i = 0; i < results.length; i++)
      {  
         for (int j = 0; j < results[i].length; j++)
         {
            outputFile.print(results[i][j]);
            outputFile.print(DELIMITER);
         }
         outputFile.println();
      }
      outputFile.close();
      return filename;
   }
   
   public static String writeToCSV(String[] header, String[][] results) 
         throws FileNotFoundException
   {
      return writeToCSV(DEFAULT_FILENAME, header, results);
   }
   
   private static final String DELIMITER = ",";
   private static final String DEFAULT_FILENAME = "query_results.csv";
   private static final String MARKER = "-";
}