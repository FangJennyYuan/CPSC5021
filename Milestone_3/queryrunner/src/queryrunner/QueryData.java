/*
 * Restaurant Solutions (Group 2)
 * Celeste Broderick, Pabi Dhaliwal, Eric Nunn, Fang (Jenny) Yuan
 * CPSC 5021, Seattle University
 */
package queryrunner;

/**
 * The QueryData class stores information related to a query to be made
 * to the database. Small update made since last version to allow the name
 * of the query to be stored.
 *
 * @author mckeem
 */
public class QueryData
{
   QueryData()
   {
   }

   QueryData(String name, String query, String[] parms, boolean[] likeparms,
         boolean isAction, boolean isParm)
   {
      m_queryName = name;
      m_queryString = query;
      m_arrayParms = parms;
      m_arrayLikeParms = likeparms;
      m_isAction = isAction;
      m_isParms = isParm;
   }

   String getQueryName()
   {
      return m_queryName;
   }

   String GetQueryString()
   {
      return m_queryString;
   }

   int GetParmAmount()
   {
      if (m_arrayParms == null)
         return 0;
      else
         return m_arrayParms.length;
   }

   String GetParamText(int index)
   {
      return m_arrayParms[index];
   }

   boolean GetLikeParam(int index)
   {
      return m_arrayLikeParms[index];
   }

   boolean[] GetAllLikeParams()
   {
      return m_arrayLikeParms;
   }

   boolean IsQueryAction()
   {
      return m_isAction;
   }

   boolean IsQueryParm()
   {
      return m_isParms;
   }

   private String m_queryName;
   private String m_queryString;
   private String[] m_arrayParms;
   private boolean m_isAction;
   private boolean m_isParms;
   private boolean[] m_arrayLikeParms;
}
