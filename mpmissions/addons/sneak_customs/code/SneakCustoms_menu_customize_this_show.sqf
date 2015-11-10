/********************************************************************
* sneak_customs
* file: sneak_customs\code\SneakCustoms_menu_customize_this_show.sqf
* Author: Sneak
* sneakcustoms@gmail.com
* This extension is licensed under the Arma Public Licence
********************************************************************/
private ["_display", "_ctrlButtonBack", "_ctrlLisboxSkins", "_triggerObject"];

if(vehicle player isEqualTo player) then {
	["LockKickWarning", "You have to get into a Vehicle first."] call ExileClient_gui_notification_event_addNotification;
} else {
	_triggerObject = getArray(missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> "SneakCustoms" >> "spots");
	if(count nearestObjects [player, _triggerObject, 3] == 0) then {
		["LockKickWarning", "Please drive to a Vehicle Customs first."] call ExileClient_gui_notification_event_addNotification;
	} else {
		if(player isEqualTo (driver vehicle player)) then {
			createDialog "SneakCustomsCustomizeThis";
			disableSerialization;
			_display = findDisplay 762395;
			_ctrlButtonBack = _display displayCtrl 1600;
			_ctrlLisboxSkins = _display displayCtrl 1500;

			//CamInit
			call SneakCustoms_menu_customize_this_cam_init;

			//BackButton or ESC reverts and closes
			originalTextures = getObjectTextures vehicle player;
			_ctrlButtonBack ctrlRemoveAllEventHandlers "ButtonClick";
			_ctrlButtonBack ctrlAddEventHandler["ButtonClick", {
				call SneakCustoms_menu_customize_this_destroy;
			}];
			_display displayAddEventHandler["KeyDown", {
				if(_this select 1 == 0x01) then {
					call SneakCustoms_menu_customize_this_destroy;
				};
			}];

			//Fill list
			_ctrlLisboxSkins call SneakCustoms_menu_customize_this_update_list;
		} else {
			["LockKickWarning", "Only the driver can purchase skins."] call ExileClient_gui_notification_event_addNotification;
		};
	};

};