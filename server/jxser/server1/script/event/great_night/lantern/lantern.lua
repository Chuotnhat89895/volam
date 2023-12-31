-- 2005中秋节活动 花灯NPC脚本 by wangbin 2005-09-02

IncludeLib("FILESYS")
Include("\\script\\event\\great_night\\lantern\\create_lanterns.lua")
Include("\\script\\tong\\tong_award_head.lua");

LANTERN_TSKID_DATE	= 1604;
LANTERN_TSKID_WCNT	= 1605;
MX_LANTERN_COUNT	= 30;
LANTERN_FILE = "\\settings\\event\\zhongqiuhuodong\\zhongqiudengmi.txt"

function main()
	local npcidx = GetLastDiagNpc()
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end
	
	local nDay = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(LANTERN_TSKID_DATE) ~= nDay ) then
		SetTask(LANTERN_TSKID_DATE, nDay)
		SetTask(LANTERN_TSKID_WCNT, 0)
	end
	
	if ( GetLevel() < 20 ) then
		Say("Ъng c蕄 th蕄 h琻 20, kh玭g th� tham gia ho箃 ng n祔.", 0)
		return
	end
	
	if ( GetTask(LANTERN_TSKID_WCNT) >= MX_LANTERN_COUNT ) then
		Say("H玬 nay b筺  畂竛 ng "..MX_LANTERN_COUNT.."nhi襲 c﹗  r錳! Nhng c� h閕 cho ngi kh竎 甶!", 0)
		return
	end
	show_riddle(0, "C﹗  nh� sau: <enter>" )
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx)	--delete npc
end

function delnpcsafe(nNpcIndex)
	if (nNpcIndex <= 0 )  then
		return
	end
	
	PIdx = NpcIdx2PIdx(nNpcIndex);
	if (PIdx > 0) then 
		WriteLog("ERROR!!!DelNpc WANT TO DELETE Player");
		return
	end;
	
	DelNpc(nNpcIndex)
	local mapid = SubWorldIdx2ID(SubWorld)
	for i = 1, getn( tbLANTERNS_NPC ) do
		if ( tbLANTERNS_NPC[i][1] == mapid ) then
			SetGlbValue( tbLANTERNS_NPC[i][2], (GetGlbValue( tbLANTERNS_NPC[i][2] ) - 1) )
			break
		end
	end
end;

-- 显示灯谜对话
tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

-- 概率
tbl_odds = {
	20,
	12,
	6,
	4,
	2,
	5,
	20,
	11.5,
	15,
	1.5,
	1.5,
	1.5,
};


-- 奖励
tbl_awards = {
	{5,  nil},
	{10, nil},
	{15, nil},
	{30, nil},
	{50, nil},
	{0, {"Ti猲 Th秓 L� ", 6, 1, 71, 0}},
	{0, {"Ph骳 Duy猲 L� (Чi) ", 6, 1, 124, 0}},
	{0, {"Qu� Hoa T鰑", 6, 1, 125, 1}},
	{0, {"Thi猲 s琻  B秓 L� ", 6, 1, 72, 1}},
	{0, {"Lam Th駓 Tinh", 238}},
	{0, {"L鬰 Th駓 Tinh", 240}},		
	{0, {"T� Th駓 Tinh", 239}},
};

-- 发奖
function issue(items)
local szLog = date("%y-%m-%d,%H:%M,").."Account:"..GetAccount()..",Name:"..GetName()..",in the mid_autumn "
	if (items[1] ~= 0) then
		local exp = items[1] * 10000
		AddOwnExp(exp)
		Msg2Player("B筺 t 頲" .. exp .. "甶觤 kinh nghi謒.");
		szLog = szLog.."get "..exp.." point experience;"
	end
	local attrs = items[2]
	if (attrs ~= nil) then
		local count = getn(attrs)
		if (count == 2) then
			AddEventItem(attrs[2])
		elseif (count == 5) then
			AddItem(attrs[2], attrs[3], attrs[4], attrs[5], 0, 0, 0)
		elseif (count == 9) then
			AddQualityItem(attrs[2], attrs[3], attrs[4], attrs[5], attrs[6], attrs[7], attrs[8], attrs[9])
		end
		Msg2Player("B筺 nh薾 頲 m閠" .. attrs[1] .. "!");
		szLog = szLog.."get "..attrs[1]..";"
	end
	WriteLog(szLog)
end

g_count = 0
-- 显示灯谜问题
function show_riddle(count, caption)
--	print(format("g_count:%d", g_count))
	g_count = g_count + 1
	file = LANTERN_FILE
	TabFile_Load(file, file)
	local row_count = TabFile_GetRowCount(file) - 1
	if (row_count > 1) then
		local row = random(2, row_count)
		local answer = TabFile_GetCell(file, row, 2)
		local question = format("%s%s", caption, TabFile_GetCell(file, row, 3))
		local options = {}
		local tbi = {}
		
		local ncount = 0;
		local szopp = "";
		for i = 1, 4 do
			szopp = TabFile_GetCell(file, row, 3 + i);
			if (szopp ~= "" and szopp ~= nil) then
				ncount = ncount + 1;
				options[ncount] = szopp;
				if (tbl_answer_index[answer] == i) then
					options[ncount] = format("%s/#answer_ok(%d)", options[i], count)
				else
					options[ncount] = format("%s/answer_fail", options[i])
				end
			end;
		end
		ReSort(options)
		tinsert(options, "H駓 b� /answer_cancel")
		Say(question, getn(options), options)
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- 灯谜回答正确
function answer_ok(count)
	-- print(format("answer_ok(%d)", count))
	if (count >= 2) then
		-- 发奖
		tongaward_riddle()
		local index = get_odds_award(tbl_odds, 100)
		if (index >= 1) then
			issue(tbl_awards[index])
			Talk(1, "", "Ngi  p ng li猲 t鬰 3 c﹗! Xin nh薾 ph莕 thng!")
			SetTask(LANTERN_TSKID_WCNT, GetTask(LANTERN_TSKID_WCNT) + 1)
			DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "huashandengmi")
		end
	else
		show_riddle(count + 1, "Th藅 xu蕋 s綾! Xin ti誴 t鬰! <enter>")
	end
end

-- 灯谜回答错误
function answer_fail()
	show_riddle(0, "Sai r錳! Xin ti誴 t鬰! <enter>")
end

-- 取消灯谜问答 
function answer_cancel()
	-- nothing
end
-- oddsaward.lua by wangbin 2005-09-02
-- items: 一个table，每一项为一个概率值
function get_odds_award(items, base)
	local valve = random(0, base*1000) / 1000
	local odds = 0
	local i = 1
	while (i <= getn(items)) do
		odds = odds + items[i]
		if (odds >= valve) then
			return i
		end
		i = i + 1
	end
	return -1
end
