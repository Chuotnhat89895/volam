-- 江南区 罗宵山 战斗_雷部狂狼.lua （消灭采花贼任务）
-- By: Dan_Deng(2004-05-28)

function OnDeath()
	Uworld43 = GetTask(43)
	if (Uworld43 >= 20) and (Uworld43 < 29) then			-- 没杀够10个
		SetTask(43,Uworld43 + 1)
		Msg2Player("B筺 gi誸 頲 m閠 t猲 L玦 b� Cu錸g Lang ")
	elseif (Uworld43 == 29) or (Uworld43 == 30) then		-- 已经杀够10个
		SetTask(43,30)
		Msg2Player("B筺 gi誸 頲 mi m蕐 t猲 L玦 b� Cu錸g Lang, quay l筰 xem Lang ch� c� ph秐 鴑g g� kh玭g. ")
	end
end
