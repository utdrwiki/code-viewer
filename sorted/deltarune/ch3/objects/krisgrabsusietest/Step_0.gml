if (init == 0)
{
    safe_delete(obj_gameshow_swordroute);
    kris.depth = -9990;
    kris.visible = true;
    kris.image_blend = merge_color(c_black, c_white, 0.5);
    susie = scr_dark_marker(340, 282, spr_susieu_dark);
    susie.image_blend = merge_color(c_black, c_white, 0.5);
    init = 1;
}
with (obj_mainchara_board)
    visible = false;
if (con == 0)
{
    if (button1_p() && subcon == 0)
    {
        subcon = 1;
        subtimer = 0;
        var susX = susie.x;
        var susY = susie.y;
        kris.visible = false;
        susie.visible = false;
        snd_play(snd_grab);
        krisandsusie = scr_dark_marker(susX, susY, spr_dw_ch3_SM03_grab_1);
        krisandsusie.image_blend = merge_color(c_white, c_black, 0.5);
    }
    if (subcon == 1)
    {
        subtimer++;
        if (subtimer == 2)
            krisandsusie.x -= 4;
        if (subtimer == 3)
            krisandsusie.x -= 2;
        if (subtimer == 4)
            krisandsusie.x -= 2;
        if (subtimer == 5)
        {
            with (krisandsusie)
            {
                sprite_index = spr_dw_ch3_SM03_grab_2;
                image_speed = 0.25;
                hspeed = -12;
                vspeed = -3.5;
                gravity = 0.95;
            }
        }
        if (subtimer == 11)
        {
            with (krisandsusie)
            {
                sprite_index = spr_dw_ch3_SM03_grab_3;
                image_speed = 0;
                scr_lerpvar("image_index", 0, 5, 15);
            }
        }
        if (subtimer == 12)
        {
            with (krisandsusie)
            {
                y = other.susie.y;
                friction = 1.5;
                vspeed = 0;
                gravity = 0;
                subtimer = 0;
                subcon = 2;
            }
        }
        if (subtimer == 27)
        {
            with (krisandsusie)
            {
                sprite_index = spr_dw_ch3_SM03_grab_4;
                scr_lerpvar("image_speed", 0.15, 0, 180, 2, "out");
            }
        }
    }
}
else if (con == 1)
{
    if (button1_p())
    {
        room_restart();
        kris.visible = true;
        susie.visible = true;
        safe_delete(krisandsusie);
        con = 0;
    }
}
if (i_ex(krisandsusie))
{
    if (krisandsusie.y > 298)
    {
        krisandsusie.y = 298;
        krisandsusie.vspeed = 0;
        krisandsusie.gravity = 0;
        krisandsusie.friction = 1.5;
        krisandsusie.image_speed = 0;
    }
}
