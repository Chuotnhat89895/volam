
-- ====================== 文件信息 ======================

-- 剑侠情缘online 转生任务 北斗长生术基础篇 道具
-- FileName: jiayi_shengong.lua
-- Edited: 子非鱼
-- 2007-03-30	20:14:00

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")

function main()
	
	if (check_zhuansheng_level() == 1) then
		
		if (GetTask(TSK_ZHUANSHENG_FLAG) == 0) then
			Msg2Player(format("Х h鋍 頲 %s, v� c莕 ph秈 h鋍 %s m韎 c� th� c玭g th祅h danh to筰 頲.", "<B綾 u Trng Sinh Thu藅 - C� S� Thi猲>", "<B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲>"));
			Say(format("Х h鋍 頲 %s,  nh璶g v� c玭g v蒼 ch璦 頲 n﹏g c蕄, xem ra trong y v蒼 c� 甶襲  b� 萵 v蒼 ch璦 kh竚 ph� ra. C� th� n %s<color=yellow> %s<color> t譵 hi觰 tin t鴆 th� xem.", 
							"<B綾 u Trng Sinh Thu藅 - C� S� Thi猲>", "Minh Nguy謙 Tr蕁", "B綾 u L穙 Nh﹏"), 0);
			
			SetTask(TSK_ZHUANSHENG_FLAG,1);
			
			WriteLog(format("[Nhi謒 v� tr飊g sinh]\t%s\tName:%s\tAccount:%s\t C蕄 b薱 h鋍:%d, M玭 ph竔:%d",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber()));
			return 0;
		else
			Msg2Player("Х h鋍 <B綾 u Trng Sinh Thu藅 - C� S� Thi猲> r錳, ch� c莕 h鋍 th猰 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲> l� c� th� c玭g th祅h danh to筰 頲 r錳.");
			return 1;
		end
	
	end
	return 1;
end
