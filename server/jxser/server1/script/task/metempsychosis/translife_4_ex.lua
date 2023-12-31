-- 文件名　：translife_4_ex.lua
-- 创建者　：wangjingjun
-- 内容　　：转生4补充设计 若玩家已转生4次，且每次都在200级转生，则可以获得特殊技能，战意千秋	
-- 创建时间：2011-09-14 16:20:38

Include("\\script\\task\\metempsychosis\\task_head.lua")

TRANSLIFE_TIME = 4
TRANSLIFE_LEVEL = 200
SKILL_NAME = "Chi課 � Thi猲 Thu"
SKILL_ID = 1171 -- 战意千秋 id
SKILL_LEVEL = 1 -- 战意千秋 等级

function beidou_learn_specialskill()
	local szTitle = format("Ch� c� nh鱪g i hi謕 n祇 ki猲 tr�  <color=yellow>%d<color> tr飊g sinh c蕄 <color=yellow>%d<color> l莕 m韎 c� th� h鋍 頲 v� c玭g b� truy襫 t筰 ch� c馻 ta y! ",TRANSLIFE_LEVEL,TRANSLIFE_TIME)
	local tbOpt = {}
	
	tinsert(tbOpt, {"X竎 nh mu鑞 h鋍 k� n╪g",sureLearnSpecialSkill,{PlayerIndex}})
	tinsert(tbOpt, {" K誸 th骳 i tho筰!"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function checkTranslifetime()
	local n_transcount = ST_GetTransLifeCount()
	if n_transcount < TRANSLIFE_TIME then
		Talk(1,"","Ch璦 t 頲 y猽 c莡 lu玭 ki猲 tr� c蕄 200 tr飊g sinh n l莕 4, kh玭g th� nh薾 頲 k� n╪g n祔")	
		return 0
	end
	return 1
end

function checkTranslifeLevel()
	local n_taskid = 0
	local n_taskbyte = 0
	local bRet = 1
	
	for n_transcount=1, TRANSLIFE_TIME do
		local n_id = floor(n_transcount / 2) + mod(n_transcount, 2)
		n_taskid = TSK_ZHUANSHENG_GRE[n_id]
		
		if (mod(n_transcount, 2) == 0) then
			n_taskbyte = 3
		else
			n_taskbyte = 1
		end
		local n_taskvalue = GetTask(n_taskid)
		n_taskvalue = GetByte(n_taskvalue, n_taskbyte)
	
--		print(format("第%d次转生的等级为%d",n_transcount, n_taskvalue))
	
		if n_taskvalue ~= TRANSLIFE_LEVEL then
			bRet = 0
			break
		end
	end
	
	if bRet ~= 1 then
		Talk(1,"","Ch璦 t 頲 y猽 c莡 lu玭 ki猲 tr� c蕄 200 tr飊g sinh n l莕 4, kh玭g th� nh薾 頲 k� n╪g n祔")	
	end
	
	return bRet
end

function checkIsLearned()
	if HaveMagic(SKILL_ID) == -1 then
		return 1
	end
	Talk(1,"",format("Чi hi謕  h鋍 頲 <color=yellow>%s<color>, kh玭g th� h鋍 l筰 頲 n鱝",SKILL_NAME))
	return 0
end

function sureLearnSpecialSkill(nPlayerIndex)
	
	if checkIsLearned() ~= 1 then
		return 
	end
	
	if checkTranslifetime() ~= 1 then
		return 
	end
	
	if checkTranslifeLevel() ~= 1 then
		return 
	end
	
	-- 学习技能
	
	AddMagic(SKILL_ID, SKILL_LEVEL)
	Talk(1,"",format("Ch骳 m鮪g ngi h鋍 頲 <color=yellow>%s<color>",SKILL_NAME))
end

