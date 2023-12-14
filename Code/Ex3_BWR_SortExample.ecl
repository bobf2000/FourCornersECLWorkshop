IMPORT $;

Persons  := $.File_Persons.File;
Accounts := $.File_Accounts.File;

ZipNameSort := SORT(Persons,ZipCode,LastName); 
OUTPUT(ZipNameSort,NAMED('ZipNameSort'));

BalanceAcctNum := SORT(Accounts,-Balance,AccountNumber);
OUTPUT(BalanceAcctNum(AccountNumber <> ''),NAMED('BalAcctNum'));

