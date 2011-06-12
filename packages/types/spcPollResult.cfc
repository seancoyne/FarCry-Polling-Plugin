<cfcomponent
	output="false" 
	extends="farcry.core.packages.types.types" 
	displayname="Poll Result" hint="Manages poll results"
	bFriendly="false" 
	bObjectBroker="false">

	<cfproperty name="pollid" required="true" type="uuid" />
	<cfproperty name="answerid" required="true" type="uuid" />
	<cfproperty name="sessionid" required="true" type="string" />
	
	
</cfcomponent>