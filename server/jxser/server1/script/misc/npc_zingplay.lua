-- 玩ZingPlay获得奖品
-- 领取奖励NPC———ZingPlay使者

Include("\\script\\task\\system\\task_string.lua");	-- 对话处理头文件

-- COMMON 常量 --
ZingPlay_Start_Date	= 20081018;		-- 活动起始时间
ZingPlay_End_Date	= 20081102;		-- 领取限期

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {"<dec><npc>T� 18-10-2008 n 31-10-2008, T蕋 c� nh﹏ s� v� l﹎ khi tham gia c竎 tr� ch琲 c馻 ZingPlay, khi  c竎 y猽 c莕 thi誸 (tham kh秓 t筰 trang ch� c馻 ZingPlay) c� th� n g苝 S� Gi� ZingPlay  nh薾 ph莕 thng Bao L� X� ZingPlay. Th阨 gian nh薾 thng n h誸 ng祔 02-11-2008."};
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		tinsert(tb_Msg, "Ta n nh薾 bao l� x� ZingPlay./take_zingplay_bag");
	end
	
	tinsert(tb_Msg, "K誸 th骳 i tho筰/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end

function take_zingplay_bag()
	local ext_pointid = 4;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>C竎 h� ch璦 th� nh薾 thng l莕 n祔.", "K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,1826,1,1,0);
	local szMsg = format("Thu 頲 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end
