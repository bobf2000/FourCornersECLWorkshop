IMPORT $;
People   := $.File_PeopleAll.People;
Property := $.File_PeopleAll.Property;
TaxData  := $.File_PeopleAll.TaxData;
//Property.Full_Baths + ROUND(Property.Half_baths/2)

IsValidBathCount(UNSIGNED2 TotalBaths) := FUNCTION
 IsValidProperty := Property.Full_Baths + ROUND(Property.Half_baths/2) >= TotalBaths;
 IsValidTaxData  := EXISTS(TaxData(Full_Baths + ROUND(Half_baths/2) >= TotalBaths)); 
 RETURN IsValidProperty OR IsValidTaxData;
END;


PropBath_3 := COUNT(Property(IsValidBathCount(3)));

OUTPUT(COUNT(People(PropBath_3 > 0)),NAMED('One_215947'));