<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Standard Teaser --->
<!--- @@author: Sean Coyne (sean@n42designs.com)--->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
	<h4>#stObj.question#</h4>
	<p><skin:buildLink objectid="#stObj.objectid#"><cfoutput>Take Poll</cfoutput></skin:buildLink></p>
</cfoutput>	

<cfsetting enablecfoutputonly="false" />