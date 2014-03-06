///MLP_VM_Set(VarMap, [CreateNewVars] )

/*
**  Usage:
**      MLP_VM_Set(VarMap, [CreateNewVars] )
**
**  Arguments:
**      VarMap          Map containing [Variable; Value] pairs (where Variable is a string)
**      CreateNewVars   Whether to create new variables based on the new map.
**                          varstring = key (in VarMap)
**                          pointer = key (in VarMap)
**                          value = value (in VarMap)
**                          type = type of value (in VarMap)
**                          readonly = true
**                      Default to not create new vars.
**
**  Returns:
**      VarMap id.
**
**  Notes:
**      - Does NOT take ownership of the map, destroying keeps responsibility of the user
**      - Destroys all created variables in the parser
**      - Normally not called by the user (as varmap is initialized at creation of the parser)
*/

MLP_ClearVariable()
if (VARMAP != -1) ds_map_destroy(VARMAP);
VARMAP = argument[0];

if (argument_count > 1) {
    if (argument[1]) {    
        var s;
        s = ds_map_size(VARMAP);
        if (s > 0) {
            var v;
            v = ds_map_find_first(VARMAP);
            repeat (s) { 
                MLP_AddVariable(v,v)
                v = ds_map_find_next(VARMAP, v);
            }
        }
    }
}
return VARMAP;

