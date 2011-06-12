<cfsetting enablecfoutputonly="true" />

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- set up page header --->
<admin:header title="Polls" />

<ft:processform action="resetResults">
	<cfset oPollResults = application.fapi.getContentType("spcPollResult") />
	<cfquery name="q" datasource="#application.dsn#">
		select objectid from spcPollResult where pollid = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.selectedobjectid#" />
	</cfquery>
	<cfloop query="q">
		<cfset oPollResults.delete(objectid = q.objectid[q.currentRow]) />
	</cfloop>
	<skin:bubble title="Results Reset!" message="The results have been reset." />
</ft:processform>

<ft:processform action="viewResults">

	<cfset oPoll = application.fapi.getContentType("spcPoll") />
	<cfset stQuestion = oPoll.getData(objectid = form.selectedobjectid) />
	<cfset qResults = oPoll.getResults(pollid = stQuestion.objectid) />
	<cfoutput><h3>#stQuestion.question#</h3></cfoutput>
	<cfif qResults.recordCount>
	<cfoutput>
	<table border="1" width="300" class="objectAdmin headline">
		<tr>
			<th>Answer</th><th>Number of Responses</th>
		</tr>
		<cfloop query="qResults">
			<tr>
				<td>#answer#</td><td>#numresp#</td>
			</tr>
		</cfloop>
	</table>
	
	<cfchart showlegend="yes" format="png" tipstyle="mouseover" rotated="yes" show3d="yes" chartheight="300" chartwidth="300">
		<cfchartseries type="pie" query="qResults" valuecolumn="numresp" itemcolumn="answer" />
	</cfchart>
	</cfoutput>
	<cfelse>
	<cfoutput><p>No responses.</p></cfoutput>
	</cfif>
	
</ft:processform>

<ft:objectAdmin
	title="Polls"
	typename="spcPoll"
	ColumnList="question,lastupdatedby,datetimelastupdated"
	SortableColumns="question,lastupdatedby,datetimelastupdated"
	sqlorderby="datetimelastupdated desc"
	plugin="spcPoll"
	lCustomActions="viewResults:View Results,resetResults:Reset Results" />

<admin:footer />

<cfsetting enablecfoutputonly="false" />
