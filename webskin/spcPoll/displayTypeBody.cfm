<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Type Body --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qPolls = getAllPolls() />

<cfloop query="qPolls">
	<skin:view objectid="#qPolls.objectid[qPolls.currentRow]#" typename="spcPoll" webskin="displayTeaserStandard" />
</cfloop>

<cfsetting enablecfoutputonly="false" />