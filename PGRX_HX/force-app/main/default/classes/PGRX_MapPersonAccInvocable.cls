public class PGRX_MapPersonAccInvocable {
	@InvocableMethod(label='Map person account based on web email' description='Updates AccountId to a person account.' category='Case')
    public static void UpdatePersonAccount(List<ID> ids) {
        Case complaintCase = [SELECT Id,SuppliedEmail FROM Case WHERE Id=:ids[0]];
        if(complaintCase.SuppliedEmail != null) {
            List<Account> personAccList = [Select Id FROM Account where PersonEmail=:complaintCase.SuppliedEmail];
            //List<Contact> contactList = [Select Id,Email FROM Contact where Email=:complaintCase.SuppliedEmail];
            if(personAccList != null && personAccList.size() > 0) {
                complaintCase.AccountId = personAccList[0].Id;
                update complaintCase;
            }
        }
    }
}