/********************************************************************
* sneak_customs
* file: sneak_customs\code\SneakCustoms_menu_customize_this_update_vehicle_local.sqf
* Author: Sneak
* sneakcustoms@gmail.com
* This extension is licensed under the Arma Public Licence
********************************************************************/
private ["_this"];
{
	vehicle player setObjectTexture [_forEachIndex, _x];
} forEach _this;