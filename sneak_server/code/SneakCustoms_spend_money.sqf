/********************************************************************
 * sneak_server
 * file: sneak_server\code\SneakCustoms_spend_money.sqf
 * Author: Sneak
 * sneakcustoms@gmail.com
 * This extension is licensed under the Arma Public Licence
 ********************************************************************/
private ["_this", "_playerMoney", "_sessionId"];
diag_log "spend money";
_player = _this select 0;
_skinPrice = _this select 1;
_sessionId = _this select 2;
_playerMoney = _player getVariable ["ExileMoney", 0];
_playerMoney = _playerMoney - _skinPrice;
_player setVariable ["ExileMoney", _playerMoney];

format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;
[_player, "notificationRequest", ["VehicleSkinPurchasedInformation", [_skinPrice * -1]]] call ExileServer_system_network_send_to;
[_sessionId, "moneySentRequest", [str _playerMoney, "Skin"]] call ExileServer_system_network_send_to;
true