-- 定时向一组服务器的所有Gameserver发系统公告
-- 越南版不触发公告  by peres 2006/05/11

function TaskShedule()
	TaskName("Tin t鴆 t� ng - th玭g b竜");
	
	-- 10分钟一次
	TaskInterval(10);
	
	-- 不设TaskTme, 则是Relay启动时就开始
	-- x点y分开始(y%10==0)
	local n_cur_h	= tonumber(date("%H"));
	local n_cur_m	= tonumber(date("%M"));
	
	if (n_cur_m > 50) then
		n_cur_h = mod((n_cur_h + 1), 24); 
	end
	
	n_cur_m = mod((n_cur_m - mod(n_cur_m, 10) + 10), 60);
	TaskTime( n_cur_h, n_cur_m );
	TaskCountLimit(0);
	
	OutputMsg("T� ng cu閚 th玭g b竜");
end

g_strTipMsg = 
	{
--		"〖江湖传闻〗为了迎接新年，近日官府将组织“赶老虎”小游戏，各城衙门会在19：00~23：00组织人手去参与活动，并会奖励在活动中杰出的侠士，各位到时可以到各大城市的衙门差役处报名参加。",
--		"〖桃花岛〗到桃花隐士处购买〖矿镐〗，即可在桃花岛修练的同时，挖到各种不同级别的玄晶矿！打造紫色装备，从此更方便！",
--		"〖桃花岛〗桃花岛上可使用(大)白驹丸进行〖离线托管〗，修练、挖矿两不误。桃花岛修练经验与离线托管经验叠加计算，互不影响",
--		"〖桃花岛〗从七大城市的船夫坐船即可登上桃花岛，玩家进入等级不再有50级限制，5级玩家也可挖到玄晶矿；但50级以下的玩家无法获得修练经验",
--		--"〖桃花岛〗曾经购买过腊八粥的玩家，进入桃花岛，腊八粥有效时间自动转化为可挖矿时间(修练经验不再双倍)",
--		"〖信使任务〗您可以在各大城市的驿官处领取到全新的信使任务啦~(详情参见官网：jx.xoyo.com)",
--		"〖装备磨损调整〗：装备耐久度磨损到0，自动从身上卸下，变成<损坏的装备>放置在背包里(装备不消失)。<损坏的装备>可到临安〖神秘商人〗处复原",
--		"〖江湖传闻〗有人发现了许多绝世高手出现在7大城市周围，势必江湖中又将掀起一场轩然大波。",
--		"卫国战争之烽火连城活动于每周周六周日的15:00~17:00开放。玩家可以通过与成都府，襄阳府，临安府，大理府，扬州府的城门守卫对话来参加宋方守城战役；通过与凤翔府，汴京府的城门守卫对话来参加金方守城战役。",
--		--"〖情义江湖〗12月31日，第二届武林联赛进入间歇期。各门派获得前32名的选手将可以领取到排名奖励。06年1月8日第三届武林联赛即将开始，比赛类型为师徒双人赛。",
--		--"〖情义江湖〗12月8日第二届武林联赛正式开始，比赛类型为门派单项赛，比赛期为12月8日-12月28日，联赛结束后，前32名战队均会获得丰厚的排名奖励。详情请参见官网公告和武林联赛相关介绍。",
--		--"〖剑网最新资料片：情义江湖〗：2005-10-31全区全服同时开放，敬请留意，详情请参见官网。",
--		--"〖情义江湖〗：同伴系统燃情开放，玩家可以在7大城市的长歌门门人处领取同伴任务！同时可到各大新手村龙五处领取同伴剧情任务。",
--		"〖情义江湖〗：同伴系统燃情开放，玩家可以在7大城市的长歌门门人处领取同伴任务！同时可到各大新手村龙五处领取同伴剧情任务。",
--		"〖随机事件系统〗：随机事件系统全面开放，同伴处于召唤状态下即有可能触发。",
--		"〖辉煌之夜活动〗：辉煌之夜活动于每天19:30到20:00，20:30到22:30定时开启。(详情参见官网：jx.xoyo.com)",
--		"〖神秘藏宝图〗：神秘藏宝图惊现江湖，无限宝藏尽在眼前。(详情参见官网：jx.xoyo.com)",
--		"〖奇珍阁〗易容术士、行脚商人、零贩最近合伙兑下了一家百年老铺——<color=yellow>奇珍阁<color>(点击右下角按钮)，新春期间商品优惠热卖(优惠时间：2006年1月24日至2月7日)。(详情参见官网：jx.xoyo.com)",
	};
	
-- 新功能预告信息
g_nFutureDate = 2009010424;
STR_HEAD_FUTURE = " [Ho箃 ng Phong ba th竛g 9]";
g_strFutureMsg = 
	{
		"Ho箃 ng Phong ba th竛g 9 產ng ti課 h祅h, m鏸 ng祔, m鏸 tu莕, m鏸 th竛g u c� nh鱪g ph莕 thng h蕄 d蒼 產ng ch� i b筺! Trong th阨 gian t�   n, tham gia c竎 ho箃 ng nh� T鑞g Kim i chi課, Nhi謒 v� D� T萿, Nhi謒 v� s竧 th� th� luy謓 h筺g 3 u c� th� t╪g th猰 甶觤 t輈h l騳 trong t鮪g ho箃 ng s玦 n鎖. C� th� n g苝 V� L﹎ Truy襫 nh﹏ ho芻 xem chi ti誸 tr猲 trang ch� ",
		"Ho箃 ng Phong ba th竛g 9 產ng ti課 h祅h, 甶觤 t輈h l騳 m鏸 ng祔 c� th� i ph莕 thng trong ng祔: 10 t猲 c� t鎛g 甶觤 t輈h l騳 ng u trong tu莕 s� nh薾 頲 ph莕 thng tu莕: 10 t猲 c� t鎛g 甶觤 t輈h ph﹏ ng u trong su鑤 th阨 gian ho箃 ng c祅g c� th� nh薾 頲 ph莕 thng c馻 th竛g. Gi秈 thng qu竛 qu﹏ l� m閠 i nh蒼 Чi M� H� ho芻 ng蓇 nhi猲 nh薾 頲 m閠 b� i trang b� ho祅g kim c馻 m玭 ph竔 c� K� n╪g + 1!",
		"襲 ch豱h gi� B筩h C﹗ ho祅: T� ng祔 8/9, h祅g rong L﹎ An c� b竛 B筩h C﹗ ho祅 gi� l� 1 ti襫 ng/1 c竔: m鏸 ng祔 t� 0:00 n 12:00 r阨 m筺g kinh nghi謒 v蒼 t╪g i!",
	};
function TaskContent()
	str = "";
	local ndateH 	= tonumber(date("%H"));
	local ndateM	= tonumber(date("%M"));
	local ndateD	= tonumber(date("%Y%m%d"));
	if (ndateH < 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20090216) then
		str	= "Hi謓 t筰 v� l﹎ nh﹏ s� c� th� n NPC Th莕 T礽  t苙g qu� v� nh薾 Ph竜 Hoa"
	elseif (ndateH == 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20090216) then
		str	= "V� l﹎ nh﹏ s� h穣 mau n nh薾 thng ng th阨 s� c� c� h閕 nh薾 nhi襲 ph莕 qu� may m緉!";
	else
		return
		--str = getTipMsg();
	end
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

-- 取提示信息
function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

-- 取预告信息
function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d%H"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- 是否在指定日期之前，否则不发
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
