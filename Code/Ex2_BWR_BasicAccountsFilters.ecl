IMPORT $;
Accounts := $.File_Accounts.File;

OUTPUT(Accounts(Balance >= 100000));
OUTPUT(COUNT(Accounts(Balance >= 100000))); //255131
                            // (Late30Day + Late60Day + Late90Day) >= 1
OUTPUT(Accounts(Balance >= 100000, Late30Day >= 1 OR Late60Day >= 1 OR Late90Day >= 1));
OUTPUT(COUNT(Accounts(Balance >= 100000,(Late30Day<>0 OR Late60Day<>0 OR Late90Day<>0))));

Accounts((INTEGER)OpenDate[..4] >= 2000);
COUNT(Accounts(OpenDate[..4] >= '2000'));

Accounts(TermType = '');
COUNT(Accounts(TermType = ' '));

OUTPUT(Accounts(Balance = 0, Late30Day >= 1 OR Late60Day >= 1 OR Late90Day >= 1));