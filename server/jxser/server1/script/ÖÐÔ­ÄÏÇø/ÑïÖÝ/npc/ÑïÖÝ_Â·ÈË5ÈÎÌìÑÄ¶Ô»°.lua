-- 扬州 路人NPC 任天涯（入门任务）
-- by：Dan_Deng(2003-07-28)
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(73) == 0)) then		--入门任务中并且没有该物品
		Say("Ph秈 khen th� n祇 y?",4,"Con ch竨. /prise_1","Tng m筼 /prise_2","c玭g danh /prise_3","R阨 kh醝/prise_exit")
	else					--在普通对话中给一点点任务提示。
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","Ti觰 sinh gia c秐h b莕 h祅 n nay th� t� v蒼 ch璦 c�: 'C� nh﹏ v﹏,b蕋 hi誹 h鱱 tam,v� h藆 vi i'. N誹 nh� v莥 sau n祔 ta l祄 sao c� th� nh譶 m苩 t� t玭g?!")
		elseif (i == 1) then
			Talk(1,"","Ch輓h v� ta l韓 l猲 x蕌 x� nh� v莥 n猲 kh玭g c� c� g竔 n祇 ch辵 g� cho ta c�! T筰 sao c竎 c� g竔 tr猲 i l蕐 ch錸g u ch� th輈h nh譶 tng m筼?")
		else
			Talk(1,"","Th藀 ni猲 h祅 song v� nh﹏ hi觰; nh蕋 c� th祅h danh thi猲 h� tri'? Ph秈 ch╪g ch� n khi n祇 ta th祅h danh th� m韎 mong n chuy謓 th� t�?")
		end
	end
end;

function prise_1()
	Talk(2,"","V� huynh i n祔, v鮝 nh譶 th蕐 tng m筼,  bi誸 ngay l� ngi c� ph骳 s�, con ch竨 y nh�!","Ti觰 sinh gia c秐h b莕 h祅 n nay th� t� v蒼 ch璦 c�: 'c� nh﹏ v﹏,b蕋 hi誹 h鱱 tam,v� h藆 vi i'. N誹 nh� v莥 sau n祔 ta l祄 sao c� th� nh譶 m苩 t� t玭g?!")
end;

function prise_2()
	Talk(2,""," V� huynh i n祔, v鮝 nh譶 th蕐 tng m筼,  bi誸 ngay l� ngi c� ph骳 s�, con ch竨 y nh�!","Ngi ng c� a gi靚 n鱝! Ch輓h v� ta l韓 l猲 x蕌 x� nh� v莥 n猲 kh玭g c� c� g竔 n祇 ch辵 g� cho ta c�! T筰 sao c竎 c� g竔 tr猲 i l蕐 ch錸g u ch� th輈h nh譶 tng m筼?")
end;

function prise_3()
	Talk(2,""," V� huynh i n祔, v鮝 nh譶 th蕐 tng m筼,  bi誸 ngay l� ngi c� ph骳 s�, con ch竨 y nh�!","Nh﹏ sinh kh� c� tri ﹎, ngi th藅 l� tri k� c馻 ta! Ti觰 sinh kh玭g c� v藅 g� ng gi�, ch� c� phi課 qu箃 n祔, t苙g ngi g鋓 l� l� tng ki課")
	AddEventItem(73)
	Msg2Player("Nhi謒 Thi猲 Nhai t苙g b筺 chi誧 qu箃 ")
	AddNote("Nhi謒 Thi猲 Nhai t苙g b筺 chi誧 qu箃 ")
end;

function prise_exit()
end;
