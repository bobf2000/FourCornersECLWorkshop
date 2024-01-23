IMPORT $;
Layout_T_recs := RECORD
  UNSIGNED4 CSZ_ID := $.STD_Persons.File.RecID;
  $.STD_Persons.File.City;
  $.STD_Persons.File.State;
  $.STD_Persons.File.Zipcode;
  END;
T_recs := TABLE($.STD_Persons.File,Layout_T_recs);//841400
S_recs := SORT(T_recs,ZipCode,State,City,CSZ_ID);

S_Recs RollCSV(S_Recs Le, S_Recs Ri) := TRANSFORM
  SELF.CSZ_ID := IF(Le.CSZ_ID < Ri.CSZ_ID,Le.CSZ_ID,Ri.CSZ_ID);
  SELF := Le;
END;

Rollup_CSZ := ROLLUP(S_Recs,
                     LEFT.Zipcode=RIGHT.Zipcode AND
                     LEFT.State=RIGHT.State AND
                     LEFT.City=RIGHT.City,
                     RollCSV(LEFT,RIGHT));

OUTPUT(Rollup_CSZ,,'~WRKSHP::OUT::LookupCSZ',OVERWRITE);












