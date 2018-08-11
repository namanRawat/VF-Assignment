/**************************************************************************************************
 * Class : SearchAccountExtensions1
 * Created By : Naman Rawat
 --------------------------------------------------------------------------------------------------
 * Description : The Class is being called in VFDay1Assignment2 VF Page as an extension and will
                display record from account and also clicking on the name of the account it will
                display the associated contact record

 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version    Developer Name    Date          Detail Features
   1.0        Naman Rawat       20/07/2018    Initial Development
   
 **************************************************************************************************/
public class SearchAccountExtensions1 {

    public SearchAccountExtensions1(ApexPages.StandardController controller) {
            this();
    }

    public List<Account> accountList{ get;set; }
    public String inputString{get;set;}
    public Boolean renderTable{get;set;}

    /**
        This is constructor of extension which initialize initial rendering of Account Table.
     */
    public SearchAccountExtensions1() {
        renderTable = true;
        inputString = ApexPages.currentPage().getParameters().get('input');
        if( inputString == null ) {
            accountList = [
                SELECT
                    Name,
                    Phone,
                    BillingStreet, BillingCity, BillingState, BillingPostalCode,BillingCountry
                FROM
                    Account
                LIMIT 100
            ];
        } else {
            String AccName =  inputString + '%' ; 
            accountList = [
                SELECT
                    Name,
                    Phone,
                   BillingStreet, BillingCity, BillingState, BillingPostalCode,BillingCountry
                FROM
                    Account
                WHERE
                    NAME LIKE :AccName
                LIMIT 100
            ];
        }
        
    }
}