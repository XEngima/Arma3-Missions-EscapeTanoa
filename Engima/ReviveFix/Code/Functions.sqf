/*
 * Summary: Gets a parameter value in a paired list on format ["KEY", value].
 * Arguments:
 *   _params: List of paired value parameters.
 *   _key: String with key to look for.
 *   _defaultValue: Value that is returned if key was not found.
 * Returns: Value associated with key. ObjNull if no key was found.
 */
ENGIMA_REVIVEFIX_GetParamValue = {
	params ["_parameters", "_key", ["_defaultValue", []]];
	
	scopeName "main";
	
   	{
   		if (_x select 0 == _key) then {
   			(_x select 1) breakOut "main";
   		};
   	} foreach (_parameters);
    	
   	_defaultValue
};
