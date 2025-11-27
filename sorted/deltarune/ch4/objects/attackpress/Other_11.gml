if (scr_monsterpop() > 0)
{
    if (global.chapter == 4 && i_ex(obj_jackenstein_enemy))
    {
        points[0] = 0;
        points[1] = 0;
        points[2] = 0;
        scr_tensionheal(5);
    }
    if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy))
    {
        points[0] = 0;
        with (obj_hammer_of_justice_enemy)
        {
            state = 13;
            sprite_index = spr_gerson_teleport;
            image_xscale = 3;
            image_yscale = 3;
            image_speed = 1;
            x += 40;
            y += 30;
            snd_play_pitch(motor_swing_down, 1.4);
        }
    }
    if (global.chapter == 4 && i_ex(obj_sound_of_justice_enemy))
    {
        points[0] = 0;
        points[1] = 0;
        with (obj_sound_of_justice_enemy)
        {
            if (state != 13)
            {
                state = 13;
                sprite_index = spr_gerson_teleport;
                image_xscale = 3;
                image_yscale = 3;
                image_speed = 1;
                x = obj_sound_of_justice_enemy.xstart + 56;
                y = obj_sound_of_justice_enemy.ystart + 70;
                snd_play_pitch(motor_swing_down, 1.4);
            }
        }
    }
    for (i = 0; i < 3; i += 1)
    {
        if (target == i)
        {
            if (i_ex(global.charinstance[i]))
            {
                global.charinstance[i].points = points[i];
                with (global.charinstance[i])
                {
                    state = 1;
                    attacktimer = 0;
                }
            }
        }
    }
}
