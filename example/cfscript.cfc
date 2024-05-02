component {
  // TODO Write come code here
  public any function init(string arg="mystring") {
    var thisval = "This Value";
    Variables.somevar = Arguments.arg;
	cgi.test = server.test;
 	Application.anothervar = test
	var htmlString = "<br /> <p>#url.test#</P><br/>"; var variables.thisvar="new statement on same line";
	if( Arguments.arg IS 'mystring' ) {
      Arguments.arg = '#Len(thisval)# mystring';
    } else if( Arguments.arg is true ) {
      Arguments.arg = false;

    return this;
  }

  public date function getCurrentTime() {
    return now();
  }


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


  /*
    I want to have as many functions as needed to test everything from the syntax
    TODO: add more code
    XXX
    TBD
  */
  /*
   * Hello
   TODO
   todo Hello World
  */


}
