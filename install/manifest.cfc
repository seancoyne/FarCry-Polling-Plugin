<cfcomponent extends="farcry.core.webtop.install.manifest" name="manifest">

	<cfset this.name = "Poll" />
	<cfset this.description = "Provides a simple polling solution" />
	<cfset this.lRequiredPlugins = "" />
	<cfset addSupportedCore(majorVersion="6", minorVersion="0", patchVersion="0") />
	<cfset addSupportedCore(majorVersion="6", minorVersion="1", patchVersion="0") />
		
</cfcomponent>