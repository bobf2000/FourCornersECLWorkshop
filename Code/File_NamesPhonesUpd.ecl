//Solution for Exercise 2A:
IMPORT $;
EXPORT File_NamesPhonesUpd := MODULE
 EXPORT Layout := RECORD
  UNSIGNED4 RecID;
  UNSIGNED4 ForeignKeyID;
  STRING10  HomePhone;
  STRING10  CellPhone;
  STRING20  FName;
  STRING20  MName;
  STRING20  LName;
  STRING5   Name_Suffix;
  END;
 SHARED Filename       := '~ecltraining::in::namephonesupd'; //xxx - your initials
 EXPORT File           := DATASET(Filename,Layout,THOR);
 EXPORT FilePlus       := DATASET(Filename,{Layout,UNSIGNED8 RecPos{VIRTUAL(fileposition)}},THOR);
 EXPORT IDX_Fkey_RecID := INDEX(FilePlus,{ForeignKeyID,RecID,RecPos},
                                '~CLASS::BMF::IDX::UpdData');//xxx - your initials


//Added in Exercise 2d:
 EXPORT IDX_Fkey_RecIDpay := INDEX(FilePlus,
                                  {foreignkeyID,RecID},
                                  {FilePlus},
                                  '~CLASS::BMF::IDX::UpdDataPayload');																
END;