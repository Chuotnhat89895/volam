--新春大礼包
--Suyu 2004.1.12

--function main(sel)
--	--装备：10％几率送绚酷披风一件
--	p=random(1,100);
--	if(p<=10)then
--		AddItem(6,1,15,1,0,0,0)
--	end;
--
 	--宝石：50％几率送宝石一颗；
--	p=random(1,100);
--	if(p<=50)then
--		AddEventItem((238+mod(p,3)))
--	end;
--
 	--红包：价值100000的红包一个；
--	AddItem(6,1,13,1,0,0,0);

 	--烟花：2个烟花；
--	AddItem(6,0,11,1,0,0,0);
--	AddItem(6,0,11,1,0,0,0); 
--	return 0
--end

Include("\\script\\changefeature\\feature_man.lua")

function main()
	dofile("script/item/biggift.lua")
	switch_check_feature()
	return 1
end

function switch_check_feature()
	local szTitle = "Xin ch祇! Чi hi謕 mu鑞 ki觤 ngo筰 trang g�?"
	local tbOpt =
	{
		"Ng鵤/#choose_check_feature(4)",
		"V� Kh�/#choose_check_feature(3)",
		"Ao gi竝/#choose_check_feature(2)",
		"M�/#choose_check_feature(1)",
		"M苩 n�/#choose_check_feature(0)",
		"Nh薾 bao l� x�/nhanlixi",
		"Tho竧/no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end


function nhanlixi()
	AddItem(6,1,13,1,0,0,0)
	AddItem(6,1,14,1,0,0,0)
	Msg2Player("Х nh薾 2 bao l� x�.")
end

function choose_check_feature(num)
	SetTaskTemp(168, num)
end