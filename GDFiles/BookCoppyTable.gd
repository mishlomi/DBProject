
[General]
Version=1

[Preferences]
Username=
Password=2692
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
Name=SERIALNUMBER
Type=NUMBER
Size=
Data=Sequence(211111, 4, )
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=15
Data=List('new', 'used', 'new-used')
Master=

[Record]
Name=BOOKID
Type=NUMBER
Size=
Data=List(select bookID from book)
Master=

