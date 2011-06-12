<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Display Answer --->
<!--- @@author: Sean Coyne (sean@n42designs.com) --->
<!--- @@cacheStatus: -1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>
	<input type="radio" name="answerid" id="answer_#stobj.objectid#" value="#stobj.objectid#" />
	<label for="answer_#stobj.objectID#">
		#stobj.answer#
	</label><br />
</cfoutput>

<cfsetting enablecfoutputonly="false" />