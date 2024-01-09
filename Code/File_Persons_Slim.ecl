IMPORT $;
EXPORT File_Persons_Slim := MODULE
EXPORT Layout := RECORD
  unsigned4 recid;
  unsigned8 id;
  string15 firstname;
  string25 lastname;
  string1 middlename;
  string2 namesuffix;
  unsigned4 filedate;
  unsigned2 bureaucode;
  string1 gender;
  unsigned4 birthdate;
  string42 streetaddress;
  unsigned4 csz_id;
 END;
 
 EXPORT File     := DATASET('~wrkshp::OUT::Persons_Slim',Layout,FLAT);
 EXPORT FilePlus := DATASET('~wrkshp::OUT::Persons_Slim',{Layout, UNSIGNED8 recpos {virtual(fileposition)}},FLAT);
 
 EXPORT IDX_CSZ_lname_fname := INDEX(FilePlus,
                                     {CSZ_ID,LastName,FirstName,recpos},
                                      '~wrkshp::KEY::CSZ_lname_fname');	
 EXPORT IDX_lname_fname     := INDEX(FilePlus,
                                     {LastName,FirstName,recpos},
                                     '~wrkshp::KEY::lname_fname');
END;																	