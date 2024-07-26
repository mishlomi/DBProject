
[General]
Version=1

[Preferences]
Username=
Password=2226
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MICHAL
Name=PLAYPURCHASE
Count=300

[Record]
Name=PURCHASEID
Type=NUMBER
Size=
Data=Sequence(10000, 1)
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
Data=Random(1, 3)
Master=

[Record]
Name=COPYID
Type=NUMBER
Size=8
Data=List(select copyid from playcopy)
Master=

[Record]
Name=CLIENTID
Type=VARCHAR2
Size=9
Data=List(select clientid from client)
Master=

[Record]
Name=LIBRARIANID
Type=VARCHAR2
Size=9
Data=List(select librarianid from librarian)
Master=

