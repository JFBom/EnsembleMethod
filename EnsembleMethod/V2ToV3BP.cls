
ClasSet V2ToV3BP ExtendSet Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<procesSet language='objectscript' request='EnsLib.EDI.XML.Document' response='EnsLib.EDI.XML.Document' height='2000' width='4000' >
<context>
<property name='hl7' type='EnsLib.EDI.XML.Document' instantiate='1' />
<property name='xsl' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='startTime' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='endTime' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1200' >
<switch xpos='200' ypos='250' xend='200' yend='1100' >
<case condition='request.DocType="个人注册"' name='个人注册' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='335' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\1新增个人身份注册服务.xsl&quot;" action="set" xpos='335' ypos='500' />
<code name='XSL转换' xpos='335' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    ;$$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPA_IN201311UV02:PRPA_IN201311UV02&quot;" action="set" xpos='335' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='335' ypos='800' />
<call name='1' target='V3消息发送服务' async='1' xpos='335' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='335' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="信息更新"' name='信息更新' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='605' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\2个人信息更新服务.xsl&quot;" action="set" xpos='605' ypos='500' />
<code name='XSL转换' xpos='605' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    ;$$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
 
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPA_IN201314UV02:PRPA_IN201314UV02&quot;" action="set" xpos='605' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='605' ypos='800' />
<call name='2' target='V3消息发送服务' async='1' xpos='605' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='605' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="医嘱"' name='医嘱' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='875' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\14医嘱接收服务.xsl&quot;" action="set" xpos='875' ypos='500' />
<code name='XSL转换' xpos='875' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    $$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
	$$$LOGINFO(TagetXML)
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
 
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;POOR_IN200901UV:POOR_IN200901UV&quot;" action="set" xpos='875' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='875' ypos='800' />
<call name='3' target='V3消息发送服务' async='1' xpos='875' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='875' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="检查申请"' name='检查申请' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1145' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\16申请单接收服务—检查.xsl&quot;" action="set" xpos='1145' ypos='500' />
<code name='XSL转换' xpos='1145' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    $$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
 
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;POOR_IN200901UV-sqd:POOR_IN200901UV&quot;" action="set" xpos='1145' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1145' ypos='800' />
<call name='4' target='V3消息发送服务' async='1' xpos='1145' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='1145' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="检验申请"' name='检验申请' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1415' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\16申请单接收服务—检验.xsl&quot;" action="set" xpos='1415' ypos='500' />
<code name='XSL转换' xpos='1415' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    $$$LOGINFO(SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    $$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
 
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;POOR_IN200901UV-sqd:POOR_IN200901UV&quot;" action="set" xpos='1415' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1415' ypos='800' />
<call name='5' target='V3消息发送服务' async='1' xpos='1415' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='1415' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="门诊就诊登记服务"' name='门诊就诊登记服务' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1685' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\27门诊就诊登记服务.xsl&quot;" action="set" xpos='1685' ypos='500' />
<code name='XSL转换' xpos='1685' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    ;$$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPA_IN401001UV02:PRPA_IN401001UV02&quot;" action="set" xpos='1685' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1685' ypos='800' />
<call name='6' target='V3消息发送服务' async='1' xpos='1685' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='1685' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="住院就诊登记服务"' name='住院就诊登记服务' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1955' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\29住院就诊登记服务.xsl&quot;" action="set" xpos='1955' ypos='500' />
<code name='XSL转换' xpos='1955' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    ;$$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPA_IN402001UV02:PRPA_IN402001UV02&quot;" action="set" xpos='1955' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='1955' ypos='800' />
<call name='7' target='V3消息发送服务' async='1' xpos='1955' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='1955' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="出院登记服务"' name='出院登记服务' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='2225' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\31出院登记服务.xsl&quot;" action="set" xpos='2225' ypos='500' />
<code name='XSL转换' xpos='2225' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    Set SourceXML=$replace(SourceXML," xmlns:hl7='urn:hl7-org:v2xml' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'","")
    Set SourceXML=$replace(SourceXML,"hl7:","")
    ;$$$LOGINFO("XML"_SourceXML) 
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError,) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
    Set context.hl7= context.hl7.ImportFromString(TagetXML)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPA_IN402003UV02:PRPA_IN402003UV02&quot;" action="set" xpos='2225' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='2225' ypos='800' />
<call name='8' target='V3消息发送服务' async='1' xpos='2225' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='2225' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="科室注册"' name='科室注册' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='2495' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\8新增医疗卫生机构（科室）注册服务.xsl&quot;" action="set" xpos='2495' ypos='500' />
<code name='XSL转换' xpos='2495' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    $$$LOGINFO(SourceXML)
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
	$$$LOGINFO(TagetXML)
    Set context.hl7= ##class(EnsLib.EDI.XML.Document).ImportFromString(TagetXML,.status)
    $$$LOGINFO(status)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPM_IN401030UV01:PRPM_IN401030UV01&quot;" action="set" xpos='2495' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='2495' ypos='800' />
<call name='9' target='V3消息发送服务' async='1' xpos='2495' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='2495' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="科室更新"' name='科室更新' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='2765' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\9医疗卫生机构（科室）信息更新服务.xsl&quot;" action="set" xpos='2765' ypos='500' />
<code name='XSL转换' xpos='2765' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    $$$LOGINFO(SourceXML)
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
	$$$LOGINFO(TagetXML)
    Set context.hl7= ##class(EnsLib.EDI.XML.Document).ImportFromString(TagetXML,.status)
    $$$LOGINFO(status)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPM_IN403010UV01:PRPM_IN403010UV01&quot;" action="set" xpos='2765' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='2765' ypos='800' />
<call name='10' target='V3消息发送服务' async='1' xpos='2765' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='2765' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="医护人员注册"' name='医护人员注册' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='3035' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\5新增医护人员注册服务.xsl&quot;" action="set" xpos='3035' ypos='500' />
<code name='XSL转换' xpos='3035' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    $$$LOGINFO(SourceXML)
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
	$$$LOGINFO(TagetXML)
    Set context.hl7= ##class(EnsLib.EDI.XML.Document).ImportFromString(TagetXML,.status)
    $$$LOGINFO(status)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPM_IN301010UV01:PRPM_IN301010UV01&quot;" action="set" xpos='3035' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='3035' ypos='800' />
<call name='9' target='V3消息发送服务' async='1' xpos='3035' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='3035' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<case condition='request.DocType="医护人员更新"' name='医护人员更新' >
<assign name="start time" property="context.startTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='3305' ypos='400' />
<assign name="加载xsl表单" property="context.xsl" value="&quot;C:\XSL\6医护人员信息更新服务.xsl&quot;" action="set" xpos='3305' ypos='500' />
<code name='XSL转换' xpos='3305' ypos='600' >
<![CDATA[  Try{
    Do request.XMLExportToString(.SourceXML)
    $$$LOGINFO(SourceXML)
    Set tSC = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(context.xsl,.pXSL)	$$$ThrowOnError(tSC)
    Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(SourceXML,pXSL,.TagetXML,.tError) $$$ThrowOnError(tSC)
	Set TagetXML = $zcvt(TagetXML,"O","UTF8")
	$$$LOGINFO(TagetXML)
    Set context.hl7= ##class(EnsLib.EDI.XML.Document).ImportFromString(TagetXML,.status)
    $$$LOGINFO(status)
   }Catch Err{
     $$$LOGERROR("XSLT转换失败"_Err.DisplayString())
     $$$LOGERROR(SourceXML) 
   }
 ]]>
</code>
<assign name="定义消息模型" property="context.hl7.DocType" value="&quot;PRPM_IN303010UV01:PRPM_IN303010UV01&quot;" action="set" xpos='3305' ypos='700' />
<assign name="end time" property="context.endTime" value="$TRanslate($ZTS,&quot;,&quot;)" action="set" xpos='3305' ypos='800' />
<call name='9' target='V3消息发送服务' async='1' xpos='3305' ypos='900' >
<request type='EnsLib.EDI.XML.Document' >
<assign property="callrequest" value="context.hl7" action="set" />
</request>
<response type='EnsLib.EDI.XML.Document' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<trace name='记录DT转换耗时(ms)' value='"DT转换耗时:"_(context.endTime-context.startTime)' xpos='3305' ypos='1000' >
<annotation><![CDATA["结束时间"_$ZDT($ZDTH($ZTS,-3),3,1,3)]]></annotation>
</trace>
</case>
<default name='default' />
</switch>
</sequence>
</process>
}

}
