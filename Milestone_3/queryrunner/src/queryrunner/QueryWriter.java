/*
 * Restaurant Solutions (Group 2)
 * Celeste Broderick, Pabi Dhaliwal, Eric Nunn, Fang (Jenny) Yuan
 * CPSC 5021, Seattle University
 */
package queryrunner;
import java.io.*;

/**
 * QueryWriter class provides static methods that can be used to export
 * query results to a csv file.
 * 
 * @author Restaurant Solutions:
 * Celeste Broderick, Pabi Dhaliwal, Eric Nunn, Fang (Jenny) Yuan
 */
public class QueryWriter
{
   /**
    * Static method that allows query results received from QueryRunner
    * to be exported to an external csv file.
    * 
    * @param filename The name of the csv file to be exported
    * @param header Array containing the column labels
    * @param results The query results.
    * @return The name of the file written.
    * @throws FileNotFoundException If the file is not found.
    */
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
   
   /**
    * Static method that allows query results received from QueryRunner
    * to be exported to an external csv file. This version of the overloaded
    * method uses the default filename for the csv file.
    * 
    * @param header Array containing the column labels
    * @param results The query results.
    * @return The name of the file written.
    * @throws FileNotFoundException If the file is not found.
    */
   public static String writeToCSV(String[] header, String[][] results) 
         throws FileNotFoundException
   {
      return writeToCSV(DEFAULT_FILENAME, header, results);
   }
   
   private static final String DELIMITER = ","; // separator used in csv
   private static final String DEFAULT_FILENAME = "query_results.csv";
      // default filename
   private static final String MARKER = "-";
      // punctuation to add to filename if a file with the same name is found
}