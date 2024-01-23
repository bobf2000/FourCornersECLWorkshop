IMPORT $,STD;

Persons  := $.File_Persons.File;
Accounts := $.File_Accounts.File;
OUTPUT(Persons,NAMED('Persons'));
OUTPUT(Accounts,NAMED('Acciounts'));

OUTPUT($.File_People.File,NAMED('NormPeople'));
OUTPUT($.File_PeopleAll.People,NAMED('DNormPeople'));

OUTPUT($.File_Property.File,NAMED('NormProp'));
OUTPUT($.File_PeopleAll.Property,NAMED('DNormProp'));

OUTPUT($.File_Taxdata.File,NAMED('NormTax'));
OUTPUT($.File_PeopleAll.TaxData,NAMED('DNormTax'));

OUTPUT($.File_Vehicle.File,NAMED('NormVeh'));
OUTPUT($.File_PeopleAll.Vehicle,NAMED('DNormVeh'));

OUTPUT($.File_NamesPhones.File,NAMED('NamesPhones'));
OUTPUT($.File_NamesPhonesUpd.File,NAMED('NamesPhonesUpd'));

d := DATASET('~wrkshp::in::KJV',{STRING Txt},CSV(SEPARATOR('')));
OUTPUT(d,NAMED('kjv'));


