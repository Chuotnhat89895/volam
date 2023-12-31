-- 功能：8转
-- 作者：廖高灿
-- 创建时间：2016-10-11

Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")



TransLife8 = {};
tbTL8MainDlg = {};
TSK_TASK_IS_TS8=2683

TransLife8.tbNeedItem = {
    {6, 1, 4476,  "Ng鋍 Chuy觧 Sinh", 3, -1, 5}
};

TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION = 4236;  -- 保存8转对话过程中选择的技能选项
TransLife8.TRANSLIFE_8_SKILL = {
    {"Чi Di謕 Kh� Tr竜", 993},
    {"Tr鋘g k輈h tuy謙 i", 998}
};

TransLife8.TB_SKILL_LEVEL_UP = {
    [10] = 1,
	[150] = 2,
	[151] = 2,
	[152] = 2,
	[153] = 2,
	[154] = 2,
	[155] = 2,
	[156] = 2,
	[157] = 2,
	[158] = 2,
	[159] = 2,
	[160] = 2,
	[161] = 2,
	[162] = 2,
	[163] = 2,
	[164] = 2,
	[165] = 2,
	[166] = 2,
	[167] = 2,
	[168] = 2,
	[169] = 2,
	[170] = 3,
	[171] = 3,
	[172] = 3,
	[173] = 3,
	[174] = 3,
	[175] = 3,
	[176] = 3,
	[177] = 3,
	[178] = 3,
	[179] = 3,
	[180] = 3,
	[181] = 3,
	[182] = 3,
	[183] = 3,
	[184] = 3,
	[185] = 3,
	[186] = 3,
	[187] = 3,
	[188] = 3,
	[189] = 3,
	[190] = 4,
	[191] = 4,
	[192] = 4,
	[193] = 4,
	[194] = 4,
	[195] = 4,
	[196] = 4,
	[197] = 4,
	[198] = 4,
	[199] = 4,
	[200] = 4
};

-- 与金山掌门对话询问如何进行8转触发的回调
function TransLife8:ShowMainDlg()
	CreateNewSayEx("Sau khi t c蕄 200 tr飊g sinh 7, c� th� 甧m cho ta 5 c竔 Ng鋍 Tr飊g Sinh, ng th阨 ngi ph秈 h鋍 B綾 u Tr飊g Sinh Thu藅 - C� s� thi猲 , ta s� gi髉 ngi tr飊g sinh 8.", tbTL8MainDlg);
end

function TransLife8:Init()
	self:RegisterEvent();
	self:InitDialog();
end

function TransLife8:RegisterEvent()
    for nLevelConfig, tbParam in TransLife8.TB_SKILL_LEVEL_UP do
		EventSys:GetType("OnPlayerLevelUp"):Reg(nLevelConfig, TransLife8.OnLevelUpProcess, self, nLevelConfig);
	end
end

-- The auto level up of the skill of translife 8.
function TransLife8:OnLevelUpProcess(nLevel)
	if ST_GetTransLifeCount() == 8 and TransLife8.TB_SKILL_LEVEL_UP[nLevel] then
		local nSkillLevel = TransLife8.TB_SKILL_LEVEL_UP[nLevel];
		local nSelection = GetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION);

		if (nSelection > 0) and (TransLife8.TRANSLIFE_8_SKILL[nSelection]) then
			local _, nSkillID = unpack(TransLife8.TRANSLIFE_8_SKILL[nSelection]);
			AddMagic(nSkillID, nSkillLevel);
		end
	end
end

function TransLife8:InitDialog()
	tinsert(tbTL8MainDlg, {"B総 u tr飊g sinh 8", self.BeginTransLife8, {self}});
	tinsert(tbTL8MainDlg, {"Ta kh玭g mu鑞 tr飊g sinh 8"});
end

function TransLife8:BeginTransLife8()

	local nCheckCode = self:CheckCondition()
	if nCheckCode ~= 1 then
		return
	end
	
	self:ChooseOneResistance();
end


function TransLife8:CheckCondition()
	local is_ts7 = GetTask(TSK_TASK_IS_TS7)
	if (is_ts7 < 1) then
		Talk(1,"", "Чi hi謕 h穣 tr飊g sinh 7 r錳 n g苝 ta!");
		return 0
	end

	local is_ts8 = GetTask(TSK_TASK_IS_TS8)
	if (is_ts8 > 0) then
		Talk(1,"", "Чi hi謕  tr飊g sinh l莕 8 r錳. Xin ki觤 tra l筰");
		return 0
	end

	if(GetLevel() < 200) then
		Talk(1,"", "Чi hi謕 h穣 t c蕄 200 r錳 quay l筰!");
		return 0
	end

	--admin edit
	-- local nTransLifeCount = ST_GetTransLifeCount()
	-- if nTransLifeCount >= 8 then
	-- 	Talk(1,"", "Ngi  ti課 h祅h tr飊g sinh 8 r錳.");
	-- 	return 0;
	-- end

	-- if nTransLifeCount ~= 7 or GetLevel() < TB_LEVEL_LIMIT[8] then
	-- 	Talk(1,"", format("Ch� c� hi謕 s� c蕄 %d tr飊g sinh 7 m韎 c� th� ti課 h祅h tr飊g sinh 8.", TB_LEVEL_LIMIT[8]));
	-- 	return 0;
	-- end
	
	-- if (check_zhuansheng_level() ~= 1) then	
	-- 	return 0;
	-- end

	-- local nTaskValue = GetTask(2885);
	-- local nTmpRes = floor(nTaskValue/100);
	-- if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
	-- 	Talk(1,"", "Ngi  nh薾 nhi謒 v� k� n╪g 150, xin h穣 ho祅 th祅h nhi謒 v� r錳 h穣 n g苝 ta");
	-- 	return 0;
	-- end

	-- if (CalcItemCount(2,0,-1,-1,-1) > 0) then			--卸下装备
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "Л頲 r錳./OnCancel"});
	-- 	return 0;
	-- end

	-- if check_zhuansheng_league(LG_WLLSLEAGUE) == 1 then	--战队关系
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "Л頲 r錳./OnCancel"});
	-- 	return 0;
	-- end

	-- if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then			--基础篇的学习
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "Л頲 r錳./OnCancel"});
	-- 	return 0;
	-- end

	--check item
	if self:CheckItemNeedCondition() == 0 then
		return 0;
	end
	
	return 1;
end

-- 检查转生玉是否足够
function TransLife8:CheckItemNeedCondition()
	for nIndex, tbItemParam in TransLife8.tbNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam);
		local nCurCount = CalcItemCount(nRoomPos, nGenre, nDetail, nParticular, nLevel)
		if nCurCount < nNeedItemCount then
            local dialogContent = format("<npc>Tr飊g sinh 8 c莕 <color=red>%d<color> c竔 %s, h穣 chu萵 b� xong r錳 quay l筰.", nNeedItemCount, szItemName);
            local tbSelection = {
                {"Л頲 r錳."}
            };
            CreateNewSayEx(dialogContent, tbSelection);
			return 0;
		end
	end
	
	return 1;
end

-- 检查是否重复选择抗性
function TransLife8:CheckResistanceRepetition(nSelection)
    local n_transcount = ST_GetTransLifeCount();
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			
			if i == 7 and n_translevel ~= 0 and n_transresist == nSelection and GetMaxResist(nSelection) < 85 then
			elseif (n_translevel ~= 0 and n_transresist == nSelection) then
                CreateNewSayEx("<npc>"..format("Зy l� l莕 chuy觧 sinh th� %d v�  ch鋘 %s kh玭g th� ch鋘 nhi襲 l莕 1 甶觤 ph遪g ng�, xin m阨 h穣 ch鋘 l筰!", i, TB_BASE_RESIST[nSelection]),
                            {
                                {"L鵤 ch鋘 l筰 t� u", TransLife8.ChooseOneResistance, {TransLife8}},
                                {" K誸 th骳 i tho筰!"}
                            });
				return 0;
			end
		end
	end
    return 1;
end

function TransLife8:onSelectSkill(nSelection)
	Msg2Player("chon skill")
    if (self:CheckCondition() == 0) then
		return 0;
	end
	
	local tbTaskNeedItem = TransLife8.tbNeedItem;
	for nIndex, tbItemParam in tbTaskNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam);
		if ConsumeEquiproomItem(nNeedItemCount, nGenre, nDetail, nParticular, nLevel) ~= 1 then
			Say("Чo c� c莕 thi誸 kh﹗ tr� nhi謒 v� th蕋 b筰!", 0 );
			return
		end
	end

	-- Record the selection of TRANSLIFE_8_SKILL.
    SetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION, nSelection);
	print(format("select TransLife8 skill | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));
	WriteLog(format("select TransLife8 skill | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));

    LeaveTeam();	
	
	--ST_DoTransLife();--trung sinh 8 thanh cong
	--Msg2Player("YYYYYYYYYYYYYY")
	--addskill
	self:AfterTranslifeProcess()
end

function TransLife8:onSelectResistance(nSelection)
    if (self:CheckCondition() == 0) then
		return 0;
	end

    if (self:CheckResistanceRepetition(nSelection) == 0) then

        return 0;
    end

    -- Record the index of resistance the player selected.
    SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, nSelection);
	print(format("select resistance | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));
	WriteLog(format("select resistance | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));


    local tbSkillOption = {};
    for nIndex, skillItem in TransLife8.TRANSLIFE_8_SKILL do
        tinsert(tbSkillOption, {skillItem[1], TransLife8.onSelectSkill, {self, nIndex}});
    end
    tinsert(tbSkillOption, {" K誸 th骳 i tho筰!"});

    CreateNewSayEx("<npc>H穣 ch鋘 k� n╪g tr飊g sinh 8 mu鑞 c�:", tbSkillOption);
end

function TransLife8:ChooseOneResistance()
    local tbOption = {};
		
	for nIndex, resistanceName in TB_BASE_RESIST do
		tinsert(tbOption, {resistanceName, TransLife8.onSelectResistance, {self, nIndex}});
	end
	tinsert(tbOption, {" K誸 th骳 i tho筰!"});

    CreateNewSayEx("<npc>H穣 ch鋘 thu閏 t輓h kh竛g mu鑞 t╪g th猰:",tbOption);
end

function TransLife8:AfterTranslifeProcess()
	SetTask(TSK_TASK_IS_TS8, 1)
	ST_LevelUp(-190);
	Talk(1, "", "Чi Hi謕  tr飊g sinh l莕 8 th祅h c玭g. V� c玭g r蕋 th﹎ h藆, ta xin b竔 ph鬰!")
	Msg2Player("Чi Hi謕  tr飊g sinh l莕 8 th祅h c玭g. V� c玭g r蕋 th﹎ h藆, ta xin b竔 ph鬰!")
   -- Say("Чi hi謕, tr飊g sinh 8  xong, n╪g l鵦  t╪g trng r蕋 nhi襲, mau mau xem th� s� thay i 甶!", 0);

	local nSelection = GetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION);
	local skillInfo = TransLife8.TRANSLIFE_8_SKILL[nSelection];
	if skillInfo then
		local szSkillName, nSkillID = unpack(skillInfo);
		AddMagic(nSkillID, 1);
	end
	AddMagicPoint(20)--add 20 甶觤 k� n╪g
	AddProp(100) --add 100 甶觤 ti襪 n╪g
end


TransLife8:Init();