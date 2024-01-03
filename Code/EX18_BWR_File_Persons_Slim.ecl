IMPORT $;
$.File_Persons_Slim.Layout Slimdown($.STD_Persons.File Le,$.File_LookupCSZ.File Ri) := TRANSFORM
	SELF.CSZ_ID := Ri.CSZ_ID;	
  SELF := Le;
END;								

SlimRecs := JOIN($.STD_Persons.File,
                 $.File_LookupCSZ.File,
								      LEFT.zipcode=RIGHT.zipcode AND
								      LEFT.city=RIGHT.city AND
								      LEFT.state=RIGHT.state,
								      Slimdown(LEFT,RIGHT),LEFT OUTER, LOOKUP);
								 
OUTPUT(SlimRecs,,'~CLASS::BMF::OUT::Persons_Slim',overwrite);