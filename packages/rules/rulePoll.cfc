<cfcomponent displayname="Poll: Display Poll" extends="farcry.core.packages.rules.rules" hint="Method for displaying a poll">

	<cfproperty ftseq="10" name="pollid" ftLabel="Poll" ftJoin="spcPoll" ftRenderType="library" ftType="uuid" type="uuid" required="true" ftvalidation="required" />
	
</cfcomponent>