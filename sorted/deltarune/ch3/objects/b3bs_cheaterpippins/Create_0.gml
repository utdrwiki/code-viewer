con = 0;
dcon = 0;
dtimer = 0;
timer = 0;
dispcount = 0;
disprate = 0;
dattempt = global.flag[1088];
pippins1 = instance_create(246, 240, obj_npc_room);
with (pippins1)
{
    extflag = "pippins1";
    scr_darksize();
}
pippins2 = instance_create(476, 240, obj_npc_room);
with (pippins2)
{
    extflag = "pippins2";
    scr_darksize();
}
pippins3 = instance_create(794, 300, obj_npc_room);
with (pippins3)
{
    extflag = "pippins3";
    scr_darksize();
}
bpip1 = instance_create(384, 64, obj_board_pippins_grabbable);
button = instance_create(352, 192, obj_board_switchtile);
dice = instance_create(416, 192, obj_board_grabbleObject);
with (dice)
{
    breakable = false;
    visible = true;
    scr_depth_board();
    scr_darksize();
    sprite_index = spr_board_die_nocheat;
    image_index = 3;
    image_speed = 0;
}
init = false;
pwriter1 = instance_create(384, 128, obj_board_shopwriter);
pwriter1.shopstring = stringsetloc("ROLL THE DIE#2,4,6 WIN!", "obj_b3bs_cheaterpippins_slash_Create_0_gml_50_0");
pwriter1.yloc = ((bpip1.y + 48) - 4) + 8;
pwriter1.xoff = 78;
lancershow = false;
digline = stringsetloc("DIG, DIG, YOU GOT#NO DIRT ON US.", "obj_b3bs_cheaterpippins_slash_Create_0_gml_55_0");
susiedicepickup = false;
susline = stringsetloc("WHAT THE? WHY WOULD#YOU THROW A DIE?", "obj_b3bs_cheaterpippins_slash_Create_0_gml_58_0");
pippickup = false;
pipline = stringsetloc("WHAT? WHERE ARE#YOU TAKING ME?", "obj_b3bs_cheaterpippins_slash_Create_0_gml_61_0");
if (global.flag[1098] == 1)
{
    safe_delete(pippins1);
    safe_delete(pippins2);
    safe_delete(pippins3);
    safe_delete(pwriter1);
    safe_delete(bpip1);
}
