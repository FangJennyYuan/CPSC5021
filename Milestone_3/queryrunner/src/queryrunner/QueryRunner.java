/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package queryrunner;

//Testing branch

import java.util.ArrayList;
import java.util.Scanner;

/**
 * 
 * QueryRunner takes a list of Queries that are initialized in it's constructor
 * and provides functions that will call the various functions in the QueryJDBC class 
 * which will enable MYSQL queries to be executed. It also has functions to provide the
 * returned data from the Queries. Currently the eventHandlers in QueryFrame call these
 * functions in order to run the Queries.
 */
public class QueryRunner {

    
    public QueryRunner()
    {
        this.m_jdbcData = new QueryJDBC();
        m_updateAmount = 0;
        m_queryArray = new ArrayList<>();
        m_error="";
        
        
        // TODO - You will need to change the queries below to match your queries.
        
        // You will need to put your Project Application in the below variable
        
        this.m_projectTeamApplication="CITYELECTION";    // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        
        // Each row that is added to m_queryArray is a separate query. It does not work on Stored procedure calls.
        // The 'new' Java keyword is a way of initializing the data that will be added to QueryArray. Please do not change
        // Format for each row of m_queryArray is: (QueryText, ParamaterLabelArray[], LikeParameterArray[], IsItActionQuery, IsItParameterQuery)
        
        //    QueryText is a String that represents your query. It can be anything but Stored Procedure
        //    Parameter Label Array  (e.g. Put in null if there is no Parameters in your query, otherwise put in the Parameter Names)
        //    LikeParameter Array  is an array I regret having to add, but it is necessary to tell QueryRunner which parameter has a LIKE Clause. If you have no parameters, put in null. Otherwise put in false for parameters that don't use 'like' and true for ones that do.
        //    IsItActionQuery (e.g. Mark it true if it is, otherwise false)
        //    IsItParameterQuery (e.g.Mark it true if it is, otherwise false)
        
        m_queryArray.add(new QueryData("Select e.Employee_Last_Name as Last, \n" + 
        								"e.Employee_First_Name as First, \r\n" + 
        								"SUM((UNIX_TIMESTAMP(es.Clock_out) - UNIX_TIMESTAMP(es.Clock_in)) / 3600.0) as Hours \r\n" + 
						        		"FROM Employee e\r\n" + 
						        		"JOIN Employee_Schedule es\r\n" + 
						        		"ON e.Employee_ID = es.Employee_ID\r\n" + 
						        		"JOIN Employee_Role er\r\n" + 
						        		"ON e.Employee_ID = er.Employee_ID\r\n" + 
						        		"WHERE es.Restaurant_Schedule_ID = 14\r\n" + 
						        		"GROUP BY e.Employee_ID", null, null, false, false));   // Query 13
        m_queryArray.add(new QueryData("call mm_sttest2b.Receipts(?)",new String [] {"TABLE_ID"}, new boolean [] {false}, false, true));   // Receipt Procedure 
        
        m_queryArray.add(new QueryData("INSERT INTO Customer(Customer_Name, Customer_Phone_Number, Customer_Email)\n" + 
				   "VALUES (?,?,?);", new String[] {"Customer_Name", "Customer_Phone_Number", "Customer_Email"}, null, true, true)); // Eric testing
        
        //m_queryArray.add(new QueryData("Select * from contact where contact_id=?", new String [] {"CONTACT_ID"}, new boolean [] {false},  false, true));        // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        //m_queryArray.add(new QueryData("Select * from contact where contact_name like ?", new String [] {"CONTACT_NAME"}, new boolean [] {true}, false, true));        // THIS NEEDS TO CHANGE FOR YOUR APPLICATION
        //m_queryArray.add(new QueryData("insert into contact (contact_id, contact_name, contact_salary) values (?,?,?)",new String [] {"CONTACT_ID", "CONTACT_NAME", "CONTACT_SALARY"}, new boolean [] {false, false, false}, true, true));// THIS NEEDS TO CHANGE FOR YOUR APPLICATION
                       
    }
       

    public int GetTotalQueries()
    {
        return m_queryArray.size();
    }
    
    public int GetParameterAmtForQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetParmAmount();
    }
              
    public String  GetParamText(int queryChoice, int parmnum )
    {
       QueryData e=m_queryArray.get(queryChoice);        
       return e.GetParamText(parmnum); 
    }   

    public String GetQueryText(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetQueryString();        
    }
    
    /**
     * Function will return how many rows were updated as a result
     * of the update query
     * @return Returns how many rows were updated
     */
    
    public int GetUpdateAmount()
    {
        return m_updateAmount;
    }
    
    /**
     * Function will return ALL of the Column Headers from the query
     * @return Returns array of column headers
     */
    public String [] GetQueryHeaders()
    {
        return m_jdbcData.GetHeaders();
    }
    
    /**
     * After the query has been run, all of the data has been captured into
     * a multi-dimensional string array which contains all the row's. For each
     * row it also has all the column data. It is in string format
     * @return multi-dimensional array of String data based on the resultset 
     * from the query
     */
    public String[][] GetQueryData()
    {
        return m_jdbcData.GetData();
    }

    public String GetProjectTeamApplication()
    {
        return m_projectTeamApplication;        
    }
    public boolean  isActionQuery (int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryAction();
    }
    
    public boolean isParameterQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryParm();
    }
    
     
    public boolean ExecuteQuery(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteQuery(e.GetQueryString(), parms, e.GetAllLikeParams());
        return bOK;
    }
    
     public boolean ExecuteUpdate(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteUpdate(e.GetQueryString(), parms);
        m_updateAmount = m_jdbcData.GetUpdateCount();
        return bOK;
    }   
    
      
    public boolean Connect(String szHost, String szUser, String szPass, String szDatabase)
    {

        boolean bConnect = m_jdbcData.ConnectToDatabase(szHost, szUser, szPass, szDatabase);
        if (bConnect == false)
            m_error = m_jdbcData.GetError();        
        return bConnect;
    }
    
    public boolean Disconnect()
    {
        // Disconnect the JDBCData Object
        boolean bConnect = m_jdbcData.CloseDatabase();
        if (bConnect == false)
            m_error = m_jdbcData.GetError();
        return true;
    }
    
    public String GetError()
    {
        return m_error;
    }
 
    private QueryJDBC m_jdbcData;
    private String m_error;    
    private String m_projectTeamApplication;
    private ArrayList<QueryData> m_queryArray;  
    private int m_updateAmount;
            
    /**
     * @param args the command line arguments
     */
    
    // Console App will Connect to Database
    // It will run a single select query without Parameters
    // It will display the results
    // It will close the database session
    
    public static void main(String[] args) {
        // TODO code application logic here

        final QueryRunner queryrunner = new QueryRunner();
        
        if (args.length == 0)
        {
            java.awt.EventQueue.invokeLater(new Runnable() {
                public void run() {

                    new QueryFrame(queryrunner).setVisible(true);
                }            
            });
        }
        else
        {
            if (args[0].equals("-console"))
            {
                // TODO 
                // You should code the following functionality:

                //    You need to determine if it is a parameter query. If it is, then
                //    you will need to ask the user to put in the values for the Parameters in your query
                //    you will then call ExecuteQuery or ExecuteUpdate (depending on whether it is an action query or regular query)
                //    if it is a regular query, you should then get the data by calling GetQueryData. You should then display this
                //    output. 
                //    If it is an action query, you will tell how many row's were affected by it.
                // 
                //    This is Psuedo Code for the task:  
                //    Connect()
                //    n = GetTotalQueries()
                //    for (i=0;i < n; i++)
                //    {
                //       Is it a query that Has Parameters
                //       Then
                //           amt = find out how many parameters it has
                //           Create a paramter array of strings for that amount
                //           for (j=0; j< amt; j++)
                //              Get The Paramater Label for Query and print it to console. Ask the user to enter a value
                //              Take the value you got and put it into your parameter array
                //           If it is an Action Query then
                //              call ExecuteUpdate to run the Query
                //              call GetUpdateAmount to find out how many rows were affected, and print that value
                //           else
                //               call ExecuteQuery 
                //               call GetQueryData to get the results back
                //               print out all the results
                //           end if
                //      }
                //    Disconnect()


                // NOTE - IF THERE ARE ANY ERRORS, please print the Error output
                // NOTE - The QueryRunner functions call the various JDBC Functions that are in QueryJDBC. If you would rather code JDBC
                // functions directly, you can choose to do that. It will be harder, but that is your option.
                // NOTE - You can look at the QueryRunner API calls that are in QueryFrame.java for assistance. You should not have to 
                //    alter any code in QueryJDBC, QueryData, or QueryFrame to make this work.

            	
            	System.out.print("Please enter the Host Name: ");
            	Scanner input = new Scanner(System.in);
            	String hostName = input.nextLine();
            	System.out.print("Please enter the User Name: ");
            	String username = input.nextLine();
            	System.out.print("Please enter the Password Name: ");
            	String password = input.nextLine();
            	System.out.print("Please enter the Database Name: ");
            	String database = input.nextLine();
            	
            	
            	hostName = "cssql.seattleu.edu";
            	username = "mm_sttest2b";
            	password = "mm_sttest2bPass";
            	database = "mm_sttest2b";
				
            	/*
            	hostName = "127.0.0.1";
            	username = "test";
            	password = "test";
            	database = "mm_sttest2b";
            	*/
            	
            	boolean validate = queryrunner.Connect(hostName, username, password, database);
            	
            	if (validate) {
            		
            		System.out.println("You are loged in!\n");
            	}
            	else {
            		String error = queryrunner.GetError();
            		System.out.print("Returned an error " + error);
            		return;
            		//System.out.println("Do you want to try again? ");
            		
            	}
            	
            	int n = queryrunner.GetTotalQueries();
            	for (int i =0; i<n; i++) {
            		String [] parmArray={};
            		boolean isParameterQuery = queryrunner.isParameterQuery(i);
            		boolean execute = false;
            		boolean isActionQuery = queryrunner.isActionQuery(i);
            		if (isParameterQuery) {
            			//System.out.println("Parameter Query: ");
            			int paramAmount = queryrunner.GetParameterAmtForQuery(i);
            			parmArray = new String[paramAmount];
            			for (int k = 0; k < paramAmount ; k++) {
            				System.out.print(queryrunner.GetParamText(i, k) + ": ");
            				String parmval = input.nextLine();
            				parmArray[k] = parmval.trim();
            			}
            		}else {
            			System.out.println("This is a non paramter query");
            		}
            		if (isActionQuery) {
            			execute = queryrunner.ExecuteUpdate(i, parmArray);
            			if (execute) {
            				System.out.println("Rows affected = " + queryrunner.GetUpdateAmount());
            			}
            			else {
            				String error = queryrunner.GetError();
                    		System.out.print("Returned an error " + error);
            			}
            		}else {
            			execute = queryrunner.ExecuteQuery(i, parmArray);
            			if (execute){
            				String dataHeader[] = queryrunner.GetQueryHeaders();
            				String data[][] = queryrunner.GetQueryData();
            				System.out.println("The result of Query " + (i+1) + ": ");
            				
            				for (int j=0; j<dataHeader.length; j++) {
            					System.out.printf("%-20s", dataHeader[j]);
            				}
            				
            				System.out.println();
            				
            				for (int row=0; row<data.length; row++) {
            					for (int col=0; col<dataHeader.length; col++) {
            						System.out.printf("%-20s", data[row][col]);
            					}
            					System.out.println();
            				}
            				
            				System.out.println();
            			}else {
        				String error = queryrunner.GetError();
                		System.out.print("Returned an error " + error);
            			}
            		}
            		
            	}
            	
            	System.out.println();
            	validate = queryrunner.Disconnect();
            	if (validate) {
            		System.out.println("You have disconnected from " + database);
            	}else {
            		String error = queryrunner.GetError();
            		System.out.print("Returned an error " + error);
            		return;
            	}
            	
            	
            }
            else
            {
               System.out.println("usage: you must use -console as your argument to get non-gui functionality. If you leave it out it will be GUI");
            }
        }

    }    
}