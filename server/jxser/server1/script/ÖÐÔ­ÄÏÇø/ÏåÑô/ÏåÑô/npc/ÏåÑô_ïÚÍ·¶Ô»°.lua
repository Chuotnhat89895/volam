--中原南区 襄阳府 镖头对话
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
Say("Ti猽 C鬰 uy v� ta n鎖 ti課g � Tng Ng筩. C竎 b籲g h鱱 h綾 b筩h o r蕋 nhi襲. Ngay c� quan ph� c騨g thng nh� b鋘 ta.Ha ha! Ch� c莕 c� ti襫 nhi襲, h祅g g� b鋘 ta c騨g d竚 nh薾!", 0);
end;


