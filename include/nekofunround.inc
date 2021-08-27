#if defined _nekoFunRound_included_
	#endinput
#endif
#define _nekoFunRound_included_

public SharedPlugin __pl_neko = {
  name = "neko-FunRound-api",
  file = "neko-FunRound-api.smx",
  #if defined REQUIRE_PLUGIN
	required = 1
  #else
	required = 0
  #endif
};

/**
 * 注册自定义回合
 * @param FunRoundName 注册回合名字
 * Returns 返回自定义回合索引
 **/
native int NEKO_RegFunRoundIndex(char[] FunRoundName);

/**
 * 注销自定义回合
 * @param index	注册回合索引  
 * Returns 注销是否成功
 **/
native bool NEKO_RemoveFunRoundIndex(int index);

/**
 * 注销自定义回合
 * @param index	注册回合索引  
 * Returns 当前索引是否为自定义回合索引
 **/
native bool NEKO_IsFunRoundIndex(int index);

/**
 * @param index	回合索引
 **/
forward void NEKO_OnFundRonudStart(int index);

/**
 * @param index	回合索引
 **/
forward void NEKO_OnFundRonudEnd(int index);