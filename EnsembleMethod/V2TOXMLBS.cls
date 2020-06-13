Class Module.V2ToV3BS Extends EnsLib.SOAP.Service
{

Parameter ADAPTER;

Parameter SERVICENAME = "V2ToV3BS";

Parameter NAMESPACE = "http://tempuri.org";

/// MethodName：A28<br>
/// Summary:    将A28（患者信息登记消息）转换为互联互通对应的新增个人身份注册服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method A28(pInput As %String) As %String [ WebMethod ]
{
	$$$LOGINFO("12345432:个人注册")
	Set returnStr=..processHandle(pInput,"2.4:ADT_A05","个人注册")
	Quit returnStr
}

Method A01(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A01","患者入科")
	Quit returnStr
}

Method A02(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A02","患者转科")
	Quit returnStr
}

Method A09(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A09","患者取消入院")
	Quit returnStr
}

Method A11(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A11","患者取消入院")
	Quit returnStr
}

Method A12(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A12","患者取消入科")
	Quit returnStr
}

Method A13(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A13","患者取消出院")
	Quit returnStr
}

/// MethodName：A08<br>
/// Summary:    将028（患者信息更新消息）转换为互联互通对应的个人信息更新服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method A08(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A01","信息更新")
	Quit returnStr
}

/// MethodName：O09<br>
/// Summary:    将O09（患者医嘱消息）转换为互联互通对应的医嘱接收服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method O09(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:OMP_O09","医嘱")
	Quit returnStr
}

/// MethodName：O01<br>
/// Summary:    将ORM^O01（检查申请消息）转换为互联互通对应的申请单接收服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method O01(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ORM_O01","检查申请")
	Quit returnStr
}

/// MethodName：O21<br>
/// Summary:    将OML^O21（检验申请消息）转换为互联互通对应的申请单接收服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method O21(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:OML_O21","检验申请")
	Quit returnStr
}

/// MethodName：A05OUT<br>
/// Summary:    将ADT^A05（门诊）转换为互联互通对应的门诊就诊登记服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method A05OUT(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A05","门诊就诊登记服务")
	Quit returnStr
}

/// MethodName：A05IN<br>
/// Summary:    将ADT^A05（住院）转换为互联互通对应的住院就诊登记服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    Test<br>
Method A05IN(pInput As %String) As %String [ WebMethod ]
{
	$$$LOGINFO("111")
	Set returnStr=..processHandle(pInput,"2.4:ADT_A05","住院就诊登记服务")
	Quit returnStr
}

/// MethodName：A03<br>
/// Summary:    将ADT_A03（出院）转换为互联互通对应的出院登记服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年11月3日 10:34 <br>
/// Author：    Test<br>
Method A03(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandle(pInput,"2.4:ADT_A03","出院登记服务")
	Quit returnStr
}

Method DeptNW(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandleObj(pInput,"deptRegister","科室注册")
	Quit returnStr
}

Method DeptSC(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandleObj(pInput,"deptUpdate","科室更新")
	Quit returnStr
}

Method StaffNW(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandleObj(pInput,"staffRegister","医护人员注册")
	Quit returnStr
}

Method StaffSC(pInput As %String) As %String [ WebMethod ]
{
	Set returnStr=..processHandleObj(pInput,"staffUpdate","医护人员更新")
	Quit returnStr
}

Method processHandleObj(pInput As %String, Type As %String, value As %String) As %String
{
	Try{
		$$$LOGINFO("type:"_value)
		Set Out = ##class(EnsLib.EDI.XML.Document).%New()
		Set Out = Out.ImportFromString(pInput)
		Set Out.DocType = value
		Set pOutput = ##class(EnsLib.EDI.XML.Document).%New()
		Set tSC=..ProcessInput(Out,.pOutput) $$$ThrowOnError(tSC)
    }catch errobj{
		$$$LOGERROR(errobj.DisplayString())
	}
	Set xmlString =  pOutput.OutputToString()
	Quit xmlString
}

Method processHandle(pInput As %String, Type As %String, value As %String) As %String
{
	Set pOutput = ##class(Ens.StringResponse).%New()
	Try{
		$$$LOGINFO("type:"_value)
		Set pInput = $zcvt(pInput,"O","UTF8")	
		Set inStream = ##class(%Stream.GlobalCharacter).%New()
    Do inStream.Write(pInput)
    Do inStream.Rewind()
		Set target=##class(EnsLib.HL7.Message).%New()	
 		Set target=##class(EnsLib.HL7.Message).ImportFromLibraryStream(inStream,.status) 
 		If 'status { Do $system.Status.DisplayError(status) Quit }
    	Set target.DocType=Type
    	Set target.UserValues=value
		Set guid=##class(%SYSTEM.Util).CreateGUID()
		Do target.SetValueAt(guid,"MSH:13.1","set")
		$$$LOGINFO("取值"_target.GetValueAt("PV1:PatientClass"))
		Set tMessageXML=target.OutputToString(target.Separators,,.tSC,"EnsLib.HL7.Util.FormatDSXMLv2")
		$$$LOGINFO("tSC: "_tSC)
		Set tMessageXML = $zcvt(tMessageXML,"I","UTF8")
		;Do ..Log(tMessageXML,"日志")
		Set Out = ##class(EnsLib.EDI.XML.Document).%New()
		Set Out = Out.ImportFromString(tMessageXML)
		Set Out.DocType=value
		;Set pOutput = ##class(EnsLib.EDI.XML.Document).%New()
		Set tSC=..ProcessInput(Out,.pOutput) $$$ThrowOnError(tSC)	
		;Set xmlString =  pOutput.OutputToString()	
    }Catch errobj{
		$$$LOGERROR(errobj.DisplayString())
	}
	;s xmlString =  pOutput.OutputToString()
	  Quit pOutput.StringValue
}

ClassMethod Log(logStr As %String, logType As %String = "info") As %Status
{
	
	set fileName=$TRanslate($ZDate($H,3),"-")
	Set fileName="C:\ENSLOG\"_fileName_".log"
	Set stream=##class(%FileCharacterStream).%New()
	Set stream.Filename=fileName
	d stream.MoveToEnd()
	d stream.WriteLine("["_$ZDate($H,3)_"] 日志级别:【"_logType_"】日志信息如下：")
	d stream.WriteLine(logStr)
	d stream.WriteLine()
	d stream.SaveStream()
	Quit $$$OK
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	Set pOutput = ##class(Ens.StringResponse).%New()
	Set tSC=..SendRequestAsync("V2消息转换服务总线",pInput)
	Set pOutput.StringValue = "转化成功"
	Quit $$$OK
}

}
