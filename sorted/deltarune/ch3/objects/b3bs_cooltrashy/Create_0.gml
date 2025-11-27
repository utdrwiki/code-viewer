with (instance_create(1006, 126, obj_npc_room))
    extflag = "trashy";
with (instance_create(1076, 224, obj_dw__backstagelight))
    type = 0;
var makeribbick = false;
if (global.flag[591] > 1 || global.flag[593] > 1)
    makeribbick = true;
if (global.flag[591] == 1 || global.flag[593] == 1)
    makeribbick = false;
if (makeribbick)
{
    with (instance_create(946, 160, obj_npc_room))
        extflag = "ribbick";
    with (instance_create(998, 236, obj_dw__backstagelight))
        lightpos = 100;
}
var makestealth = true;
if (makestealth)
    scr_stealth_drawmarkers();
