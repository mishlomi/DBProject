
[General]
Version=1

[Preferences]
Username=
Password=2521
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=BOOKSALES
Count=390

[Record]
Name=BOOKID
Type=NUMBER
Size=
Data=List(select bookid from book)
Master=

[Record]
Name=PURCHASEID
Type=NUMBER
Size=
Data=List(select purchaseid from purchase)
Master=

