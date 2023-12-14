IMPORT $;

$.OutRec Xform($.File_NamesPhones.File Le, $.File_NamesPhonesUpd.FilePlus Ri) := TRANSFORM
 SELF.new_homephone := Ri.homephone;
 SELF.new_cellphone := Ri.cellphone;
 SELF.new_fname     := Ri.fname;
 SELF.new_mname     := Ri.mname;
 SELF.new_lname     := Ri.lname;
 SELF := Le;
END;

//FULL KEYED JOIN - Uses FilePlus as RIGHT RecordSet, KEYED(index) option
//Left RS is Base dataset
KeyedJoin := JOIN($.File_NamesPhones.File(Lname[1]='L'),
                  $.File_NamesPhonesUpd.FilePlus,
                  LEFT.RecID=RIGHT.foreignkeyID,
                  Xform(LEFT,RIGHT),
                  KEYED($.File_NamesPhonesUpd.IDX_Fkey_RecID));

OUTPUT(KeyedJoin,,'~CLASS::BMF::JOIN::FullKeyed',OVERWRITE);