/**************************************************************************************************
 * Class : PagingDemoWithAlphabets
 * Created By : Naman Rawat
 --------------------------------------------------------------------------------------------------
 * Description : The Class is being called in VFDay2Assignment2 VF Page as an extension and will
                display contact records along with a delete link to delete record using VFRemoting .

 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version    Developer Name    Date          Detail Features
   1.0        Naman Rawat       20/07/2018    Initial Development
   
 **************************************************************************************************/
public class PagingDemoWithAlpabets 
{
 public PagingDemoWithAlpabets (ApexPages.StandardController controller) {
            this();
    }
    public List<String> searchAlphabet{get;set;}
    public String searchVariable{get;set;}
    public list<contact> con{set;get;}
    public list<contact> showContact{set;get;}
    public Integer size{get;set;}
    public PagingDemoWithAlphabets() 
    { 
        searchAlphabet=new List<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
        con=new List<Contact>();
        con=[SELECT Name,MobilePhone FROM Contact ORDER BY Name];
        searchVariable='All';
        showContact=new List<Contact>();
        for(Contact c:con)
        {
            if(searchVariable.equals('All'))
                showContact.add(c);
            else 
                if(c.Name.startsWith(searchVariable.toLowerCase())||c.Name.startsWith(searchVariable))
                showContact.add(c);
        }
        size=showContact.size(); 
    }
    public PageReference display() 
    {
        System.debug('searchVariable'+searchVariable);
        showContact.clear();
        for(Contact c:con)
        {
            if(searchVariable.equals('All'))
                showContact.add(c);
            else
                if(c.Name.startsWith(searchVariable.toLowerCase())||c.Name.startsWith(searchVariable))
                {
                   showContact.add(c);
                   system.debug('if C'+c);
                }   
        }
        size=showContact.size(); 
        return null;
    }    
    @RemoteAction
    public static Boolean deleteContact(String contactId) {
        Contact contactRecord = [
            SELECT  
                id
            FROM
                Contact
            WHERE 
                id = :contactId
        ];
        Database.DeleteResult deleteResult = Database.delete(contactRecord);
        return deleteResult.isSuccess();
    }
}