--中原南区 襄阳府 嫖客2对话
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>Th阨 cu閏 b﹜ gi� nh鱪g con d﹏ b� t竛h ngay c琺 c騨g kh玭g c� m� ╪ cho  no, quan l筰 th� t竎 l筩 kh緋 n琲."
		G_TASK:OnMessage("Th髖 Y猲", tbDailog, "DialogWithNpc")
		tbDailog:Show() 
end;


