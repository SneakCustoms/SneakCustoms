/********************************************************************
 * sneak_server
 * file: sneak_server\config.cpp
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
 
class CfgPatches {
    class sneak_server {
        requiredVersion = 0.1;
        requiredAddons[]=
        {
            "exile_client",
            "exile_server_config"
        };
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class SneakServer {
        class main {
            file="sneak_server\bootstrap";
            class Sneak_preInit{ 
                preInit = 1;
            };
            class Sneak_postInit {
                postInit = 1;
            };
        };
    };
};

class CfgSettings
{
    class SneakSettings{
        
    };
};


