<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Display Poll Rule --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfif structKeyExists(stobj,'pollid') and isValid("uuid",stobj.pollid)>
	
	<cfset oPoll = application.fapi.getContentType("spcPoll") />
	
	<cfif StructKeyExists(form,"pollid") and isValid("uuid",form.pollid) and form.pollid eq stobj.pollid and structKeyExists(form,'answerid') and isValid('uuid',form.answerid)>
		
		<!--- handle submission --->
		<cfif not oPoll.hasResponded(pollid=stobj.pollid,sessionid=session.sessionid)> 
			<cfset oPoll.submit(pollid=stobj.pollid,answerid=form.answerid,sessionid=session.sessionid) />
		</cfif> 
		
	</cfif>
		
	<cfif oPoll.hasResponded(pollid=stobj.pollid,sessionid=session.sessionid) eq false and (not structKeyExists(url,'showResults'))> 
		
		<!--- display the poll --->
		<cfif structKeyExists(request,'navid') and isValid("uuid",request.navid)>
			<cfset actionURL = application.fapi.getLink(objectid = request.navid) />
		<cfelse>
			<cfset actionURL = application.fapi.getLink(objectid = stobj.pollid) />
		</cfif>
		<skin:view objectid="#stobj.pollid#" typename="spcPoll" webskin="displayPoll" actionURL="#actionURL#" />
		
	<cfelse>
		
		<!--- display results --->
		<skin:view objectid="#stobj.pollid#" typename="spcPoll" webskin="displayPollResults" />
		
	</cfif>

</cfif>

<cfsetting enablecfoutputonly="false" />