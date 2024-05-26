
[General]
Version=1

[Preferences]
Username=
Password=2649
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=ESTER
Name=ROOMS
Count=400

[Record]
Name=ID_ROOM
Type=NUMBER
Size=5
Data=Sequence(1000, [Inc], [1])
Master=

[Record]
Name=R_TYPE
Type=VARCHAR2
Size=15
Data=List('Dance', 'Lab', 'studio', 'pool')
Master=

[Record]
Name=R_LOCATION
Type=VARCHAR2
Size=15
Data=List('Jerusalem', 'TLV', 'Netanya')
Master=

[Record]
Name=ID_GROUP
Type=NUMBER
Size=
Data=List(select id_Group from Course_Group)
Master=

