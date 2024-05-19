--中原北区 少林派to少林密室
--Trap ID：中原北区 67
-- by：Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 40*256+10) then
			SetTaskTemp(43,0)		-- 临时变量暂定为43，要三个问题答对（临时变量值为3）方可进入密室。
			Talk(1,"L40_sele1_1","Trc Th筩h m玭 c� kh綾 m蕐 h祅g ch�: Mu鑞 v祇 m藅 th蕋, ph秈 tr� l阨 3 c﹗ h醝 di y!")
		elseif (UTask_sl >= 40*256+10) then
			NewWorld(113, 1675, 3361)
		else
			Msg2Player("C蕀 a c馻 b鎛 ph竔, kh玭g 頲 v祇! ")
		end
	else
		Msg2Player("N琲 y l� c蕀 a c馻 b鎛 ph竔, ngi ngo礽 kh玭g 頲 v祇! ")
	end
--	AddTermini(47)		--这是什么东西？
end;

function L40_sele1_1()
	Say("C﹗ th� nh蕋: N╩ x璦 Л阯g Huy襫 Trang mang t� Thi猲 Tr骳 b� kinh l�: ",2,"Чi Th鮝 Ph藅 Kinh /L40_S1_correct1","Ti觰 Th鮝 Ph藅 Kinh /L40_sele1_2")
end;

function L40_S1_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，三个全对方可进入
	L40_sele1_2()
end;

function L40_sele1_2()
	Say("C﹗ th� 2: X� L� c馻 Ph藅 t� l�:",2,"Sau khi Ph藅 T� v� c鈏 Ni誸 B祅 t� ng h鉧 th祅h /L40_sele1_3","Do ch輓h th﹏ Ph藅 T� thi猽 ch竬 m� th祅h /L40_S1_correct2")
end;

function L40_S1_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，三个全对方可进入
	L40_sele1_3()
end;

function L40_sele1_3()
	Say("C﹗ th� 3: Ph藅 ph竝 c馻 b鎛 t� l� thu閏:",3,"Thi襫 T玭g /L40_S1_correct3","M藅 T玭g /L40_sele1_result","Lu藅 T玭g /L40_sele1_result")
end;

function L40_S1_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- 答对一个问题值加1，三个全对方可进入
	L40_sele1_result()
end;

function L40_sele1_result()
	if (GetTaskTemp(43) >= 3) then
		SetTaskTemp(43,0)				--每次进入要重打二门的口诀
		Talk(1,"","Tr� l阨 ng 3 p 竛, th筩h m玭 l藀 t鴆 chuy觧 ng m� ra 1 l鑙 甶")
		NewWorld(113, 1675, 3361);
	else
		SetTaskTemp(43,0)				--每次进入要重打二门的口诀
		Talk(1,"","Tr� l阨 ng 3 p 竛, nh璶g h莡 nh� th筩h m玭 v蒼 tr� tr� ")
--		SetPos()		--把玩家移出trap点
	end
end;
