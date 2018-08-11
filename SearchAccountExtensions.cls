/**************************************************************************************************
 * Class : SearchAccountExtensions
 * Created By : Naman Rawat
 --------------------------------------------------------------------------------------------------
 * Description : The Class is being called in VFDay1Assignment1 VF Page as an extension and will
                display record from account, contact , lead and opportunity object based on the 
                search keyword which is being entered by user.

 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version    Developer Name    Date          Detail Features
   1.0        Naman Rawat       20/07/2018    Initial Development
   
 **************************************************************************************************/
public class SearchAccountExtensions {
    
    public SearchAccountExtensions(ApexPages.StandardController controller) {
            this();
    }
    public List<Account> accountList{get;set;}
    public Boolean renderTableAccount{get;set;}
    public List<Contact> contactList{get;set;}
    public Boolean renderTableContact{get;set;}
    public List<Lead> leadList{get;set;}
    public Boolean renderTableLead{get;set;}
    public List<Opportunity> opportunityList{get;set; }
    public Boolean renderTableOpportunity{get;set;}
    public String inputString{get;set;}
    
    public SearchAccountExtensions() {
    }
    /* Method will query on account, contact, lead and opportunity object and will display records 
     * based on the input given by user in search box   
     *
     * @param: NA
     *
     * @return: NA
     *
     */ 
    public void search() { 
            String AccountName =  inputString + '%' ; 
            accountList = [
                SELECT
                    Name
                FROM
                    Account
                WHERE
                    NAME LIKE :AccountName
                LIMIT 10
            ];  
             String ContactName =  inputString + '%' ; 
            contactList = [
                SELECT
                    FirstName,
                    LastName
                FROM
                    Contact
                WHERE
                    FirstName LIKE :ContactName OR LastName LIKE :ContactName
                LIMIT 10
            ];  
            
             String LeadName =  inputString + '%' ; 
            leadList = [
                SELECT
                    Name
                FROM
                    Lead
                WHERE
                    NAME LIKE :LeadName
                LIMIT 10
            ]; 
         String OpportunityName =  inputString + '%' ; 
            opportunityList = [
                SELECT
                    Name
                FROM
                    Opportunity
                WHERE
                    Name LIKE :OpportunityName
                LIMIT 10
            ]; 
            if(accountList.size() > 0) {
                renderTableAccount = true;
            }else {
                renderTableAccount =false;
            }
            if(contactList.size() > 0) {
                renderTableContact = true;
            }else {
                renderTableContact =false;
            }
            if(leadList.size() > 0) {
                renderTableLead = true;
            }else {
                renderTableLead =false;
            }
            if(opportunityList.size() > 0) {
                renderTableOpportunity = true;
            }else {
                renderTableOpportunity =false;
            }
    }
}