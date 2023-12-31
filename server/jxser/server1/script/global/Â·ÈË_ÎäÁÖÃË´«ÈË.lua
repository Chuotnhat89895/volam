--提供福缘领取的NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\event\\storm\\award_npc.lua")	--Storm
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
--	2007年春节活动
Include([[\script\event\springfestival07\head.lua]]);
--武林令活动
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
--dinhhq_20110124:Vip acc 2011
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")

function main()
	
	-- 凡是涉及到活动的武林盟传人对话皆插入到此数组 -- 佩雷斯 2006/03/20
	local aryTalk  = {};
	local ndate = tonumber(GetLocalDate("%Y%m%d%H"));
	local Uworld1000 = nt_getTask(1000);
	
	tinsert(aryTalk, "<dec><npc>Th阨 th� lo筺 l筩, ch� v� n猲 gi� o ch輓h ph竔, t筼 ph骳 ch髇g sinh. C� th� m韎 hi v鋘g tr� th祅h m閠 i hi謕 頲 m鋓 ngi ngng m�.");
	--dinhhq_20110124:Vip acc 2011
	tbVNG_VipAcc2011_VLTN:addDialog(aryTalk)
	
	if ndate >= 2007042800 and ndate <= 2007051324 then
	tinsert(aryTalk,"Ho箃 ng 30-4 v� Qu鑓 t� lao ng/nanfangjiefangri_main");
	end
	if (not FALSE(tongwar_checkinphase())) then
		tinsert(aryTalk, "V� L﹎ е Nh蕋 Bang/tongWar_Start");
	end;
	
	--tinsert(aryTalk, " danh nh﹏ 阯g/honor_hall_enter");
	
	--tinsert(aryTalk, " Minh Nguy謙 tr蕁/autumn_enter");
	
	tinsert(aryTalk, "Nh薾 甶觤 ph骳 duy猲 c馻  b筺/OnGain_Self");

	if( GetTeamSize() > 1 ) then
		tinsert(aryTalk, "Nh薾 甶觤 ph骳 duy猲 c馻 t蕋 c� th祅h vi猲 trong nh鉳/OnGain_Team");
	end;
	
	tinsert(aryTalk, "Nh薾 甶觤 danh v鋘g (ch琲 nhi襲 gi�) /W33_prise");
	
	tinsert(aryTalk, "Th阨 gian t輈h l騳 i 甶觤 ph骳 duy猲/OnQueryTime");
	
	tinsert(aryTalk, "Li猲 quan n ph骳 duy猲/OnAbout");
	
	tinsert(aryTalk, "H駓 b� /OnCancel");
	
	if ( Uworld1000 ==340 ) or ( Uworld1000 == 350 ) then
		education_wulinmengchuanren();
		return
	end;
	
	CreateTaskSay(aryTalk);
	
	
end

--领取玩家本人的福缘点数
function OnGain_Self()
	if( IsCharged() ~= 1 ) then
		Say( "Ngi ch璦 n筽 th�, n筽 xong  h穣 n t譵 ta!", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "B筺  bc v祇 giai 畂筺 m謙 m醝! kh玭g th� nh薾 甶觤 ph骳 duy猲. Xin h穣 ngh� ng琲, gi� g譶 s鴆 kh醗!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C竎 h� m韎 ra giang h�, ta c� ch髏 l� v藅, xin nh薾 l蕐!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nResult = FuYuan_Gain();
	if( nResult == 0 ) then
		Say( "Ngi phi猽 b箃 giang h� c遪 ch璦 , h鋍 h醝 nhi襲 th猰 r錳 n t譵 ta!", 0 );
	elseif( nResult == 1 ) then
		Say( "Ngi phi猽 b箃 giang h�  l﹗, c玭g lao  nhi襲, y l� ph莕 thng ngi ng 頲 nh薾! ng b� l�!", 0 );
	end
end

--领取玩家队伍所有成员的福缘点数
function OnGain_Team()
	if( IsCharged() ~= 1 ) then
		Say( "Ngi ch璦 n筽 th�, n筽 xong  h穣 n t譵 ta!", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "B筺  bc v祇 giai 畂筺 m謙 m醝! kh玭g th� nh薾 甶觤 ph骳 duy猲. Xin h穣 ngh� ng琲, gi� g譶 s鴆 kh醗!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C竎 h� m韎 ra giang h�, ta c� ch髏 l� v藅, xin nh薾 l蕐!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local bAllUnavailable = 1;
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		if( FuYuan_Gain() == 1 ) then
			bAllUnavailable = 0;
		end		
	end
	PlayerIndex = nPreservedPlayerIndex;
	if( bAllUnavailable == 0 ) then
		Say( "Ngi phi猽 b箃 giang h�  l﹗, c玭g lao  nhi襲, y l� ph莕 thng ngi ng 頲 nh薾! ng b� l�!", 0 );
	else
		Say( "Ngi phi猽 b箃 giang h� c遪 ch璦 , h鋍 h醝 nhi襲 th猰 r錳 n t譵 ta!", 0 );
	end
end

--查询当前可换取福缘的累积在线时间
function OnQueryTime()
	if( IsCharged() ~= 1 ) then
		Say( "Ngi ch璦 n筽 th�, n筽 xong  h穣 n t譵 ta!", 0 );
		return
	end
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C竎 h� m韎 ra giang h�, ta c� ch髏 l� v藅, xin nh薾 l蕐!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nFYTotalTime, FYValidTime = FuYuan_GetDepositTime();
	Say( "<#> T� 甶觤 ph骳 duy猲 l莕 trc nh薾 頲, t鎛g c閚g b筺 t輈h l騳 頲 <color=yellow>"..timeToString( nFYTotalTime ).."<#> <color> th阨 gian Online", 0 );
end

--关于福缘
function OnAbout()
	Talk( 3, "", "S� 甶觤 ph骳 duy猲: Th玭g qua t輈h l騳 th阨 gian Online s� i l蕐 m閠 s� 甶觤 秓, c� th� d飊g  i c竎 lo筰 v藅 ph萴 c bi謙  � Th莕 b� Thng Nh﹏ Li評 蕋(Tng Dng) .", "фi ph骳 duy猲: Sau khi online > 2 gi�, n V� L﹎ Truy襫 Nh﹏ � c竎 Чi th祅h th�  i. N誹 1 ng祔 i ph骳 duy猲 th祅h c玭g 2 l莕, s� nh薾 頲 ph莕 thng. N誹 Online < 4 gi�, m鏸 gi� i 頲 1 甶觤. Sau , m鏸 2 gi� i 頲 1 甶觤. Th祅h vi猲 trong i c� th� nh薾 甶觤 gi髉 cho c� i.", "H筺 ch�: khi ng錳 t� v� luy謓 c玭g tr猲 Уo hoa o s� kh玭g t輓h v祇 th阨 gian t輈h l騳 i 甶觤 ph骳 duy猲. � gian 畂筺 m謙 m醝 kh玭g th� nh薾 甶觤 ph骳 duy猲." );
end


function W33_prise()				-- 在线时间送声望任务

Uworld33 = GetTask(33)

if (GetGameTime() - Uworld33 >= 43200) then

	SetTask(33,GetGameTime())
	Talk(1,"","V� l﹎ truy襫 nh﹏: N� l鵦 c馻 ngi ta u nh譶 th蕐! Ti襫  s竛g l筺 kh玭g xa! Ti誴 t鬰 c� g緉g nh�!")
	i = random(0,99)
	if (i < 19) then			-- 19%
		AddRepute(1)
		Msg2Player("B筺 頲 t╪g 1 甶觤 danh v鋘g.")
	elseif (i < 36) then		-- 17%
		AddRepute(2)
		Msg2Player("B筺 頲 t╪g 2 甶觤 danh v鋘g.")
	elseif (i < 51) then		-- 15%
		AddRepute(3)
		Msg2Player("B筺 頲 t╪g 3 甶觤 danh v鋘g.")
	elseif (i < 64) then		-- 13%
		AddRepute(4)
		Msg2Player("B筺 頲 t╪g 4 甶觤 danh v鋘g.")
	elseif (i < 75) then		-- 11%
		AddRepute(5)
		Msg2Player("B筺 頲 t╪g 5 甶觤 danh v鋘g.")
	elseif (i < 84) then		-- 9%
		AddRepute(6)
		Msg2Player("B筺 頲 t╪g 6 甶觤 danh v鋘g.")
	elseif (i < 91) then		-- 7%
		AddRepute(7)
		Msg2Player("B筺 頲 t╪g 7 甶觤 danh v鋘g.")
	elseif (i < 96) then		-- 5%
		AddRepute(8)
		Msg2Player("B筺 頲 t╪g 8 甶觤 danh v鋘g.")
	elseif (i < 99) then		-- 3%
		AddRepute(9)
		Msg2Player("B筺 頲 t╪g 9 甶觤 danh v鋘g.")
	else							-- 1% (i = 99)
		AddRepute(10)
		Msg2Player("B筺 頲 t╪g 10 甶觤 danh v鋘g.")
	end

else

	Say("V� l﹎ truy襫 nh﹏: 襲 ki謓 c馻 ngi hi謓 nay kh玭g   nh薾 甶觤 danh v鋘g. V� l� tng c馻 m譶h, h穣 c� l猲!",0)

end

end



--取消
function OnCancel()
end

function timeToString( time )
	local nHour = floor( time / 3600 );
	local nMinute = mod( floor( time / 60 ), 60 );
	local nSecond = mod( time, 60 );
	return nHour.."<#> gi� "..nMinute.."<#> ph髏 "..nSecond.."<#> gi﹜ ";	
end

function honor_hall_enter()
    NewWorld(897, 1553, 3329);
end