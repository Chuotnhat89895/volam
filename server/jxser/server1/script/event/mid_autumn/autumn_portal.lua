-- 明月镇入口 武林盟传人处
-- lixin 2005-9-7

--武林盟传人	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V� l﹎ truy襫 nh﹏<link>"


tab_city = {
{1,520,1601,3269, "<#> Phng Tng ph� "},
{11,521,1601,3269, "<#> Th祅h Й ph� "},
{37,522,1601,3269, "<#> Bi謓 Kinh ph� "},
{78,523,1601,3269, "<#> Tng Dng ph� "},
{80,524,1601,3269, "<#> Dng Ch﹗ ph� "},
{162,525,1601,3269, "<#> Чi L� ph� "},
{176,526,1601,3269, "<#> L﹎ An ph� "},
}

startdate = 05091618
enddate = 05091824

function mid_autumn_main()
	local nDay = tonumber(GetLocalDate("%y%m%d"))
	local mid_sdate = floor(startdate / 100)
	local mid_edate = floor(enddate / 100)
	if ( nDay >= mid_sdate and nDay <= mid_edate ) then
		Describe(WULINMENG_NPC.."<#> Л阯g gia b秓 � Ba Th鬰 g莕 y  c� nh鱪g bi觰 hi謓 tr� m苩 v韎 V� l﹎! чc C� minh ch� mu鑞 t� ch鴆 m閠 h閕 thi l祄 b竛h � Minh Nguy謙 tr蕁 nh籱 t譵 hi觰 th鵦 h� c馻 Л阯g m玭! Xem ra l莕 n祔 l祅h 輙 d� nhi襲. C� nhi襲 cao th� s� xu蕋 hi謓. C竎 ngi n  tham gia nh� ph秈 h誸 s鴆 th薾 tr鋘g!", 4, "<#> Ta bi誸 r錳!, a ta n Minh Nguy謙 tr蕁 nh�./autumn_enter", "<#> Ta mu鑞 n ch� i h閕 hoa ng /lantern_enter", "<#> Li猲 quan v� ho箃 ng h� tr� trung thu /autumn_help","<#> в ta suy ngh� l筰!/cancel");
	else
		Describe(WULINMENG_NPC.."<#> Л阯g gia b秓 � Ba Th鬰 g莕 y  c� nh鱪g bi觰 hi謓 tr� m苩 v韎 V� l﹎! чc C� minh ch� mu鑞 t� ch鴆 m閠 h閕 thi l祄 b竛h � Minh Nguy謙 tr蕁 nh籱 t譵 hi觰 th鵦 h� c馻 Л阯g m玭! Xem ra l莕 n祔 l祅h 輙 d� nhi襲. C� nhi襲 cao th� s� xu蕋 hi謓. C竎 ngi n  tham gia nh� ph秈 h誸 s鴆 th薾 tr鋘g!", 2, "<#> Ta bi誸 r錳!, a ta n Minh Nguy謙 tr蕁 nh�./autumn_enter", "<#> в ta suy ngh� l筰!/cancel");
	end
end;


function autumn_enter()
	local nDate = tonumber(date("%y%m%d%H"));
	local nCount = getn(tab_city);
	local cityid = 0;

	for i=1,nCount do
		if( SubWorldIdx2ID( SubWorld ) == tab_city[i][1] ) then
			cityid = i
			break
		end;
	end;
	if ( GetPlayerCount() >=700 or cityid <= 0 ) then
		Describe(WULINMENG_NPC..tab_city[cityid][5].."<#> T� y n Minh Nguy謙 tr蕁 r蕋 nguy hi觤! Hay l� ngi d0i t� th祅h th� kh竎 v祇  nh�!", 1, "<#> V藋 c騨g 頲! C秏 琻!/cancel");
		return
	end
	NewWorld(tab_city[cityid][2],tab_city[cityid][3],tab_city[cityid][4]);
	SetFightState(0);
	if(nDate >= startdate and nDate <= enddate) then
		Say("<#> C竎 khu v鵦 t� ch鴆 h閕 Hoa Жng l�: Hoa S琻, Thanh Th祅h s琻, V� Di s琻, 觤 Thng s琻 v� Minh Nguy謙 tr蕁.T� ng祔 n ng祔, m鏸 ng祔 t� 18:00-24:00, b筺 c� th� n  ng緈 hoa ng, thng nguy謙, tham gia c竎 ho箃 ng v� nh薾 thng.",0)
	end
end

function autumn_help()
	Describe(WULINMENG_NPC.."<#> Ho箃 ng trung thu l莕 n祔 bao g錷 c� <color=red>thi l祄 b竛h t筰 Minh Nguy謙 tr蕁<color>. T� <color=red>Ng祔 16 th竛g 9 n ng祔 18 th竛g 9, m鏸 ng祔 t� 18:00-24:00<color>, c� 4 khu v鵦 u m� h閕 <color=red>hoa ng<color>. Ngi mu鑞 n khu v鵦 n祇?", 3, "<#> Li猲 quan v� Ho箃 ng 'Hoa Жng' Trung thu /huadeng_help","<#> Li猲 quan n ho箃 ng l祄 b竛h trung thu /yuebing_help","<#> Ta  bi誸 r錳 /cancel");
end;

function huadeng_help()
	Describe(WULINMENG_NPC.."<#> T� <color=red>ng祔 16 th竛g 9 n 18 th竛g 9, m鏸 ng祔 18:00-24:00 <color>, <color=yellow>Thanh Th祅h s琻<color>, <color=yellow>V� Di s琻<color>, <color=yellow>觤 Thng s琻<color>, <color=yellow>Hoa S琻<color> s� ng lo箃 m� h閕 hoa ng. Ch� c莕 b筺 <color=red>li猲 t鬰 p dng 3 c﹗ <color> s� nh薾 頲 ph莕 thng. M鏸 ng祔 ch� c� <color=red>100 ph莕 thng<color>!",1,"<#> Ta  bi誸 r錳 /cancel")
end

function yuebing_help()
	Describe(WULINMENG_NPC.."<#> Trong th阨 gian t� 16/9 n 30/9 m鋓 ngi c� th� nh� V� L﹎ Truy襫 Nh﹏ a v祇 Minh Nguy謙 tr蕁, sau  t譵 c竎 <color=red>Th� b竛h<color>  t譵 hi觰 quy t綾 l祄 b竛h. уng th阨 m鏸 ng祔 t� <color=red>9:00-24:00<color> t筰 7 th祅h th� s� c� H祅h Cc thng nh﹏ trao i c竎 nguy猲 li謚 l祄 b竛h!",1,"<#> Trang k� /yuebing_help2")
end

function yuebing_help2()
	Describe(WULINMENG_NPC.."<#> L祄 b竛h trung thu g錷 3 bc: <color=red>'nh祇 b閠' <color>, <color=red>'l祄 nh﹏ b竛h'<color>, <color=red>'nng b竛h'<color>, m鏸 kh﹗ c� m閠 th阨 gian nh蕋 nh, ho祅 th祅h m鏸 kh﹗ b筺 s� 頲 th玭g b竜 n bc k� ti誴, n誹 vt qu� th阨 gian, s� b� th蕋 b筰. N誹 b筺 l祄 th祅h c玭g <color=red>B竛h trung thu Th藀 c萴<color>, <color=red>B竛h trung thu H筺h nh﹏<color>, <color=red>B竛h trung thu u tr鴑g<color>, <color=red>B竛h trung thu nh﹏ u<color> c� th� mang n Minh Nguy謙 tr蕁 t譵 <color=red>Minh Nguy謙 L穙 nh﹏<color> i thng!",1,"<#> K誸 th骳 i tho筰!/cancel")
end

function lantern_enter()
	Describe(WULINMENG_NPC.."<#> Чi h閕 trung thu hoa ng 頲 t� ch鴆 � 4 khu v鵦: Thanh Th祅h s琻, V� Di s琻, 觤 Thng s琻, Hoa S琻. Ngi th輈h n khu n祇?",5, "<#> Thanh Th祅h s琻/#lantern_enter_lantern(21)", "<#> V� Di s琻/#lantern_enter_lantern(193)", "<#> 觤 Thng s琻/#lantern_enter_lantern(167)", "<#> Hoa S琻/#lantern_enter_lantern(2)", "<#> K誸 th骳 i tho筰!/cancel")
end

tbLANTERN_ENTER_POS = {
		[2] = { 	--huashan
			{ 2287 ,4092 },
			{ 2595, 3501 },
			{ 2546, 3618 },
			{ 2360, 3758 },
			{ 2332, 3912 },
			{ 2355, 4045 },
			{ 2428, 4054 },
			{ 2525, 4052 },
			{ 2290, 4087 },
			{ 2546, 4035 },
		 },
		[21] = { 	--qingchengshan
			{ 2621, 4501 },
			{ 2577, 3292 },
			{ 2387, 3706 },
			{ 2561, 3313 },
			{ 2365, 4016 },
			{ 2735, 3965 },
			{ 2542, 3915 },
			{ 2270, 3842 },
			{ 2830, 3700 },
			{ 2049, 4107 },
		 },
		[167] = { 	--diancangshan
			{ 1606, 3214 },
			{ 1373, 2532 },
			{ 1689, 2620 },
			{ 1430, 2692 },
			{ 1617, 2738 },
			{ 1216, 2805 },
			{ 1586, 2850 },
			{ 1430, 2950 },
			{ 1671, 3034 },
			{ 1517, 3215 },
		 },
		[193] = { 	--wuyishan
			{ 1937, 2851},
			{ 1071, 2843 },
			{ 1130, 3074 },
			{ 1113, 2641 },
			{ 1447, 3243 },
			{ 1808, 2705 },
			{ 1513, 2497 },
			{ 1213, 2565 },
			{ 1431, 2776 },
			{ 1310, 2435 },
		 },
}

function lantern_enter_lantern(area)
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end



function cancel()
end
	