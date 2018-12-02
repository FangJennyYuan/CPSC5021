package queryrunner;
import java.io.*;

public class QueryWriter
{
   public static void writeToCSV(String filename, String[] header, 
         String[][] results) throws FileNotFoundException
   {
      File queryCSV = new File(filename);
      PrintWriter outputFile = new PrintWriter(queryCSV);
      
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
   }
   
   public static void writeToCSV(String[] header, String[][] results) 
         throws FileNotFoundException
   {
      writeToCSV(DEFAULT_CSV_FILENAME, header, results);
   }
   
   private static final String DELIMITER = ",";
   private static final String DEFAULT_CSV_FILENAME = "query.csv";
}