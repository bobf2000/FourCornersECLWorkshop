IMPORT $,STD;

uidRecs := RECORD
	UNSIGNED4 RecID; 
	$.File_Persons.Layout;
END;

uidRecs addUIDProject($.File_Persons.File Le, INTEGER Cnt) := TRANSFORM
	node  := STD.System.Thorlib.node();
	nodes := CLUSTERSIZE;
	SELF.RecID := ((Cnt-1) * (nodes-1)) + node + Cnt;
	SELF := Le;
END;

EXPORT Ex15_BWR_LocalRecordSequencing := 
       SORT(PROJECT($.File_Persons.File, 
			         addUIDProject(LEFT,COUNTER), LOCAL),RecID)
               :PERSIST('~CLASS::BMF::PERSIST::PersonsSEQ');











