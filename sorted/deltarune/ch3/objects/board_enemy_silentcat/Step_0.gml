if (aggressive == true)
    scr_board_enemy_sword_collision();
scr_board_enemy_step_init();
scr_depth_board();
scr_board_enemy_hurt_state();
updatetimer++;
if (updatetimer == 2)
    updatetimer = 0;
else
    exit;
x += hspd;
y += vspd;
if (hp < 1)
{
    with (obj_board_enemy_silentcat)
        onebyone_timer = 0;
}
if (onebyone_timer > 0)
    onebyone_timer--;
if (obj_board_controller.kris_object.leftdoorway == true)
{
    if ((obj_board_controller.killedacatbefore == 2 || justgo == true) && onebyone_timer <= 0 && aggressive == false && wake == false && !i_ex(obj_board_enemy_singingcat))
    {
        if (onebyone == true)
        {
            with (obj_board_enemy_silentcat)
            {
                onebyone_timer = 22;
                wake = false;
            }
        }
        wake = true;
    }
    if (wake == true)
    {
        waketimer++;
        if (waketimer == 7)
            snd_play_pitch(snd_wing, 1.2);
        if ((waketimer % 2) == 0)
            x = xstart + 2;
        else
            x = xstart - 2;
        if (waketimer == 8)
        {
            wake = false;
            aggressive = true;
        }
    }
    if (aggressive == true)
    {
        idealdir = point_direction(x, y, obj_board_controller.kris_object.x + 16, obj_board_controller.kris_object.y + 16);
        image_index = 1;
        depth = obj_board_controller.kris_object.depth - 2000;
        vspd += lengthdir_y(homingfactor, idealdir);
        hspd += lengthdir_x(homingfactor, idealdir);
        if (vspd > 10)
            vspd = 10;
        if (hspd > 10)
            hspd = 10;
        homingfactor = scr_approach(homingfactor, maxhomingfactor, 0.4);
        timer++;
    }
}
