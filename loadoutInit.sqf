/*	executes loadout scripts defined in bluforLoadouts.sqf and opforLoadouts.sqf
*
*		executed on player via init.sqf
*/

waitUntil {!isNull player};
waitUntil {player == player};

if (roleDescription player == "") exitWith {diag_log "loadoutInit.sqf - PLAYER HAS NO ROLE DESCRIPTION!"};

#include "USERSCRIPTS\bluforLoadouts.sqf";
_role = [roleDescription player] call mcd_fnc_strToLoadout;
if (isNil _role) exitWith {diag_log format ["loadoutInit.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
diag_log format ["Getting loadout: %1", _role];
call compile ("call " + _role);
