if (scr_debug())
    scr_setparty(1, 1, 0);
var _marquee = instance_create(100, 340, obj_dw_ch3_teevie_marquee);
_marquee.mystring = stringsetloc("Now playing...", "obj_room_teevie_large_01_slash_Create_0_gml_5_0");
_marquee.width = 220;
with (_marquee)
    scr_depth();
var _encounter_id = 117;
var _encounter_flag = 590;
for (var i = 0; i < 5; i++)
{
    var enemy_encounter = instance_create(0, 0, obj_chaseenemy);
    with (enemy_encounter)
    {
        path_start(path_teevie_large_01, 8, path_action_continue, 1);
        path_position = i * 0.2;
        myencounter = _encounter_id;
        encounterflag = _encounter_flag;
        sprite_index = spr_shadowman_idle_a;
        touchsprite = spr_shadowman_hurt;
        touchtype = 1;
        boxtype = 1;
        radius = 1;
        alertskip = 0;
        pacetype = 11;
        chasetype = -1;
        ignoresolid = 0;
        moveradius = 10;
        eraser = 1;
        alerttype = 1;
        canAlertThroughWalls = 0;
        extflag = "shutta";
    }
}
var tv_screen_left = instance_create(0, 0, obj_dw_teevie_tv_screens);
with (tv_screen_left)
{
    x = 420;
    y = 500;
    width = 3;
    height = 3;
    depth = 1000010;
    tvbasesprite = spr_dw_teevie_tv_base;
}
