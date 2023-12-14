IMPORT $;

EXPORT fn_FetchPersons := MODULE
     SHARED basefile := $.File_Persons_Slim.FilePlus;
     SHARED basekey1 := $.File_Persons_Slim.IDX_lname_fname;
     SHARED basekey2 := $.File_Persons_Slim.IDX_CSZ_lname_fname;
     SHARED cszfile  := $.File_LookupCSZ.FilePlus;
     SHARED cszkey   := $.File_LookupCSZ.IDX_St_City;

     OutRec := RECORD
           RECORDOF(basefile) AND NOT [RecPos, CSZ_ID];
           RECORDOF(cszfile)  AND NOT [RecPos, CSZ_ID];
     END;

     OutRec JoinEm(cszfile Le, basefile Ri) := TRANSFORM 
           SELF := Le;
           SELF := Ri;
     END;
     //SHARED Function for both INDEX searches:
     SHARED JoinRecs(DATASET(RECORDOF(cszfile)) LeftFile,
                     DATASET(RECORDOF(basefile)) RightFile) := 
                     JOIN(LeftFile,RightFile,
                          LEFT.CSZ_ID = RIGHT.CSZ_ID,
                          JoinEm(LEFT,RIGHT),LOOKUP);


     EXPORT By_LFname(STRING25 l_key,
                      STRING15 f_key)      := FUNCTION
           FilteredKey := IF(f_key = '',
                             basekey1(LastName=l_key),
                             basekey1(LastName=l_key,FirstName=f_key));
           Fetch_People := FETCH(basefile, FilteredKey, RIGHT.RecPos);
           RETURN JoinRecs(cszfile,Fetch_People);
     END;

     EXPORT By_StateLFname(STRING2  s_key,
                           STRING25 l_key,
                           STRING15 f_key) := FUNCTION

           StateRecs  := FETCH(cszfile, cszkey(State=s_key), RIGHT.RecPos);
           SetCSZ_IDs := SET(StateRecs,CSZ_ID);

           FilteredKey := IF(f_key='',
                             basekey2(CSZ_ID IN SetCSZ_IDs,LastName=l_key),
                             basekey2(CSZ_ID IN SetCSZ_IDs,
                                      LastName=l_key,
                                      FirstName=f_key));
           Fetch_People := FETCH(basefile, FilteredKey, RIGHT.RecPos);

           RETURN JoinRecs(StateRecs,Fetch_People);
     END;
END;
