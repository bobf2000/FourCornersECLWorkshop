EXPORT File_LookupCSZ := MODULE
  EXPORT Layout := RECORD
   UNSIGNED4  CSZ_ID;
   STRING20   City;
   STRING2    State;
   UNSIGNED3  ZipCode;
   END;
  SHARED Filename := '~CLASS::BMF::OUT::LookupCSZ';

  EXPORT File := DATASET(Filename,Layout,FLAT);
  EXPORT FilePlus := DATASET(Filename,
	                          {Layout, UNSIGNED8 recpos {virtual(fileposition)}},THOR);
  														 
  EXPORT IDX_st_city := INDEX(FilePlus,
                             {State,City,recpos},
                             '~CLASS::BMF::KEY::LookupCSZ');
END;