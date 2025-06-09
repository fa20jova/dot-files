@echo off
:: Batch file to reimport data
:: Change arguements after /tflc-%%A for specific data type
:: Change x in (x,y,z) to first day of import.
:: Change z in (x,y,z) to last day of import.
:: z must be >/= x in (x,y,z)
:: Example: (11,1,16) imports prior days starting @ tflc-11 to tflc-16

ECHO "Import Log" > importlog.txt

	IF EXIST "C:\Program Files (x86)\RTI\RTIconnect\RTIImport.exe" (
		(
		FOR /L %%A IN (1,1,33) DO (
			taskkill /f /im RTIImport.exe > NUL
			ECHO *****PRIOR DAY: %%A - Importing in progress - DO NOT CLOSE*****
			ECHO ********** Day: %%A **********>> importlog.txt
			"C:\Program Files (x86)\RTI\RTIconnect\RTIImport.exe" /tflc-%%A /DPOSDeposits >> importlog.txt
			TIMEOUT 120 > NUL
			ECHO ******************************>> importlog.txt
					)
				)
		)

	IF EXIST "C:\Program Files\RTI\RTIconnect\RTIImport.exe" (
		FOR /L %%A IN (1,1,33) DO (
			taskkill /f /im RTIImport.exe > NUL
			ECHO *****PRIOR DAY: %%A - Importing in progress - DO NOT CLOSE*****
			ECHO ********** Day: %%A **********>> importlog.txt
			"C:\Program Files\RTI\RTIconnect\RTIImport.exe" /tflc-%%A /DPOSDeposits >> importlog.txt
			TIMEOUT 120 > NUL
			ECHO ******************************>> importlog.txt
					)
		)

