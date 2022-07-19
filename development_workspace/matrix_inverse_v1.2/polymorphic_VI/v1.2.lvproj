<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="host.vi" Type="VI" URL="../host.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="NiFpgaLv.dll" Type="Document" URL="NiFpgaLv.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
	<Item Name="NI-cRIO-9035-01B68DEF" Type="RT CompactRIO">
		<Property Name="alias.name" Type="Str">NI-cRIO-9035-01B68DEF</Property>
		<Property Name="alias.value" Type="Str">129.252.23.81</Property>
		<Property Name="CCSymbols" Type="Str">TARGET_TYPE,RT;OS,Linux;CPU,x64;DeviceCode,77DB;</Property>
		<Property Name="crio.ControllerPID" Type="Str">77DB</Property>
		<Property Name="host.ResponsivenessCheckEnabled" Type="Bool">true</Property>
		<Property Name="host.ResponsivenessCheckPingDelay" Type="UInt">5000</Property>
		<Property Name="host.ResponsivenessCheckPingTimeout" Type="UInt">1000</Property>
		<Property Name="host.TargetCPUID" Type="UInt">9</Property>
		<Property Name="host.TargetOSID" Type="UInt">19</Property>
		<Property Name="host.TargetUIEnabled" Type="Bool">false</Property>
		<Property Name="target.cleanupVisa" Type="Bool">false</Property>
		<Property Name="target.FPProtocolGlobals_ControlTimeLimit" Type="Int">300</Property>
		<Property Name="target.getDefault-&gt;WebServer.Port" Type="Int">80</Property>
		<Property Name="target.getDefault-&gt;WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.IOScan.Faults" Type="Str"></Property>
		<Property Name="target.IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="target.IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="target.IOScan.Period" Type="UInt">10000</Property>
		<Property Name="target.IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="target.IOScan.Priority" Type="UInt">0</Property>
		<Property Name="target.IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="target.IsRemotePanelSupported" Type="Bool">true</Property>
		<Property Name="target.RTCPULoadMonitoringEnabled" Type="Bool">true</Property>
		<Property Name="target.RTDebugWebServerHTTPPort" Type="Int">8001</Property>
		<Property Name="target.RTTarget.ApplicationPath" Type="Path">/c/ni-rt/startup/startup.rtexe</Property>
		<Property Name="target.RTTarget.EnableFileSharing" Type="Bool">true</Property>
		<Property Name="target.RTTarget.IPAccess" Type="Str">+*</Property>
		<Property Name="target.RTTarget.LaunchAppAtBoot" Type="Bool">false</Property>
		<Property Name="target.RTTarget.VIPath" Type="Path">/home/lvuser/natinst/bin</Property>
		<Property Name="target.server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.server.tcp.access" Type="Str">+*</Property>
		<Property Name="target.server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="target.server.tcp.paranoid" Type="Bool">true</Property>
		<Property Name="target.server.tcp.port" Type="Int">3363</Property>
		<Property Name="target.server.tcp.serviceName" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.tcp.serviceName.default" Type="Str">Main Application Instance/VI Server</Property>
		<Property Name="target.server.vi.access" Type="Str">+*</Property>
		<Property Name="target.server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="target.server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="target.WebServer.Enabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogEnabled" Type="Bool">false</Property>
		<Property Name="target.WebServer.LogPath" Type="Path">/c/ni-rt/system/www/www.log</Property>
		<Property Name="target.WebServer.Port" Type="Int">80</Property>
		<Property Name="target.WebServer.RootPath" Type="Path">/c/ni-rt/system/www</Property>
		<Property Name="target.WebServer.TcpAccess" Type="Str">c+*</Property>
		<Property Name="target.WebServer.Timeout" Type="Int">60</Property>
		<Property Name="target.WebServer.ViAccess" Type="Str">+*</Property>
		<Property Name="target.webservices.SecurityAPIKey" Type="Str">PqVr/ifkAQh+lVrdPIykXlFvg12GhhQFR8H9cUhphgg=:pTe9HRlQuMfJxAG6QCGq7UvoUpJzAzWGKy5SbZ+roSU=</Property>
		<Property Name="target.webservices.ValidTimestampWindow" Type="Int">15</Property>
		<Item Name="Chassis" Type="cRIO Chassis">
			<Property Name="crio.ProgrammingMode" Type="Str">fpga</Property>
			<Property Name="crio.ResourceID" Type="Str">RIO0</Property>
			<Property Name="crio.Type" Type="Str">cRIO-9035</Property>
			<Property Name="NI.SortType" Type="Int">3</Property>
			<Item Name="Real-Time Scan Resources" Type="Module Container">
				<Property Name="crio.ModuleContainerType" Type="Str">crio.RSIModuleContainer</Property>
			</Item>
			<Item Name="FPGA Target" Type="FPGA Target">
				<Property Name="AutoRun" Type="Bool">false</Property>
				<Property Name="configString.guid" Type="Str">{0FB528BB-E0CE-43EE-ABA0-9A9518BC87A5}NumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool{3AEDE998-ECA0-4943-9CA5-D1918A3A9AE2}resource=/Scan Clock;0;ReadMethodType=bool{50FB2845-05EF-49C9-A45E-6C299D40E345}resource=/Chassis Temperature;0;ReadMethodType=i16{87F44DB2-39EA-4D37-ABEC-A4A74A5DDDEB}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{8AC67632-8400-485D-939E-BF8807046634}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{B33EA400-5FA5-473E-AE55-9D38629DF779}resource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8{DE3DE597-A900-4BB0-A3E5-AE684BEEC12B}"ControlLogic=0;NumberOfElements=1029;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - A in;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"{DED6D7DA-CD8E-4E58-A460-E461DA9EF293}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{FC5AE6C2-7FF7-4614-9F8B-B2657E95CC1E}"ControlLogic=0;NumberOfElements=1023;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - B out;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"cRIO-9035/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9035FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;Chassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO-9035/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9035FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGAFIFO - A in"ControlLogic=0;NumberOfElements=1029;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - A in;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"FIFO - B out"ControlLogic=0;NumberOfElements=1023;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - B out;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"Scan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=boolUSER FPGA LEDresource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8USER Push ButtonNumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool</Property>
				<Property Name="Mode" Type="Int">0</Property>
				<Property Name="NI.LV.FPGA.CompileConfigString" Type="Str">cRIO-9035/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9035FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
				<Property Name="NI.LV.FPGA.Version" Type="Int">6</Property>
				<Property Name="niFpga_TopLevelVIID" Type="Path">/D/github/LabVIEW-FPGA-Array-Based-Linear-Algebra/development_workspace/matrix_inversion_v1.2/polymorphic_VI/target.vi</Property>
				<Property Name="Resource Name" Type="Str">RIO0</Property>
				<Property Name="Target Class" Type="Str">cRIO-9035</Property>
				<Property Name="Top-Level Timing Source" Type="Str">40 MHz Onboard Clock</Property>
				<Property Name="Top-Level Timing Source Is Default" Type="Bool">true</Property>
				<Item Name="Chassis I/O" Type="Folder">
					<Item Name="Chassis Temperature" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Chassis Temperature</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{50FB2845-05EF-49C9-A45E-6C299D40E345}</Property>
					</Item>
					<Item Name="Sleep" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Sleep</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{87F44DB2-39EA-4D37-ABEC-A4A74A5DDDEB}</Property>
					</Item>
					<Item Name="System Reset" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/System Reset</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{DED6D7DA-CD8E-4E58-A460-E461DA9EF293}</Property>
					</Item>
					<Item Name="USER FPGA LED" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/USER FPGA LED</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{B33EA400-5FA5-473E-AE55-9D38629DF779}</Property>
					</Item>
					<Item Name="USER Push Button" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="NumberOfSyncRegistersForReadInProject">
   <Value>0</Value>
   </Attribute>
   <Attribute name="resource">
   <Value>/USER Push Button</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{0FB528BB-E0CE-43EE-ABA0-9A9518BC87A5}</Property>
					</Item>
					<Item Name="Scan Clock" Type="Elemental IO">
						<Property Name="eioAttrBag" Type="Xml"><AttributeSet name="">
   <Attribute name="resource">
   <Value>/Scan Clock</Value>
   </Attribute>
</AttributeSet>
</Property>
						<Property Name="FPGA.PersistentID" Type="Str">{3AEDE998-ECA0-4943-9CA5-D1918A3A9AE2}</Property>
					</Item>
				</Item>
				<Item Name="40 MHz Onboard Clock" Type="FPGA Base Clock">
					<Property Name="FPGA.PersistentID" Type="Str">{8AC67632-8400-485D-939E-BF8807046634}</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig" Type="Str">ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.Accuracy" Type="Dbl">100</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ClockSignalName" Type="Str">Clk40</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxDutyCycle" Type="Dbl">50</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MaxFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinDutyCycle" Type="Dbl">50</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.MinFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.NominalFrequency" Type="Dbl">40000000</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.PeakPeriodJitter" Type="Dbl">250</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.ResourceName" Type="Str">40 MHz Onboard Clock</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.SupportAndRequireRuntimeEnableDisable" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.TopSignalConnect" Type="Str">Clk40</Property>
					<Property Name="NI.LV.FPGA.BaseTSConfig.VariableFrequency" Type="Bool">false</Property>
					<Property Name="NI.LV.FPGA.Valid" Type="Bool">true</Property>
					<Property Name="NI.LV.FPGA.Version" Type="Int">5</Property>
				</Item>
				<Item Name="target.vi" Type="VI" URL="../target.vi">
					<Property Name="configString.guid" Type="Str">{0FB528BB-E0CE-43EE-ABA0-9A9518BC87A5}NumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool{3AEDE998-ECA0-4943-9CA5-D1918A3A9AE2}resource=/Scan Clock;0;ReadMethodType=bool{50FB2845-05EF-49C9-A45E-6C299D40E345}resource=/Chassis Temperature;0;ReadMethodType=i16{87F44DB2-39EA-4D37-ABEC-A4A74A5DDDEB}resource=/Sleep;0;ReadMethodType=bool;WriteMethodType=bool{8AC67632-8400-485D-939E-BF8807046634}ResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;{B33EA400-5FA5-473E-AE55-9D38629DF779}resource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8{DE3DE597-A900-4BB0-A3E5-AE684BEEC12B}"ControlLogic=0;NumberOfElements=1029;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - A in;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"{DED6D7DA-CD8E-4E58-A460-E461DA9EF293}resource=/System Reset;0;ReadMethodType=bool;WriteMethodType=bool{FC5AE6C2-7FF7-4614-9F8B-B2657E95CC1E}"ControlLogic=0;NumberOfElements=1023;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - B out;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"cRIO-9035/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9035FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGA</Property>
					<Property Name="configString.name" Type="Str">40 MHz Onboard ClockResourceName=40 MHz Onboard Clock;TopSignalConnect=Clk40;ClockSignalName=Clk40;MinFreq=40000000.000000;MaxFreq=40000000.000000;VariableFreq=0;NomFreq=40000000.000000;PeakPeriodJitter=250.000000;MinDutyCycle=50.000000;MaxDutyCycle=50.000000;Accuracy=100.000000;RunTime=0;SpreadSpectrum=0;GenericDataHash=D41D8CD98F00B204E9800998ECF8427E;Chassis Temperatureresource=/Chassis Temperature;0;ReadMethodType=i16cRIO-9035/Clk40/falsefalseFPGA_EXECUTION_MODEFPGA_TARGETFPGA_TARGET_CLASSCRIO_9035FPGA_TARGET_FAMILYKINTEX7TARGET_TYPEFPGAFIFO - A in"ControlLogic=0;NumberOfElements=1029;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - A in;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"FIFO - B out"ControlLogic=0;NumberOfElements=1023;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - B out;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"Scan Clockresource=/Scan Clock;0;ReadMethodType=boolSleepresource=/Sleep;0;ReadMethodType=bool;WriteMethodType=boolSystem Resetresource=/System Reset;0;ReadMethodType=bool;WriteMethodType=boolUSER FPGA LEDresource=/USER FPGA LED;0;ReadMethodType=u8;WriteMethodType=u8USER Push ButtonNumberOfSyncRegistersForReadInProject=0;resource=/USER Push Button;0;ReadMethodType=bool</Property>
					<Property Name="NI.LV.FPGA.InterfaceBitfile" Type="Str">D:\github\LabVIEW-FPGA-Array-Based-Linear-Algebra\development_workspace\matrix_inversion_v1.2\polymorphic_VI\FPGA Bitfiles\v1.2_FPGATarget_target_16Q3nfesLdw.lvbitx</Property>
				</Item>
				<Item Name="FIFO - A in" Type="FPGA FIFO">
					<Property Name="Actual Number of Elements" Type="UInt">1029</Property>
					<Property Name="Arbitration for Read" Type="UInt">1</Property>
					<Property Name="Arbitration for Write" Type="UInt">1</Property>
					<Property Name="Control Logic" Type="UInt">0</Property>
					<Property Name="Data Type" Type="UInt">9</Property>
					<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
					<Property Name="fifo.configuration" Type="Str">"ControlLogic=0;NumberOfElements=1029;Type=1;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - A in;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
					<Property Name="fifo.configured" Type="Bool">true</Property>
					<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
					<Property Name="fifo.valid" Type="Bool">true</Property>
					<Property Name="fifo.version" Type="Int">13</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{DE3DE597-A900-4BB0-A3E5-AE684BEEC12B}</Property>
					<Property Name="Local" Type="Bool">false</Property>
					<Property Name="Memory Type" Type="UInt">2</Property>
					<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
					<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
					<Property Name="Requested Number of Elements" Type="UInt">1023</Property>
					<Property Name="Type" Type="UInt">1</Property>
					<Property Name="Type Descriptor" Type="Str">1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000</Property>
				</Item>
				<Item Name="FIFO - B out" Type="FPGA FIFO">
					<Property Name="Actual Number of Elements" Type="UInt">1023</Property>
					<Property Name="Arbitration for Read" Type="UInt">1</Property>
					<Property Name="Arbitration for Write" Type="UInt">1</Property>
					<Property Name="Control Logic" Type="UInt">0</Property>
					<Property Name="Data Type" Type="UInt">9</Property>
					<Property Name="Disable on Overflow/Underflow" Type="Bool">false</Property>
					<Property Name="fifo.configuration" Type="Str">"ControlLogic=0;NumberOfElements=1023;Type=2;ReadArbs=Arbitrate if Multiple Requestors Only;ElementsPerRead=1;WriteArbs=Arbitrate if Multiple Requestors Only;ElementsPerWrite=1;Implementation=2;FIFO - B out;DataType=1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000;DisableOnOverflowUnderflow=FALSE"</Property>
					<Property Name="fifo.configured" Type="Bool">true</Property>
					<Property Name="fifo.projectItemValid" Type="Bool">true</Property>
					<Property Name="fifo.valid" Type="Bool">true</Property>
					<Property Name="fifo.version" Type="Int">13</Property>
					<Property Name="FPGA.PersistentID" Type="Str">{FC5AE6C2-7FF7-4614-9F8B-B2657E95CC1E}</Property>
					<Property Name="Local" Type="Bool">false</Property>
					<Property Name="Memory Type" Type="UInt">2</Property>
					<Property Name="Number Of Elements Per Read" Type="UInt">1</Property>
					<Property Name="Number Of Elements Per Write" Type="UInt">1</Property>
					<Property Name="Requested Number of Elements" Type="UInt">1023</Property>
					<Property Name="Type" Type="UInt">2</Property>
					<Property Name="Type Descriptor" Type="Str">1000800000000001003C005F035100200000000A000100200000000AFFFFFFFF80000000000100200000000A000000007FFFFFFF00000001FFFFFFEB000000000000000100010000000000000000000000000000</Property>
				</Item>
				<Item Name="Dependencies" Type="Dependencies">
					<Item Name="Matrix Inverse.vi" Type="VI" URL="../Matrix Inverse.vi"/>
					<Item Name="1_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_1_matrix_inverse.vi"/>
					<Item Name="1_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_2_matrix_inverse.vi"/>
					<Item Name="1_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_3_matrix_inverse.vi"/>
					<Item Name="1_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_4_matrix_inverse.vi"/>
					<Item Name="1_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_5_matrix_inverse.vi"/>
					<Item Name="1_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_6_matrix_inverse.vi"/>
					<Item Name="1_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_7_matrix_inverse.vi"/>
					<Item Name="1_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_8_matrix_inverse.vi"/>
					<Item Name="1_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_9_matrix_inverse.vi"/>
					<Item Name="1_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_10_matrix_inverse.vi"/>
					<Item Name="1_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_11_matrix_inverse.vi"/>
					<Item Name="1_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_12_matrix_inverse.vi"/>
					<Item Name="1_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_13_matrix_inverse.vi"/>
					<Item Name="1_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_14_matrix_inverse.vi"/>
					<Item Name="1_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_15_matrix_inverse.vi"/>
					<Item Name="1_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/1_16_matrix_inverse.vi"/>
					<Item Name="2_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_1_matrix_inverse.vi"/>
					<Item Name="2_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_2_matrix_inverse.vi"/>
					<Item Name="2_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_3_matrix_inverse.vi"/>
					<Item Name="2_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_4_matrix_inverse.vi"/>
					<Item Name="2_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_5_matrix_inverse.vi"/>
					<Item Name="2_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_6_matrix_inverse.vi"/>
					<Item Name="2_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_7_matrix_inverse.vi"/>
					<Item Name="2_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_8_matrix_inverse.vi"/>
					<Item Name="2_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_9_matrix_inverse.vi"/>
					<Item Name="2_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_10_matrix_inverse.vi"/>
					<Item Name="2_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_11_matrix_inverse.vi"/>
					<Item Name="2_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_12_matrix_inverse.vi"/>
					<Item Name="2_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_13_matrix_inverse.vi"/>
					<Item Name="2_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_14_matrix_inverse.vi"/>
					<Item Name="2_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_15_matrix_inverse.vi"/>
					<Item Name="2_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/2_16_matrix_inverse.vi"/>
					<Item Name="3_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_1_matrix_inverse.vi"/>
					<Item Name="3_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_2_matrix_inverse.vi"/>
					<Item Name="3_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_3_matrix_inverse.vi"/>
					<Item Name="3_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_4_matrix_inverse.vi"/>
					<Item Name="3_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_5_matrix_inverse.vi"/>
					<Item Name="3_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_6_matrix_inverse.vi"/>
					<Item Name="3_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_7_matrix_inverse.vi"/>
					<Item Name="3_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_8_matrix_inverse.vi"/>
					<Item Name="3_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_9_matrix_inverse.vi"/>
					<Item Name="3_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_10_matrix_inverse.vi"/>
					<Item Name="3_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_11_matrix_inverse.vi"/>
					<Item Name="3_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_12_matrix_inverse.vi"/>
					<Item Name="3_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_13_matrix_inverse.vi"/>
					<Item Name="3_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_14_matrix_inverse.vi"/>
					<Item Name="3_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_15_matrix_inverse.vi"/>
					<Item Name="3_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/3_16_matrix_inverse.vi"/>
					<Item Name="4_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_1_matrix_inverse.vi"/>
					<Item Name="4_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_2_matrix_inverse.vi"/>
					<Item Name="4_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_3_matrix_inverse.vi"/>
					<Item Name="4_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_4_matrix_inverse.vi"/>
					<Item Name="4_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_5_matrix_inverse.vi"/>
					<Item Name="4_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_6_matrix_inverse.vi"/>
					<Item Name="4_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_7_matrix_inverse.vi"/>
					<Item Name="4_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_8_matrix_inverse.vi"/>
					<Item Name="4_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_9_matrix_inverse.vi"/>
					<Item Name="4_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_10_matrix_inverse.vi"/>
					<Item Name="4_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_11_matrix_inverse.vi"/>
					<Item Name="4_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_12_matrix_inverse.vi"/>
					<Item Name="4_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_13_matrix_inverse.vi"/>
					<Item Name="4_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_14_matrix_inverse.vi"/>
					<Item Name="4_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_15_matrix_inverse.vi"/>
					<Item Name="4_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/4_16_matrix_inverse.vi"/>
					<Item Name="5_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_1_matrix_inverse.vi"/>
					<Item Name="5_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_2_matrix_inverse.vi"/>
					<Item Name="5_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_3_matrix_inverse.vi"/>
					<Item Name="5_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_4_matrix_inverse.vi"/>
					<Item Name="5_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_5_matrix_inverse.vi"/>
					<Item Name="5_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_6_matrix_inverse.vi"/>
					<Item Name="5_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_7_matrix_inverse.vi"/>
					<Item Name="5_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_8_matrix_inverse.vi"/>
					<Item Name="5_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_9_matrix_inverse.vi"/>
					<Item Name="5_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_10_matrix_inverse.vi"/>
					<Item Name="5_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_11_matrix_inverse.vi"/>
					<Item Name="5_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_12_matrix_inverse.vi"/>
					<Item Name="5_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_13_matrix_inverse.vi"/>
					<Item Name="5_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_14_matrix_inverse.vi"/>
					<Item Name="5_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_15_matrix_inverse.vi"/>
					<Item Name="5_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/5_16_matrix_inverse.vi"/>
					<Item Name="6_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_1_matrix_inverse.vi"/>
					<Item Name="6_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_2_matrix_inverse.vi"/>
					<Item Name="6_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_3_matrix_inverse.vi"/>
					<Item Name="6_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_4_matrix_inverse.vi"/>
					<Item Name="6_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_5_matrix_inverse.vi"/>
					<Item Name="6_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_6_matrix_inverse.vi"/>
					<Item Name="6_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_7_matrix_inverse.vi"/>
					<Item Name="6_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_8_matrix_inverse.vi"/>
					<Item Name="6_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_9_matrix_inverse.vi"/>
					<Item Name="6_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_10_matrix_inverse.vi"/>
					<Item Name="6_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_11_matrix_inverse.vi"/>
					<Item Name="6_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_12_matrix_inverse.vi"/>
					<Item Name="6_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_13_matrix_inverse.vi"/>
					<Item Name="6_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_14_matrix_inverse.vi"/>
					<Item Name="6_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_15_matrix_inverse.vi"/>
					<Item Name="6_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/6_16_matrix_inverse.vi"/>
					<Item Name="7_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_1_matrix_inverse.vi"/>
					<Item Name="7_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_2_matrix_inverse.vi"/>
					<Item Name="7_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_3_matrix_inverse.vi"/>
					<Item Name="7_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_4_matrix_inverse.vi"/>
					<Item Name="7_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_5_matrix_inverse.vi"/>
					<Item Name="7_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_6_matrix_inverse.vi"/>
					<Item Name="7_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_7_matrix_inverse.vi"/>
					<Item Name="7_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_8_matrix_inverse.vi"/>
					<Item Name="7_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_9_matrix_inverse.vi"/>
					<Item Name="7_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_10_matrix_inverse.vi"/>
					<Item Name="7_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_11_matrix_inverse.vi"/>
					<Item Name="7_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_12_matrix_inverse.vi"/>
					<Item Name="7_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_13_matrix_inverse.vi"/>
					<Item Name="7_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_14_matrix_inverse.vi"/>
					<Item Name="7_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_15_matrix_inverse.vi"/>
					<Item Name="7_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/7_16_matrix_inverse.vi"/>
					<Item Name="8_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_1_matrix_inverse.vi"/>
					<Item Name="8_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_2_matrix_inverse.vi"/>
					<Item Name="8_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_3_matrix_inverse.vi"/>
					<Item Name="8_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_4_matrix_inverse.vi"/>
					<Item Name="8_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_5_matrix_inverse.vi"/>
					<Item Name="8_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_6_matrix_inverse.vi"/>
					<Item Name="8_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_7_matrix_inverse.vi"/>
					<Item Name="8_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_8_matrix_inverse.vi"/>
					<Item Name="8_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_9_matrix_inverse.vi"/>
					<Item Name="8_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_10_matrix_inverse.vi"/>
					<Item Name="8_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_11_matrix_inverse.vi"/>
					<Item Name="8_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_12_matrix_inverse.vi"/>
					<Item Name="8_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_13_matrix_inverse.vi"/>
					<Item Name="8_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_14_matrix_inverse.vi"/>
					<Item Name="8_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_15_matrix_inverse.vi"/>
					<Item Name="8_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/8_16_matrix_inverse.vi"/>
					<Item Name="9_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_1_matrix_inverse.vi"/>
					<Item Name="9_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_2_matrix_inverse.vi"/>
					<Item Name="9_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_3_matrix_inverse.vi"/>
					<Item Name="9_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_4_matrix_inverse.vi"/>
					<Item Name="9_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_5_matrix_inverse.vi"/>
					<Item Name="9_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_6_matrix_inverse.vi"/>
					<Item Name="9_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_7_matrix_inverse.vi"/>
					<Item Name="9_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_8_matrix_inverse.vi"/>
					<Item Name="9_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_9_matrix_inverse.vi"/>
					<Item Name="9_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_10_matrix_inverse.vi"/>
					<Item Name="9_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_11_matrix_inverse.vi"/>
					<Item Name="9_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_12_matrix_inverse.vi"/>
					<Item Name="9_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_13_matrix_inverse.vi"/>
					<Item Name="9_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_14_matrix_inverse.vi"/>
					<Item Name="9_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_15_matrix_inverse.vi"/>
					<Item Name="9_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/9_16_matrix_inverse.vi"/>
					<Item Name="10_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_1_matrix_inverse.vi"/>
					<Item Name="10_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_2_matrix_inverse.vi"/>
					<Item Name="10_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_3_matrix_inverse.vi"/>
					<Item Name="10_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_4_matrix_inverse.vi"/>
					<Item Name="10_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_5_matrix_inverse.vi"/>
					<Item Name="10_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_6_matrix_inverse.vi"/>
					<Item Name="10_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_7_matrix_inverse.vi"/>
					<Item Name="10_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_8_matrix_inverse.vi"/>
					<Item Name="10_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_9_matrix_inverse.vi"/>
					<Item Name="10_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_10_matrix_inverse.vi"/>
					<Item Name="10_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_11_matrix_inverse.vi"/>
					<Item Name="10_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_12_matrix_inverse.vi"/>
					<Item Name="10_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_13_matrix_inverse.vi"/>
					<Item Name="10_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_14_matrix_inverse.vi"/>
					<Item Name="10_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_15_matrix_inverse.vi"/>
					<Item Name="10_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/10_16_matrix_inverse.vi"/>
					<Item Name="11_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_1_matrix_inverse.vi"/>
					<Item Name="11_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_2_matrix_inverse.vi"/>
					<Item Name="11_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_3_matrix_inverse.vi"/>
					<Item Name="11_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_4_matrix_inverse.vi"/>
					<Item Name="11_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_5_matrix_inverse.vi"/>
					<Item Name="11_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_6_matrix_inverse.vi"/>
					<Item Name="11_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_7_matrix_inverse.vi"/>
					<Item Name="11_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_8_matrix_inverse.vi"/>
					<Item Name="11_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_9_matrix_inverse.vi"/>
					<Item Name="11_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_10_matrix_inverse.vi"/>
					<Item Name="11_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_11_matrix_inverse.vi"/>
					<Item Name="11_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_12_matrix_inverse.vi"/>
					<Item Name="11_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_13_matrix_inverse.vi"/>
					<Item Name="11_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_14_matrix_inverse.vi"/>
					<Item Name="11_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_15_matrix_inverse.vi"/>
					<Item Name="11_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/11_16_matrix_inverse.vi"/>
					<Item Name="12_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_1_matrix_inverse.vi"/>
					<Item Name="12_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_2_matrix_inverse.vi"/>
					<Item Name="12_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_3_matrix_inverse.vi"/>
					<Item Name="12_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_4_matrix_inverse.vi"/>
					<Item Name="12_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_5_matrix_inverse.vi"/>
					<Item Name="12_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_6_matrix_inverse.vi"/>
					<Item Name="12_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_7_matrix_inverse.vi"/>
					<Item Name="12_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_8_matrix_inverse.vi"/>
					<Item Name="12_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_9_matrix_inverse.vi"/>
					<Item Name="12_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_10_matrix_inverse.vi"/>
					<Item Name="12_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_11_matrix_inverse.vi"/>
					<Item Name="12_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_12_matrix_inverse.vi"/>
					<Item Name="12_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_13_matrix_inverse.vi"/>
					<Item Name="12_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_14_matrix_inverse.vi"/>
					<Item Name="12_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_15_matrix_inverse.vi"/>
					<Item Name="12_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/12_16_matrix_inverse.vi"/>
					<Item Name="13_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_1_matrix_inverse.vi"/>
					<Item Name="13_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_2_matrix_inverse.vi"/>
					<Item Name="13_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_3_matrix_inverse.vi"/>
					<Item Name="13_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_4_matrix_inverse.vi"/>
					<Item Name="13_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_5_matrix_inverse.vi"/>
					<Item Name="13_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_6_matrix_inverse.vi"/>
					<Item Name="13_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_7_matrix_inverse.vi"/>
					<Item Name="13_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_8_matrix_inverse.vi"/>
					<Item Name="13_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_9_matrix_inverse.vi"/>
					<Item Name="13_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_10_matrix_inverse.vi"/>
					<Item Name="13_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_11_matrix_inverse.vi"/>
					<Item Name="13_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_12_matrix_inverse.vi"/>
					<Item Name="13_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_13_matrix_inverse.vi"/>
					<Item Name="13_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_14_matrix_inverse.vi"/>
					<Item Name="13_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_15_matrix_inverse.vi"/>
					<Item Name="13_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/13_16_matrix_inverse.vi"/>
					<Item Name="14_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_1_matrix_inverse.vi"/>
					<Item Name="14_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_2_matrix_inverse.vi"/>
					<Item Name="14_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_3_matrix_inverse.vi"/>
					<Item Name="14_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_4_matrix_inverse.vi"/>
					<Item Name="14_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_5_matrix_inverse.vi"/>
					<Item Name="14_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_6_matrix_inverse.vi"/>
					<Item Name="14_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_7_matrix_inverse.vi"/>
					<Item Name="14_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_8_matrix_inverse.vi"/>
					<Item Name="14_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_9_matrix_inverse.vi"/>
					<Item Name="14_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_10_matrix_inverse.vi"/>
					<Item Name="14_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_11_matrix_inverse.vi"/>
					<Item Name="14_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_12_matrix_inverse.vi"/>
					<Item Name="14_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_13_matrix_inverse.vi"/>
					<Item Name="14_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_14_matrix_inverse.vi"/>
					<Item Name="14_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_15_matrix_inverse.vi"/>
					<Item Name="14_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/14_16_matrix_inverse.vi"/>
					<Item Name="15_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_1_matrix_inverse.vi"/>
					<Item Name="15_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_2_matrix_inverse.vi"/>
					<Item Name="15_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_3_matrix_inverse.vi"/>
					<Item Name="15_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_4_matrix_inverse.vi"/>
					<Item Name="15_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_5_matrix_inverse.vi"/>
					<Item Name="15_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_6_matrix_inverse.vi"/>
					<Item Name="15_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_7_matrix_inverse.vi"/>
					<Item Name="15_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_8_matrix_inverse.vi"/>
					<Item Name="15_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_9_matrix_inverse.vi"/>
					<Item Name="15_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_10_matrix_inverse.vi"/>
					<Item Name="15_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_11_matrix_inverse.vi"/>
					<Item Name="15_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_12_matrix_inverse.vi"/>
					<Item Name="15_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_13_matrix_inverse.vi"/>
					<Item Name="15_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_14_matrix_inverse.vi"/>
					<Item Name="15_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_15_matrix_inverse.vi"/>
					<Item Name="15_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/15_16_matrix_inverse.vi"/>
					<Item Name="16_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_1_matrix_inverse.vi"/>
					<Item Name="16_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_2_matrix_inverse.vi"/>
					<Item Name="16_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_3_matrix_inverse.vi"/>
					<Item Name="16_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_4_matrix_inverse.vi"/>
					<Item Name="16_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_5_matrix_inverse.vi"/>
					<Item Name="16_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_6_matrix_inverse.vi"/>
					<Item Name="16_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_7_matrix_inverse.vi"/>
					<Item Name="16_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_8_matrix_inverse.vi"/>
					<Item Name="16_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_9_matrix_inverse.vi"/>
					<Item Name="16_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_10_matrix_inverse.vi"/>
					<Item Name="16_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_11_matrix_inverse.vi"/>
					<Item Name="16_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_12_matrix_inverse.vi"/>
					<Item Name="16_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_13_matrix_inverse.vi"/>
					<Item Name="16_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_14_matrix_inverse.vi"/>
					<Item Name="16_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_15_matrix_inverse.vi"/>
					<Item Name="16_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/16_16_matrix_inverse.vi"/>
					<Item Name="17_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_1_matrix_inverse.vi"/>
					<Item Name="17_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_2_matrix_inverse.vi"/>
					<Item Name="17_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_3_matrix_inverse.vi"/>
					<Item Name="17_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_4_matrix_inverse.vi"/>
					<Item Name="17_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_5_matrix_inverse.vi"/>
					<Item Name="17_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_6_matrix_inverse.vi"/>
					<Item Name="17_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_7_matrix_inverse.vi"/>
					<Item Name="17_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_8_matrix_inverse.vi"/>
					<Item Name="17_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_9_matrix_inverse.vi"/>
					<Item Name="17_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_10_matrix_inverse.vi"/>
					<Item Name="17_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_11_matrix_inverse.vi"/>
					<Item Name="17_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_12_matrix_inverse.vi"/>
					<Item Name="17_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_13_matrix_inverse.vi"/>
					<Item Name="17_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_14_matrix_inverse.vi"/>
					<Item Name="17_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_15_matrix_inverse.vi"/>
					<Item Name="17_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/17_16_matrix_inverse.vi"/>
					<Item Name="18_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_1_matrix_inverse.vi"/>
					<Item Name="18_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_2_matrix_inverse.vi"/>
					<Item Name="18_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_3_matrix_inverse.vi"/>
					<Item Name="18_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_4_matrix_inverse.vi"/>
					<Item Name="18_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_5_matrix_inverse.vi"/>
					<Item Name="18_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_6_matrix_inverse.vi"/>
					<Item Name="18_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_7_matrix_inverse.vi"/>
					<Item Name="18_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_8_matrix_inverse.vi"/>
					<Item Name="18_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_9_matrix_inverse.vi"/>
					<Item Name="18_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_10_matrix_inverse.vi"/>
					<Item Name="18_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_11_matrix_inverse.vi"/>
					<Item Name="18_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_12_matrix_inverse.vi"/>
					<Item Name="18_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_13_matrix_inverse.vi"/>
					<Item Name="18_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_14_matrix_inverse.vi"/>
					<Item Name="18_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_15_matrix_inverse.vi"/>
					<Item Name="18_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/18_16_matrix_inverse.vi"/>
					<Item Name="19_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_1_matrix_inverse.vi"/>
					<Item Name="19_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_2_matrix_inverse.vi"/>
					<Item Name="19_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_3_matrix_inverse.vi"/>
					<Item Name="19_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_4_matrix_inverse.vi"/>
					<Item Name="19_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_5_matrix_inverse.vi"/>
					<Item Name="19_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_6_matrix_inverse.vi"/>
					<Item Name="19_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_7_matrix_inverse.vi"/>
					<Item Name="19_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_8_matrix_inverse.vi"/>
					<Item Name="19_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_9_matrix_inverse.vi"/>
					<Item Name="19_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_10_matrix_inverse.vi"/>
					<Item Name="19_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_11_matrix_inverse.vi"/>
					<Item Name="19_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_12_matrix_inverse.vi"/>
					<Item Name="19_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_13_matrix_inverse.vi"/>
					<Item Name="19_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_14_matrix_inverse.vi"/>
					<Item Name="19_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_15_matrix_inverse.vi"/>
					<Item Name="19_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/19_16_matrix_inverse.vi"/>
					<Item Name="20_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_1_matrix_inverse.vi"/>
					<Item Name="20_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_2_matrix_inverse.vi"/>
					<Item Name="20_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_3_matrix_inverse.vi"/>
					<Item Name="20_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_4_matrix_inverse.vi"/>
					<Item Name="20_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_5_matrix_inverse.vi"/>
					<Item Name="20_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_6_matrix_inverse.vi"/>
					<Item Name="20_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_7_matrix_inverse.vi"/>
					<Item Name="20_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_8_matrix_inverse.vi"/>
					<Item Name="20_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_9_matrix_inverse.vi"/>
					<Item Name="20_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_10_matrix_inverse.vi"/>
					<Item Name="20_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_11_matrix_inverse.vi"/>
					<Item Name="20_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_12_matrix_inverse.vi"/>
					<Item Name="20_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_13_matrix_inverse.vi"/>
					<Item Name="20_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_14_matrix_inverse.vi"/>
					<Item Name="20_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_15_matrix_inverse.vi"/>
					<Item Name="20_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/20_16_matrix_inverse.vi"/>
					<Item Name="21_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_1_matrix_inverse.vi"/>
					<Item Name="21_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_2_matrix_inverse.vi"/>
					<Item Name="21_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_3_matrix_inverse.vi"/>
					<Item Name="21_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_4_matrix_inverse.vi"/>
					<Item Name="21_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_5_matrix_inverse.vi"/>
					<Item Name="21_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_6_matrix_inverse.vi"/>
					<Item Name="21_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_7_matrix_inverse.vi"/>
					<Item Name="21_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_8_matrix_inverse.vi"/>
					<Item Name="21_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_9_matrix_inverse.vi"/>
					<Item Name="21_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_10_matrix_inverse.vi"/>
					<Item Name="21_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_11_matrix_inverse.vi"/>
					<Item Name="21_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_12_matrix_inverse.vi"/>
					<Item Name="21_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_13_matrix_inverse.vi"/>
					<Item Name="21_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_14_matrix_inverse.vi"/>
					<Item Name="21_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_15_matrix_inverse.vi"/>
					<Item Name="21_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/21_16_matrix_inverse.vi"/>
					<Item Name="22_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_1_matrix_inverse.vi"/>
					<Item Name="22_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_2_matrix_inverse.vi"/>
					<Item Name="22_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_3_matrix_inverse.vi"/>
					<Item Name="22_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_4_matrix_inverse.vi"/>
					<Item Name="22_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_5_matrix_inverse.vi"/>
					<Item Name="22_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_6_matrix_inverse.vi"/>
					<Item Name="22_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_7_matrix_inverse.vi"/>
					<Item Name="22_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_8_matrix_inverse.vi"/>
					<Item Name="22_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_9_matrix_inverse.vi"/>
					<Item Name="22_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_10_matrix_inverse.vi"/>
					<Item Name="22_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_11_matrix_inverse.vi"/>
					<Item Name="22_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_12_matrix_inverse.vi"/>
					<Item Name="22_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_13_matrix_inverse.vi"/>
					<Item Name="22_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_14_matrix_inverse.vi"/>
					<Item Name="22_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_15_matrix_inverse.vi"/>
					<Item Name="22_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/22_16_matrix_inverse.vi"/>
					<Item Name="23_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_1_matrix_inverse.vi"/>
					<Item Name="23_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_2_matrix_inverse.vi"/>
					<Item Name="23_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_3_matrix_inverse.vi"/>
					<Item Name="23_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_4_matrix_inverse.vi"/>
					<Item Name="23_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_5_matrix_inverse.vi"/>
					<Item Name="23_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_6_matrix_inverse.vi"/>
					<Item Name="23_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_7_matrix_inverse.vi"/>
					<Item Name="23_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_8_matrix_inverse.vi"/>
					<Item Name="23_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_9_matrix_inverse.vi"/>
					<Item Name="23_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_10_matrix_inverse.vi"/>
					<Item Name="23_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_11_matrix_inverse.vi"/>
					<Item Name="23_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_12_matrix_inverse.vi"/>
					<Item Name="23_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_13_matrix_inverse.vi"/>
					<Item Name="23_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_14_matrix_inverse.vi"/>
					<Item Name="23_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_15_matrix_inverse.vi"/>
					<Item Name="23_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/23_16_matrix_inverse.vi"/>
					<Item Name="24_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_1_matrix_inverse.vi"/>
					<Item Name="24_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_2_matrix_inverse.vi"/>
					<Item Name="24_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_3_matrix_inverse.vi"/>
					<Item Name="24_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_4_matrix_inverse.vi"/>
					<Item Name="24_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_5_matrix_inverse.vi"/>
					<Item Name="24_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_6_matrix_inverse.vi"/>
					<Item Name="24_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_7_matrix_inverse.vi"/>
					<Item Name="24_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_8_matrix_inverse.vi"/>
					<Item Name="24_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_9_matrix_inverse.vi"/>
					<Item Name="24_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_10_matrix_inverse.vi"/>
					<Item Name="24_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_11_matrix_inverse.vi"/>
					<Item Name="24_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_12_matrix_inverse.vi"/>
					<Item Name="24_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_13_matrix_inverse.vi"/>
					<Item Name="24_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_14_matrix_inverse.vi"/>
					<Item Name="24_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_15_matrix_inverse.vi"/>
					<Item Name="24_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/24_16_matrix_inverse.vi"/>
					<Item Name="25_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_1_matrix_inverse.vi"/>
					<Item Name="25_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_2_matrix_inverse.vi"/>
					<Item Name="25_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_3_matrix_inverse.vi"/>
					<Item Name="25_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_4_matrix_inverse.vi"/>
					<Item Name="25_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_5_matrix_inverse.vi"/>
					<Item Name="25_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_6_matrix_inverse.vi"/>
					<Item Name="25_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_7_matrix_inverse.vi"/>
					<Item Name="25_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_8_matrix_inverse.vi"/>
					<Item Name="25_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_9_matrix_inverse.vi"/>
					<Item Name="25_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_10_matrix_inverse.vi"/>
					<Item Name="25_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_11_matrix_inverse.vi"/>
					<Item Name="25_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_12_matrix_inverse.vi"/>
					<Item Name="25_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_13_matrix_inverse.vi"/>
					<Item Name="25_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_14_matrix_inverse.vi"/>
					<Item Name="25_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_15_matrix_inverse.vi"/>
					<Item Name="25_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/25_16_matrix_inverse.vi"/>
					<Item Name="26_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_1_matrix_inverse.vi"/>
					<Item Name="26_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_2_matrix_inverse.vi"/>
					<Item Name="26_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_3_matrix_inverse.vi"/>
					<Item Name="26_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_4_matrix_inverse.vi"/>
					<Item Name="26_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_5_matrix_inverse.vi"/>
					<Item Name="26_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_6_matrix_inverse.vi"/>
					<Item Name="26_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_7_matrix_inverse.vi"/>
					<Item Name="26_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_8_matrix_inverse.vi"/>
					<Item Name="26_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_9_matrix_inverse.vi"/>
					<Item Name="26_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_10_matrix_inverse.vi"/>
					<Item Name="26_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_11_matrix_inverse.vi"/>
					<Item Name="26_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_12_matrix_inverse.vi"/>
					<Item Name="26_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_13_matrix_inverse.vi"/>
					<Item Name="26_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_14_matrix_inverse.vi"/>
					<Item Name="26_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_15_matrix_inverse.vi"/>
					<Item Name="26_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/26_16_matrix_inverse.vi"/>
					<Item Name="27_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_1_matrix_inverse.vi"/>
					<Item Name="27_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_2_matrix_inverse.vi"/>
					<Item Name="27_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_3_matrix_inverse.vi"/>
					<Item Name="27_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_4_matrix_inverse.vi"/>
					<Item Name="27_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_5_matrix_inverse.vi"/>
					<Item Name="27_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_6_matrix_inverse.vi"/>
					<Item Name="27_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_7_matrix_inverse.vi"/>
					<Item Name="27_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_8_matrix_inverse.vi"/>
					<Item Name="27_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_9_matrix_inverse.vi"/>
					<Item Name="27_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_10_matrix_inverse.vi"/>
					<Item Name="27_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_11_matrix_inverse.vi"/>
					<Item Name="27_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_12_matrix_inverse.vi"/>
					<Item Name="27_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_13_matrix_inverse.vi"/>
					<Item Name="27_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_14_matrix_inverse.vi"/>
					<Item Name="27_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_15_matrix_inverse.vi"/>
					<Item Name="27_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/27_16_matrix_inverse.vi"/>
					<Item Name="28_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_1_matrix_inverse.vi"/>
					<Item Name="28_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_2_matrix_inverse.vi"/>
					<Item Name="28_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_3_matrix_inverse.vi"/>
					<Item Name="28_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_4_matrix_inverse.vi"/>
					<Item Name="28_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_5_matrix_inverse.vi"/>
					<Item Name="28_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_6_matrix_inverse.vi"/>
					<Item Name="28_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_7_matrix_inverse.vi"/>
					<Item Name="28_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_8_matrix_inverse.vi"/>
					<Item Name="28_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_9_matrix_inverse.vi"/>
					<Item Name="28_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_10_matrix_inverse.vi"/>
					<Item Name="28_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_11_matrix_inverse.vi"/>
					<Item Name="28_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_12_matrix_inverse.vi"/>
					<Item Name="28_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_13_matrix_inverse.vi"/>
					<Item Name="28_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_14_matrix_inverse.vi"/>
					<Item Name="28_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_15_matrix_inverse.vi"/>
					<Item Name="28_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/28_16_matrix_inverse.vi"/>
					<Item Name="29_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_1_matrix_inverse.vi"/>
					<Item Name="29_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_2_matrix_inverse.vi"/>
					<Item Name="29_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_3_matrix_inverse.vi"/>
					<Item Name="29_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_4_matrix_inverse.vi"/>
					<Item Name="29_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_5_matrix_inverse.vi"/>
					<Item Name="29_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_6_matrix_inverse.vi"/>
					<Item Name="29_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_7_matrix_inverse.vi"/>
					<Item Name="29_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_8_matrix_inverse.vi"/>
					<Item Name="29_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_9_matrix_inverse.vi"/>
					<Item Name="29_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_10_matrix_inverse.vi"/>
					<Item Name="29_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_11_matrix_inverse.vi"/>
					<Item Name="29_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_12_matrix_inverse.vi"/>
					<Item Name="29_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_13_matrix_inverse.vi"/>
					<Item Name="29_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_14_matrix_inverse.vi"/>
					<Item Name="29_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_15_matrix_inverse.vi"/>
					<Item Name="29_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/29_16_matrix_inverse.vi"/>
					<Item Name="30_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_1_matrix_inverse.vi"/>
					<Item Name="30_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_2_matrix_inverse.vi"/>
					<Item Name="30_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_3_matrix_inverse.vi"/>
					<Item Name="30_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_4_matrix_inverse.vi"/>
					<Item Name="30_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_5_matrix_inverse.vi"/>
					<Item Name="30_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_6_matrix_inverse.vi"/>
					<Item Name="30_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_7_matrix_inverse.vi"/>
					<Item Name="30_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_8_matrix_inverse.vi"/>
					<Item Name="30_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_9_matrix_inverse.vi"/>
					<Item Name="30_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_10_matrix_inverse.vi"/>
					<Item Name="30_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_11_matrix_inverse.vi"/>
					<Item Name="30_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_12_matrix_inverse.vi"/>
					<Item Name="30_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_13_matrix_inverse.vi"/>
					<Item Name="30_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_14_matrix_inverse.vi"/>
					<Item Name="30_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_15_matrix_inverse.vi"/>
					<Item Name="30_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/30_16_matrix_inverse.vi"/>
					<Item Name="31_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_1_matrix_inverse.vi"/>
					<Item Name="31_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_2_matrix_inverse.vi"/>
					<Item Name="31_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_3_matrix_inverse.vi"/>
					<Item Name="31_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_4_matrix_inverse.vi"/>
					<Item Name="31_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_5_matrix_inverse.vi"/>
					<Item Name="31_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_6_matrix_inverse.vi"/>
					<Item Name="31_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_7_matrix_inverse.vi"/>
					<Item Name="31_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_8_matrix_inverse.vi"/>
					<Item Name="31_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_9_matrix_inverse.vi"/>
					<Item Name="31_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_10_matrix_inverse.vi"/>
					<Item Name="31_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_11_matrix_inverse.vi"/>
					<Item Name="31_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_12_matrix_inverse.vi"/>
					<Item Name="31_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_13_matrix_inverse.vi"/>
					<Item Name="31_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_14_matrix_inverse.vi"/>
					<Item Name="31_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_15_matrix_inverse.vi"/>
					<Item Name="31_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/31_16_matrix_inverse.vi"/>
					<Item Name="32_1_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_1_matrix_inverse.vi"/>
					<Item Name="32_2_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_2_matrix_inverse.vi"/>
					<Item Name="32_3_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_3_matrix_inverse.vi"/>
					<Item Name="32_4_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_4_matrix_inverse.vi"/>
					<Item Name="32_5_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_5_matrix_inverse.vi"/>
					<Item Name="32_6_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_6_matrix_inverse.vi"/>
					<Item Name="32_7_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_7_matrix_inverse.vi"/>
					<Item Name="32_8_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_8_matrix_inverse.vi"/>
					<Item Name="32_9_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_9_matrix_inverse.vi"/>
					<Item Name="32_10_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_10_matrix_inverse.vi"/>
					<Item Name="32_11_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_11_matrix_inverse.vi"/>
					<Item Name="32_12_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_12_matrix_inverse.vi"/>
					<Item Name="32_13_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_13_matrix_inverse.vi"/>
					<Item Name="32_14_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_14_matrix_inverse.vi"/>
					<Item Name="32_15_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_15_matrix_inverse.vi"/>
					<Item Name="32_16_matrix_inverse.vi" Type="VI" URL="../matrix_inverse_VIs/32_16_matrix_inverse.vi"/>
					<Item Name="matrix_inverse_SGL.vi" Type="VI" URL="../matrix_inverse_SGL.vi"/>
				</Item>
				<Item Name="Build Specifications" Type="Build">
					<Item Name="target" Type="{F4C5E96F-7410-48A5-BB87-3559BC9B167F}">
						<Property Name="AllowEnableRemoval" Type="Bool">false</Property>
						<Property Name="BuildSpecDecription" Type="Str"></Property>
						<Property Name="BuildSpecName" Type="Str">target</Property>
						<Property Name="Comp.BitfileName" Type="Str">v1.2_FPGATarget_target_mWbbjvpzfsI.lvbitx</Property>
						<Property Name="Comp.CustomXilinxParameters" Type="Str"></Property>
						<Property Name="Comp.MaxFanout" Type="Int">-1</Property>
						<Property Name="Comp.RandomSeed" Type="Bool">false</Property>
						<Property Name="Comp.Version.Build" Type="Int">0</Property>
						<Property Name="Comp.Version.Fix" Type="Int">0</Property>
						<Property Name="Comp.Version.Major" Type="Int">1</Property>
						<Property Name="Comp.Version.Minor" Type="Int">0</Property>
						<Property Name="Comp.VersionAutoIncrement" Type="Bool">false</Property>
						<Property Name="Comp.Vivado.EnableMultiThreading" Type="Bool">true</Property>
						<Property Name="Comp.Vivado.OptDirective" Type="Str"></Property>
						<Property Name="Comp.Vivado.PhysOptDirective" Type="Str"></Property>
						<Property Name="Comp.Vivado.PlaceDirective" Type="Str"></Property>
						<Property Name="Comp.Vivado.RouteDirective" Type="Str"></Property>
						<Property Name="Comp.Vivado.RunPowerOpt" Type="Bool">false</Property>
						<Property Name="Comp.Vivado.Strategy" Type="Str">Default</Property>
						<Property Name="Comp.Xilinx.DesignStrategy" Type="Str">balanced</Property>
						<Property Name="Comp.Xilinx.MapEffort" Type="Str">default(noTiming)</Property>
						<Property Name="Comp.Xilinx.ParEffort" Type="Str">standard</Property>
						<Property Name="Comp.Xilinx.SynthEffort" Type="Str">normal</Property>
						<Property Name="Comp.Xilinx.SynthGoal" Type="Str">speed</Property>
						<Property Name="Comp.Xilinx.UseRecommended" Type="Bool">true</Property>
						<Property Name="DefaultBuildSpec" Type="Bool">true</Property>
						<Property Name="DestinationDirectory" Type="Path">FPGA Bitfiles</Property>
						<Property Name="NI.LV.FPGA.LastCompiledBitfilePath" Type="Path">/D/github/LabVIEW-FPGA-Array-Based-Linear-Algebra/development_workspace/matrix_inversion_v1.2/polymorphic_VI/FPGA Bitfiles/v1.2_FPGATarget_target_16Q3nfesLdw.lvbitx</Property>
						<Property Name="NI.LV.FPGA.LastCompiledBitfilePathRelativeToProject" Type="Path">FPGA Bitfiles/v1.2_FPGATarget_target_16Q3nfesLdw.lvbitx</Property>
						<Property Name="ProjectPath" Type="Path">/D/github/LabVIEW-FPGA-Array-Based-Linear-Algebra/development_workspace/v1.2/LabVIEW_FPGA/v1.2.lvproj</Property>
						<Property Name="RelativePath" Type="Bool">true</Property>
						<Property Name="RunWhenLoaded" Type="Bool">false</Property>
						<Property Name="SupportDownload" Type="Bool">true</Property>
						<Property Name="SupportResourceEstimation" Type="Bool">false</Property>
						<Property Name="TargetName" Type="Str">FPGA Target</Property>
						<Property Name="TopLevelVI" Type="Ref">/NI-cRIO-9035-01B68DEF/Chassis/FPGA Target/target.vi</Property>
					</Item>
				</Item>
			</Item>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
