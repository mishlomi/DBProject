
[General]
Version=1

[Preferences]
Username=
Password=2699
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=MEMBERSHIP
Count=10

[Record]
Name=MEMBERSHIPID
Type=NUMBER
Size=
Data=[100000000]
Master=

[Record]
Name=STARTDATE
Type=DATE
Size=
Data=Random(01/01/2023, 01/01/2024)
Master=

[Record]
Name=ENDDATE
Type=DATE
Size=
Data=Random(01/01/2024, 01/01/2025)
Master=

[Record]
Name=MEMBERSHIPTYPE
Type=VARCHAR2
Size=15
Data=List('month', 'year', '6-month')
Master=

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=
Data=List(select CustomerId from Customer)
Master=

