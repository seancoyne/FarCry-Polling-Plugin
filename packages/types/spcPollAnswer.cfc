<cfcomponent
	output="false" 
	extends="farcry.core.packages.types.types" 
	displayname="Poll Answer" hint="Manages poll answers"
	bFriendly="false" 
	bObjectBroker="false">

	<cfproperty name="answer" ftLabel="Answer" ftType="longchar" bLabel="true" type="longchar" required="true" ftValidation="required" />
	
</cfcomponent>