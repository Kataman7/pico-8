pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include particul/effects.lua
#include particul/particul.lua
#include transition.lua
#include entity/entity.lua
#include entity/tnt.lua
#include entity/player.lua
#include entity/camera.lua
#include entity/zombie.lua
#include entity/spyder.lua
#include entity/bat.lua
#include upgrade.lua
#include worldGenerator.lua
#include platform.lua
#include main.lua
__gfx__
00000000004444400044444000444440eeeeeee80000000000000000000000000000000000000000000000000002220000022200011811100101010110101010
00000000044444000444440004444400e28282820ee00ee00007a0000007e0000007600000000000002220000023330000233300081111100101010110101010
0070070004ffff0004ffff0004ffff00111711770e7eee80000a9a00000e8e000006d60000000000003332000037370000373700011111000111111001111110
0007700000f1f10000f1f10000f1f100717717170eeeee800074a7a00072e7e00075676000000000003733000033330000333300001155000118111001181110
0007700000ffff0000ffff0000ffff007177171708eee88007a9794007e87820076d7d50000000000033370000eee00000eee000000000000811150008111500
00700700000eee00000eee00000eee00e2828282008888000a949a900e828e8006d5d6d0000000000003330000ede20000ede200000000000115000001150000
00000000000eee00000eee00000eee00e28282820008800000a9a90000e8e800006d6d0000000000000ee00000eee00000eee000000000000000000000000000
00000000000d0d00000d000000000d00822222220000000000000000000000000000000000000000000ded0000d000000000d000000000000000000000000000
0000000000000000fffffffefffefffefffffffe6666666500000000000000000000000000000000001010000000000000000000000000000000000000000000
0000000000000000feeeeee2fee2fee2feeeeee2655555510007b000000000000000000000000000001110000010100000000000000000000000000000000000
0000000000000000fe222ee2fee2fee2feeeeee265111551000b3b00000000000000000000000000017171100011100000000000000000000000000000000000
0000000000000000fe2eefe2e222e222feeeeee2651556510072b7b0000000000000000000000000111111d10171710000000000000000000000000000000000
0000000000000000fe2eefe2fffefffefeeeeee26515565107b373200000000000000000000000001d1001d11d11111100000000000000000000000000000000
00000000000b3000feefffe2fee2fee2feeeeee2655666510b323b300000000000000000000000001d1000101d1001d100000000000000000000000000000000
00000000b30b20b3feeeeee2fee2fee2feeeeee26555555100b3b30000000000000000000000000001000000010001d100000000000000000000000000000000
0000000032032032e2222222e222e222e22222225111111100000000000000000000000000000000000000000000001000000000000000000000000000000000
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
0000000000000000000000000000000000000101010000000000000000000000000101000100000000000000000000000101010101000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000250502a0502d0502e050310503205000000330503405034050000003405031050000002e05027050220501d0501a050190501905019050190501a0501c0500000000000000000000000000
