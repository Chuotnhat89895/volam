-- IB帮会地图管理

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4, 1290, 1, -1, "Thanh ng nh" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1天的秒数
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1周的秒数


-- 帮会地图管理
function tongmap_management()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� m韎 c� th� x﹜ d鵱g khu v鵦 cho bang", "Л頲!/cancel"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalk, "<dec><npc>B蕋 k� bang h閕 n祇 u c� th� x﹜ d鵱g khu v鵦 ri猲g. X﹜ d鵱g khu v鵦 ri猲g c莕 c� <color=yellow>4 Thanh уng жnh<color>, th阨 gian s� d鬾g l� <color=yellow>2 tu莕<color>. Thanh уng жnh c� th� k衞 d礽 th阨 gian s� d鬾g khu v鵦 bang h閕, m鏸 Thanh уng жnh c� t竎 d鬾g k衞 d礽 th阨 gian s� d鬾g 1 tu莕.");
		tinsert(aryTalk, "V祇 xem th�/tongmap_preview_1");
		tinsert(aryTalk, "X﹜ d鵱g khu v鵦 bang h閕/tongmap_create_1");
	else
		tinsert(aryTalk, "<dec><npc>Khu v鵦 bang h閕 c馻 b筺 c� th阨 h筺 s� d鬾g l� <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalk, "迁移帮会地图/tongmap_change_1");
		tinsert(aryTalk, "K衞 d礽 th阨 gian s� d鬾g khu v鵦 bang h閕./tongmap_recharge_1");
	end
	tinsert(aryTalk, "H駓 b� /cancel");
	CreateTaskSay(aryTalk);
end
		
-- 预览帮会地图
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>L鵤 ch鋘 khu v鵦 mu鑞 xem",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "H駓 b� /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyId, pos.x, pos.y);
end

-- 创建帮会地图
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>H穣 l鵤 ch鋘 khu v鵦 mu鑞 x﹜ d鵱g<enter>X﹜ d鵱g khu v鵦 bang h閕 c莕 c�"..TONGMAP_CREATE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5]..", c� th� s� d鬾g trong 2 tu莕. :",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "H駓 b� /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>Ngi x竎 nh mu鑞 x﹜ d鵱g  "..aDynMapCopyName[nMapCopyId].." Ch鋘 khu v鵦 n祔? <enter>X﹜ d鵱g khu v鵦 bang h閕 c莕 c�"..TONGMAP_CREATE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].." c� th� s� d鬾g trong  2 tu莕.",
		"X竎 nh薾/#tongmap_create_3("..nMapCopyId..")",
		"H駓 b� /cancel",
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>Qu� bang  c� khu v鵦 bang h閕 r錳.", "Л頲!/cancel"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>X﹜ d鵱g khu v鵦 bang h閕 c莕 4 Thanh уng жnh!", "Л頲!/cancel"});
		return
	end
	-- 扣钱
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] L鏸 x秠 ra khi tr� chi ph� x﹜ d鵱g bang h閕!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- 创建地图
	TONG_ApplyCreatMap(nTongID, nMapCopyId);
	-- 设置有效日期
	local szExpireDate = tongmap_add_expire_date(nTongID, TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>X﹜ d鵱g th祅h c玭g khu v鵦 bang h閕, c� hi謚 l鵦 n <color=yellow>"..szExpireDate.."<color>", "Ti誴 t骳 gia h筺/tongmap_recharge_1", "R阨 kh醝/cancel"});
end

---- 迁移帮会地图
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>请选择要迁移到哪个地图（价格 "..TONGMAP_CHANGE_PRICE.."个"..TONGMAP_PRICE_ITEM[5].."）：",
--	};
--	for nMapCopyId, szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalk, szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalk, "取消/cancel");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>你确定要迁移到 "..aDynMapCopyName[nMapCopyId].." 这个地图（价格 "..TONGMAP_CHANGE_PRICE.."个"..TONGMAP_PRICE_ITEM[5].."）？",
--		"确定/#tongmap_change_3("..nMapCopyId..")",
--		"取消/cancel",
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _, nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>贵帮还没有帮会地图！", "好的/cancel"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>你不够钱迁移帮会地图阿，同学！", "好的/cancel"});
--		return
--	end
--	-- 扣钱
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] 异常！迁移帮会地图扣费失败！\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- 迁移地图
--	TONG_ApplyChangeMap(nTongID, nMapCopyId);
--end

-- 充值帮会地图
function tongmap_recharge_1()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("Gia h筺 khu v鵦 bang h閕", "H穣 a v祇 "..TONGMAP_PRICE_ITEM[5]..","..TONGMAP_RECHARGE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5].."C� th� gia h筺 s� d鬾g th猰 1 tu莕. \n".."C� th阨 h筺 s� d鬾g n "..tongmap_get_expire_date(nTongID), "tongmap_recharge_2", "cancel");
end
function tongmap_recharge_2(nItemCount)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1, nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenre, nItemDetailType, nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItem, nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>C莕 ph秈 a v祇 t鑙 thi觰 "..TONGMAP_RECHARGE_PRICE.."c竔"..TONGMAP_PRICE_ITEM[5]..".",
			"M� l筰/#tongmap_recharge_1()",
			"Kh玭g c莕/cancel",
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- 扣钱
	for i = 1, nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] L鏸 x秠 ra khi kh蕌 tr� chi ph� gia h筺 khu v鵦 bang h閕!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- 设置有效日期
	local szExpireDate = tongmap_add_expire_date(nTongID, nRechargeWeek);
	CreateTaskSay({"<dec><npc>Gia h筺 th祅h c玭g th猰 <color=yellow>"..nRechargeWeek.."<color> tu莕, c� hi謚 l鵦 n <color=yellow>"..szExpireDate.."<color>", "Ti誴 t骳 gia h筺/tongmap_recharge_1", "R阨 kh醝/cancel"});
end

-- 增加帮会地图有效日期（单位为周）
function tongmap_add_expire_date(nTongID, nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
end

-- 检查帮会地图是否已过有效日期
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- 已过期
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1天内提示即将过期
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- 即将过期
		else
			return 0;		-- 正常
		end
	end
end

-- 获取帮会地图有效日期
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d", TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function cancel()
end