<!--- This is a ColdFusion Comment. Browsers do not receive it. --->

<cfset MyVar = var1 <!--- & var2 --->> 
<cfoutput>#Dateformat(now() <!---, "dddd, mmmm yyyy" --->)#</cfoutput> 

<!--- disable this code 
<!--- display error message ---> 
<cfset errormessage1="Oops!"> 
<cfoutput> 
    #errormessage1# 
</cfoutput> 
--->

<cfoutput>
	Hello #YourName#! <br>

	<!doctype html>
	<html>

		<head>
			<title>TEST</title>
		</head>
		<body>
			<p>Test</p>
			<form action="test.cfm" method="POST">
			</form>
			<!-- this is an html comment <cfset variables.test="#ListGetAt('1')#" /> #withcoldfusion# -->
			<!--- this is a cf comment <cfset variables.test="" /> #withcoldfusion#--->
		</body>
	</html>
</cfoutput>

<cfset YourName="Bob">

<cfprocessingdirective pageencoding="euc-jp" />

<!--- Configure dynamic attribute variables. ---> 

<cfset testaddhtmlstring = "<p>testing string \" ' asdf </p>" />
<cfset testaddhtmlstring = '<p>testing string \' "asdf </p>' />
<cfparam name="theURL" default="http://www.adobe.com"> 
<cfparam name="resolveURL" default="yes"> 

<!--- Code that dynamically changes values for attributes can go here. ---> 

<!--- Create an arguments structure using variables. ---> 
<cfset myArgs=StructNew() />
<cfset myArgs.url="#Variables.theURL#"> 
<!--- Include a user name and password only if they are available. ---> 
<cfif IsDefined("username")> 
    <cfset myArgs.username="#username#"> 
</cfif> 
<cfif IsDefined("password")>
    <cfset myArgs.password="#password#"> 
</cfif> 
<cfset myArgs.resolveURL="#resolveURL#"> 
<cfset myArgs.timeout="2"> 
<cfset myArgs["resolveURL"] = "test"/>
<!--- Use the myArgs structure to specify the cfhttp tag attributes. ---> 
<cfhttp attributeCollection="#myArgs#"> 
<cfoutput> 
    #cfhttp.fileContent# 
</cfoutput>
<cfquery>
	select * from schema.tbl where tbl.column = 'asdf'
</cfquery>
<cfscript>
    param name="paramname" default="value" min="minvalue" max="maxvalue" pattern="pattern"; 
</cfscript>

<cfscript> 
    Variables.qry = new Query(); 
    qry.setDatasource("test"); 
    qry.setSQL("delete from art where artid=62"); 
    qry.execute(); 
    TRANSACTION action="begin" {
    writeoutput("Transaction in cfscript test"); 
    TRANSACTION action="begin" { 
    qry.setSQL("insert into art(artid, artistid, artname, description, issold, price) 
    values ( 62, 1, 'art12', 'something', 1, 100)"); 
    qry.execute();
    } 
    transactionSetSavepoint("sp01"); 
    qry.setSQL("update art set artname='art45' where artid=62"); 
    qry.execute(); 
    transactionSetSavepoint("sp02"); 
    qry.setSQL("update art set artname='art56' where artid=62"); 
    qry.execute(); 
    transactionrollback("sp02"); 
    transactioncommit(); 
	} 

	public void function testfunction(loudness=1) {
		WriteOutput( "<p style=""font-size:#arguments.loudness#em"">Meow</p>" );
	}
	
	component extends="fruit" output="false"{
		WriteOutput("test");
		abort();
		cfabort();
		mojo = 1; //THIS IS A COMMENT
		/*
			Multipline comment
			testing
			<cfset />
			abort();
		*/
	}

</cfscript>

