/********************************************************************
 * sneak_customs
 * file: sneak_customs\fn_SneakClient_preInit.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
	
    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['SneakCustoms_menu_customize_this_cam_destroy', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_cam_destroy.sqf'],
	['SneakCustoms_menu_customize_this_cam_init', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_cam_init.sqf'],
	['SneakCustoms_menu_customize_this_destroy', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_destroy.sqf'],
	['SneakCustoms_menu_customize_this_update_list', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_update_list.sqf'],
	['SneakCustoms_menu_customize_this_update_vehicle_local', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_update_vehicle_local.sqf'],
	['SneakCustoms_menu_customize_this_show', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_show.sqf'],
	['SneakCustoms_menu_customize_this_list_onChanged', 'addons\sneak_customs\code\SneakCustoms_menu_customize_this_list_onChanged.sqf']
];

diag_log "[AURENTIS_CLIENT] Loading aurentis_client addon.";

true