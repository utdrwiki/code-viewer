if (init == 0)
{
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        scr_lerpvar("tone_saturation", 1, 0.1, 30, 2, "out");
        scr_lerpvar("tone_factor", 0, 0.5, 30, 2, "out");
    }
    if (timer == 2)
        scr_lerpvar("staticalpha", 0, 0.015, 15);
    if (timer == 3)
        scr_lerpvar("grayalpha", 0, 0.35, 15);
    if ((timer == 30 && !i_ex(obj_rhythmgame)) || (timer == 90 && i_ex(obj_rhythmgame)))
    {
        var gameover_state = 0;
        if (room == room_dw_rhythm)
            gameover_state = 1;
        if (scr_debug())
        {
        }
        if (replayversion && replaywin == true)
        {
            con = 1;
            timer = 0;
            instance_create(0, 0, obj_round_evaluation);
        }
        if ((replayversion && quitversion) || (replayversion && replaywin == false))
        {
            con = 1;
            timer = 0;
            quitcon = 1;
            mus_volume(global.currentsong[1], 0, 30);
            scr_fadeout(30);
            with (obj_fadeout)
                depth = -9999;
        }
    }
}
if (sprite_exists(global.screenshot))
{
    var lightColor = 13088418;
    var darkColor = 6242121;
    var is_rhythm_replaywin = room == room_dw_rhythm && replaywin;
    if (!quitversion && !replaywin)
        tone_on(tone_saturation, tone_brightness, tone_factor, darkColor, lightColor);
    if (!is_rhythm_replaywin)
        draw_sprite_ext(global.screenshot, 0, camerax(), cameray(), 1, 1, 0, c_white, 1);
    if (!quitversion && !replaywin)
        tone_off();
    if (!quitversion && !replaywin)
    {
        draw_set_alpha(grayalpha);
        draw_set_color(c_gray);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
        staticindex += 0.25;
        draw_sprite_tiled_ext(spr_static_effect, staticindex - 0.5, 0, 0, 2, 2, c_white, staticalpha);
        draw_sprite_tiled_ext(spr_static_effect, staticindex, 0, 0, 2, 2, c_white, staticalpha);
        draw_set_alpha(blackalpha);
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
}
