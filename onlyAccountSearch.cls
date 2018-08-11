/**************************************************************************************************
 * Class : onlyAccountSearch
 * Created By : Naman Rawat
 --------------------------------------------------------------------------------------------------
 * Description : The Class is being called in VFDay2Assignment1 VF Page as an extension and will
                display account records based on the search keyword entered by the user.

 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version    Developer Name    Date          Detail Features
   1.0        Naman Rawat       20/07/2018    Initial Development
   
 **************************************************************************************************/
    public class onlyAccountSearch{
        public onlyAccountSearch(ApexPages.StandardController controller) {
                this();
        }
        public List<Account> accountList{ get;set; }
        public String inputString{get;set;}
        public Boolean renderTableAccount{get;set;}
        public Boolean renderMessage{get;set;}
        public String message{get;set;}
        /**
            This is constructor of extension which initialize initial rendering of Account Table.
        */
        public onlyAccountSearch() {
            renderTableAccount = false;
            inputString = ApexPages.currentPage().getParameters().get('input');
            String AccName =  inputString + '%' ; 
                accountList = [
                    SELECT
                        Name,
                        Phone,
                        Website,
                        Active__c
                    FROM
                        Account
                    WHERE
                        NAME LIKE :AccName
                    LIMIT 100
                ];
        }
        /* Method will query on account object and will display records based on the input 
        * given by user in search box   
        *
        * @param: NA
        *
        * @return: NA
        *
        */ 
        public void search() { 
            if(inputString.length() < 3 ) {
                message = 'Input at least 3 characters to perform search';
                renderMessage = true;
                renderTableAccount = false;
            } else {
                String AccName =  inputString + '%' ; 
                accountList = [
                    SELECT
                        Name,
                        Phone,
                        Website,
                        Active__c
                    FROM
                        Account
                    WHERE
                        NAME LIKE :AccName
                    LIMIT 1000
                ];  
                message = accountList.size() + ' accounts found.';
                renderTableAccount = true;
                renderMessage = true;
            }
        }
        /* Method will clear all the search record and will display a success message 
        *
        * @param: NA
        *
        * @return: NA
        *
        */ 
        public void clear() {
        renderTableAccount = false;
        message = 'Result Cleared';        
        }
    }