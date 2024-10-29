-- 汴京 路人NPC 辛弃疾（少林入门任务）
-- by：Dan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(122) == 0)) then		--入门任务进行中
		Say("шi ngi kh玭g ai kh玭g c� hi觤 nguy! Qua r錳 s� r蘮 luy猲 th猰 b秐 t輓h ki猲 cng",2,"Ta Cho r籲g: с l�: C竔 g� m譶h kh玭 mu鑞 th� ng l祄 cho ngi kh竎 /enroll_S2_A","Tr猲 阯g th蕐 chuy謓 b蕋 b譶h kh玭g th� l祄 ng�. с m韎 l� hi謕 ngh躠 /enroll_S2_B")
	else
		Talk(1,"","H穣 c� g緉g n� l鵦 nh�! V� nc v� d﹏! V� b� t竛h thi猲 h�.")
	end
end;

function enroll_S2_A()
	Say("шi ngi kh玭g ai kh玭g c� hi觤 nguy! Qua r錳 s� r蘮 luy猲 th猰 b秐 t輓h ki猲 cng",3,"H穣 c� g緉g n� l鵦 nh�. V� nc v� d﹏. V� thi猲 h� b� t竛h /enroll_S2_wrongA","в ta suy ngh�, t譵 m閠 c竎h gi秈 quy誸 t鑤 nh蕋 /enroll_S2_correct","Cho d� 頲 l頸 cho m譶h th� c騨g ng l祄 cho ngi kh竎 b� t鎛 thng /enroll_S2_wrongA")
end;

function enroll_S2_B()
	Say("� y c� 500 lng b筩, xin nh薾 l蕐!",3," t� /enroll_S2_wrongB","Ta c� th� gi髉 cho ngi 頲 g� y? /enroll_S2_wrongB","Th藅 s� kh玭g d竚 l祄 phi襫 /enroll_S2_correct")
end;

function enroll_S2_correct()
	Talk(1,"","Xem nh� ta v� ngi c� duy猲! T苙g ngi Qu秐g Ho綾 Hng n祔  l祄 qu� tao ng�!")
	AddEventItem(122)
	Msg2Player("Nh薾 頲 Qu秐g Ho綾 Hng ")
	AddNote("Tr� l阨 頲 c﹗ h醝 c馻 T﹏ Kh� T藅, nh薾 頲 Qu秐g Ho綾 Hng ")
end;

function enroll_S2_wrongA()
	Talk(1,"","шi ngi kh玭g ai kh玭g c� hi觤 nguy! Qua r錳 s� r蘮 luy猲 th猰 b秐 t輓h ki猲 cng")
end;

function enroll_S2_wrongB()
	Talk(1,"","Ngi th蕐 ti襫 l� s竛g m総 th� l祄 sao c� th� ph竧 huy ch輓h kh�? Ngi th藅 khi課 ta th蕋 v鋘g!")
end;
