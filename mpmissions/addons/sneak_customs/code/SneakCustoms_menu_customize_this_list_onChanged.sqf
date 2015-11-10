/********************************************************************
* sneak_customs
* file: sneak_customs\code\SneakCustoms_menu_customize_this_list_onChanged.sqf
* Author: Sneak
* sneakcustoms@gmail.com
* This extension is licensed under the Arma Public Licence
********************************************************************/
private ["_this", "_ctrlListboxSkins", "_ctrlButtonApply", "_display", "_index", "_skinTexturesTmp", "_skinTextures"];
disableSerialization;
_display = findDisplay 762395;
_ctrlButtonApply = _display displayCtrl 1601;
_ctrlListboxSkins = _this select 0;
_index = _this select 1;
skinClassName = _ctrlListboxSkins lbData _index;
skinPrice = parseNumber (_ctrlListboxSkins lbText _index);

if(!(configName(inheritsFrom(missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> skinClassName)) isEqualTo "SneakCustoms")) then {
	_skinTexturesTmp = getArray(configFile >> "CfgVehicles" >> skinClassName >> "hiddenSelectionsTextures");
    _skinTextures = [];
    //delete first "/" from "/a3/..." to match getObjectTextures
    {
    	_tmp = [_x, 1] call BIS_fnc_trimString;
    	_skinTextures set [_forEachIndex, (toLower _tmp)];
	} forEach _skinTexturesTmp;
} else {
	_skinTextures = getArray(missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> skinClassName >> "hiddenSelectionsTextures");
};

if(originalTextures isEqualTo _skinTextures) then {
	_ctrlButtonApply ctrlRemoveAllEventHandlers "ButtonClick";
	_ctrlButtonApply ctrlSetText "Already applied";
	_skinTextures call SneakCustoms_menu_customize_this_update_vehicle_local;
} else {
	_ctrlButtonApply ctrlSetText "Apply";
	_ctrlButtonApply ctrlRemoveAllEventHandlers "ButtonClick";
	_ctrlButtonApply ctrlAddEventHandler["ButtonClick", {[ExileClientSessionId, netId (vehicle player), skinClassName, skinDonatorOnly, netId player, skinPrice, originalTextures] remoteExecCall ['ExileServer_aurentis_change_skin', 2];}];
	_skinTextures call SneakCustoms_menu_customize_this_update_vehicle_local;
};

