<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Display Poll --->
<!--- @@author: Sean Coyne (sean@n42designs.com)--->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfif StructKeyExists(form,"pollid") and isValid("uuid",form.pollid) and form.pollid eq stobj.objectid and structKeyExists(form,'answerid') and isValid('uuid',form.answerid)>
	
	<!--- handle submission --->
	<cfif not hasResponded(pollid=stobj.objectid,sessionid=session.sessionid)> 
		<cfset submit(pollid=stobj.objectid,answerid=form.answerid,sessionid=session.sessionid) />
	</cfif> 
	
</cfif>
	
<cfif hasResponded(pollid=stobj.objectid,sessionid=session.sessionid) eq false and (not structKeyExists(url,'showResults'))> 
	
	<!--- display the poll --->
	<skin:view stobject="#stobj#" webskin="displayPoll" />
	
<cfelse>
	
	<!--- display results --->
	<skin:view stobject="#stobj#" webskin="displayPollResults" />
	
</cfif>

<cfsetting enablecfoutputonly="false" />