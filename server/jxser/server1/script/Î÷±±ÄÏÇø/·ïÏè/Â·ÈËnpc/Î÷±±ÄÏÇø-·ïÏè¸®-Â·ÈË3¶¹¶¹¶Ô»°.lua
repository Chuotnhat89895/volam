--西北南区 凤翔府 路人3豆豆对话
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
	Say("H玬 qua l祄 g蓎 c竔 g祏 m骳 nc c馻 Th竔 th萴 th萴, b� la cho m閠 tr薾, th藅 l� xui x蝟!",0)

end;

