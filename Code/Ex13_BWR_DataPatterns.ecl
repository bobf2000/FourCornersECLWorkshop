IMPORT $,STD;
Persons := $.File_Persons.File;
profileResults := STD.DataPatterns.Profile(Persons):PERSIST('~WRKSHP::Persist::PersonProfile');
bestrecord     := STD.DataPatterns.BestRecordStructure(Persons)
                  :PERSIST('~WRKSHP::Persist::PersonBR');
OUTPUT(profileResults, ALL, NAMED('profileResults'));
OUTPUT(bestrecord, ALL, NAMED('BestRecord'));

// NewLayout := RECORD
    // UNSIGNED8 id;
    // STRING14 firstname;
    // STRING18 lastname;
    // STRING1 middlename;
    // STRING2 namesuffix;
    // UNSIGNED4 filedate;
    // UNSIGNED2 bureaucode;
    // STRING1 maritalstatus;
    // STRING1 gender;
    // UNSIGNED1 dependentcount;
    // UNSIGNED4 birthdate;
    // STRING39 streetaddress;
    // STRING15 city;
    // STRING2 state;
    // STRING5 zipcode;
// END;