if (active == 1)
{
    if (drawkris == 1)
        draw_self();
    if (ballcon == 1)
    {
        xballtimer += (xballtimer + 1);
        yballtimer++;
        balltimer++;
        cenx = x + 18;
        ceny = y + 57;
        draw_set_color(c_white);
        d_ellipse(cenx - xballtimer, ceny - 1, cenx + xballtimer, ceny + 1, false);
        if (xballtimer >= 80)
        {
            balltimer = 0;
            yballtimer = 1;
            ballcon = 2;
            whitecolor = 16777215;
        }
    }
    if (ballcon == 2)
    {
        balltimer++;
        if (balltimer > 80)
            inverttimer++;
        if (inverttimer >= 90)
            releasetimer++;
        if (inverttimer >= 0 && inverttimer < 60)
            whitecolor = merge_color(c_white, c_black, inverttimer / 60);
        xballtimer *= 0.5;
        if (releasetimer <= 0)
        {
            if (xballtimer <= 20)
                xballtimer = 20;
            if (xballtimer < (yballtimer / 6))
                xballtimer = yballtimer / 6;
            if (yballtimer >= 98)
                yballtimer = 99 + random(5);
            yballtimer *= 3;
        }
        else
        {
            yballtimer *= 3;
            var _ball = instance_create(cenx, ceny, obj_DCA15_fountain_ball);
            _ball.depth = depth + 10;
            draw_sprite_ext(spr_kris_fountain_ball, 0, cenx + 1, ceny - 1, 0.15, 0.15, 0, c_black, 1);
            if (releasetimer == 1)
                con = 64;
            if (releasetimer >= 10)
            {
                ballcon = 3;
                fountain_sound = audio_play_sound(snd_deep_noise, 50, 1);
            }
        }
        draw_set_color(c_white);
        d_ellipse(cenx - xballtimer - 2, ceny - yballtimer, cenx + xballtimer + 2, ceny + 1, false);
        draw_set_color(whitecolor);
        d_ellipse(cenx - xballtimer, ceny - yballtimer, cenx + xballtimer, ceny + 1, false);
        if (releasetimer <= 0)
        {
            if (balltimer >= 6)
                draw_sprite_ext(susie_sprite.sprite_index, susie_sprite.image_index, susie_sprite.x, susie_sprite.y, image_xscale, image_yscale, image_angle, image_blend, 0.3 - (1 / ((balltimer / 2) + 1)));
            if (inverttimer >= 1)
                draw_sprite_ext(spr_susie_fountain_make_loop_invert, susie_sprite.image_index, susie_sprite.x, susie_sprite.y, image_xscale, image_yscale, image_angle, image_blend, 1 - (30 / inverttimer));
        }
        if (releasetimer <= 0)
        {
            if ((balltimer % 5) == 0)
            {
                afterimage = instance_create(cenx - 4, ceny + 4, obj_afterimage);
                afterimage.sprite_index = spr_kris_make_fountain_flash;
                afterimage.image_speed = 0;
                afterimage.image_xscale = 4;
                afterimage.image_yxscale = 0.5;
                afterimage.image_alpha = 0.8;
            }
        }
        with (obj_afterimage)
        {
            image_xscale *= (1.15 + random(0.02));
            image_yscale *= (1.05 + random(0.02));
            y += 0.4;
            x -= 0.4;
        }
    }
    if (ballcon == 3)
    {
        var _ball = instance_create(cenx, ceny, obj_DCA15_fountain_ball);
        _ball.vspeed = -0.5 + (random(-1) * speed_modifier);
        _ball.depth = depth + 100;
        draw_sprite_ext(spr_kris_fountain_ball, 0, cenx + 1, ceny - 1, 0.15, 0.15, 0, c_black, 1);
        ceiltimer += (1 * speed_modifier);
        if (ceilheight < 120)
            ceilheight += (sin(ceiltimer / 18) + (0.3 * speed_modifier));
        if (ceilheight >= 120)
            ceilheight += (0.5 * speed_modifier);
        for (i = 0; i < 12; i++)
        {
            ceilballx[i] = ((ceiltimer + (i * 40)) % 400) + -40 + camerax();
            draw_sprite_ext(spr_kris_fountain_ball, 0, ceilballx[i], (ceilheight - 80) + (sin(i + (ceiltimer / 8)) * 7), 1.05, 1.05, 0, c_white, 1);
        }
        for (i = 0; i < 12; i++)
            draw_sprite_ext(spr_kris_fountain_ball, 0, ceilballx[i], (ceilheight - 80) + (sin(i + (ceiltimer / 8)) * 7), 1, 1, 0, c_black, 1);
        draw_set_color(c_black);
        ossafe_fill_rectangle(-10, ceilheight - 80, 999, -90, false);
        if (ceiltimer >= 600)
        {
            volume_modifier = scr_movetowards(volume_modifier, 0, 0.01);
            audio_sound_gain(fountain_sound, 1 * volume_modifier, 0);
        }
    }
}
