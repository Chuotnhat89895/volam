--中原南区 扬州府 茶博士对话
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
	i = random(0,3)

	if (i == 0) then
		Say("Tr� l� m閠 s秐 ph萴 tao nh� trong thi猲 h�. U鑞g tr� l� m閠 chuy謓 tao nh� b薱 nh蕋 trong thi猲 h�. Ngi ngi u bi誸 u鑞g tr� l� m閠 ngh� thu藅, c竎h pha tr� c騨g l� lo筰 h鋍 v蕁 uy猲 th﹎!",0)
		return
	end

	if (i == 1) then
		Say("Pha tr� chia th祅h h� u, trung u, thng u, kh玭g n gi秐 nh� m鋓 ngi tng",0)
		return
	end

	if (i == 2) then
		Say("Tr� l� m閠 s秐 ph萴 tao nh� trong thi猲 h�. U鑞g tr� l� m閠 chuy謓 tao nh� b薱 nh蕋 trong thi猲 h�. Ngi ngi u bi誸 u鑞g tr� l� m閠 ngh� thu藅, c竎h pha tr� c騨g l� lo筰 h鋍 v蕁 uy猲 th﹎!",0)
		return
	end

	if (i == 3) then
		Say("U鑞g tr� ch� thng th鴆 c飊g b竛h ng鋞 tr竔 c﹜, c遪 u鑞g ru ph秈 c� ch髏  nh蕀!.....",0)
	end

end

