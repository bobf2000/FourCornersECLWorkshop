IMPORT $;
 STRING15 fname_value  := '' : STORED('FirstName');
 STRING25 lname_value  := '' : STORED('LastName');
 STRING2  state_value  := '' : STORED('State');
 STRING1  sex_value    := '' : STORED('Sex');

Fetched := IF(state_value <> '',
              $.FN_FetchPersons.By_StateLFname(state_value,
                                               lname_value,
                                               fname_value),
              $.FN_FetchPersons.By_LFname(lname_value,
                                          fname_value));
filter := sex_value = '' OR fetched.gender = sex_value;

EXPORT PeopleFileSearchService := OUTPUT(Fetched(filter));

