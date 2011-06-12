<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Display Poll --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfparam name="stParam.actionUrl" type="string" default="#application.fapi.getLink(objectid = stobj.objectid)#" />

<cfoutput>
<form action="#stParam.actionURL#" method="post">
	<h4>#stObj.question#</h4>
	<p>
</cfoutput>

<cfloop array="#stobj.aAnswer#" index="answer">
	<skin:view objectid="#answer#" typename="spcPollAnswer" webskin="displayAnswer" />
</cfloop>

<cfoutput>
	</p>
	<p>
		<input type="hidden" name="pollid" value="#stobj.objectid#" /> 
		<input type="submit" value="Submit" />
	</p>
</cfoutput>
</form>

<cfsetting enablecfoutputonly="false" />