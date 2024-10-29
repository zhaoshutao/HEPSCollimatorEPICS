#!../../bin/linux-x86_64/CollimatorControl

#- You may have to change CollimatorControl to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/CollimatorControl.dbd"
CollimatorControl_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/user.substitutions"
dbLoadRecords "db/CollimatorControlVersion.db", "user=balmy"
dbLoadRecords "db/dbSubExample.db", "user=balmy"

##
##R03
##
# use the following commands for TCP/IP
drvAsynIPPortConfigure("R03CLM", "10.7.70.30:502",0,0,1)
modbusInterposeConfig("R03CLM", 0,2000, 0)

#drvModbusAsynConfigure("portName", 	"tcpPortName",		slaveAddress,	modbusFunction,		modbusStartAddress,	 modbusLength,		dataType,		pollMsec,	"plcType")
#BO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R03CLM_BO1_Bits", 	"R03CLM",		0, 		6, 			12288, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R03CLM_BO2_Bits", 	"R03CLM",		0, 		6, 			12289, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R03CLM_BO3_Bits", 	"R03CLM",		0, 		6, 			12290, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R03CLM_BO4_Bits", 	"R03CLM",		0, 		6, 			12291, 			100, 			0, 			100, 		"simulation")
#BI,PLC->EPICS,Response
drvModbusAsynConfigure("R03CLM_BI1_Bits", 	"R03CLM",		0, 		3, 			12293, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R03CLM_BI2_Bits", 	"R03CLM",		0, 		3, 			12294, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R03CLM_BI3_Bits", 	"R03CLM",		0, 		3, 			12295, 			100, 			0,	 		100, 		"simulation")
#AO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R03CLM_AO1_FLOAT", 	"R03CLM",		0, 		16, 			12538, 			123, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R03CLM_AO2_FLOAT", 	"R03CLM",		0, 		16, 			12588, 			123, 			0, 			100, 		"simulation")
#AO,PLC->EPICS,Response
drvModbusAsynConfigure("R03CLM_AI1_FLOAT", 	"R03CLM",		0, 		3, 			12638, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R03CLM_AI2_FLOAT", 	"R03CLM",		0, 		3, 			12688, 			100, 			0,	 		100, 		"simulation")
#IntIn,PLC->EPICS,Response
drvModbusAsynConfigure("R03CLM_Intin", 	"R03CLM",		0, 		3, 			12694, 			100, 			0,	 		100, 		"simulation")
#StingIn,PLC->EPICS,Response
drvModbusAsynConfigure("R03CLM_Stringin", 	"R03CLM",		0, 		3, 			12696, 			100, 			0,	 		100, 		"simulation")

cd "${TOP}/iocBoot/${IOC}"
dbLoadTemplate("R03CLM.substitutions")

##
##R15
##
# use the following commands for TCP/IP
drvAsynIPPortConfigure("R15CLM", "10.7.70.31:503",0,0,1)
modbusInterposeConfig("R15CLM", 0,2000, 0)

#drvModbusAsynConfigure("portName", 	"tcpPortName",		slaveAddress,	modbusFunction,		modbusStartAddress,	 modbusLength,		dataType,		pollMsec,	"plcType")
#BO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R15CLM_BO1_Bits", 	"R15CLM",		0, 		6, 			12288, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R15CLM_BO2_Bits", 	"R15CLM",		0, 		6, 			12289, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R15CLM_BO3_Bits", 	"R15CLM",		0, 		6, 			12290, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R15CLM_BO4_Bits", 	"R15CLM",		0, 		6, 			12291, 			100, 			0, 			100, 		"simulation")
#BI,PLC->EPICS,Response
drvModbusAsynConfigure("R15CLM_BI1_Bits", 	"R15CLM",		0, 		3, 			12293, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R15CLM_BI2_Bits", 	"R15CLM",		0, 		3, 			12294, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R15CLM_BI3_Bits", 	"R15CLM",		0, 		3, 			12295, 			100, 			0,	 		100, 		"simulation")
#AO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R15CLM_AO1_FLOAT", 	"R15CLM",		0, 		16, 			12538, 			123, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R15CLM_AO2_FLOAT", 	"R15CLM",		0, 		16, 			12588, 			123, 			0, 			100, 		"simulation")
#AO,PLC->EPICS,Response
drvModbusAsynConfigure("R15CLM_AI1_FLOAT", 	"R15CLM",		0, 		3, 			12638, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R15CLM_AI2_FLOAT", 	"R15CLM",		0, 		3, 			12688, 			100, 			0,	 		100, 		"simulation")
#IntIn,PLC->EPICS,Response
drvModbusAsynConfigure("R15CLM_Intin", 	"R15CLM",		0, 		3, 			12694, 			100, 			0,	 		100, 		"simulation")
#StingIn,PLC->EPICS,Response
drvModbusAsynConfigure("R15CLM_Stringin", 	"R15CLM",		0, 		3, 			12696, 			100, 			0,	 		100, 		"simulation")

cd "${TOP}/iocBoot/${IOC}"
dbLoadTemplate("R15CLM.substitutions")

#- Set this to see messages from mySub
#-var mySubDebug 1

#- Run this to trace the stages of iocInit
#-traceIocInit

#
##R27
##

# use the following commands for TCP/IP
drvAsynIPPortConfigure("R27CLM", "10.7.70.32:504",0,0,1)
modbusInterposeConfig("R27CLM", 0,2000, 0)

#drvModbusAsynConfigure("portName", 	"tcpPortName",		slaveAddress,	modbusFunction,		modbusStartAddress,	 modbusLength,		dataType,		pollMsec,	"plcType")
#BO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R27CLM_BO1_Bits", 	"R27CLM",		0, 		6, 			12288, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R27CLM_BO2_Bits", 	"R27CLM",		0, 		6, 			12289, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R27CLM_BO3_Bits", 	"R27CLM",		0, 		6, 			12290, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R27CLM_BO4_Bits", 	"R27CLM",		0, 		6, 			12291, 			100, 			0, 			100, 		"simulation")
#BI,PLC->EPICS,Response
drvModbusAsynConfigure("R27CLM_BI1_Bits", 	"R27CLM",		0, 		3, 			12293, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R27CLM_BI2_Bits", 	"R27CLM",		0, 		3, 			12294, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R27CLM_BI3_Bits", 	"R27CLM",		0, 		3, 			12295, 			100, 			0,	 		100, 		"simulation")
#AO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R27CLM_AO1_FLOAT", 	"R27CLM",		0, 		16, 			12538, 			123, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R27CLM_AO2_FLOAT", 	"R27CLM",		0, 		16, 			12588, 			123, 			0, 			100, 		"simulation")
#AO,PLC->EPICS,Response
drvModbusAsynConfigure("R27CLM_AI1_FLOAT", 	"R27CLM",		0, 		3, 			12638, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R27CLM_AI2_FLOAT", 	"R27CLM",		0, 		3, 			12688, 			100, 			0,	 		100, 		"simulation")
#IntIn,PLC->EPICS,Response
drvModbusAsynConfigure("R27CLM_Intin", 	"R27CLM",		0, 		3, 			12694, 			100, 			0,	 		100, 		"simulation")
#StingIn,PLC->EPICS,Response
drvModbusAsynConfigure("R27CLM_Stringin", 	"R27CLM",		0, 		3, 			12696, 			100, 			0,	 		100, 		"simulation")

cd "${TOP}/iocBoot/${IOC}"
dbLoadTemplate("R27CLM.substitutions")
#
##R39
##

# use the following commands for TCP/IP
drvAsynIPPortConfigure("R39CLM", "10.7.70.33:505",0,0,1)
modbusInterposeConfig("R39CLM", 0,2000, 0)

#drvModbusAsynConfigure("portName", 	"tcpPortName",		slaveAddress,	modbusFunction,		modbusStartAddress,	 modbusLength,		dataType,		pollMsec,	"plcType")
#BO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R39CLM_BO1_Bits", 	"R39CLM",		0, 		6, 			12288, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R39CLM_BO2_Bits", 	"R39CLM",		0, 		6, 			12289, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R39CLM_BO3_Bits", 	"R39CLM",		0, 		6, 			12290, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R39CLM_BO4_Bits", 	"R39CLM",		0, 		6, 			12291, 			100, 			0, 			100, 		"simulation")
#BI,PLC->EPICS,Response
drvModbusAsynConfigure("R39CLM_BI1_Bits", 	"R39CLM",		0, 		3, 			12293, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R39CLM_BI2_Bits", 	"R39CLM",		0, 		3, 			12294, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R39CLM_BI3_Bits", 	"R39CLM",		0, 		3, 			12295, 			100, 			0,	 		100, 		"simulation")
#AO,EPICS->PLC,Commnad
drvModbusAsynConfigure("R39CLM_AO1_FLOAT", 	"R39CLM",		0, 		16, 			12538, 			123, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("R39CLM_AO2_FLOAT", 	"R39CLM",		0, 		16, 			12588, 			123, 			0, 			100, 		"simulation")
#AO,PLC->EPICS,Response
drvModbusAsynConfigure("R39CLM_AI1_FLOAT", 	"R39CLM",		0, 		3, 			12638, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("R39CLM_AI2_FLOAT", 	"R39CLM",		0, 		3, 			12688, 			100, 			0,	 		100, 		"simulation")
#IntIn,PLC->EPICS,Response
drvModbusAsynConfigure("R39CLM_Intin", 	"R39CLM",		0, 		3, 			12694, 			100, 			0,	 		100, 		"simulation")
#StingIn,PLC->EPICS,Response
drvModbusAsynConfigure("R39CLM_Stringin", 	"R39CLM",		0, 		3, 			12696, 			100, 			0,	 		100, 		"simulation")

cd "${TOP}/iocBoot/${IOC}"
dbLoadTemplate("R39CLM.substitutions")

#
##RBY
##


# use the following commands for TCP/IP
drvAsynIPPortConfigure("RBYCLM", "10.7.70.34:506",0,0,1)
modbusInterposeConfig("RBYCLM", 0,2000, 0)

#drvModbusAsynConfigure("portName", 	"tcpPortName",		slaveAddress,	modbusFunction,		modbusStartAddress,	 modbusLength,		dataType,		pollMsec,	"plcType")
#BO,EPICS->PLC,Commnad
drvModbusAsynConfigure("RBYCLM_BO1_Bits", 	"RBYCLM",		0, 		6, 			12288, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_BO2_Bits", 	"RBYCLM",		0, 		6, 			12289, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_BO3_Bits", 	"RBYCLM",		0, 		6, 			12290, 			100, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_BO4_Bits", 	"RBYCLM",		0, 		6, 			12291, 			100, 			0, 			100, 		"simulation")
#BI,PLC->EPICS,Response
drvModbusAsynConfigure("RBYCLM_BI1_Bits", 	"RBYCLM",		0, 		3, 			12293, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_BI2_Bits", 	"RBYCLM",		0, 		3, 			12294, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_BI3_Bits", 	"RBYCLM",		0, 		3, 			12295, 			100, 			0,	 		100, 		"simulation")
#AO,EPICS->PLC,Commnad
drvModbusAsynConfigure("RBYCLM_AO1_FLOAT", 	"RBYCLM",		0, 		16, 			12538, 			123, 			0, 			100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_AO2_FLOAT", 	"RBYCLM",		0, 		16, 			12588, 			123, 			0, 			100, 		"simulation")
#AO,PLC->EPICS,Response
drvModbusAsynConfigure("RBYCLM_AI1_FLOAT", 	"RBYCLM",		0, 		3, 			12638, 			100, 			0,	 		100, 		"simulation")
drvModbusAsynConfigure("RBYCLM_AI2_FLOAT", 	"RBYCLM",		0, 		3, 			12688, 			100, 			0,	 		100, 		"simulation")
#IntIn,PLC->EPICS,Response
drvModbusAsynConfigure("RBYCLM_Intin", 	"RBYCLM",		0, 		3, 			12694, 			100, 			0,	 		100, 		"simulation")
#StingIn,PLC->EPICS,Response
drvModbusAsynConfigure("RBYCLM_Stringin", 	"RBYCLM",		0, 		3, 			12696, 			100, 			0,	 		100, 		"simulation")

cd "${TOP}/iocBoot/${IOC}"
dbLoadTemplate("RBYCLM.substitutions")



iocInit

## Start any sequence programs
#seq sncExample, "user=balmy"