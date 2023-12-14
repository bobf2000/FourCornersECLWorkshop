IMPORT $;

Accounts := $.File_Accounts.File;

BalanceAcctNum := SORT(Accounts,AccountNumber,-Balance);

OUTPUT(DEDUP(BalanceAcctNum,AccountNumber));

