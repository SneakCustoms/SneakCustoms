/********************************************************************
 * sneak_server
 * file: sneak_server\code\SneakCustoms_change_skin.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ["_originalTextures", "_paid", "_playerMoney", "_skinPrice", "_tmp", "_currentTimestamp", "_expiringDate", "_currentVehicleNetId", "_sessionId", "_player", "_skinClass", "_currentVehicle", "_currentVehicleId", "_missionPath", "_jpg", "_page", "_pageSize","_currentVehicleIdAndSkin", "_found", "_skinTextures"];
_sessionId = _this select 0;
_currentVehicleNetId = (_this select 1);
_currentVehicle = objectFromNetId _currentVehicleNetId;
_skinClass = _this select 2;
_playerNetId = _this select 3;
_skinPrice = _this select 4;
_originalTextures = _this select 5;
_player = objectFromNetId _playerNetId;
_paid = false;
_playerMoney = _player getVariable ["ExileMoney", 0];

_currentVehicleId = _currentVehicle getVariable ["ExileDatabaseID", -1];

if(_currentVehicleId > -1) then {
	_page = 0;
	_pageSize = 100;
	_currentVehicleIdAndSkin = format ["getVehicleSkinIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;

	if (_playerMoney >= _skinPrice) then {
		[_player, _skinPrice, _sessionId] call SneakCustoms_spend_money;
		_paid = true;
	} else {
		[_player, "notificationRequest", ["LockKickWarning", ["You dont have enough Pop-Tabs."]]] call ExileServer_system_network_send_to;
		_paid = false;
	};

if(_paid) then {
	_found = false;
	{
		if(((_currentVehicleIdAndSkin select _forEachIndex) find _currentVehicleId) != -1) then {
			_found = true;
		};
	} forEach _currentVehicleIdAndSkin;

	if(_found) then {
		//check if custom skin
		if(configName(inheritsFrom (missionConfigFile >> "CfgAurentisClient" >> "CfgAurentisCustoms" >> _skinClass)) isEqualTo "Aurentis_Skins") then {
			format ["updateVehicleWithSkin:%1:%2", _skinClass, _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
			diag_log format ["[SNEAK_CUSTOMS]Changing vehicle %1 to skin %2.", _currentVehicleId, _skinClass];
			_skinTextures = getArray(missionConfigFile >> "CfgAurentisClient" >> "CfgAurentisCustoms" >> _skinClass >> "hiddenSelectionsTextures");
			[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
		} else {
			format["deleteVehicleWithSkin:%1", _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
			format["updateVehicleClass:%1:%2", _skinClass, _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
			diag_log format ["[SNEAK_CUSTOMS]Deleting vehicle %1.", _currentVehicleId];
			diag_log format ["[SNEAK_CUSTOMS]Changing baseclass in database of non custom vehicle, vehicleId: %1, skin %2", _currentVehicleId, _skinClass];
			_skinTextures = getArray(ConfigFile >>"CfgVehicles" >> _skinClass >> "hiddenSelectionsTextures");
			diag_log format ["_skinTextures %1", _skinTextures];
			[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
		};

	} else {
		//check if custom skin
		if(configName(inheritsFrom (missionConfigFile >> "CfgAurentisClient" >> "CfgAurentisCustoms" >> _skinClass)) isEqualTo "Aurentis_Skins") then {
			format ["createVehicleWithSkin:%1:%2", _currentVehicleId, _skinName] call ExileServer_system_database_query_fireAndForget;
			diag_log format ["[SNEAK_CUSTOMS]Adding vehicle %1 with skin %2", _currentVehicleId, _skinClass];
			_skinTextures = getArray(missionConfigFile >> "CfgAurentisClient" >> "CfgAurentisCustoms" >> _skinClass >> "hiddenSelectionsTextures");
			[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
		} else {
			format["updateVehicleClass:%1:%2", _skinClass, _currentVehicleId] call ExileServer_system_database_query_fireAndForget;
			diag_log format ["[SNEAK_CUSTOMS]Changing baseclass in database of non custom vehicle, vehicleId: %1, skin %2", _currentVehicleId, _skinClass];
			_skinTextures = getArray(ConfigFile >>"CfgVehicles" >> _skinClass >> "hiddenSelectionsTextures");
			diag_log format ["_skinTextures %1", _skinTextures];
			[_currentVehicle, _skinTextures] call SneakCustoms_update_vehicle;
		};
	};
} else {
	diag_log "[SNEAK_CUSTOMS]Invalid vehicleId";	
};




