Include Ensemble

Class Module.V2ToV3BS Extends EnsLib.SOAP.Service
{

Parameter ADAPTER;

Parameter SERVICENAME = "V2TOXMLBS";

Parameter NAMESPACE = "http://tempuri.org";

/// MethodName：A28<br>
/// Summary:    将A28（患者信息登记消息）转换为互联互通对应的新增个人身份注册服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method A28(pInput As %String) As %String [ WebMethod ]
{
	$$$LOGINFO("12345432:个人注册")
	s returnStr=..processHandle(pInput,"2.4:ADT_A05","个人注册")
	q returnStr
}

Method A01(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A01","患者入科")
	q returnStr
}

Method A02(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A02","患者转科")
	q returnStr
}

Method A09(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A09","患者取消入院")
	q returnStr
}

Method A11(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A11","患者取消入院")
	q returnStr
}

Method A12(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A12","患者取消入科")
	q returnStr
}

Method A13(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A13","患者取消出院")
	q returnStr
}

/// MethodName：A08<br>
/// Summary:    将028（患者信息更新消息）转换为互联互通对应的个人信息更新服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method A08(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A01","信息更新")
	q returnStr
}

/// MethodName：O09<br>
/// Summary:    将O09（患者医嘱消息）转换为互联互通对应的医嘱接收服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method O09(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:OMP_O09","医嘱")
	q returnStr
}

/// MethodName：O01<br>
/// Summary:    将ORM^O01（检查申请消息）转换为互联互通对应的申请单接收服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method O01(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ORM_O01","检查申请")
	q returnStr
}

/// MethodName：O21<br>
/// Summary:    将OML^O21（检验申请消息）转换为互联互通对应的申请单接收服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method O21(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:OML_O21","检验申请")
	q returnStr
}

/// MethodName：A05OUT<br>
/// Summary:    将ADT^A05（门诊）转换为互联互通对应的门诊就诊登记服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method A05OUT(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A05","门诊就诊登记服务")
	q returnStr
}

/// MethodName：A05IN<br>
/// Summary:    将ADT^A05（住院）转换为互联互通对应的住院就诊登记服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年10月18日 10:34 <br>
/// Author：    钟奕<br>
Method A05IN(pInput As %String) As %String [ WebMethod ]
{
	$$$LOGINFO("111")
	s returnStr=..processHandle(pInput,"2.4:ADT_A05","住院就诊登记服务")
	q returnStr
}

/// MethodName：A03<br>
/// Summary:    将ADT_A03（出院）转换为互联互通对应的出院登记服务<br>
/// In Parameter: HL7 2.4的消息消息br>
/// Return：    互联互通的标准响应<br>
/// Date：      2017年11月3日 10:34 <br>
/// Author：    钟奕<br>
Method A03(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandle(pInput,"2.4:ADT_A03","出院登记服务")
	q returnStr
}

Method DeptNW(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandleObj(pInput,"deptRegister","科室注册")
	q returnStr
}

Method DeptSC(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandleObj(pInput,"deptUpdate","科室更新")
	q returnStr
}

Method StaffNW(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandleObj(pInput,"staffRegister","医护人员注册")
	q returnStr
}

Method StaffSC(pInput As %String) As %String [ WebMethod ]
{
	s returnStr=..processHandleObj(pInput,"staffUpdate","医护人员更新")
	q returnStr
}

Method processHandleObj(pInput As %String, Type As %String, value As %String) As %String
{
	try{
		$$$LOGINFO("type:"_value)
		s Out = ##class(EnsLib.EDI.XML.Document).%New()
		s Out = Out.ImportFromString(pInput)
		s Out.DocType = value
		s pOutput = ##class(EnsLib.EDI.XML.Document).%New()
		s tSC=..ProcessInput(Out,.pOutput) $$$ThrowOnError(tSC)
    }catch errobj{
		$$$LOGERROR(errobj.DisplayString())
	}
	s xmlString =  pOutput.OutputToString()
	q xmlString
}

Method processHandle(pInput As %String, Type As %String, value As %String) As %String
{
	s pOutput = ##class(Ens.StringResponse).%New()
	try{
		$$$LOGINFO("type:"_value)
		s pInput = $zcvt(pInput,"O","UTF8")	
		s inStream = ##class(%Stream.GlobalCharacter).%New()
		d inStream.Write(pInput)
		s target=##class(EnsLib.HL7.Message).%New()	
 		s target=##class(EnsLib.HL7.Message).ImportFromLibraryStream(inStream,.status) 
 		if 'status {do $system.Status.DisplayError(status) q}
    	s target.DocType=Type
    	s target.UserValues=value
		s guid=##class(%SYSTEM.Util).CreateGUID()
		d target.SetValueAt(guid,"MSH:13.1","set")
		$$$LOGINFO("取值"_target.GetValueAt("PV1:PatientClass"))
		s tMessageXML=target.OutputToString(target.Separators,,.tSC,"EnsLib.HL7.Util.FormatDSXMLv2")
		$$$LOGINFO("tsc: "_tSC)
		s tMessageXML = $zcvt(tMessageXML,"I","UTF8")
		;d ..Log(tMessageXML,"日志")
		s Out = ##class(EnsLib.EDI.XML.Document).%New()
		s Out = Out.ImportFromString(tMessageXML)
		s Out.DocType=value
		;s pOutput = ##class(EnsLib.EDI.XML.Document).%New()
		s tSC=..ProcessInput(Out,.pOutput) $$$ThrowOnError(tSC)	
		;s xmlString =  pOutput.OutputToString()	
    }catch errobj{
		$$$LOGERROR(errobj.DisplayString())
	}
	;s xmlString =  pOutput.OutputToString()
	q pOutput.StringValue
}

ClassMethod Log(logStr As %String, logType As %String = "info") As %Status
{
	
	set fileName=$TRanslate($ZDate($H,3),"-")
	s fileName="C:\ENSLOG\"_fileName_".log"
	s stream=##class(%FileCharacterStream).%New()
	s stream.Filename=fileName
	d stream.MoveToEnd()
	d stream.WriteLine("["_$ZDate($H,3)_"] 日志级别:【"_logType_"】日志信息如下：")
	d stream.WriteLine(logStr)
	d stream.WriteLine()
	d stream.SaveStream()
	q $$$OK
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	s pOutput = ##class(Ens.StringResponse).%New()
	Set tSC=..SendRequestAsync("V2消息转换服务总线",pInput)
	s pOutput.StringValue = "成功"
	q $$$OK
}

}
