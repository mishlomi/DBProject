
[General]
Version=1

[Preferences]
Username=
Password=2385
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MICHAL
Name=PLAYORDERS
Count=300

[Record]
Name=ORDERID
Type=NUMBER
Size=
Data=Sequence(2000, 1)
Master=

[Record]
Name=PLAYID
Type=NUMBER
Size=
Data=List(select playid from play)
Master=

[Record]
Name=AVAILABLECOPIES
Type=NUMBER
Size=
Data=
Master=

[Record]
Name=ORDERQUANTITY
Type=NUMBER
Size=
Data=
Master=

