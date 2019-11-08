Class Module.MD5Hash Extends %RegisteredObject
{

ClassMethod StringMd5Hash(Input As %String) As %String
{
 
  Set InString = $ZCVT(Input,"O","UTF8") 
  Set InString = $system.Encryption.MD5Hash(InString)
  Set outString = ##class(%xsd.hexBinary).LogicalToXSD(InString)
  Quit outString
}

ClassMethod StreamMd5Hash(Input As %GlobalCharacterStream) As %String
{
 
  Set InString = Input.Read()
  Set InString = $ZCVT(InString,"O","UTF8") 
  Set InString = $system.Encryption.MD5Hash(InString)
  Set outString = ##class(%xsd.hexBinary).LogicalToXSD(InString)
  Quit outString
}

}
