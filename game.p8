pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include particul/effects.lua
#include particul/particul.lua
#include particul/wave.lua
#include transition.lua
#include entity/entity.lua
#include entity/tnt.lua
#include entity/player.lua
#include entity/camera.lua
#include entity/zombie.lua
#include entity/spyder.lua
#include entity/bat.lua
#include entity/boss.lua
#include entity/skull.lua
#include entity/tir.lua
#include upgrade.lua
#include worldGenerator.lua
#include platform.lua
#include main.lua
#include gui.lua
__gfx__
00000000004444400044444000444440006666000000000000000000000000000000000000000000000000000002220000022200011811100101010110101010
00000000044444000444440004444400067777700ee00ee00007a0000007e000000760000007c000002220000023330000233300081111100101010110101010
0070070004ffff0004ffff0004ffff006777777f0e7eee80000a9a00000e8e000006d600000cdc00003332000037370000373700011111000111111001111110
0007700000f1f10000f1f10000f1f1006111177f0eeeee800074a7a00072e7e0007567600071c7c0003733000033330000333300001155000118111001181110
0007700000ffff0000ffff0000ffff006777877f08eee88007a9794007e87820076d7d5007cd7d100033370000eee00000eee000000000000811150008111500
00700700000eee00000eee00000eee006777787f008888000a949a900e828e8006d5d6d00cd1dcd00003330000ede20000ede200000000000115000001150000
00000000000eee00000eee00000eee00077777f00008800000a9a90000e8e800006d6d0000cdcd00000ee00000eee00000eee000000000000000000000000000
00000000000d0d00000d000000000d0000ffff000000000000000000000000000000000000000000000ded0000d000000000d000000000000000000000000000
0000000000000000fffffffefffefffefffffffe666666650000000000009000eee80000eee88882001010000000000000000000007777000077770000000000
0000000000000000feeeeee2fee2fee2feeeeee2655555510007b0000009a900e8820000e8828221001110000010100000777700007878000078780000000000
0000000000000000fe222ee2fee2fee2feeeeee265111551000b3b000999a999e8820000e8828221017171100011100000787800007777000077770000000000
0000000000000000fe2eefe2e222e222feeeeee2651556510072b7b009aaaaa98222000082222111111111d10171710000777700000071100000711000067000
0000000000000000fe2eefe2fffefffefeeeeee26515565107b37320009aaa900000eee88882eee81d1001d11d11111100007110000707100007071000075000
00000000000b3000feefffe2fee2fee2feeeeee2655666510b323b30009a9a900000e8828221e8821d1000101d1001d100070710000070100000701000000000
00000000b30b20b3feeeeee2fee2fee2feeeeee26555555100b3b300009909900000e8828221e88201000000010001d100007010000711000007110000000000
0000000032032032e2222222e222e222e22222225111111100000000000000000000822221118222000000000000001000071100000700000000070000000000
00ddd200bbbbbbb36666666500000000aaaaaaa9666d666dfffffff400777f00eeeeeee8ddddddd2000000000000000000000000000011111111000000000000
00d22100b33333326555555100000000a99999926dd16dd1f4444442007ffd00e8888882d2222221077700000000000000000000000155555555100000000000
00d22100b32223326511155100000000a99999926dd16dd1f4222442007ffd00e8222882d2333221076600000000000000000000001ddd11dddd510000000000
00d22100b3233b32651cc65100000000a9999992d111d111f4244f42007ffd00e8288e82d23bb521000bbb000000000000000000001dd1561ddd510000000000
00d22100b3233b32651cc65100000000a9999992666d666df4244f42007ffd00e8288e82d23bb521000b33000000000000000000001dd1661ddd510000000000
00d22100b33bbb3265566651b30000b3a99999926dd16dd1f44fff42007ffd00e88eee82d2255521000b00000000000000000000001ddd11dddd510000000000
00d22100b333333265555551b20b30b2a99999926dd16dd1f4444442007ffd00e8888882d2222221000b00000000000000000000001ddddddddd510000000000
0021110032222222511111113203203292222222d111d1114222222200fddd008222222221111111000b00000000000000000000001ddd111ddd510000000000
ddddddd2bbb366656666666d66666665fffffff4bbb300006666666566666665bbbbbbbb66666665000000000000000000000000001dd15551dd510000000000
d2222221b33265516dddddd165555551f4444445b33100006555555165555551b333333365555551000000000000000000000000001d1556661d510000000000
d2222221b33265516dddddd165555551f4444445b33100006599955165222551fffffff465111551000000000000000000000000001d1561661d510000000000
d2222221322251116dddddd165555551f444444531110000659aa65165288e51f444444565177651000000000000000000228000001d1566661d510000000000
d22222216665bbb36dddddd165555551f44444450000bbb3659aa65165288e51f44444456517765100dd200000ffe000008ee800001dd16661dd510000000000
d22222216551b3326dddddd165555551f44444450000b33165566651655eee51f4444445655666510021100000e2200000082200001ddd111ddd510000000000
d22222216551b3326dddddd165555551f44444450000b3316555555165555551f444444565555551000300000003000000030000000155555555100000000000
2111111151113222d111111151111111455555550000311151111111511111114555555551111111000300000003000000300000000011111111000000000000
eeeeeee877777777eeeeeee877777777eeeeeee877777777eeeeeee8777777770000000000000000000000000000000000000000000000000000000000000000
e282828277777777e282828277777777e282828277777777e2828282777777770000000000000000000000000000000000000000000000000000000000000000
11171177777777777711171177777777117711177777777717117711777777770000000000000000000000000000000000000000000000000000000000000000
71771717777777771771771777777777171771777777777777171771777777770000000000000000000000000000000000000000000000000000000000000000
71771717777777771771771777777777171771777777777777171771777777770000000000000000000000000000000000000000000000000000000000000000
e282828277777777e282828277777777e282828277777777e2828282777777770000000000000000000000000000000000000000000000000000000000000000
e282828277777777e282828277777777e282828277777777e2828282777777770000000000000000000000000000000000000000000000000000000000000000
82222222777777778222222277777777822222227777777782222222777777770000000000000000000000000000000000000000000000000000000000000000
__label__
70000000777070707770077077707770000007707770777077700000707077707770700000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
07000000700070707070707070700700000070007070777070000000707007007770700000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
00700000770007007770707077000700000070007770707077000000777007007070700000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
07000000700070707000707070700700000070707070707070000000707007007070700000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
70000000777070707000770070700700000077707070707077700700707007007070777000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
00000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
66606000666066600660666000000660666066606660606066606660000066600000600066606660666060000000666066606660066066600000000000000000
60606000600060606000600000006000606060600600606060606000000060600000600060606060600060000000600006006060600006000000000000000000
66606000660066606660660000006000666066600600606066006600000066600000600066606600660060000000660006006600666006000000000000000000
60006000600060600060600000006000606060000600606060606000000060600000600060606060600060000000600006006060006006000000000000000000
60006660666060606600666000000660606060000600066060606660000060600000666060606660666066600000600066606060660006000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
700000007000077000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccb3333333b3333333ccccccccccccccccccccccccccccc
070000007000700000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccfffffff4fffffff4ccccccccccccccccccccccccccccc
007000007000777000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccf4444445f4444445ccccccccccccccccccccccccccccc
070000007000007000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccf4444445f4444445ccccccccccccccccccccccccccccc
700000007770770000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccf4444445f4444445ccccccccccccccccccccccccccccc
000000000000000000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccf4444445f4444445ccccccccccccccccccccccccccccc
cc00ccc0ccc0ccc00cc0ccc00cc0ccc0c0c00000000000c0ccc0ccc00cc00cc00000ccc000000000000000000000000000000000000000000000000000000000
c0c00c00c0c0c000c0000c00c0c0c0c0c0c00c0000000c00c0c00c00c000c0c00000c0c000000000000000000000000000000000000000000000000000000000
c0c00c00cc00cc00c0000c00c0c0cc00ccc0000000000c00ccc00c00c000c0c0ccc0ccc000000000000000000000000000000000000000000000000000000000
c0c00c00c0c0c000c0000c00c0c0c0c000c00c0000000c00c0000c00c000c0c00000c0c000000000000000000000000000000000000000000000000000000000
ccc0ccc0c0c0ccc00cc00c00cc00c0c0ccc000000000c000c000ccc00cc0cc000000ccc000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000ee0eee0eee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000e0000e000e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000e0000e000e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000e0e00e000e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e00eee0eee00e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06606660666066600000666066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006060666060000000606060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006660606066000000666066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60606060606060000000600060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606060606066600600600066600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99909000999099909990999099009990990000009090999099000990900090909900999009900000000000000000000000000000000000000000000000000000
90009000909009000900900090909000909000009990090090909000900090909090900090000000000000000000000000000000000000000000000000000000
99009000999009000900990090909900909000009090090090909000900090909090990099900000000000000000000000000000000000000000000000000000
90009000909009000900900090909000909000009990090090909000900090909090900000900000000000000000000000000000000000000000000000000000
90009990909009000900999090909990999000009090999090900990999009909990999099000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99909000999099909990999099009990990000009090999099000990900090909900999009900000000000000000000000000000000000000000000000000000
90009000909009000900900090909000909000009990090090909000900090909090900090000000000000000000000000000000000000000000000000000000
99009000999009000900990090909900909000009090090090909000900090909090990099900000000000000000000000000000000000000000000000000000
90009000909009000900900090909000909000009990090090909000900090909090900000900000000000000000000000000000000000000000000000000000
90009990909009000900999090909990999000009090999090900990999009909990999099000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
99909000999099909990999099009990990000009090999099000990900090909900999009900000000000000000000000000000000000000000000000000000
90009000909009000900900090909000909000009990090090909000900090909090900090000000000000000000000000000000000000000000000000000000
99009000999009000900990090909900909000009090090090909000900090909090990099900000000000000000000000000000000000000000000000000000
90009000909009000900900090909000909000009990090090909000900090909090900000900000000000000000000000000000000000000000000000000000
90009990909009000900999090909990999000009090999090900990999009909990999099000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707770077077707770000007707770777077700000707077707770700000000555551655555516555555165555551ccccccccccccccccccccc
07000000700070707070707070700700000070007070777070000000707007007770700000000555551655555516555555165555551ccccccccccccccccccccc
00700000770007007770707077000700000070007770707077000000777007007070700000000555551655555516555555165555551ccccccccccccccccccccc
07000000700070707000707070700700000070707070707070000000707007007070700000000555551655555516555555165555551ccccccccccccccccccccc
70000000777070707000770070700700000077707070707077700700707007007070777000000111111511111115111111151111111ccccccccccccccccccccc
00000000000000000000000000000000000000000000000000000000000000000000000000000666665666666656666666566666665ccccccccccccccccccccc
66606000666066600660666000000660666066606660606066606660000066600000600066606660666060000000666066606660066066600000000000000000
60606000600060606000600000006000606060600600606060606000000060600000600060606060600060000000600006006060600006000000000000000000
66606000660066606660660000006000666066600600606066006600000066600000600066606600660060000000660006006600666006000000000000000000
60006000600060600060600000006000606060000600606060606000000060600000600060606060600060000000600006006060006006000000000000000000
60006660666060606600666000000660606060000600066060606660000060600000666060606660666066600000600066606060660006000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7000000088880cccccccccccccccccccccccccccccccccccccccccccccccccdcdcc5111111151111111511111115111111151111111ccccccccccccccccccccc
0700000088880ccccccccccccccccccccccccccccccccccccccccccccccbbbbbbbb6666666566666665666666656666666566666665ccccccccccccccccccccc
0070000088880ccccccccccccccccccccccccccccccccccccccccccccccb33333336555555165555551655555516555555165555551ccccccccccccccccccccc
0700000088880ccccccccccccccccccccccccccccccccccccccccccccccfffffff46555555165555551655555516555555165999551ccccccccccccccccccccc
7000000088880ccccccccccccccccccccccccccccccccccccccccccccccf444444565555551655555516555555165555551659aa651ccccccccccccccccccccc
0000000000000ccccccccccccccccccccccccccccccccccccccccccccccf444444565555551655555516555555165555551659aa651ccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccf44444456555555165555551655555516555555165566651ccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccf44444456555555165555551655555516555555165555551ccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc455555555111111151111111511111115111111151111111ccccccccccccccccccccc
ccccccccccc6666666566666665ccccccccccccccccccccccccbbbbbbbbfffffff466666665666666656666666566666665ccccccccccccccccccccccccccccc
ccccccccccc6555555165555551ccccccccccccccccccccccccb3333333f444444565555551655555516555555165555551ccccccccccccccccccccccccccccc
ccccccccccc6555555165555551ccccccccccccccccccccccccfffffff4f444444565555551655555516555555165555551ccccccccccccccccccccccccccccc
ccccccccccc6555555165555551ccccccccccccccccccccccccf4444445f444444565555551655555516555555165555551ccccccccccccccccccccccccccccc
ccccccccccc6555555165555551ccccccccccccccccccccccccf4444445f444444565555551655555516555555165555551ccccccccccccccccccccccccccccc
ccccccccccc6555555165555551ccccccccccccccccccccccccf4444445f444444565555551655555516555555165555551ccccccccccccccccccccccccccccc
ccccccccccc6555555165555551ccccccccccccccccccccccccf4444445f444444565555551655555516555555165555551ccccccccccccccccccccccccccccc
ccccccccccc5111111151111111cccccccccccccccccccccccc455555554555555551111111511111115111111151111111ccccccccccccccccccccccccccccc
ccc666666656666666566666665666666656666666566666665fffffff46666666566666665ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551f44444456555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551f44444456555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551f44444456555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551f44444456555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551f44444456555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551f44444456555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc511111115111111151111111511111115111111151111111455555555111111151111111ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc6666666566666665666666656666666566666665666666656666666566666665ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc6555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc6555555165555551655555516555555165555551655555516599955165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551659aa65165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc655555516555555165555551655555516555555165555551659aa65165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc6555555165555551655555516555555165555551655555516556665165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc6555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccc5111111151111111511111115111111151111111511111115111111151111111ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
6656666666566666665666666656666666566666665666666656666666566666665ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165999551655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
55165555551655555516555555165555551659aa651655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
55165555551655555516555555165555551659aa651655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165566651655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
1115111111151111111511111115111111151111111511111115111111151111111ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
6656666666566666665666666656666666566666665666666656666666566666665666666656666666566666665ccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551655555516555555165555551655555516555555165555551ccccccccccccccccccccccccccccccccccccc
1115111111151111111511111115111111151111111511111115111111151111111511111115111111151111111ccccccccccccccccccccccccccccccccccccc
6656666666566666665666666656666666566666665cccccccccccccccc6666666566666665666666656666666566666665ccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551cccccccccccccccc6555555165555551655555516555555165555551ccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551cccccccccccccccc6555555165555551655555516555555165555551ccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551cccccccccccccccc6555555165555551655555516555555165555551ccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551cccccccccccccccc6555555165555551655555516555555165555551ccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551cccccccccccccccc6555555165555551655555516555555165555551ccccccccccccccccccccccccccccc
5516555555165555551655555516555555165555551cccccccccccccccc6555555165555551655555516555555165555551ccccccccccccccccccccccccccccc
1115111111151111111511111115111111151111111cccccccccccccccc5111111151111111511111115111111151111111ccccccccccccccccccccccccccccc
ccc66666665666666656666666566666665cccccccccccccccccccccccc666666656666666566666665666666656666666566666665ccccccccccccccccccccc
ccc65555551655555516555555165555551cccccccccccccccccccccccc655555516555555165555551655555516555555165555551ccccccccccccccccccccc
ccc65555551655555516555555165555551cccccccccccccccccccccccc655555516555555165555551655555516555555165555551ccccccccccccccccccccc
ccc65555551655555516555555165555551cccccccccccccccccccccccc655555516555555165555551655555516555555165555551ccccccccccccccccccccc
ccc65555551655555516555555165555551cccccccccccccccccccccccc655555516555555165555551655555516555555165555551ccccccccccccccccccccc

__gff__
0000000000000000000000000000000000080301030000000000000000000000000105080100000000050800000000000101010101000505010508080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
090d0000247602474021760217401c7601c740247602474021760217401c7601c740247602474021760217401c7601c740247602474021760217401c7601c74023760237401f7601f7401c7601c7402376023740
090d00001f7601f7401c7601c74023760237401f7601f7401c7601c74023760237401f7601f7401c7601c74021760217401d7601d7401a7601a74021760217401d7601d7401a7601a74021760217401d7601d740
090d00001a7601a74021760217401d7601d7401a7601a74023760237401f7601f7401c7601c74023760237401f7601f7401c7601c74023760237401f7601f7401c7601c74023760237401f7601f7401c7601c740
d10d00001f1411f1401f1401f1401f1401f1402114021140211402114021140211402114021140211402114021140211402114021130211202111024141241402414024140241302412023140231402314023140
d10d000023140231402314023140231402314023140231402314023140231402313023120231101f1411f1401f1401f1401f1401f130211402114021140211402114021140211402114021140211402114021140
d10d0000211402113021120211102414124140241402414024140241301f1401f1401f1401f1401f1401f1401f1401f1401f1401f1401f1401f1401f1401f1401f1401f1301f1201f11000000000000000000000
d10d1c00211502115021150211502415024150241502415024150241501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f1501f15001400014000140001400
890d00002b165000042b1652b2652b1652b2652b1652b2642d1652d2652d1652d24500004282652b1650000500005000052b1650000500005000052d1652d2642d1652d245000050000500005000040000400000
890d00002b165000052b1652b2652b1652b2652b1652b2642d1652d2652d1652d24500005282652616500005000050000526165000050000500005281652826428165282452b1652b2652b1652b2452816528265
890d00002816528245261652626526165262452416524264241652424526165262652616526245281652826528165282652b1652b2652b1652b26526165262642616526245000050000524165240052616500005
890d1f002816528165261652616526165261652416524164241652416526165261652616526165281652816528165281652b1652b1652b1652b16526165261642616526165000050000524165000052616501405
010d00000945015040094501504009450150400945015040094501504009450150400945015040094501504009450150400945015040094501504009450150400745013040074501304007450130400745013040
010d00000745013040074501304007450130400745013040074501304007450130400745013040074501304005450110400545011040054501104005450110400545011040054501104005450110400545011040
010d00000545011040054501104005450110400545011040074501304007450130400745013040074501304007450130400745013040074501304007450130400745013040074501304007450130400745013040
910d000030765307452d7652d745287652874530765307452d7652d745287652874530765307452d7652d745287652874530765307452d7652d74528765287452f7652f7452b7652b74528765287452f7652f745
910d00002b7652b74528765287452f7652f7452b7652b74528765287452f7652f7452b7652b74528765287452d7652d745297652974526765267452d7652d745297652974526765267452d7652d7452976529745
910d000026765267452d7652d745297652974526765267452f7652f7452b7652b74528765287452f7652f7452b7652b74528765287452f7652f7452b7652b74528765287452f7652f7452b7652b7452876528745
011a0000180633c214186633c214180633c214186633c214180633c214186633c214180633c214186633c214180633c214186633c214180633c214186633c214180633c214186633c214180633c214186633c214
890d00002816528245261652626526165262452416524264241652424526165262652616526245281652826528165282652b1652b2652b1652b26526165262642616526245000050000500000000000000000000
011a0000180633c214186633c214180633c214186633c214180633c214186633c214180633c2041866318663180633c214186633c214180633c214186633c214180633c214186633c214180633c2041866318663
010d00000545011040054501104005450110400545011040074501304007450130400745013040074501304007450130400745013040074501304007450130400745013040074501304000000000000000000000
__music__
00 00404040
00 01404140
00 02404240
00 00434040
00 01444140
00 02454240
00 00034040
00 01044140
00 02054240
00 00034040
00 01044140
00 02054240
01 07110e0b
00 08110f0c
00 0913100d
00 07110e0b
00 08110f0c
00 1213100d
00 07110e0b
00 08110f0c
00 0911100d
00 07110e0b
00 08110f0c
06 12131014

