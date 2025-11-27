var _camx = camx;
var _camy = camy;
var _py = camy + 410;
if (con != 2)
    timer++;
if (con > 0 && con < 4)
{
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_set_font(scr_84_get_font("8bit"));
    kr_pomark.image_index = kr_podium;
    su_pomark.image_index = su_podium;
    ra_pomark.image_index = ra_podium;
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}
if (timer > 0 && timer <= transition_time)
    scr_quizwipe(timer / transition_time, 0, false, board4 ? 2 : 0);
if ((con == 0 || con == 3) && timer >= (transition_time / 2))
{
    _camx = camx;
    _camy = camy;
    con++;
    if (con == 1)
    {
        if (!i_ex(bg))
            debug_print("no bg found");
        else
            bg.visible = true;
        with (susie)
        {
            fun = 1;
            other.susie_xy.x = x;
            other.susie_xy.y = y;
            other.start_sprite[0] = sprite_index;
            other.start_speed[0] = image_speed;
            visible = true;
            if (other.board4)
                setxy(_camx + 80, _py - 28 - (sprite_height - sprite_yoffset));
            else
                setxy((_camx + 100) - (sprite_width / 2), _py - 28 - (sprite_height - sprite_yoffset));
        }
        var susie_x = susie.x;
        var susie_y = susie.y;
        with (gacha_balls[1])
            set_pos(susie_x, susie_y);
        with (kris)
        {
            fun = 1;
            other.kris_xy.x = x;
            other.kris_xy.y = y;
            other.start_sprite[1] = sprite_index;
            other.start_speed[1] = image_speed;
            visible = true;
            setxy(((_camx + 250) - (sprite_width / 2)) + 1, _py - 28 - (sprite_height - sprite_yoffset));
        }
        var kris_x = kris.x;
        var kris_y = kris.y;
        with (gacha_balls[0])
            set_pos(kris_x, kris_y);
        with (ralsei)
        {
            fun = 1;
            other.ralsei_xy.x = x;
            other.ralsei_xy.y = y;
            other.start_sprite[2] = sprite_index;
            other.start_speed[2] = image_speed;
            visible = true;
            if (other.board4)
                setxy(_camx + 380, _py - 28 - (sprite_height - sprite_yoffset));
            else
                setxy(((_camx + 400) - (sprite_width / 2)) + 1, _py - 28 - (sprite_height - sprite_yoffset));
        }
        var ral_x = ralsei.x - 2;
        var ral_y = ralsei.y;
        with (gacha_balls[2])
            set_pos(ral_x, ral_y);
        with (tenna)
        {
            other.tenna_xy.x = x;
            other.tenna_xy.y = y;
            setxy(_camx + 568, _camy + 420);
            drawtype = 0;
            wobblestate = 1;
            wobbletime = 8;
            wobbleamt = 10;
            visible = true;
            sprite_index = other.tenna_podium;
            image_index = 3;
        }
    }
    if (con == 4)
    {
        bg.visible = false;
        var i = array_length_1d(gacha_balls) - 1;
        while (i >= 0)
        {
            safe_delete(gacha_balls[i]);
            i--;
        }
        safe_delete(kris);
        safe_delete(ralsei);
        safe_delete(susie);
        safe_delete(tenna);
        with (obj_confetti_overworld)
            instance_destroy();
    }
}
if (timer >= transition_time)
{
    timer = 0;
    if (con == 4)
        instance_destroy();
    else
        con++;
}
