IMPORT $;

Accounts := $.File_Accounts.File;

BalanceAcctNum := SORT(Accounts,AccountNumber,-Balance);
OUTPUT(BalanceAcctNum);

OUTPUT(DEDUP(BalanceAcctNum,AccountNumber));

OUTPUT(COUNT(DEDUP(BalanceAcctNum,AccountNumber)));

