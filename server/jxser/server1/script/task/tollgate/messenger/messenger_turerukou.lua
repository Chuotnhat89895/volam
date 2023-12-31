-------------------------------------------------------------------------
-- FileName		:	messenger_turerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   千宝库入口
-------------------------------------------------------------------------

Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --包含玩家任务数据表格的类
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数

Include("\\script\\lib\\common.lua");

Include("\\script\\activitysys\\functionlib.lua")--引用lib:DoFunByPlayer

function main()
	local tbDialog =
	{
		--"接受任务/ture_gettask",
		"B総 u nhi謒 v� /ture_try_starttask",
		"Ti誴 t鬰 nhi謒 v�/ture_continuetask",
	  	"R阨 kh醝 khu v鵦/ture_movecity",
	  	"L竧 n鱝 quay l筰 /no",
	}
--	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "在千宝库地图的任务/birthday0905_ture");
--	end
	 Describe(DescLink_YiGuan..": T� ch� c馻 ta y b総 u ph﹏ c玭g nhi謒 v� c� th� cho ngi, c� l猲 nh�. T� i do i trng b総 u nhi謒 v� th� c祅g d� ho祅 th祅h nhi謒 v� h琻. B﹜ gi� ngi mu鑞 l祄 g� y ?",getn(tbDialog), unpack(tbDialog))
end

--function ture_gettask()
--	local Uworld1204 = nt_getTask(1204)  --记录玩家的任务变量，每次任务结束时清空
--	local Uworld1028 = nt_getTask(1028)  --任务链任务变量
--
--	if ( GetLevel() < 120 ) then
--		Describe(DescLink_YiGuan.."：对不起，您当前等级没有达到最小的120级要求。请达到等级再来找我吧。",1,"结束对话/no")	
--	elseif ( Uworld1204 ~= 0 )  then
--		Describe(DescLink_YiGuan.."：对不起，您当前的信使任务未完成，不能接同样的任务，请先完成该任务，谢谢。",1,"结束对话/no")
--	elseif (  messenger_givetime() == 10 ) then  --查看今日是否还有关卡时间
--		Describe(DescLink_YiGuan.."：对不起，您今天在信使任务中的时间已耗尽，请明日再来,谢谢。",1,"结束对话/no")
--	else
--		nt_setTask( 1204,1 )
--		nt_setTask( 1203,10) --设置信使任务的步骤
--	end
--end

--function ture_starttask()
--	if ( nt_getTask(1203) == 10 ) then
--		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
--		nt_setTask(1203,20)
--		DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
--		SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
--		SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
--		SetPunish(0);				--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
--		SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
--		ForbidChangePK(1);   		--不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
--		SetPKFlag(0);               --设置为练功模式            
--		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
--		SetPos(1414,3191);
--		Msg2Player("任务开始计时了")
--	elseif ( nt_getTask(1203) == 20 ) then
--		Describe(DescLink_YiGuan.."：你已经开始了任务，无需再开始勒。",1,"结束对话/no")
--	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
--		Describe(DescLink_YiGuan.."：你已经完成了任务，怎么还要开始任务呢？速速离开吧。",1,"结束对话/no")
--	elseif ( nt_getTask(1203) == 0 ) then
--		Describe(DescLink_YiGuan.."：你的信使任务已经失败，请速速离开。",1,"结束对话/no")
--	end
--end

function ture_try_starttask()
	if ( nt_getTask(1203) == 10 ) then
		--自己开始任务
		local nTeamSize = GetTeamSize();
		if nTeamSize > 1 and IsCaptain() ~= 1 then
			Describe(DescLink_YiGuan..": Ngi kh玭g ph秈 i trng, kh玭g th� b総 u nhi謒 v�.",1,"K誸 th骳 i tho筰/no")
			return
		end
		
		local nTaskCode,_ = %get_task_order()
		ture_real_starttask_one(nTaskCode);
		
    	if (nTeamSize > 1) then
    		--所有队员开始任务
    		for i=1,nTeamSize do
    			local nMemberIndex = GetTeamMember(i)
    			print(format("nMemberIndex:%d", nMemberIndex))
    			if nMemberIndex >= 0 then
    			
--    			if(CallPlayerFunction(nMemberIndex, IsCaptain)~=1)then
--    				CallPlayerFunction(nMemberIndex, ture_real_starttask_member, nTaskCode)
--    			end
        			if(lib:DoFunByPlayer(nMemberIndex, IsCaptain)~=1)then
    					lib:DoFunByPlayer(nMemberIndex, ture_real_starttask_member, nTaskCode);
    				end
    			else
    				print(format("nMemberIndex:%d error", nMemberIndex))
				end
    		end
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] b総 u nhi謒 v� T輓 S�, nh﹏ s� t� i l� [%d]",
			GetAccount(),
			GetName(),
			nTeamSize
			)
		);
	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
		Describe(DescLink_YiGuan..": Ngi  b総 u nhi謒 v�, kh玭g c莕 ph秈 l筰 b総 u n鱝.",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": Nhi謒 v� c馻 ngi  ho祅 th祅h, sao l筰 ph秈 b総 u n鱝 ? Nhanh ch﹏ r阨 kh醝 y 甶.",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v� T輓 s� r錳! Nhanh ch﹏ r阨 kh醝 y 甶!",1,"K誸 th骳 i tho筰/no")
	end
end

function ture_real_starttask_one(nTaskCode)
	nt_setTask(1202,0)--清空当前任务进度
	ture_real_starttask(nTaskCode)
	
	local szMsg,nCount = get_task_string(nTaskCode)
	szMsg = format("Ngi b総 u nhi謒 v� Thi猲 B秓 Kh� Лa Tin, h穣 n緈 b総 th阨 gian 甶 m� 5 B秓 Rng ho祅 th祅h nhi謒 v� 甶, h穣 ch� � m� ng th� t�: <color=yellow>%s<color>", szMsg)
	Msg2Player(szMsg)
end

function ture_real_starttask_member(nTaskCode)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == 395 then
    	if ( nt_getTask(1203) == 10 ) then
    		nt_setTask(1202,0)--清空当前任务进度
    		ture_real_starttask(nTaskCode)
    		
    		local szMsg,nCount = get_task_string(nTaskCode)
    		szMsg = format("чi trng c馻 ngi  b総 u nhi謒 v� Thi猲 B秓 Kh� Лa Tin, h穣 n緈 b総 th阨 gian n b秐  <color=yellow> Thi猲 B秓 Kh�<color> m� B秓 Rng ho祅 th祅h nhi謒 v� 甀, h穣 ch� � m� rng ng th� t�: <color=yellow>%s<color>", szMsg)
    		Msg2Player(szMsg)
    		return
    	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
    		Msg2Player("чi trng c馻 ngi  b総 u nhi謒 v� Thi猲 B秓 Kh� Лa Tin, nhi謒 v� c馻 ngi kh玭g gi鑞g v韎 i ng�, h穣 t� m譶h ho祅 th祅h nh�")
    	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
    		Msg2Player("чi trng c馻 ngi  b総 u nhi謒 v� Thi猲 B秓 Kh� Лa Tin, nhi謒 v� c馻 ngI  ho祅 th祅h, kh玭g gi鑞g v韎 i ng�, h穣 r阨 i 甶 giao nhi謒 v� 甶")
    	elseif ( nt_getTask(1203) == 0 ) then
    		Msg2Player("чi trng c馻 ngi  b総 u nhi謒 v� Thi猲 B秓 Kh� Лa Tin, ngI v蒼 ch璦 ti誴 nh薾 nhi謒 v� n祔, h穣 r阨 kh醝 i ng� 甶")
    	end
    else
    	Msg2Player("чi trng c馻 ngi  b総 u nhi謒 v� Thi猲 B秓 Kh� Лa Tin, ngi kh玭g � b秐 <color=yellow>Thi猲 B秓 Kh�<color>, xin h穣 t� m譶h ho祅 th祅h")
	end
	
	Msg2Team(format("<color=yellow>%s<color>Ti課  nhi謒 v� kh玭g gi鑞g v韎 i ng�", GetName()))
end

function ture_real_starttask(nTaskCode)
	nt_setTask(1211,GetGameTime())              --:设置任务开始时间
	nt_setTask(1203,20)
	nt_setTask(1201,nTaskCode)
	DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
	SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
	SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
	SetPunish(1);				--打开死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
	--SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
	ForbidChangePK(0);   		--允许更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
	SetPKFlag(0);               --设置为练功模式            
	SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
	SetPos(1414,3191);
	--Cho b蕋 t� 3 gi﹜, tr竓 b�  s竧 - Modifiec by DinhHQ - 20110502
	SetProtectTime(3*18)
	AddSkillState(963, 1, 0, 18*3) 	
end

function ture_movecity()
--Fix bug v蒼 pk 甤 trong th祅h n誹 d辌h chuy觧 b籲g npc D辌h Quan khi ho祅 th祅h nhi謒 v� t輓 s� - Modified by DinhHQ - 20110518
	DisabledUseTownP(0)
	SetFightState(0)	
	SetPunish(1)
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	local name = GetName()
	if ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("D辌h tr筸 Thi猲  B秓 khu"..name.."Чi nh﹏ n"..citygo[i][4].."D辌h tr筸!")
			end
		end	
	elseif ( nt_getTask(1203) == 10 ) or ( nt_getTask(1203) == 0 ) or ( nt_getTask(1203) == 20) or ( nt_getTask(1203) == 21 ) then
		SetLogoutRV(0);
		NewWorld(11,3021,5090)
	end
end

function birthday0905_ture()
	tbBirthday0905.tbTask:reset_task();
	Say("D辌h Quan: T� ng祔 19/06/2009 n 24h ng祔 19/07/2009 , n誹 i hi謕 c� th� vt qua 頲 m閠 trong nh鱪g th� th竎h sau y th� i hi謕 s� nh薾 頲 m閠 trong b鑞 t輓 v藅 v� c飊g qu� gi� l� 揟hi猲 T祅 o�. Чi hi謕 c� b籲g l遪g tham gia th� th竎h kh玭g?", 8, 
		"Nh薾 nhi謒 v� M� 100 b秓 rng./#birthday0905_settask_message(4)",
		"Nh薾 nhi謒 v� Ti猽 di謙 1 Чo t芻./#birthday0905_settask_message(5)",
		"Nh薾 nhi謒 v� T譵 1 Thi誹 n� b� th蕋 l筩./#birthday0905_settask_message(6)",
		"Ta  ho祅 th祅h nhi謒 v� M� 100 b秓 rng./#birthday0905_gettask_message(4)",
		"Ta  ho祅 th祅h nhi謒 v� Ti猽 di謙 1 Чo t芻./#birthday0905_gettask_message(5)",
		"Ta  ho祅 th祅h nhi謒 v� T譵 1 Thi誹 n� b� th蕋 l筩./#birthday0905_gettask_message(6)",
		"Ta mu鑞 h駓 nhi謒 v� hi謓 t筰/birthday0905_cancel_message",
		"Ta c� chuy謓 g蕄, s� quay l筰 sau./no");
end

function no()
end

function ture_continuetask()
	if ( nt_getTask(1203) == 10 ) then
		Describe(DescLink_YiGuan..": Nhi謒 v� c馻 ngi v蒼 ch璦 b総 u, kh玭g th� ti誴 t鬰 nhi謒 v�.",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1203) == 20 ) then
		Describe(DescLink_YiGuan..": Nhi謒 v� c馻 ngi  b総 u, h穣 nhanh ch鉵g 甶 m� 5 B秓 Rng 甶.",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1203) == 21 ) then
		ture_real_starttask(nt_getTask(1201))
		Msg2Player("Nhi謒 v� c馻 ngi c� th� ti誴 t鬰")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": Nhi謒 v� c馻 ngi  ho祅 th祅h, kh玭g c莕 ph秈 ti誴 t鬰 n鱝.",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": Nhi謒 v� c馻 ngi  th蕋 b筰, nhanh ch鉵g r阨 kh醝 y.",1,"K誸 th骳 i tho筰/no")
	end
end

