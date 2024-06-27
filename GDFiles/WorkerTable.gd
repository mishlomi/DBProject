
[General]
Version=1

[Preferences]
Username=
Password=2199
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=WORKER
Count=390

[Record]
Name=WORKERID
Type=NUMBER
Size=
Data=[100000000]
Master=

[Record]
Name=WORKERFNAME
Type=VARCHAR2
Size=15
Data=FirstName
Master=

[Record]
Name=WORKERLNAME
Type=VARCHAR2
Size=15
Data=LastName
Master=

[Record]
Name=WORKERPHONE
Type=NUMBER
Size=
Data='0'+Random(0500000000, 0529999999)
Master=

[Record]
Name=POSITION
Type=VARCHAR2
Size=15
Data=List('Employee', 'Manager')
Master=

[Record]
Name=HIREDATE
Type=DATE
Size=
Data=Random(01/01/2016, 01/01/2024)
Master=

