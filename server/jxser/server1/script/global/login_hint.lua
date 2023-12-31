Include("\\script\\lib\\common.lua")
Include("\\script\\global\\rename_head.lua")

--活动定义
EVENTS_TB = {
--	{
--		--显示活动条件
--		ndate = {051101, 051131},	--起止日期，可选
--		ntime = {2000, 2359},		--起止时间，可选
--		level = {1, 200},			--起止级别，可选
--		taskequal = {taskid, taskvalue},	--任务变量相等，可选
--		tasknot = {taskid, taskvalue},		--任务变量不等，可选
--		checkfunc = func			--检测函数，可选。函数返回nil表示不触发，否则触发
--		
--		--活动描述
--		name = "某某活动",			--活动名称，必需
--		describe = "简单说明文字",	--活动说明，也可以用一个函数返回字符串，可选
--		detail =
--[[　　这里可以写很多文字，详细描述你的活动。
--　　方括号的形式可以自由换行。
--　　也可以用一个函数返回字符串]],	--活动详情，可选 \___二者只可选其一
--		callback = nil,				--回调函数，可选 /
--		link = nil,					--Describe对话link信息，可选（使用detail时有效）
--	},
	{
		ndate = {070414,070424},
		name = "M飊g 3 th竛g 3",
		describe = "T� ng祔 <color=yellow>14/4/2007<color> n <color=yellow>24/4/2007<color>, trong th阨 gian ho箃 ng, t蕋 c� ngi ch琲 trong qu� tr譶h nh qu竔 luy謓 c玭g s� c� c� h閕 nh苩 頲 <color=yellow>T骾 h祅g h鉧<color>. Mang t骾 h祅g h鉧 v� ng﹏ lng n NPC B竛 h祅g rong t筰 c竎 i th祅h th�  i l蕐 <color=yellow>Bao ng nguy猲 li謚<color>.",
	},
	{	--3级以前龙五教育任务
		level = {1, 3},
		tasknot = {1014, 2},
		name = "Nhi謒 v� s� nh藀 ",
		describe = "Long Ng� cung c蕄 nhi謒 v� S� nh藀",
		callback = Uworld1000_word,
	},
	{	--武林联赛——新秀
		level = {80, 119},
		name = "V� l﹎ li猲 u, v� l﹎ li猲 u 'Ki謙 xu蕋'",
		describe = "B筺 c� th� n g苝 Quan vi猲 b竜 danh tham gia li猲 u V� l﹎.",
		detail =
[[V� l﹎ t� v� 產ng trong giai 畂筺 chu萵 b�. Ъng c蕄 c馻 b筺 c� th� tham gia <color=yellow>V� L﹎ T﹏ T� Li猲 Tr筰<color>.
V� tr� c馻 S� gi� li猲 u t﹏ t� l�: <color=yellow>Bi謓 Kinh (222, 191)<color>, <color=yellow>L﹎ An (182, 204)<color>.]],
	},
	{	--武林联赛——高级
		level = {120, 200},
		name = "V� l﹎ li猲 u, v� l﹎ li猲 u 'Ki謙 xu蕋'",
		describe = "B筺 c� th� n g苝 Quan vi猲 b竜 danh tham gia li猲 u V� l﹎.",
		detail =
[[V� l﹎ t� v� 產ng trong giai 畂筺 chu萵 b�. Ъng c蕄 c馻 b筺 c� th� tham gia <color=yellow>V� L﹎ Li猲 Tr筰<color>.
V� tr� c馻 S� gi� li猲 u l�: <color=yellow>Чi L� (200, 197)<color>, <color=yellow>Dng Ch﹗ (219, 190)<color>.]],
	},
	{	--辉煌之夜
		name = "Иm Huy Ho祅g",
		describe = "V� L﹎ Minh ch� чc C� Ki誱  m� ho箃 ng mang t猲 'Иm Huy Ho祅g' v祇 m鏸 t鑙 7 gi� 30 ph髏. ",
		detail =
[[Trc m総 l� th阨 gian m璦 thu薾 gi� h遖. в p t� th辬h t譶h c馻 c竎 nh﹏ s� v� l﹎ tr猲 giang h�, V� l﹎ minh ch� truy襫 nh﹏ m� ra ho箃 ng 'Иm Huy Ho祅g'. Ho箃 ng b総 u v祇 19h30 m鏸 t鑙. M鏸 t ho箃 ng di詎 ra trong 30 ph髏. N閕 dung c� th� c� th� n t譵 L� Quan  t譵 hi觰.]],
	},

	-- {
	-- 	name = "<#>角色改名",
	-- 	describe = "<#>由于在并服过程中，您的角色名与其他玩家的角色名出现了重名情况，因此系统已帮您自动更名，如果您需要重新改变角色名的话，请到各新手村的新手推广员处选择修改角色名。您只能更改一次角色名，所以请仔细阅读相应说明。",
	-- },
	-- {
	-- 	name = "<#>帮会改名",
	-- 	describe = "由于在并服过程中，您所在的帮会，帮会名与其他帮会名出现了重名情况，因此系统已帮您所在的帮会自动更名，如果帮主需要重新改变帮会名的话，请到各新手村的新手推广员处选择修改帮会名。帮主只能更改一次帮会名，所以请仔细阅读相应说明。",
	-- },
}

EVENT_HINT_LINK = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy060\\enemy060_st.spr>C竎 ho箃 ng g莕 y 頲 s緋 x誴:<link>"
EVENT_HINT_TIMES = 3	--每天上线提示次数

--如果有较复杂的活动需要自定义一些函数。请在下面Include，并使用：
--	if EVENTS_TB then EVENTS_TB[getn(EVENTS_TB)+1] = {……} end
--的方式添加
--=================================================================
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
--=================================================================

--登陆时调用的函数
function event_hint_login(bExchangeIn)
	-- 跨服过来的就不用再提示了
	if (bExchangeIn == 1) then
		return
	end
	local n_date = tonumber(GetLocalDate("%y%m%d"));
	local n_time = tonumber(GetLocalDate("%H%M"));
	local n_times;
	if (GetTask(2308) ~= n_date) then	--不是今天登陆的
		SetTask(2308, n_date);
		SetTask(2309, 0);
		n_times = 0;
	else
		n_times = GetTask(2309);
	end
	if (n_times >= EVENT_HINT_TIMES) then	--已达到提示次数，不再提示
		return
	end
	
	local n_level = GetLevel();
	local tb = {};
	for i = 1, getn(EVENTS_TB) do
		if event_hint_check(EVENTS_TB[i], n_date, n_time, n_level) then	--符合条件
			tb[getn(tb)+1] = i;
		end
	end
	if (getn(tb) == 1) then	--只有一个活动，直接显示详情
		event_show_detail(tb, 1);
	elseif (getn(tb) > 0) then	--多个活动
		event_show_all(tb);
	end
	
	SetTask(2309, n_times + 1)
	
	bingfu_hint()	--并服更名，临时添加的高优先级上线提示，不属于规范的使用
end

--检查某个活动是否需要通知当前玩家
function event_hint_check(tb_event, n_date, n_time, n_level)
	local tb = tb_event.ndate;
	if (tb) then	--限定日期
		if (n_date < tb[1] or n_date > tb[2]) then	--日期不符
			return
		end			
	end
	tb = tb_event.ntime;
	if (tb) then	--限定时间
		if (n_time < tb[1] or n_time > tb[2]) then	--日期不符
			return
		end			
	end
	tb = tb_event.level;
	if (tb) then	--限定级别
		if (n_level < tb[1] or n_level > tb[2]) then	--级别不符
			return
		end			
	end
	tb = tb_event.taskequal
	if (tb) then	--任务变量相等
		if (GetTask(tb[1]) ~= tb[2]) then
			return
		end			
	end
	tb = tb_event.tasknot
	if (tb) then	--任务变量不等
		if (GetTask(tb[1]) == tb[2]) then
			return
		end			
	end
	local func = tb_event.checkfunc
	if (func) then	--函数判断
		if (not func()) then
			return
		end			
	end
	return 1
end

--显示所有活动
function event_show_all(tb)
	local str = "<enter>";
	local tb_option = {};
	for i = 1, getn(tb) do
		local tb_event = EVENTS_TB[tb[i]];
		str = str .. "<color=red>" .. tb_event.name .. "<color><enter>";
		if (tb_event.describe) then
			local str_des
			if (type(tb_event.describe) == "function") then
				str_des = tb_event.describe()
			else
				str_des = tostring(tb_event.describe)
			end
			str = str .. "  " .. str_des .. "<color><enter>";
		end
		if (tb_event.detail or tb_event.callback) then
			tb_option[getn(tb_option)+1] = tb_event.name.."Chi ti誸/#event_show_detail({"..join(tb).."},"..i..")";
		end
	end
	tb_option[getn(tb_option)+1] = "H玬 nay kh醝 nh綾 nh� ta/event_hint_stop";
	tb_option[getn(tb_option)+1] = "Ta bi誸 r錳!/no";
	Describe(EVENT_HINT_LINK..str, getn(tb_option), tb_option);
end

--显示某一指定活动详情（全部，当前第几个）
function event_show_detail(tb, n)
	local tb_event = EVENTS_TB[tb[n]];
	if (tb_event.callback) then
		tb_event.callback();
	else
		local str = "<enter><color=red>"..tb_event.name.."<color><enter>"
		local tb_option = {};
		if (getn(tb) > 1) then
			tb_option[1] = "ta c遪 mu鑞  t譵 hi觰 c竎 ho箃 ng kh竎/#event_show_all({"..join(tb).."})";
		end
		tb_option[getn(tb_option)+1] = "H玬 nay kh醝 nh綾 nh� ta/event_hint_stop";
		tb_option[getn(tb_option)+1] = "Ta bi誸 r錳!/no";
		if (tb_event.link) then
			str = tb_event.link .. str
		else
			str = EVENT_HINT_LINK .. str
		end
		if (tb_event.detail) then
			if (type(tb_event.detail) == "function") then
				str = str .. tb_event.detail()
			else
				str = str .. tb_event.detail
			end
		elseif (tb_event.describe) then
			if (type(tb_event.describe) == "function") then
				str = str .. tb_event.describe()
			else
				str = str .. tostring(tb_event.describe)
			end
		end
		Describe(str, getn(tb_option), tb_option);
	end
end

function event_hint_stop()
	SetTask(2309, EVENT_HINT_TIMES);
end

function bingfu_hint()
	-- 角色改名提示
	local msg = ""
	if (check_renamerole() == 1) then
		msg = msg .. "<#>Trong qu� tr譶h s竧 nh藀 m竬 ch�, h� th鑞g  t� ng i t猲 nh﹏ v藅 cho b筺. H穣 n NPC S� gi� t筰 c竎 t﹏ th� th玭  <color=red>i l筰 t猲 nh﹏ v藅<color> b筺 mu鑞."
	end
	-- 帮会改名提示
	if (check_renametong() == 1) then
		msg = msg .. "<#>Trong qu� tr譶h s竧 nh藀 m竬 ch�, h� th鑞g  t� ng i t猲 bang h閕 c馻 b筺. H穣 n NPC S� gi� t筰 c竎 t﹏ th� th玭  <color=red>i l筰 t猲 bang h閕<color> b筺 mu鑞."
	end
	if (check_castellan_remedy() == 1) then
		msg = msg .. "<#>Trong qu� tr譶h s竧 nh藀 m竬 ch�, h� th鑞g  t� ng tc 甶 quy襫 th鑞g tr� th祅h th� c馻 bang h閕 b筺. H穣 n NPC S� gi� t筰 c竎 t﹏ th� th玭  <color=red>Nh薾 l筰 b錳 thng tng 鴑g<color>. Ch鴆 n╪g n祔 ch� c� hi謚 l鵦 trong v遪g <color=red>1 th竛g k� t� khi s竧 nh藀 m竬 ch�<color>."
	end
	
	if (msg ~= "") then
		Say(msg, 1, "<#> Bi誸 r錳!/cancel")
	end
end

if login_add then login_add(event_hint_login, 0) end

