Include Ensemble

Class Module.OBJToV3 Extends %RegisteredObject
{

/// This is first Method
ClassMethod StringMd5Hash(Input As %String) As %String
{
  Set Input = "dfdfd "
  Set InString = $ZCVT(Input,"O","UTF8") 
  Set InString = $system.Encryption.MD5Hash(InString)
  Set outString = ##class(%xsd.hexBinary).LogicalToXSD(InString)
  Quit outString
}

/// Second Method
ClassMethod StringMd5Hash2(Input As %String) As %String
{
 
  Set InString = $ZCVT(Input,"O","UTF8")
  Set str = $System.Encryption.MD5Hash(InString) 
  #Dim hex as %String = ""
  #Dim hex1 as %String
  #Dim iStr as %Integer
  For iStr=1:1:$Length(str) {
    Set hex1 = $ZHex($Ascii(str,iStr))
    If $Length(hex1)=1 set hex1="0"_hex1
    Set hex = hex _ hex1
  }
  Quit $ZConvert(hex,"l")
}

/// third Method
ClassMethod StringMd5Hash3(Input As %String) As %String
{
 
  Set InString = $ZCVT(Input,"O","UTF8")
  Set str = $System.Encryption.MD5Hash(InString) 
  #Dim hex as %String = ""
  #Dim hex1 as %String
  #Dim iStr as %Integer
  For iStr=1:1:$Length(str) {
    Set hex1 = $ZHex($Ascii(str,iStr))
    If $Length(hex1)=1 set hex1="0"_hex1
    Set hex = hex _ hex1
  }
  Quit $ZConvert(hex,"l")
}

}
