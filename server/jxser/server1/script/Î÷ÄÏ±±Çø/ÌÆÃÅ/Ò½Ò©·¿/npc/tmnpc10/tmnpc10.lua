--西南北区\唐门\医药房\npc\tmnpc10.lua
--description: 唐门唐野 40级任务 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
-- Update: xiaoyang(2004\4\13)  加入90级五毒任务

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	Uworld124 = GetTask(124)
	if(GetFaction() == "tangmen") and (GetSeries() == 1) then
		if((UTask_tm == 40*256) and (GetLevel() >= 40) and (GetFaction() == "tangmen")) then		--40级任务启动
			Talk(4,"L40_get","Ta c� m閠 chuy謓 duy nh蕋 m� n nay v蒼 ch璦 ho祅 th祅h! Th藅 bu錸 qu�!", "L穙 phu t鮪g c� ngi b筺 t猲 C秐h T� K�, 10 n╩ trc, v� C秐h T� K� m綾 b謓h l� n xin c鴘 gi髉. Nh璶g B鎛 m玭 c� quy nh kh玭g ph秈 l� ngi trong Л阯g M玭 kh玭g 頲 c鴘 ch鱝. B蕋 lu薾 C秐h T� K� c莡 xin l穙 phu v蒼 cng quy誸 kh玭g ra tay gi髉 , k誸 qu� kh玭g l﹗ sau v� h緉 qua i, hai ta t�  tr� m苩 th祅h th�.", "M蕐 ng祔 trc, ta c� nh薾 頲 1 b鴆 th� c馻 C秐h T� K�, h裯 ta ra g苝 m苩. Ta bi誸 h緉 n t譵 ta  b竜 th�, ta n� h緉 1 m筺g tr� l筰 h緉 c騨g kh玭g sao. Ch� l� ta kh玭g m苩 m騣 n祇 g苝 l筰 c� nh﹏! ", "S� th骳! Chuy謓 n祔 kh玭g th� tr竎h ngi 頲, ngi n猲 gi秈 th輈h r� nguy猲 nh﹏ v韎 玭g ta,  玭g ta hi觰 r� n鏸 kh� n╩ x璦 c馻 ngi.")
		elseif(UTask_tm == 40*256+40) then 
			Talk(3, "L40_step44", "Л阯g D� s� th骳! Con g竔 c馻 C秐h ti襫 b鑙 v� m� c� ta c飊g m綾 gi鑞g m閠 ch鴑g b謓h, t輓h m筺g 產ng nguy k辌h, n誹 S� th骳 c� th� c鴘 con c馻 玭g ta, 玭g ta nh蕋 nh s� kh玭g tr竎h ngi n鱝!", "Nh璶g m� m玭 quy.....", "S� th骳 y猲 t﹎,  t�  ngh� ra m閠 bi謓 ph竝 hay. S� th骳 kh玭g c莕 ph� m玭 quy m� v蒼 c� th� c鴘 ngi. Ch� c莕 cho е t� bi誸 phng thu鑓 l� 頲!")
		elseif(UTask_tm == 40*256+80) then
			Talk(4, "L40_prise", "Phng thu鑓 m� S� th骳 a qu� nhi猲 c� hi謚 qu�, con g竔 c馻 C秐h ti襫 b鑙 頲 c鴘 r錳! g ta  kh玭g c遪 tr竎h ngi n鱝!", "Th藅 kh玭g? Th� th� hay qu�! Nh璶g con g竔 c馻 玭g ta kh玭g ph秈 l� do ta c鴘 m� l� ngi c鴘, hi觰 � ta ch�?", "D� hi觰! Vi謈 n祔 kh玭g li猲 can n S� th骳, l� do е t� l祄! ", "Ngi qua nhi猲 th玭g minh, l穙 phu kh玭g nh譶 l莔 ngi, ha ha ha! ")
		elseif(UTask_tm > 40*256) and (UTask_tm < 40*256+60) then					--40级任务中普通对话
			Talk(1,"","<color=Red>C秐h T� K�<color> 萵 c� � <color=Red>ph輆 t﹜ Thanh Th祅h s琻<color>.")
		elseif(UTask_tm >= 40*256+60) and (UTask_tm < 50*256) then					--尚未完成40级任务
			Talk(1,"","Dc li謚 c� 5 lo筰:<color=Red>da c鉩<color>, <color=Red>gan r緉 c<color>,<color=Red>h箃 anh t骳<color>,<color=Red>畊玦 r誸 c<color>,<color=Red>u thi猲 t祄<color>. Nh鱪g dc li謚 n祔 c� nhi襲 � <color=Red>Thanh Dng L躰h<color> <color=Red>Йng b綾 Thanh Th祅h s琻<color>.")
		elseif(UTask_tm >= 50*256) and (GetFaction() == "tangmen") then					--已经完成40级任务，尚未出师
			Talk(1,"","Ngi  gi髉 l穙 phu h鉧 gi秈 ﹏ o竛 10 n╩ nay, th藅 kh玭g bi誸 sao  c秏 t�!")
		else
			Talk(1,"","B筺 b� tr� m苩, th藅 khi課 ngi ta 產u l遪g!")
		end
	elseif (Uworld124 == 20) and (HaveItem(385) == 1) then
		Talk (2,"Uworld_wdutask","Л阯g ti猲 sinh! � y c� b鴆 th� xin ng礽 xem qua!","V鴗 n� 甶! Ta kh玭g th蘭 xem!")
	elseif (Uworld124 == 20) then
		Msg2Player("B鴆 th� ph秈 ch╪g  b� m蕋 tr猲 阯g 甶, h穣 甶 t譵 th�. ")
	elseif (Uworld124 == 25) then
		Talk (15,"Uworld_wdutask2","Chuy謓 g� v藋?","Ti觰 t�! Ngi su齮 m蕋 m筺g c� bi誸 kh玭g?","Oh! T筰 h� ngu mu閕!","N誹 nh� ta kh玭g c� n閕 gi竛 trong Ng� чc Gi竜 xem ra h玬 nay b� tr髇g k� c馻 V﹏ l穙 nhi r錳. C� ph秈 y l� b鴆 th� V﹏ B蕋 T� nh� ngi chuy觧 gi髉 kh玭g?","ng v藋.","Haha! Ngi tr髇g k� r錳! Th� n祔 c� c v� h譶h , b� ngo礽 kh玭g th蕐 g� h誸 nh璶g khi m� ra s� l祄 cho kinh m筩h ol閚, V﹏ l穙 nhi v鑞 d� mu鑞 h筰 ta, kh玭g xem m筺g s鑞g c馻 ngi ra g� h誸.","Huhu! T輓h sao y ti猲 sinh?","ng lo! V﹏ l穙 nhi h筰 ta l� v� ta thng c鴘 nh鱪g ngi m� l穙 h� c. B謓h c馻 ngi giao cho l穙 phu.","Л阯g D� s� d鬾g n閕 c玭g tr� c cho b筺, b筺 c� c秏 gi竎 nh� c� ng祅 vi猲 bi b緉 ra xu鑞g t v藋.","Л阯g D�: May l� ph竧 hi謓 s韒, kh玭g th� ngi ti猽 r錳.","C竚 琻 Л阯g L穙 gia.","Kh玭g ph秈 l祄 c玭g kh玭g u! Ngi gi髉 ta 甧m b鴆 th� n祔 v� b猲  ta c� b� s絥 thu鑓 c kh竎 r錳 ch� c莕 ngi n鉯 l�  ph竧 hi謓 ra ﹎ m璾 c馻 h緉, h緉 s� gi鵷 ngay b鴆 th� xem n l骳 蕐 s� c� ngi n l蕐 m筺g c馻 h緉.","V﹏ B蕋 T� nu玦 c h筰 ngi nh蕋 nh ta kh玭g tha cho h緉 u.","Ngi u鑞g thu鑓 gi秈 xong l猲 阯g ngay 甶.","D�!")
	elseif(Uworld124 == 30 ) and (HaveItem(386) == 0) then
		Talk (1,"","Ti觰 t� nh� ngi, l� th� � , 甶 阯g c萵 th薾, V﹏ l穙 t芻 tuy謙 kh玭g d� i ph� u. ") 
		AddEventItem(386)
		Msg2Player("Nh薾 l筰 th� c馻 Л阯g D� ")
	elseif(UTask_tm == 70*256) then							--已经出师
		Talk(1,"","C� r秐h n u鑞g ru v韎 l穙 phu!")
	else										--未完成40级任务（缺省对话）
		Talk(1,"","Л阯g m� n祔  n鉯 m閠 l阨 quy誸 kh玭g thay i!")
	end
end;

function L40_step44()
	SetTask(2, 40*256+60)
	AddNote("Tr� v� ph遪g Y Dc g苝 Л阯g D� s�, bi誸 頲 phng thu鑓 g錷 c�: Da C鉩, Gan R緉 c, 玦 R誸 c v� u Thi猲 t祄.")
	Msg2Player(" Thanh Th祅h S琻,  n Thanh Dng Phong t譵 dc li謚")
	Talk(2,"", "Vi謈 n nc n祔 ch� nh v藋, mu鑞 tr� b謓h n祔 c莕 c� 5 lo筰 c v藅:<color=Red>da c鉩<color>,<color=Red>gan r緉 c<color>,<color=Red>v� anh t骳<color>,<color=Red> 畊玦 b� c筽 c<color>,<color=Red>u con t籱<color>. L蕐 c tr� c.","5 lo筰 c v藅 n祔 c� � nhi襲 � <color=Red>Thanh Dng L躰h<color> tr猲 <color=Red>Йng B綾 Thanh Th祅h s琻<color>. Nh璶g m� �  thng c� <color=Red> H綾 g<color>,<color=Red>Hung th鴘<color>,<color=Red>Linh 猽<color> xu蕋 hi謓, ngi ph秈 c萵 th薾!")
end;

function L40_get()
	Say("H緉 h薾 ta th蕐 ch誸 kh玭g c鴘, l祄 g� nghe ta gi秈 th輈h.", 2, "H鉧 gi秈 ﹏ o竛 gi鱝 hai ngi/L40_get_yes", "Ta kh玭g th� gi髉 g� 頲/L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","<color=Red>C秐h T� K�<color> c� 萵 c� � <color=Red> ph輆 t﹜ Thanh Th祅h s琻<color>.")
	SetTask(2, 40*256+20)
	AddNote("T筰 ph遪g Y Dc g苝 Л阯g D�, nh薾 <color=red> nhi謒 v� C秐h T� K�<color>, h鉧 gi秈 ﹏ o竛 gi鱝 Л阯g D� v� C秐h T� K�.")
	Msg2Player("Nh薾 nhi謒 v� C秐h T� K� t� Л阯g D�: H鉧 gi秈 ﹏ o竛 gi鱝 Л阯g D� v� C秐h T� K�.")
end;

function L40_get_no()
end;

function L40_prise()
	SetRank(29)
	SetTask(2, 50*256)
--	AddMagic(345)
	add_tm(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! B筺  頲 th╪g l祄  t� Nh藀 C竎! C� th� h鋍 v� c玭g H祅 B╪g Th輈h c馻 Л阯g M玭. ")
	AddNote("дn ph遪g thu鑓 Л阯g m玭, ph鬰 m謓h Л阯g D�, ho祅 th祅h nhi謒 v� C秐h T� K�, th╪g l祄  t� Nh藀 C竎. ")
end;

function Uworld_wdutask()
	DelItem(385)
	Msg2Player("B筺 n衜 b� th� c馻 V﹏ B蕋 T� ")
	SetTask(124,25)
end

function Uworld_wdutask2()
	AddEventItem(386)
	Msg2Player("Ch蕋 c  gi秈 h誸, nh薾 頲 th� c馻 Л阯g D�, giao cho V﹏ B蕋 T� ")
	AddNote("m th� tr� l阨 c馻 Л阯g D� giao cho V﹏ B蕋 T�. ")
	SetTask(124,30)
end
