IMPORT $;
Persons := $.File_Persons.File; 
r := RECORD
  Persons.Gender;
  CNT := COUNT(GROUP);
END;

// EXPORT 
XTAB_Persons_Gender := SORT(TABLE($.File_Persons.File,r,Gender),Gender);

OUTPUT(XTAB_Persons_Gender);


DISTRIBUTION(Persons,MaritalStatus,DependentCount);
DISTRIBUTION(Persons,MiddleName);




