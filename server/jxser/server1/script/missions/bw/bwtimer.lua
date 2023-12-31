Include("\\script\\missions\\bw\\bwhead.lua");

szCaptainName = {};
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);
	
	szCaptainName = bw_getcaptains(); --获取两队队长的名字；

	if (timestate == 1) then 	--报名阶段
		local str1 = ReportMemberState(V);
		bw_noticecaptainkey(str1);
	elseif (timestate == 2) then --开战了
		ReportBattle(V);
	elseif (timestate == 3) then  --战斗结束了
		Msg2MSAll(BW_MISSIONID, "K誸 th骳 tr薾 u!");
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况

	if (V == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - V) / 3);
	RestSec = mod((GO_TIME - V),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "Th阨 gian v祇 thi u l玦 i <#> c遪: <color=yellow>"..RestMin.."<color><#> ph髏."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - V) == 3) then 
			str1 = GetMissionS(CITYID).."Th阨 gian v祇 thi u l玦 i <#> ch� c遪 ng <color=yellow>1<color> ph髏, xin m鋓 ngi nhanh ch鉵g v祇 trng u."
			--AddGlobalCountNews(str1)
		end
	elseif (RestMin == 0) then
		str1 = "Th阨 gian v祇 thi u l玦 i <#> c遪: <color=yellow>" ..RestSec.. "<color><#> gi﹜."
		Msg2MSAll(BW_MISSIONID, str1);
	end;
	return str1;
end;

function bw_noticecaptainkey(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	local masteridx, szName, nKey, str;
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
			szName = GetMissionS(MSS_CAPTAIN[i]);
			nKey = GetMissionV(MS_TEAMKEY[i]);
			nCount = GetMissionV(MS_MAXMEMBERCOUNT);
			str = "C竎 h�  thu閏 i thi u <color=yellow> "..GetMissionS(CITYID).."<color> <#> thu閏 i <color=yellow> "..nCount.."<color> u v韎 <color=yellow> "..nCount.."<color>, <#> s� th� t� v祇 u trng <color=yellow> ["..nKey.."]<color>. H穣 th玭g b竜 v韎 i h鱱 m譶h v祇 u trng.";
			Msg2Player(str);
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_begin_compete()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0  and nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Th阨 gian thi u l玦 i  n, i <color=yellow>"..szCaptainName[1].."<#> <color> v� i <color=yellow>"..szCaptainName[2].."<#> <color> kh玭g ng gi� v祇 u trng, tr薾 u h駓 b�!";
		Msg2MSAll(BW_MISSIONID,str1)
		--AddGlobalCountNews(str1);
		SetMissionV(MS_STATE,3);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Th阨 gian thi u l玦 i  n, i <color=yellow>"..szCaptainName[1].."<#> <color> kh玭g ng gi� v祇 u trng, i <color=yellow>"..szCaptainName[2].."<#> <color> 頲 x� th緉g!"
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(2);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Th阨 gian thi u l玦 i  n, i <color=yellow>"..szCaptainName[2].."<#> <color> kh玭g ng gi� v祇 u trng, i <color=yellow>"..szCaptainName[1].."<#> <color> 頲 x� th緉g!";
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(1);
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "Ch蕀 d鴗 th阨 gian v祇 u trng, thi u ch輓h th鴆 b総 u!");
	str = GetMissionS(CITYID).."L玦 i <#> <color=yellow>"..szCaptainName[1].."<color> <#> v� <color=yellow>"..szCaptainName[2].."<color> <#> ch蕀 d鴗 th阨 gian v祇 u trng, thi u ch輓h th鴆 b総 u!";
	--AddGlobalCountNews(str);
	RunMission(BW_MISSIONID);
	return
end;

function ReportBattle(V)
	bw_checkwinner();	--战斗进行过程中，系统定期通知各方的阵亡情况
	gametime = (floor(GetMSRestTime(BW_MISSIONID,BW_TOTALTIME_ID)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "Giai 畂筺 chi課 u L玦 i <#>: Hai b猲 產ng thi u. Th阨 gian c遪  <color=yellow>"..RestSec.."<color><#> gi﹜.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "Giai 畂筺 chi課 u L玦 i <#>: Hai b猲 產ng thi u. Th阨 gian c遪  <color=yellow>"..RestMin.."<color><#> ph髏.");
	else
		Msg2MSAll(BW_MISSIONID, "Giai 畂筺 chi課 u L玦 i <#>: Hai b猲 產ng thi u. Th阨 gian c遪  <color=yellow>"..RestMin.."<color><#> ph髏<color=yellow>"..RestSec.."<color><#> gi﹜.");
	end;
end;

function bw_checkwinner()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."Hai b猲 ng th阨 r阨 kh醝 u trng <#>, i <color=yellow>"..szCaptainName[1].."<color> <#> v� <color=yellow>"..szCaptainName[2].."<color> <#> h遖 nhau!";
		bw_all_gone(str1)
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."K誸 qu� l玦 i <#>, i <color=yellow>"..szCaptainName[2].."<color> <#>  nh b筰 i <color=yellow>"..szCaptainName[1].."<color> <#>, gi祅h th緉g l頸 chung cu閏!"
		bw_all_gone(str1)
		return
	end;
	
	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."K誸 qu� l玦 i <#>, i <color=yellow>"..szCaptainName[1].."<color> <#>  nh b筰 i <color=yellow>"..szCaptainName[2].."<color> <#>, gi祅h th緉g l頸 chung cu閏!"
		bw_all_gone(str1)
		return
	end;
end;

function bw_noticecaptainnews(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_all_gone(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	bw_noticecaptainnews(str1);
	CloseMission(BW_MISSIONID);
end;