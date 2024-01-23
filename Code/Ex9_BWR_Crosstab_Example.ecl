IMPORT $;
Persons := $.File_Persons.File;

//Example 1 using an INLINE Dataset
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


//Example 2 using the Persons Dataset
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
