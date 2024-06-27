
[General]
Version=1

[Preferences]
Username=
Password=2016
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=PURCHASE
Count=390

[Record]
Name=PURCHASEID
Type=NUMBER
Size=
Data=Random(100, 9000) 
Master=

[Record]
Name=PURCHASEDATE
Type=DATE
Size=
Data=Random(01/01/2018, 01/06/2024)
Master=

[Record]
Name=QUANTITY
Type=NUMBER
Size=
Data=[1]
Master=

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=
Data=List(select customerid from customer)
Master=

[Record]
Name=WORKERID
Type=NUMBER
Size=
Data=List(select workerid from worker)
Master=

