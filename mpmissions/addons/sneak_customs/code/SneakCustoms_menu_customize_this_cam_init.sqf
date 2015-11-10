/********************************************************************
* sneak_customs
* file: sneak_customs\code\SneakCustoms_menu_customize_this_cam_init.sqf
* Author: Sneak
* sneakcustoms@gmail.com
* This extension is licensed under the Arma Public Licence
********************************************************************/
SneakCustomsCustomizeThisPos = getPosATL (nearestObjects [player, getArray(missionConfigFile >> "CfgSneakClient" >> "CfgSneakCustoms" >> "SneakCustoms" >> "spots"), 3] select 0);

SneakCustomsCustomizeThisCameraPos = [	(SneakCustomsCustomizeThisPos select 0) + 3,
								(SneakCustomsCustomizeThisPos select 1) + 5,
								(SneakCustomsCustomizeThisPos select 2) + 4	];

SneakCustomsCustomizeThisCameraFocus = "LOGIC" createVehicleLocal SneakCustomsCustomizeThisPos;
SneakCustomsCustomizeThisCameraFocus setPosATL SneakCustomsCustomizeThisPos;

SneakCustomsCustomizeThisCamera = "camera" camCreate SneakCustomsCustomizeThisCameraPos;
SneakCustomsCustomizeThisCamera camPrepareFov 1.0;
SneakCustomsCustomizeThisCamera camPrepareTarget SneakCustomsCustomizeThisCameraFocus;
SneakCustomsCustomizeThisCamera setPosATL SneakCustomsCustomizeThisCameraPos;
SneakCustomsCustomizeThisCamera camCommitPrepared 0;

showCinemaBorder false;

SneakCustomsCustomizeThisCamera cameraEffect ["internal", "back"];