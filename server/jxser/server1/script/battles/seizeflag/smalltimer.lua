IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1_TIME) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1_TIME, t)
	
	--Storm 加奖励积分
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v鵦 S� c蕄 "
	elseif (lsf_level == 2) then
		resultstr = "Khu v鵦 Trung c蕄 "
	elseif (lsf_level == 3) then
		resultstr = "Khu v鵦 Cao c蕄 "
	end
	
	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."T鑞g Kim- phng th鴆 畂箃 c�-  k誸 th骳 b竜 danh! Ch輓h th鴆 khai chi課!", 2);
		Msg2MSAll(MISSIONID, "T鑞g Kim ch輓h th鴆 khai chi課! C竎 chi課 s�! X玭g l猲!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- 日常任务刷新对话NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Chi課 d辌h T鑞g Kim 畂箃 k�, hi謓 tai 產ng trong giai 畂筺 b竜 danh, nh鱪g ngi mu鑞 tham gia h穣 nhanh ch鉵g n Tng Dng ho芻 Chu Ti猲 Tr蕁  n Chi課 trng, ho芻 s� d鬾g T鑞g Kim Chi猽 Th�  n 甶觤 b竜 danh. Th阨 gian khai chi課 c遪 l筰:"..RestMin.."ph髏. 襲 ki謓 tham gia: ng c蕄 t� 40, ph� b竜 danh 3000 lng. Sau khi khai chi課, n誹 t鎛g s� ngi ch璦  v蒼 c� th� ti誴 t鬰 b竜 danh!";
			str2 ="<#>C竎h th阨 gian khai chi課 ch� c遪:"..RestMin.."ph髏"
		else
			str1 = resultstr.."<#>Chi課 d辌h T鑞g Kim 畂箃 k�, hi謓 tai 產ng trong giai 畂筺 b竜 danh, nh鱪g ngi mu鑞 tham gia h穣 nhanh ch鉵g n Tng Dng ho芻 Chu Ti猲 Tr蕁  n Chi課 trng, ho芻 s� d鬾g T鑞g Kim Chi猽 Th�  n 甶觤 b竜 danh. Th阨 gian khai chi課 c遪 l筰:"..RestMin.."ph髏"..RestSec.."gi﹜. 襲 ki謓 tham gia: ng c蕄 t� 40, ph� b竜 danh 3000 lng. Sau khi khai chi課, n誹 t鎛g s� ngi ch璦  v蒼 c� th� ti誴 t鬰 b竜 danh!";
			str2 = "<#>C竎h th阨 gian khai chi課 ch� c遪:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--每一分钟产生一批Npc，并且通告当前夺旗的数量
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			if (mod(t, 3 ) == 0) then
				msstr = "C玭g c竜: t� l� 畂箃 c� hi謓 gi� l� <color=yellow>"..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2);
				Msg2MSAll(MISSIONID, msstr);
			end
		end

		if (gamemode == 1 and mod(t, 6) == 0) then
			sf_showflagpos()
		end
	end;


	--随机夺旗模式的产生旗规则 。必须在正式战斗状态才能放旗
	if (gamemode == 2) then
		if (GetMissionV(MS_STATE) ~= 2) then
			return
		end;	
		if (mod(t - RUNGAME_TIME, 6) == 0)  then
			sf_createrandomflag()
		end
	end
end;

function sf_showflagpos()
	l_flagx1 , l_flagy1=  sf_getflagposinfo(1)
	l_flagx2,  l_flagy2 = sf_getflagposinfo(2)
	if (l_flagx1 ~= 0 or l_flagy1 ~= 0) then
		flagstr = "<color=0x00FFFF>Th玭g b竜 chi課 d辌h: hi謓 t筰 so竔 k� b猲 T鑞g t筰<color=yellow>"..l_flagx1..","..l_flagy1.."<color>Ph� c薾"
		Msg2MSAll(MISSIONID, flagstr)
	end
	if (l_flagx2 ~= 0 or l_flagy2 ~= 0) then
		flagstr = "<color=0x9BFF9B>Th玭g b竜 chi課 d辌h: hi謓 t筰 soias k� b猲 Kim t筰<color=yellow>"..l_flagx2..","..l_flagy2.."<color>Ph� c薾"
		Msg2MSAll(MISSIONID, flagstr)
	end			
end
