IMPORT Visualizer;

state := TABLE($.File_Persons.File, {state, UNSIGNED4 rowcount := COUNT(GROUP)}, state, FEW);
OUTPUT(state, NAMED('state_rowcount'));
Visualizer.Choropleth.USStates('Step03b', , 'state_rowcount', , , DATASET([{'paletteID', 'PuBuGn'}], Visualizer.KeyValueDef));

Visualizer.MultiD.__test;




