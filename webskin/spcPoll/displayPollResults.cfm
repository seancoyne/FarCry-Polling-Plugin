<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Display Poll Results --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qResults = getResults(pollid=stObj.objectid) />

<cfoutput>
	<h3>#stObj.question#</h3>
	<div class="pollResults">
</cfoutput>

		<cfchart showlegend="yes" format="png" tipstyle="mouseover" rotated="yes" show3d="yes" chartheight="200" chartwidth="200">
			<cfchartseries type="pie" query="qResults" valuecolumn="numResp" itemcolumn="answer" />
		</cfchart>	

<cfoutput>
	</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />