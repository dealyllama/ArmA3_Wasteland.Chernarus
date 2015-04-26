/*
Add Script to individual units spawned by COS.
_unit = unit. Refer to Unit as _unit.
*/

_unit =(_this select 0);
_unit addAction ["Hello", {hint "Civilian militia will attack you on sight!"}];// EXAMPLE SCRIPT