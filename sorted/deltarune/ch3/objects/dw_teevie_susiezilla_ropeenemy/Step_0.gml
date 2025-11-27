scr_depth_alt();
if (fakey > -48)
    active = true;
else
    active = false;
if (con == 0)
{
    if (active && global.interact == 0)
    {
        var ymod = y + 58;
        if (i_ex(collision_rectangle(x - 30, ymod - 20, x + 30, ymod + 4, obj_mainchara, 0, 0)))
        {
            with (object_index)
                image_speed = 0;
            with (obj_dw_teevie_susiezilla)
                killmove = 1;
            global.interact = 1;
            snd_play(snd_tensionhorn);
            snd_play_delay(snd_tensionhorn, 8, 1, 1.1);
            con = 1;
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        with (scr_marker_ext(x, cameray(), spr_pxwhite, 4, cameray() + y + fakey, 0, 0, c_black, depth + 1, undefined, 30))
            image_blend = #5F3417;
        shadowman = scr_marker_ext(x, y + fakey, sprite_index, 2, 2, 0, image_index, undefined, 88);
        visible = false;
    }
    if (timer == 31)
    {
        shadowman.sprite_index = spr_shadowman_idle_a;
        shadowman.x -= 56;
        shadowman.y -= 61;
        global.flag[54] = encounterflag;
        encounterno = 136;
        scr_battle(encounterno, 0, shadowman);
    }
    if (timer == 80)
    {
        if (erase == true)
        {
            with (object_index)
                instance_destroy();
        }
        else
        {
            instance_destroy();
        }
    }
}
