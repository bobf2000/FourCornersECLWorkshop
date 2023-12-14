IMPORT $;
People   := $.File_PeopleAll.People;
Property := $.File_PeopleAll.Property;
Taxdata  := $.File_PeopleAll.Taxdata;

PropTaxBeds3 := COUNT(Property(Bedrooms >= 3 OR EXISTS(Taxdata(Bedrooms >= 3))));

OUTPUT(COUNT(People(PropTaxBeds3 > 0)),NAMED('Ex_265988'));



