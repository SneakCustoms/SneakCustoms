Screenshots:
http://imgur.com/a/AgsuB

I expect everyone to know how to handle pbo's and getting scripts on your server so i wont explain this.

Installation:

-Database
	-import the _sql\sneak_customs.sql into your database
	-add the content of _sql\sneak_exile.ini at the end of your exile.ini (@ExileServer\extDB\sql_custom_v2\exile.ini)

-Serverside
	-compile as pbo and add to your server in: @ExileServer\addons

-mpmissions
	-add the mpmissions folder to your server
	-open the config.cpp and add 
		ExileClient_gui_hud_event_onKeyUp = "overrides\ExileClient_gui_hud_event_onKeyUp.sqf";
	in class CfgCustomCode
	note: if you want to open the menu with a different key, this is the place to go.
	also add #include "addons\sneak_customs\SneakCustoms_config.cpp" at the top of your config.cpp

	-add 
		class SneakCustoms_change_skin {allowedTargets = 2;};
	to CfgRemoteExec -> CfgFunctions
	(description.ext)

-Battleye
	-add
		!="remoteExecCall ["SneakCustoms_change_skin\","
	to end of line 
		7 remoteexec

	-add
		!"SneakCustoms_change_skin"


Questions, bugreports or suggestions to:
sneakcustoms@gmail.com

How to use:
You can only use this when youre on near one of the objects specified in the sneak_customs\SneakCustoms_config.cpp\SneakCustoms\spots array.
You can add custom skins like the example in sneak_customs\SneakCustoms_config.cpp.
This shop replaces the ingame vehicle customs completely for now. I dont know what happens when you use him with an custom skinned car, but i dont think it will be changed appropiately.

How this works:
Everytime you change a skin the script will look up if its an custom skin or an exile standard.
When its standard it will just update the texture and the skinclass in the database.
When you apply a new custom skin it will add an entry to the sneak_customs database.
On server start the fn_Sneak_postInit.sqf will compare every spawned vehicle with my custom
database and update the skin to make custom skins persistent. When you revert back to a standard skin the entry in the custom databse will be deleted and value is stored in the standard database.





