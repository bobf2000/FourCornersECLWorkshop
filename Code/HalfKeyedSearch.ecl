IMPORT $;
IDXpay         := $.File_NamesPhonesUpd.IDX_Fkey_RecIDpay;
NamesPhonesPay := $.File_NamesPhones.IDX_lname_pay;

// EXPORT HalfkeyedSearch() := FUNCTION

  STRING StartsWith := '' :STORED('StartsWith');

  $.OutRec Xform3(NamesPhonesPay Le, IDXpay Ri) := TRANSFORM
    SELF.new_homephone := Ri.homephone;
    SELF.new_cellphone := Ri.cellphone;
    SELF.new_fname     := Ri.fname;
    SELF.new_mname     := Ri.mname;
    SELF.new_lname     := Ri.lname;
    SELF := Le;
  END;
	//begins with filter:
  HalfKeyedPayJoin := JOIN(NamesPhonesPay(KEYED(lname[1..LENGTH(StartsWith)]=StartsWith)),
                           IDXpay,
                           KEYED(LEFT.RecID=RIGHT.foreignkeyID),
                           Xform3(LEFT,RIGHT));
EXPORT HalfKeyedSearch := SEQUENTIAL(OUTPUT(COUNT(HalfKeyedPayJoin)),OUTPUT(HalfKeyedPayJoin));
  // RETURN SEQUENTIAL(OUTPUT(COUNT(HalfKeyedPayJoin)),OUTPUT(HalfKeyedPayJoin));
// END;