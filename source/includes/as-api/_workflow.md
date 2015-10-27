# Workflow
##Introduction simple workflow in AS
All stream items can include simple workflow information. A workflow action can be set by any user or employee that has access to the item in an activity stream.
A workflow action triggers a corresponding/appropriate workflow status.

Currently only simple rules are applied to state sequence but future versions of Activity Stream may introduce more advanced workflow rules. 

## Available workflow actions
 
### VIEWED_BY
Set automatically the first time a user looks at the details for a stream item that is using workflow.
The viewed action does not trigger any state changes  

### ACKNOWLEDGED_BY
Typically set by the user to acknowledge the issue prior to any further action taking place.

### CLAIMED_BY
Typically set by a user that is opting to address the issue (self assigning).

### CONFIRMED_BY
Typically set by a user that is confirming the issue or the resolution.

### ASSIGNED_BY
Typically set by as user that is assigning the issue to a different user.

### COMPLETED_BY
Typically set by as user that is completing the issue.

### APPROVED_BY
Typically set by as user that is approving the issue or its resolution.

### VERIFIED_BY
Typically set by as user that is verifying the issue or its resolution.

### CLOSED_BY
Typically set by as user that is closing the issue after it has been completed or rejected.  

### REJECTED_BY
Typically set by as user that is rejecting the issue or its resolution.

### REOPENED_BY
Typically set by as user that is re-stating an issue after its been closes.

## Workflow API
Currently the workflow actions can only be set vie the REST API.

###Get workflow information for a single stream item*
`GET` `https://{tenant-label}.activitystream.com/api/v1/as/workflow/{stream_id}`

*Summary information for workflow is included in stream items but a detailed list of actions can be set.

###Add a workflow state to a stream item*
`PUT` `https://{tenant-label}.activitystream.com/api/v1/as/workflow/{stream_id}/{action}`

###Remove a workflow state from a stream item*
`DELETE` `https://{tenant-label}.activitystream.com/api/v1/as/workflow/{stream_id}/{action}`

Property | Description
-------- | -----------
{stream_id} | The id of the stream item to set/get/delete workflow status for 
{action} | Available actions: `view`,`acknowledge`,`claim`,`confirm`,`confirm`,`verify`,`assign`,`approve`,`complete`,`reject`,`closed`,`reopen`

**Att.** *These actions are always performed as current user