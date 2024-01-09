IMPORT $;
Accounts := $.File_Accounts.File;

OUTPUT(Accounts(Balance >= 100000),NAMED('BALGT100K'));
OUTPUT(COUNT(Accounts(Balance >= 100000)),NAMED('BALGT100KCnt')); //255131
                            // (Late30Day + Late60Day + Late90Day) >= 1
OUTPUT(Accounts(Balance >= 100000, Late30Day >= 1 OR Late60Day >= 1 OR Late90Day >= 1),NAMED('Late'));
OUTPUT(COUNT(Accounts(Balance >= 100000,(Late30Day<>0 OR Late60Day<>0 OR Late90Day<>0))),NAMED('LateCnt'));

OUTPUT(Accounts((INTEGER)OpenDate[..4] >= 2000),NAMED('DateGT2K'));
OUTPUT(COUNT(Accounts(OpenDate[..4] >= '2000')),NAMED('DateGT2KCnt'));

OUTPUT(Accounts(TermType = ''),NAMED('BlankTermType'));
OUTPUT(COUNT(Accounts(TermType = ' ')),NAMED('BlankTermTypeCnt'));

