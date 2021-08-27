#include <sourcemod>
#include <nekofunround>

#define roundname "透视回合"
int index = -1;
public void OnPluginStart()
{
	index = NEKO_RegFunRoundIndex(roundname);
	HookEvent("player_spawn", PlayerSpawn);
}

public void NEKO_OnFundRonudStart(int RoundIndex) {//自定义回合开始

	if(index != RoundIndex)
		return;
	PrintToChatAll("当前回合为 %s", roundname);
}

public Action PlayerSpawn(Event event, const char[] name, bool dontBroadcast) 
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (IsValidClient(client) && IsPlayerAlive(client) && NEKO_IsFunRoundIndex(index))//NEKO_IsFunRoundIndex(index) 只要索引一样必定为当前自定义回合
		SetEntPropFloat(client, Prop_Send, "m_flDetectedByEnemySensorTime", 9999999.0);
}

public void NEKO_OnFundRonudEnd(int RoundIndex) {//回合结束

	if(index != RoundIndex)
		return;
	for(int client = 1; client <= MaxClients; ++client)
	{
		if (IsValidClient(client))
			SetEntPropFloat(client, Prop_Send, "m_flDetectedByEnemySensorTime", 0.0);
	}	
}

stock bool IsValidClient( client )
{
	if ( client < 1 || client > MaxClients ) return false;
	if ( !IsClientConnected( client )) return false;
	if ( !IsClientInGame( client )) return false;
	return true;
}