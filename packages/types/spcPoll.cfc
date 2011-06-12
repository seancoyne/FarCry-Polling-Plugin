<cfcomponent
	output="false"
	extends="farcry.core.packages.types.types"
	displayname="Poll" hint="Manages polls"
	bFriendly="true"
	bObjectBroker="true">

	<cfproperty name="question" ftLabel="Question" ftType="longchar" bLabel="true" type="longchar" required="true" ftValidation="required" />
	<cfproperty name="aAnswer" ftLabel="Answers" type="array" ftType="array" ftJoin="spcPollAnswer" ftAllowCreate="true" ftAllowEdit="true" />
	
	<cffunction name="getAllPolls" access="public" output="false" returntype="Query">
		<cfset var q = "" />
		<cfquery name="q" datasource="#application.dsn#">
		select objectid from spcPoll order by datetimecreated desc
		</cfquery>
		<cfreturn q />
	</cffunction>
	
	<cffunction name="getResults" access="public" output="false" returntype="query">
		<cfargument name="pollid" required="true" type="uuid" />
		<cfset var q = '' />
		<cfset var oPollAnswerService = application.fapi.getContentType("spcPollAnswer") />
		<cfset var tmpVals = arrayNew(1) />
		<cfset var i = 0 />

		<cfquery name="q" datasource="#application.dsn#">
		SELECT     #application.dbowner#spcPollResult.answerid, COUNT(#application.dbowner#spcPollResult.answerid) AS numResp
		FROM         #application.dbowner#spcPollResult INNER JOIN
		                      #application.dbowner#spcPollAnswer ON #application.dbowner#spcPollResult.answerid = #application.dbowner#spcPollAnswer.ObjectID
		WHERE     (#application.dbowner#spcPollResult.pollid = <cfqueryparam value="#arguments.pollid#" />)
		GROUP BY #application.dbowner#spcPollResult.answerid
		</cfquery>

		<cfloop from="1" to="#q.recordCount#" index="i">
			<cfset arrayAppend(tmpVals,'') />
		</cfloop>

		<cfset queryAddColumn(q,'answer','varchar',tmpVals) />
		<cfloop query="q">
			<cfset querySetCell(q,'answer',oPollAnswerService.getData(answerid).answer,q.currentRow) />
		</cfloop>
		<cfquery name="q" dbtype="query">
		select answer,numresp from q
		</cfquery>

		<cfreturn q />
	</cffunction>

	<cffunction name="hasResponded" access="public" output="false" returntype="boolean">
		<cfargument name="pollid" required="true" type="uuid" />
		<cfargument name="sessionid" required="true" type="string" />
		<cfset var q = '' />
		<cfquery name="q" datasource="#application.dsn#">
		select spcPollResult.objectid from spcPollResult where sessionid = <cfqueryparam value="#arguments.sessionid#" />
		and pollid = <cfqueryparam value="#arguments.pollid#" />
		</cfquery>
		<cfreturn q.recordCount />
	</cffunction>

	<cffunction name="submit" access="public" output="false" returntype="void">
		<cfargument name="pollid" required="true" type="uuid" />
		<cfargument name="answerid" required="true" type="uuid" />
		<cfargument name="sessionid" required="true" type="string" />
		<cfset var oPoll = application.fapi.getContentType("spcPollResult") />
		<cfset oPoll.createData(stProperties = arguments) />
	</cffunction>

</cfcomponent>