public class MockTestInstanceCreation implements IPrototypeClone {
    private Opportunity objOpportunity;
    private Contact objContact;
    private String instanceName;
    private integer count=0;
    
    private MockTestInstanceCreation(){
        
    }
    
    public MockTestInstanceCreation(String objectName, Id accountId, String strName, String stageValue) {
        instanceName = objectName;
        if(objectName == 'Opportunity'){
            objOpportunity = new Opportunity(AccountId=accountId, Name=strName, StageName=stageValue);
        } else if(objectName == 'Contact'){
            objContact = new Contact(AccountId=accountId, LastName=strName);
        }
    }
    
    public Opportunity getOpportunityInstance(){
        return objOpportunity;
    }
    
    public Contact getContactInstance(){
        return objContact;
    }
    
	public IPrototypeClone cloneInstance(){        
        MockTestInstanceCreation mockTestObj;
        if(instanceName == 'Opportunity'){
            count++;
            String strName = objOpportunity.Name+count;
            mockTestObj = new MockTestInstanceCreation(instanceName, objOpportunity.AccountId, strName, objOpportunity.StageName);
        } else if(instanceName == 'Contact'){
            mockTestObj = new MockTestInstanceCreation();
            mockTestObj.objContact = objContact.clone(false, false, false, false);
            //clone(preserveId, isDeepClone, preserveReadonlyTimestamps, preserveAutonumber)
        }
        return mockTestObj;
    }
}

/* How to call/execute the above code
MockTestInstanceCreation objMockTestInstance = new MockTestInstanceCreation('Opportunity', '006ak000002lp6KAAQ', 'Mock Test Oppty', 'Prospecting');
Opportunity objOppty = objMockTestInstance.getOpportunityInstance();
System.debug('objOppty:::'+objOppty);
MockTestInstanceCreation cloneOpptyTemp = (MockTestInstanceCreation) objMockTestInstance.cloneInstance();
System.debug('cloneOpptyTemp:::'+cloneOpptyTemp);
Opportunity objCloneOppty = cloneOpptyTemp.getOpportunityInstance();
System.debug('objCloneOppty:::'+objCloneOppty);


MockTestInstanceCreation objMockTestInstance = new MockTestInstanceCreation('Contact', '006ak000002lp6KAAQ', 'Mock Test Contact', null);
Contact objContact = objMockTestInstance.getContactInstance();
System.debug('objContact:::'+objContact);
Contact objCloneContact = ((MockTestInstanceCreation) objMockTestInstance.cloneInstance()).getContactInstance();
System.debug('objCloneContact:::'+objCloneContact);

*/
