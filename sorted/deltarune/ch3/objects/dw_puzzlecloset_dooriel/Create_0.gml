myinteract = 0;
buffer = 0;
attempt = 0;
codeentry = 0;
timer = 0;
ribbick = 0;
image_speed = 0;
sprite_index = spr_dw_puzzlecloset_door_unlock;
if (room == room_dw_puzzlecloset_1 && global.flag[1094] == 1)
    instance_destroy();
if (room == room_dw_puzzlecloset_2 && global.flag[1095] == 1)
    instance_destroy();
if (room == room_dw_puzzlecloset_3 && global.flag[1231] == 1)
    instance_destroy();
if (room == room_dw_puzzlecloset_0)
    instance_destroy();
resultcheck = 0;
ribbickleave = 0;
open = 0;
opentimer = 0;
fade = 1;
openindex = 0;
unlockindex = 0;
screenon = 0;
