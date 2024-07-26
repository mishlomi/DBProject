
[General]
Version=1

[Preferences]
Username=
Password=2451
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=MEMBERSHIP
Count=400

[Record]
Name=MEMBERSHIPID
Type=NUMBER
Size=
Data=Sequence(11000, 1)
Master=

[Record]
Name=STARTDATE
Type=DATE
Size=
Data=Random(01/01/2022, 01/01/2025)
Master=

[Record]
Name=ENDDATE
Type=DATE
Size=
Data=Random(01/01/2022, 01/01/2025)
Master=

[Record]
Name=MEMBERSHIPTYPE
Type=VARCHAR2
Size=15
Data=List(VIP, regilar)
Master=

[Record]
Name=CLIENTID
Type=VARCHAR2
Size=9
Data=List(select clientid from client)
Master=

