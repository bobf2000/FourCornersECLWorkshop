IMPORT $;
layout_min_max := RECORD
  Title := 'High Credit Ranges'; 
  Min_Value := MIN(GROUP, $.File_Accounts.File.HighCredit);
  Max_Value := MAX(GROUP, $.File_Accounts.File.HighCredit);
END;


XTAB_Accounts_HighCredit_MaxMin := TABLE($.File_Accounts.File, layout_min_max);
OUTPUT(XTAB_Accounts_HighCredit_MaxMin);

MIN($.File_Accounts.File, HighCredit);
MAX($.File_Accounts.File, HighCredit);

