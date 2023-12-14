IMPORT $;
Persons := $.File_Persons.File;


OUTPUT(Persons(State = 'FL'),NAMED('FL_Peeps'));
OUTPUT(COUNT(Persons(State = 'FL')),NAMED('FL_PeepsCnt')); //40854

OUTPUT(Persons(State = 'FL',City = 'MIAMI'),NAMED('MiamiPeeps'));
OUTPUT(COUNT(Persons(State = 'FL',City = 'MIAMI')),NAMED('MiamiPeepsCnt')); //2438

OUTPUT(Persons(State = 'FL',City = 'MIAMI',ZipCode='33102'),NAMED('A33102'));
OUTPUT(COUNT(Persons(State = 'FL',City = 'MIAMI',ZipCode='33102')),NAMED('A33102Cnt')); //40

OUTPUT(Persons(FirstName >= 'B' AND FirstName < 'C'),NAMED('BFirstNames'));
OUTPUT(COUNT(Persons(FirstName[1] = 'B')),NAMED('BFirstNamesCnt'));//31193

OUTPUT(Persons(FileDate[1..4] > '2000'),NAMED('FileDate2000'));
OUTPUT(COUNT(Persons((INTEGER)FileDate[..4] > 2000)),NAMED('FileDate2000Cnt'));//687

Persons(FirstName = 'B'); //? What does this do? :-)