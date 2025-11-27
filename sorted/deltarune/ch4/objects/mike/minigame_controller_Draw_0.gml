with (obj_gravity_hoop)
    draw_sprite_ext(sprite_index, 1, x + random_x, y + random_y, image_xscale, image_yscale, 0, image_blend, 1);
if (scr_debug())
{
    draw_set_colour(c_white);
    draw_set_font(fnt_main);
}
var _hs = obj_mike_minigame_tv.hiscore[obj_mike_minigame_tv.minigame];
new_hiscore -= 1;
if (new_hiscore > 0)
{
    draw_set_halign(fa_center);
    draw_set_font(fnt_mainbig);
    draw_set_colour(c_yellow);
    if (vis)
        draw_text(320, 80, stringsetloc("* NEW HISCORE! *\n", "obj_mike_minigame_controller_slash_Draw_0_gml_28_0") + string(_hs));
    draw_set_halign(fa_left);
}
if (phase == 0)
{
    music_y = lerp(music_y, 0, 0.5);
    draw_set_colour(c_white);
    draw_set_font(fnt_mainbig);
    draw_set_halign(fa_center);
    draw_text(240, 24 + music_y, stringsetloc("MUSIC: ", "obj_mike_minigame_controller_slash_Draw_0_gml_54_0"));
    if (point_distance(obj_mike_controller.mx, obj_mike_controller.my, 360, 64 + music_y) < 20)
    {
        draw_set_colour(c_yellow);
        if (scr_mouse_leftclick())
        {
            if (!music_on)
            {
                snd_play(snd_item);
                global.batmusic[1] = mus_loop_ext(global.batmusic[0], 1, 1);
            }
            with (obj_hand_collision)
                instance_destroy();
            music_on = true;
        }
    }
    else if (music_on)
    {
        draw_set_colour(c_white);
    }
    else
    {
        draw_set_colour(c_gray);
    }
    ossafe_fill_rectangle(332, 28 + music_y, 384, 54 + music_y, 1);
    draw_text(360, 24 + music_y, stringsetloc("ON", "obj_mike_minigame_controller_slash_Draw_0_gml_70_0"));
    if (point_distance(obj_mike_controller.mx, obj_mike_controller.my, 440, 64 + music_y) < 30)
    {
        draw_set_colour(c_yellow);
        if (scr_mouse_leftclick())
        {
            if (music_on)
            {
                snd_play(snd_item);
                snd_stop(global.batmusic[1]);
            }
            with (obj_hand_collision)
                instance_destroy();
            music_on = false;
        }
    }
    else if (!music_on)
    {
        draw_set_colour(c_white);
    }
    else
    {
        draw_set_colour(c_gray);
    }
    ossafe_fill_rectangle(412, 28 + music_y, 464, 54 + music_y, 1);
    draw_text(440, 24 + music_y, stringsetloc("OFF", "obj_mike_minigame_controller_slash_Draw_0_gml_87_0"));
}
else
{
    music_y = -64;
}
if (action == 3 && phase == 0)
{
    var __y = 288;
    draw_set_colour(c_white);
    draw_set_font(scr_84_get_font("mainbig"));
    draw_text(240, (24 - music_y) + __y, stringsetloc("INVERT VOL: ", "obj_mike_minigame_controller_slash_Draw_0_gml_109_0"));
    draw_set_font(fnt_mainbig);
    if (point_distance(obj_mike_controller.mx, obj_mike_controller.my, 360, 32 + __y) < 20)
    {
        draw_set_colour(c_yellow);
        if (scr_mouse_leftclick())
        {
            if (!inv_mic)
                snd_play(snd_item);
            with (obj_hand_collision)
                instance_destroy();
            inv_mic = true;
        }
    }
    else if (inv_mic)
    {
        draw_set_colour(c_white);
    }
    else
    {
        draw_set_colour(c_gray);
    }
    ossafe_fill_rectangle(332, (28 - music_y) + __y, 384, 54 + music_y + __y, 1);
    draw_text(360, (24 - music_y) + __y, stringsetloc("ON", "obj_mike_minigame_controller_slash_Draw_0_gml_127_0"));
    if (point_distance(obj_mike_controller.mx, obj_mike_controller.my, 440, 32 + __y) < 30)
    {
        draw_set_colour(c_yellow);
        if (scr_mouse_leftclick())
        {
            if (inv_mic)
                snd_play(snd_item);
            with (obj_hand_collision)
                instance_destroy();
            inv_mic = false;
        }
    }
    else if (!inv_mic)
    {
        draw_set_colour(c_white);
    }
    else
    {
        draw_set_colour(c_gray);
    }
    ossafe_fill_rectangle(412, (28 - music_y) + __y, 464, 54 + music_y + __y, 1);
    draw_text(440, (24 - music_y) + __y, stringsetloc("OFF", "obj_mike_minigame_controller_slash_Draw_0_gml_143_0"));
    draw_set_halign(fa_left);
}
if (action == 2 && wave == 2)
{
    retry_y = lerp(retry_y, 0, 0.5);
    draw_set_colour(c_white);
    draw_set_font(fnt_mainbig);
    draw_set_halign(fa_center);
    if (point_distance(obj_mike_controller.mx, obj_mike_controller.my, 160, 64 + retry_y) < 20)
    {
        draw_set_colour(c_yellow);
        if (scr_mouse_leftclick())
        {
            snd_play(snd_item);
            myscore = 0;
            with (obj_hand_collision)
                instance_destroy();
            with (obj_gravity_ball)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            wave = 0;
        }
    }
    else
    {
        draw_set_colour(c_white);
    }
    ossafe_fill_rectangle(120, 28 + retry_y, 196, 54 + retry_y, 1);
    draw_text(160, 24 + retry_y, stringsetloc("RETRY", "obj_mike_minigame_controller_slash_Draw_0_gml_120_0"));
    if (point_distance(obj_mike_controller.mx, obj_mike_controller.my, 260, 64 + retry_y) < 30)
    {
        draw_set_colour(c_yellow);
        if (scr_mouse_leftclick())
        {
            game_over = true;
            wave = 0;
            with (obj_hand_collision)
                instance_destroy();
            snd_play(snd_item);
        }
    }
    else
    {
        draw_set_colour(c_white);
    }
    ossafe_fill_rectangle(222, 28 + retry_y, 298, 54 + retry_y, 1);
    draw_text(260, 24 + retry_y, stringsetloc("QUIT", "obj_mike_minigame_controller_slash_Draw_0_gml_137_0"));
    draw_set_halign(fa_left);
}
else
{
    retry_y = -64;
}
