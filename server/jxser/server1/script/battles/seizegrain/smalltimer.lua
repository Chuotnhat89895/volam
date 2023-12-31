IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function OnTimer()
	local t = GetMissionV(MS_TIMER1_TIME) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1_TIME, t);
	
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
		AddGlobalCountNews(resultstr.."Th阨 gian b竜 danh cho T鑞g Kim phng th鴆 V薾 lng  n, cu閏 chi課 ch輓h th鴆 b総 u!", 2);
		Msg2MSAll(MISSIONID, "T鑞g Kim ch輓h th鴆 khai chi課! C竎 chi課 s�! X玭g l猲!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>T鑞g Kim i chi課 phng th鴆 V薾 lng 產ng trong th阨 gian b竜 danh, m鋓 ngi h穣 mau n Tng Dng ho芻 Chu Ti猲 tr蕁  b竜 danh, ho芻 c� th� d飊g T鑞g Kim chi猽 th�  tr鵦 ti誴 n 甶觤 b竜 danh. Th阨 gian khai chi課 c遪 l筰 l�: 	"..RestMin.."ph髏. 襲 ki謓 tham gia: ng c蕄 t� 40, ph� b竜 danh 3000 lng. Sau khi khai chi課, n誹 t鎛g s� ngi ch璦  v蒼 c� th� ti誴 t鬰 b竜 danh!";
			str2 ="<#> Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"
		else
			str1 = resultstr.."<#>T鑞g Kim i chi課 phng th鴆 V薾 lng 產ng trong th阨 gian b竜 danh, m鋓 ngi h穣 mau n Tng Dng ho芻 Chu Ti猲 tr蕁  b竜 danh, ho芻 c� th� d飊g T鑞g Kim chi猽 th�  tr鵦 ti誴 n 甶觤 b竜 danh. Th阨 gian khai chi課 c遪 l筰 l�: 	"..RestMin.."ph髏"..RestSec.."gi﹜. 襲 ki謓 tham gia: ng c蕄 t� 40, ph� b竜 danh 3000 lng. Sau khi khai chi課, n誹 t鎛g s� ngi ch璦  v蒼 c� th� ti誴 t鬰 b竜 danh!";
			str2 = "<#> Th阨 gian b竜 danh c遪 l筰 l�:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--每一分钟产生一批Npc，并且通告当前送粮食包的数量
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			if (mod(t, 3 ) == 0) then
				msstr = format("C玭g b�: T� l� Bao lng phe T鑞g v� phe Kim v薾 chuy觧 頲 l� <color=yellow>%d:%d",BT_GetGameData(GAME_CAMP1),BT_GetGameData(GAME_CAMP2));
				Msg2MSAll(MISSIONID, msstr);
			end
		end
		
		if (t > RUNGAME_TIME) then
			local bp = mod(t - RUNGAME_TIME*2, 3*10);
			local n_b = floor((t - RUNGAME_TIME*2) / (3*10));
			
			if (bp == 0)  then
				sf_creategraingharry(n_b+1);
			end
		end
		
	end;
	
end;

function sf_creategraingharry(n_branch)
	if (n_branch > 3) then
		print("error, add grain branch is overflow !"..n_branch);
		return 0;
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area1 = BT_GetGameData(GAME_CAMP1AREA);
	local area2 = BT_GetGameData(GAME_CAMP2AREA);
	
	local flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "grainpos");
	local flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "grainpos");
	local flagposfile = {flagposfile1, flagposfile2};
	for n_camp = 1, 2 do
		local sz_file = flagposfile[n_camp]
		local count = GetTabFileHeight(sz_file) - 1;
		if (count < 9) then
			print("error, flagposfile height not enough!"..sz_file, count);
			return
		end
		
		for i = ((n_branch-1)*3+1), (n_branch*3) do
			local srcx = GetTabFileData(sz_file, i + 1, 1)
			local srcy = GetTabFileData(sz_file, i + 1, 2)
		
			sf_addgharry(n_camp, srcx, srcy, 0);
		end
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Xe lng m韎  n, h穣 mau cho ngi 甶 v薾 lng.");
	end
	
end
