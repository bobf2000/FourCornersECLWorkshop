IMPORT $,Std;
Seq := $.Ex15_BWR_LocalRecordSequencing;

EXPORT STD_Persons := MODULE //DON'T SUBMIT YOUR MODULE :-) - SYNTAX CHECK ONLY! 
	EXPORT Layout := RECORD
   Seq.RecID;
   Seq.ID;
   STRING15 FirstName  := std.Str.ToUpperCase(Seq.FirstName);
   STRING25 LastName   := std.Str.ToUpperCase(Seq.LastName);
   STRING1  MiddleName := std.Str.ToUpperCase(Seq.MiddleName);
   STRING2  NameSuffix := std.Str.ToUpperCase(Seq.NameSuffix);		
   UNSIGNED4  FileDate := (UNSIGNED4)Seq.FileDate;
   Seq.BureauCode;
   Seq.Gender;
   UNSIGNED4  BirthDate := (UNSIGNED4)Seq.BirthDate;
   Seq.StreetAddress;
   Seq.City;
   Seq.State;
   UNSIGNED3  ZipCode := (UNSIGNED3)Seq.ZipCode;
	END;
	EXPORT File := TABLE(Seq,Layout) : PERSIST('~CLASS::BMF::PERSIST::STD_Persons');
END;