IMPORT $;

IDXpay         := $.File_NamesPhonesUpd.IDX_Fkey_RecIDpay;
NamesPhonesPay := $.File_NamesPhones.IDX_lname_pay;

$.OutRec Xform3(NamesPhonesPay Le, IDXpay Ri) := TRANSFORM
  SELF.new_homephone := Ri.homephone;
  SELF.new_cellphone := Ri.cellphone;
  SELF.new_fname     := Ri.fname;
  SELF.new_mname     := Ri.mname;
  SELF.new_lname     := Ri.lname;
  SELF := Le;
END;
HalfKeyedPayJoin := JOIN(NamesPhonesPay,
                         IDXpay,
                         KEYED(LEFT.RecID=RIGHT.foreignkeyID) AND LEFT.Lname[1]='L',
                         Xform3(LEFT,RIGHT));
												 
OUTPUT(HalfKeyedPayJoin,,'~CLASS::BMF::JOIN::HalfKeyedPayloadRoxie',overwrite);