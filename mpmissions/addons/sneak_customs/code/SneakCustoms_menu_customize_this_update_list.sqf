/********************************************************************
* sneak_customs
* file: sneak_customs\code\SneakCustoms_menu_customize_this_update_list.sqf
* Author: Sneak
* sneakcustoms@gmail.com
* This extension is licensed under the Arma Public Licence
********************************************************************/
private ["_this", "_ctrlListboxSkins", "_originalClass", "_vehicleClass"];
_ctrlListboxSkins = _this;

_originalClass = typeOf vehicle player;
_vehicleClass = configname (inheritsFrom (configFile >> "CfgVehicles" >> _originalClass));
lbClear _ctrlListboxSkins;

if(isClass (missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> _vehicleClass) || isClass (missionConfigFile >> "CfgVehicleCustoms" >> _vehicleClass)) then {
	_availableSkins = (getArray (missionConfigFile >> "CfgVehicleCustoms" >> _vehicleClass >> "skins")) + (getArray (missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> _vehicleClass >> "skins"));
	{
		_skinClassName = _x select 0;
		_skinPrice = _x select 1;
		if(!(configName(inheritsFrom(missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> _skinClassName)) isEqualTo "SneakCustoms")) then {
			_entryIndex = _ctrlListboxSkins lbAdd getText(configFile >> "CfgVehicles" >> _skinClassName >> "skinName");
			_ctrlListboxSkins lbSetData [_entryIndex, _skinClassName];
			_ctrlListboxSkins lbSetTextRight [_entryIndex, format ["%1", _skinPrice]];
		} else {
			_entryIndex = _ctrlListboxSkins lbAdd getText(missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> _skinClassName >> "skinName");
			_ctrlListboxSkins lbSetData [_entryIndex, _skinClassName];
			_ctrlListboxSkins lbSetTextRight [_entryIndex, format ["%1", _skinPrice]];
		};	
	} forEach _availableSkins;
};


