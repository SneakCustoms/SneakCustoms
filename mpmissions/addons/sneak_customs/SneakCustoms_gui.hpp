/********************************************************************
* sneak_customs
* file: sneak_customs\code\SneakCustoms_gui.hpp
* Author: Sneak
* sneakcustoms@gmail.com
* This extension is licensed under the Arma Public Licence
********************************************************************/
class SneakCustomsMenu{
	idd = 762394;
	movingenable = 0;

	fadein = 0 ;
	fadeout = 0;
	duration = 0;

	class controlsBackground{
		class SneakCustomsBackground: RscText{
			idc = -1;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class controls{
		class SneakCustomsButtonBack: RscButton{
			idc = 1600;
			text = "Back";
			action = "closeDialog 0";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class SneakCustomsButtonCustomizeThis: RscButton{
			idc = 1601;
			text = "Customize this!";
			action = "call SneakCustoms_menu_customize_this_show";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
		};


	};
};

class SneakCustomsCustomizeThis{
	idd = 762395;
	movingenable = 0;

	fadein = 0 ;
	fadeout = 0;
	duration = 0;

	class controlsBackground{
		class SneakCustomsBackground: RscText{
			idc = -1;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class controls{
		class SneakCustomsButtonBack: RscButton{
			idc = 1600;
			text = "Back";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscListbox_1500: RscListbox{
			idc = 1500;
			onLBSelChanged = "_this call SneakCustoms_menu_customize_this_list_onChanged";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class SneakCustomsButtonApply: RscButton{
			idc = 1601;
			text = "Apply";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};