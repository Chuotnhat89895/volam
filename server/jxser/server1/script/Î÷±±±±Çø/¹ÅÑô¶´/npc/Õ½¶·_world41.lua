-- 龙门镇-古阳洞-“妖刀”赵方(世界任务“救小娟”)
-- by：Dan_Deng(2004-03-03)

function OnDeath()
	Uworld41 = GetByte(GetTask(41),1)
	if (Uworld41 >= 10) and (Uworld41 < 100) and (HaveItem(352) == 0) and (random(0,99) < 50) then		-- 任务中并且没有钥匙，50%机率
		if (Uworld41 == 10) then		-- 第一次打时加剧情对话,及变量赋值
			if (GetSex() == 0) then		-- 对话男女不同
				Talk(1,"","Anh h飊g xin tha m筺g! H玬 qua b総 Ti觰 Quy猲 giam trong H綾 lao nh璶g c� ta kh玭g b� t鎛 h筰 g�! Зy l� ch譨 kh鉧. Xin anh h飊g tha cho m筺g s鑞g!")
			else
				Talk(1,"","N� hi謕 xin tha m筺g! H玬 qua b総 Ti觰 Quy猲 giam trong H綾 lao nh璶g c� ta kh玭g b� t鎛 h筰 g�! Зy l� ch譨 kh鉧. Xin n� hi謕 tha cho m筺g s鑞g!")
			end
			Uworld41 = SetByte(GetTask(41),1,30)
			SetTask(41,Uworld41)
			AddNote("Цnh b筰 頲 u l躰h Y猽 產o Tri謚 phng. L蕐 頲 ch譨 kh鉧  m� H綾 lao c鴘 Ti觰 Quy猲 ")
		end
		AddEventItem(352)			-- 机关钥匙
		Msg2Player("L蕐 頲 ch譨 kh鉧 C� quan ")
	end
end;
