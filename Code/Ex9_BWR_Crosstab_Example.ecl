IMPORT BWR_Training_Examples AS X;
//Sample data to demonstarte Example 2
Layout := RECORD
	UNSIGNED8 ID;
	STRING15  FirstName;
	STRING25  LastName;
	STRING15  MiddleName;
	STRING2   NameSuffix;
  STRING8   FileDate;
	UNSIGNED2 BureauCode;
	STRING1   MaritalStatus;
	STRING1   Gender;
	UNSIGNED1 DependentCount;
  STRING8   BirthDate;
  STRING42  StreetAddress;
  STRING20  City;
  STRING2   State;
  STRING5   ZipCode;
END;
Persons := DATASET('~CLASS::BMF::Intro::Persons',layout,FLAT);

 MyRec := RECORD
  STRING1  Value1;
  STRING1  Value2;
  INTEGER1 Value3;
 END;
 SomeFile := DATASET([{'C','G',1},
                      {'C','G',6},
                      {'C','C',2},
                      {'A','X',3},
                      {'B','G',4},
                      {'A','B',5}],MyRec);
 MyOutRec := RECORD
   SomeFile.Value1;
   ValCount := COUNT(GROUP);
   GrpSum   := SUM(GROUP,SomeFile.Value3);
   AveSum   := AVE(GROUP,SomeFile.Value3);
 END;
MyTable := TABLE(SomeFile,MyOutRec,Value1);
OUTPUT(MyTable);
OUTPUT(SORT(MyTable,Value1));

/* MyTable result set is:
	Rec#	Value1	GrpCount	GrpSum
	1		C		2			3
	2		A		2			8
	3		B		1			4
*/

 r := RECORD
  Persons.LastName;
  Persons.Gender;
  GrpCnt := COUNT(GROUP);
  MaxLen := MAX(GROUP,LENGTH(TRIM(Persons.firstname)));
 END;
   
 tbl := TABLE(Persons,r,LastName,Gender);
 OUTPUT(tbl);
 stbl := SORT(tbl,-Maxlen);
 OUTPUT(stbl,NAMED('SortByName'));
 firstnameval := Persons(lastName = 'Saron',Gender = 'M');
 OUTPUT(firstnameval,NAMED('FirstNames'));
 firstname14 := Persons(LENGTH(TRIM(Persons.firstname)) = 14);
 OUTPUT(firstname14,NAMED('FN14'));
