public class TaskTemplate implements IPrototypeClone {
    private Task taskInstance;
    public TaskTemplate(String strPriority, String strSubject){
        taskInstance = new Task(Priority=strPriority, Subject=strSubject, Status='In Progress');
    }
    
    public Task getTaskInstance(){
        return taskInstance;
    }
    
    public IPrototypeClone cloneInstance(){
        TaskTemplate cloneObj = new TaskTemplate(taskInstance.Priority, taskInstance.Subject);
        cloneObj.taskInstance.Status = 'Not Started';
        return cloneObj;
    }
}

/*How to call/execute the above code
List<Task> lstCloneTask = new List<Task>();
TaskTemplate objTaskTemp = new TaskTemplate('Normal', 'Bulk Task to be created');
Task objTask = objTaskTemp.getTaskInstance();
lstCloneTask.add(objTask);
for(integer i=0; i<1;i++){
    TaskTemplate cloneTaskTemp = ((TaskTemplate) objTaskTemp.cloneInstance());
    Task cloneTask = cloneTaskTemp.getTaskInstance();
	lstCloneTask.add(cloneTask);
}
insert lstCloneTask;

*/
