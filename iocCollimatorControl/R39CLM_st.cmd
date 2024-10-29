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


#- Set this to see messages from mySub
#-var mySubDebug 1

#- Run this to trace the stages of iocInit
#-traceIocInit

iocInit

## Start any sequence programs
#seq sncExample, "user=balmy"