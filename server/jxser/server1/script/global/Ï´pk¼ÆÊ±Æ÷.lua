-- 洗PK计时器.lua
-- Update: Dan_Deng(2003-11-27)
-- Timer: 9

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	local Uworld96	= GetTask(96)
	local PK_value	= GetPK();
	local nMapId	= GetWorldPos();
	StopTimer();
	
	if (nMapId == 208) then			-- 只有在牢房中才允许减PK值
		if (PK_value > 1) then		-- 尚未洗完PK值
			Msg2Player("Qua t辬h t﹎ h鑙 c秈, t閕 c馻 b筺  gi秏 nh� ")
			SetPK(PK_value - 1)
			SetTask(96,100 + (PK_value - 1));
			SetTimer(12 * CTime * FramePerSec, 9)						--重新开始计时（12个时辰==120分钟）
		else							-- 洗完PK了
			Msg2Player("Sau khi xem x衪 k� h祅h vi ph筸 t閕, cu鑙 c飊g b筺 c騨g  r鯽 s筩h t閕 c馻 m譶h. ")
			SetPK(0)
			SetTask(96,100)
		end
	end
end;
