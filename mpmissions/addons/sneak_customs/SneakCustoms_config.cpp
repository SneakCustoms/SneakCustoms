/********************************************************************
 * sneak_customs
 * file: sneak_customs\SneakCustoms_config.cpp
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
 class CfgFunctions{
 	class SneakClient{
		class main{
			file="addons\sneak_customs\bootstrap";
			class SneakClient_preInit{
				preInit = 1;
			};
			class SneakClient_postInit{
				postInit = 1;
			};
		};
	};
};

 class CfgSneakClient{
 	class CfgSneakCustoms{

 		class SneakCustoms{
 			spots[] = {
 				"Sr_border"
 			};
 		};

 		//add new skins like this
 		class Exile_Car_Strider_Abstract{
 			skins[] = {
 				{"Exile_Car_Strider", 1750},
 				{"SneakCustoms_Car_Strider_Desert", 1750}
 			};
 		};
 		class SneakCustoms_Car_Strider_Desert : SneakCustoms{ //class derivative to distinguish between standard and custom skins
			skinName = "Desert";
            hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa", "a3\data_f\vehicles\turret_co.paa"};
 		};
 		class Exile_Car_Strider : SneakCustoms{ //standard strider is listed here because there is no texture entry in the standard exile config
            skinName = "Hex";
            hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa", "a3\data_f\vehicles\turret_indp_co.paa"};
        };
 	};
 };

