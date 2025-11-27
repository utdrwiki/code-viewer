con = 0;
timer = 0;
endcon = 0;
endcontimer = 0;
treasuretrig = 0;
if (global.flag[1163] == 0)
    treasuretrig = 1;
cheese = instance_create(348, 676, obj_trigger_interact);
with (cheese)
{
    sprite_index = spr_mazecheese;
    issolid = true;
    visible = true;
    scr_darksize();
    scr_depth();
}
cheesejump = 0;
triggeralarm = 0;
finishline = scr_marker_ext(722, 600, spr_dw_teevie_finishline, 2, 2, undefined, undefined, undefined, 1000000);
finishline.visible = false;
if (global.flag[1164] == 1)
{
    con = -999;
    endcon = -999;
    treasuretrig = 1;
    safe_delete(cheese);
    safe_delete(finishline);
    with (obj_dw_teevie_stealth_chaselamp)
        instance_destroy();
    with (obj_dw_teevie_cameras_cheer)
        instance_destroy();
    with (obj_dw_teevie_cameras_crowd)
        instance_destroy();
}
