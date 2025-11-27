if (i_ex(obj_tenna_enemy))
    exit;
if (i_ex(obj_shadowman_sharpshoot_target))
    exit;
if (posecon > 0)
{
    if (posecon == 1)
    {
        posetimer++;
        if (posetimer == 1)
        {
            sprite_index = spr_shutta_pose;
            image_index = 0;
            image_speed = 0.5;
        }
        if (posetimer == 30)
        {
            image_speed = 0;
            posecon = 2;
            posetimer = 0;
        }
    }
    if (posecon == 2 && global.turntimer < 1)
    {
        posetimer++;
        if (posetimer == 1)
        {
            sprite_index = spr_shutta_pose_return;
            image_index = 0;
            image_speed = 0.5;
        }
        if (posetimer == 9)
        {
            sprite_index = spr_shutta_idle;
            posecon = 0;
            posetimer = 0;
        }
    }
    draw_self();
}
else if (!jumping)
{
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(0.16666666666666666);
}
else
{
    draw_self();
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
