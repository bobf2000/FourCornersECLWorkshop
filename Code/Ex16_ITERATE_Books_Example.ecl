IMPORT $,STD;


R := RECORD
  STRING Txt;
  END;
	
d := DATASET('~wrkshp::in::KJV',R,CSV(SEPARATOR('')));

OUTPUT(d,NAMED('RawInput'));

R TextOntoReference(R le, R ri) := TRANSFORM
  SELF.Txt := le.Txt + ' ' + ri.Txt;
  END;	

Rld := ROLLUP(d,LEFT.Txt[1]='$' AND RIGHT.Txt[1]<>'$',TextOntoReference(LEFT,RIGHT))
       :PERSIST('~KJV::WRKSHP::PERSIST::ROLLUP');
       
OUTPUT(Rld,NAMED('RawRolled'));       

UNSIGNED GetChapter(STRING S) := (UNSIGNED)S[1..STD.STR.Find(S,':',1)-1];
UNSIGNED GetVerse(STRING S)   := (UNSIGNED)S[STD.STR.Find(S,':',1)+1..];

R2 := RECORD
 	STRING5 Book := STD.STR.GetNthWord(Rld.Txt,2);
	UNSIGNED1 Booknum := 0;
	UNSIGNED1 Chapter := GetChapter(STD.STR.GetNthWord(Rld.Txt,3));
	UNSIGNED1 Verse   := GetVerse(STD.STR.GetNthWord(Rld.Txt,3));
	STRING Verse_Text := Rld.Txt[STD.STR.Find(Rld.Txt,' ',3)+1..];
  END;
	
t := TABLE(Rld,R2);
OUTPUT(t,NAMED('Cleaned'));
R2 NoteBookNum(R2 le, R2 ri) := TRANSFORM
  SELF.Booknum := IF( le.book=ri.book, le.booknum, le.booknum+1 );
  SELF := ri;
  END;

Txt := ITERATE(t,NoteBookNum(LEFT,RIGHT));
OUTPUT(Txt,NAMED('BookNumber'));