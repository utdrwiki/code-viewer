var xx = camerax();
var yy = cameray() - 40;
if (init == 0)
{
    tenna = instance_create(xx + (camerawidth() / 2), yy - 100, obj_actor_tenna);
    tenna.auto_depth = 0;
    tenna.wobblestate = 1;
    tenna.golden_mode = 1;
    tenna.preset = -1;
    tenna.depth = depth - 1;
    tenna.sprite_index = spr_tenna_point_at_screen;
    susie = scr_dark_marker(xx - 80, yy - 100, spr_susiezilla_susie_idle);
    susie.depth = depth - 1;
    shadowguy = scr_dark_marker(xx + 194, yy - 100, spr_susiezilla_shadowguy);
    shadowguy.depth = depth - 2;
    ralsei = scr_dark_marker(xx + 700, yy + 100, spr_susiezilla_krisandralsei);
    scr_lerpvar("bgalpha", 0, 1, 15);
    con = 1;
    bgcon = 1;
    init = 1;
}
bgtimer++;
draw_sprite_tiled_ext(spr_dw_tv_starbgtile, bgtimer * 0.5, camerax(), yy + bgtimer, 2, 2, c_white, bgalpha);
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        tenna.depth = depth - 1;
        tenna.sprite_index = spr_tenna_point_at_screen;
        tenna.wobblestate = 1;
        tenna.wobbletime = 4;
        tenna.wobbleamt = 8;
        with (tenna)
            scr_lerpvar("y", y, yy + 290, 15, -1, "out");
    }
    if (timer == 16)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    if (advance == 1)
    {
        con++;
        advance = 0;
    }
}
if (con == 3)
{
    timer++;
    if (timer == 1)
    {
        with (tenna)
            scr_lerpvar("x", x, xx + 414, 15, 2, "out");
        with (shadowguy)
            scr_lerpvar("y", y, yy + 304, 15, -1, "out");
    }
    if (timer == 15)
    {
        timer = 0;
        con++;
        readytocontinue = 0;
    }
}
if (con == 4)
{
    timer++;
    if (advance == 1)
        readytocontinue = 1;
    if (timer == 1)
    {
        shadowguy.sprite_index = spr_susiezilla_shadowguy_spin;
        shadowguy.image_speed = 0.5;
        with (shadowguy)
            scr_lerpvar("x", xx + 194, xx + 420, 12, 2, "out");
    }
    if (timer == 7)
    {
        with (tenna)
        {
            scr_shakeobj_ext(id, 16, 0, 2, 1);
            sprite_index = choose(spr_tenna_hurt, spr_tenna_grasp, spr_tenna_desperate);
            if (round(random(30)) == 0)
                sprite_index = spr_tenna_spray;
            bounce = 1;
        }
        with (shadowguy)
        {
            snd_play_x(snd_damage, 0.5, 1);
            var impactfx = instance_create(x, y - 40, obj_animation);
            impactfx.sprite_index = spr_attack_slap2;
            impactfx.image_xscale = 2;
            impactfx.image_yscale = 2;
            impactfx.depth = depth - 20;
            impactfx.image_speed = 0.5;
        }
    }
    if (timer == 9)
    {
        shadowguy.image_speed = 0.5;
        with (shadowguy)
            scr_lerpvar("x", xx + 380, xx + 194, 16, -1, "out");
    }
    if (timer == 17)
    {
        shadowguy.image_speed = 0;
        shadowguy.image_index = 0;
        shadowguy.sprite_index = spr_susiezilla_shadowguy;
    }
    if (timer == 29)
        timer = 0;
    if (timer >= 17)
    {
        if (readytocontinue == 1)
        {
            timer = 0;
            con = 5;
            readytocontinue = 0;
            advance = 0;
        }
    }
}
if (con == 5)
{
    timer++;
    if (timer == 1)
    {
        susie.depth = depth - 1;
        susie.x = xx - 80;
        susie.y = yy + 244;
        susie.sprite_index = spr_susiezilla_susie_spin;
        susie.image_speed = 0.5;
        with (susie)
            scr_lerpvar("x", x, xx + 220, 24, 3, "out");
    }
    if (timer == 8)
    {
        shadowguy.sprite_index = spr_susiezilla_shadowguy_wave;
        shadowguy.image_speed = 0.125;
        shadowguy.image_index = 11;
        shadowguy.gravity = -1;
        shadowguy.hspeed = 12;
        shadowguy.friction = 0.1;
        with (shadowguy)
        {
            snd_play_x(snd_punchmed_bc, 0.7, 0.8);
            var impactfx = instance_create(x, y - 40, obj_animation);
            impactfx.sprite_index = spr_attack_slap2;
            impactfx.image_xscale = 2;
            impactfx.image_yscale = 2;
            impactfx.depth = depth - 20;
            impactfx.image_speed = 0.5;
        }
        with (tenna)
        {
            bounce = 1;
            sprite_index = spr_tenna_pose;
        }
    }
    if (timer == 18)
    {
        susie.sprite_index = spr_susiezilla_susie_afterspin;
        susie.image_speed = 0.125;
    }
    if (timer == 30)
    {
        susie.sprite_index = spr_susiezilla_susie_idle;
        timer = -1;
        con = 6;
    }
}
if (con == 6)
{
    if (advance == 1)
    {
        con = 7;
        advance = 0;
    }
}
if (con == 7)
{
    timer++;
    if (timer > 1 && advance)
        readytocontinue = 1;
    var ballx = (xx + 220) - 20;
    if (timer == 0)
    {
        susie.sprite_index = spr_susiezilla_susie_idle;
        susie.image_speed = 0.125;
        susie.x = xx + 220;
        susie.y = yy + 244;
        tenna.x = xx + 414;
        tenna.y = yy + 308;
        with (susie)
            scr_lerpvar("x", x, xx + 142, 8, -1, "out");
        with (tenna)
            scr_lerpvar("x", x, xx + 466, 8, -1, "out");
    }
    if (timer == 1)
    {
        ball1 = scr_dark_marker(ballx, yy - 80, spr_tennis_ball_bullet);
        ball1.depth = depth - 1;
        ball1.gravity = 1;
    }
    if (timer == 26)
    {
        if (i_ex(ball1))
        {
            ball1.vspeed = -4;
            ball1.hspeed = -4;
            ball1.friction = 0.1;
            scr_doom(ball1, 80);
            susiehiteffect = 1;
        }
        with (tenna)
        {
            sprite_index = spr_tenna_laugh;
            image_speed = 0.5;
        }
    }
    if (timer > 40 && (timer % 3) == 0)
    {
        ball = scr_dark_marker(xx + 320 + irandom_range(-20, 20), (yy - 80) + irandom_range(-10, 10), spr_tennis_ball_bullet);
        ball.depth = depth - 10;
        with (ball)
        {
            scr_lerpvar("x", x, xx + 494, 8);
            scr_lerpvar("y", y, 132, 8);
            scr_delay_var("vspeed", -4 + random_range(2, -2), 8);
            scr_delay_var("hspeed", random_range(-8, -2), 8);
            scr_delay_var("gravity", 1, 9);
            scr_doom(id, 900);
        }
        scr_delay_var("tennahiteffect", 1, 8);
    }
    if (timer > 24 && timer < 48)
    {
        var acceptablestring = stringsetloc("OK", "obj_ch3_GSC05_susiezilla_tutorial_slash_Draw_0_gml_269_0");
        draw_set_font(fnt_mainbig);
        draw_text_transformed_color(xx + 260, yy + 100, acceptablestring, 2, 2, 0, c_green, c_green, c_yellow, c_yellow, 1);
    }
    if (timer >= 48)
    {
        with (susie)
            sprite_index = spr_susiezilla_susie_laugh;
        var acceptablestring = stringsetloc("BAD", "obj_ch3_GSC05_susiezilla_tutorial_slash_Draw_0_gml_276_0");
        draw_set_font(fnt_mainbig);
        draw_text_transformed_color(xx + 260, yy + 100, acceptablestring, 2, 2, 0, c_red, c_red, c_orange, c_orange, 1);
    }
    if (timer > 64)
    {
        if (readytocontinue)
        {
            con = 8;
            con9loop = 0;
            timer = 0;
            advance = 0;
            readytocontinue = 0;
        }
    }
    if (timer >= 70)
        timer = 0;
    with (obj_marker)
    {
        if (sprite_index == spr_tennis_ball_bullet)
        {
            if (y > 340)
                image_alpha *= 0.5;
            if (y > 480)
                instance_destroy();
        }
    }
}
if (con == 8 || con == 9)
{
    var nextpart = 0;
    timer++;
    if (timer == 10)
    {
        with (susie)
            sprite_index = spr_susiezilla_susie_shocked;
        with (tenna)
            sprite_index = spr_tenna_point_up_twofingers;
        with (ralsei)
        {
            image_index = 2;
            image_speed = 0;
            sprite_index = spr_susiezilla_krisandralsei_tug;
            scr_lerpvar("x", xx + 700, xx + 320, 40, -1, "out");
        }
        ralsei.depth = depth - 1;
    }
    if (timer == 42)
    {
        if (readytocontinue)
            nextpart = 1;
    }
    if (timer == 54)
    {
        snd_play_x(snd_wing, 0.8, 1.2);
        with (ralsei)
        {
            scr_lerpvar("x", xx + 320, xx + 280, 16, 2, "out");
            image_index = 0;
        }
        with (susie)
        {
            scr_lerpvar("x", x, xx + 80, 24, -1, "out");
            sprite_index = spr_susiezilla_susie_spin;
            image_speed = 0.25;
        }
    }
    if (timer == 70)
    {
        with (susie)
            sprite_index = spr_susiezilla_susie_dizzy;
        if (readytocontinue)
            nextpart = 1;
    }
    if (timer == 88)
    {
        snd_play_x(snd_wing, 0.8, 1.2);
        with (ralsei)
        {
            scr_lerpvar("x", x, xx + 320, 16, 2, "out");
            image_index = 2;
        }
        with (susie)
        {
            scr_lerpvar("x", x, xx + 220, 24, -1, "out");
            sprite_index = spr_susiezilla_susie_spin;
            image_speed = 0.25;
        }
    }
    if (timer == 104)
    {
        with (susie)
            sprite_index = spr_susiezilla_susie_dizzy;
        timer = 40;
        if (con == 9)
        {
            con9loop++;
            if (con9loop >= 3)
            {
                if (round(random(5)) == 0)
                    con9loop = 3;
                else
                    con9loop = 0;
            }
            tenna.bounce = 1;
            if (con9loop == 0)
                tenna.sprite_index = spr_tenna_point_left;
            if (con9loop == 1)
                tenna.sprite_index = spr_tenna_laugh;
            if (con9loop == 2)
                tenna.sprite_index = spr_tenna_hurt;
            if (con9loop == 3)
                tenna.sprite_index = spr_tenna_tie_adjust_a;
        }
    }
    if (con == 9)
    {
        if (con9loop == 0)
            draw_sprite_ext(spr_susiezilla_house, 0, xx + 170, yy + 280, 2, 2, 0, c_white, 1);
        if (con9loop == 1)
            draw_sprite_ext(spr_susiezilla_shadowguy_idle, timer / 4, xx + 190, yy + 310, 2, 2, 0, c_white, 1);
        if (con9loop == 2)
            draw_sprite_ext(spr_tenna_dance_cabbage_small, timer, xx + 170, yy + 240, 1, 1, 0, c_yellow, 1);
        if (con9loop == 3)
            draw_sprite_ext(spr_pipis_egg, 0, xx + 180, yy + 300, 2, 2, 0, c_white, 1);
        if (con9loop == 3)
        {
            if (round(random(2)) == 0)
                con9loop = choose(0, 1, 2);
        }
        if (timer == 58 || timer == 92)
        {
            var anim = instance_create(xx + 190, yy + 290, obj_animation);
            anim.sprite_index = spr_realisticexplosion;
            snd_play_x(snd_explosion_mmx, 0.5, 1.5);
        }
    }
    if (advance && timer > 4)
        readytocontinue = 1;
    if (nextpart)
    {
        if (con == 8)
        {
            con = 9;
            readytocontinue = 0;
        }
        else if (con == 9)
        {
            con = 10;
            readytocontinue = 0;
            timer = 0;
        }
        advance = 0;
    }
}
if (con == 10)
{
    timer++;
    if (timer == 1)
    {
        with (susie)
        {
            speed = 0;
            gravity = 0;
            sprite_index = spr_susiezilla_susie_prepare;
            scr_lerpvar("x", x, xx + 100, 20, -1, "out");
            scr_lerpvar("y", y, yy + 60, 20, -1, "out");
        }
        with (ralsei)
        {
            sprite_index = spr_susiezilla_krisandralsei_tug;
            image_index = 2;
            depth = 499;
        }
        with (tenna)
        {
            scr_lerpvar("x", x, xx + 320, 20, -1, "out");
            scr_lerpvar("y", y, yy + 360, 20, -1, "out");
            sprite_index = spr_tenna_point_at_screen;
            bounce = 1;
        }
    }
    if (timer == 30)
    {
        with (susie)
        {
            hspeed = -10;
            gravity_direction = 0;
            gravity = 2;
            sprite_index = spr_susiezilla_susie_spin;
            image_speed = 0.5;
        }
    }
    if (timer == 35)
    {
        with (ralsei)
            sprite_index = spr_susiezilla_kris_tug;
        ralseimarker = scr_dark_marker(ralsei.x - 45, ralsei.y - 45, spr_ralsei_shocked_left);
        hitralsei = 0;
    }
    if (timer >= 36)
    {
        if (susie.x > (ralseimarker.x - 20) && hitralsei == 0)
        {
            hitralsei = 1;
            var impactfx = instance_create(ralseimarker.x + 30, ralseimarker.y + 40, obj_animation);
            impactfx.sprite_index = spr_attack_slap2;
            impactfx.image_xscale = 2;
            impactfx.image_yscale = 2;
            impactfx.depth = -300;
            impactfx.image_speed = 0.5;
            with (ralseimarker)
            {
                vspeed = -24;
                gravity = 1;
            }
            snd_play_x(snd_car_doorslam, 0.5, 0.9 + random(0.2));
        }
    }
    if (timer == 60)
    {
        ralseimarker.sprite_index = spr_ralsei_splat;
        ralseimarker.x = ralseimarker.xstart + 20;
    }
    if (timer >= 60)
    {
        if (ralseimarker.y > ralseimarker.ystart)
        {
            ralseimarker.speed = 0;
            ralseimarker.gravity = 0;
            ralseimarker.y = ralseimarker.ystart;
            snd_play(snd_splat);
        }
    }
    if (timer == 270)
    {
        with (ralseimarker)
            scr_shakeobj();
    }
    if (timer == 330)
    {
        with (ralseimarker)
            scr_shakeobj();
    }
    if (timer == 390)
    {
        with (ralseimarker)
        {
            sprite_index = spr_ralsei_pose;
            y = yy;
            scr_shakeobj();
        }
    }
    if (timer >= 37)
        readytocontinue = 1;
    if (advance && readytocontinue)
    {
        advance = 0;
        con = 11;
        timer = 0;
    }
}
if (con == 11)
{
    timer++;
    if (timer == 1)
    {
        with (susie)
        {
            gravity = 0;
            speed = 0;
        }
        with (ralseimarker)
        {
            gravity = 0;
            speed = 0;
        }
        with (susie)
            scr_lerpvar("y", y, yy - 100, 12, 2, "out");
        with (tenna)
            scr_lerpvar("y", y, yy - 100, 12, 2, "out");
        with (ralsei)
            scr_lerpvar("y", y, yy - 100, 12, 2, "out");
        with (ralseimarker)
            scr_lerpvar("y", y, yy - 100, 12, 2, "out");
    }
    if (timer == 15)
        scr_lerpvar("bgalpha", 1, 0, 15);
    if (timer == 30)
    {
        with (ralseimarker)
            instance_destroy();
        instance_destroy();
    }
}
if (susiehiteffect == 1)
{
    susiehiteffect = 0;
    with (susie)
    {
        snd_play_x(snd_bump, 0.5, 0.9 + random(0.2));
        sprite_index = spr_susiezilla_susie_dizzy;
        image_speed = 0.25;
        scr_shakeobj();
        var impactfx = instance_create(x + 54, y, obj_animation);
        impactfx.sprite_index = spr_attack_slap2;
        impactfx.image_xscale = 1;
        impactfx.image_yscale = 1;
        impactfx.depth = depth - 20;
        impactfx.image_speed = 0.5;
    }
}
if (tennahiteffect == 1)
{
    tennahiteffect = 0;
    tenna.bounce = 1;
    with (tenna)
    {
        snd_play_x(snd_damage, 0.5, 0.9 + random(0.2));
        sprite_index = choose(spr_tenna_grasp, spr_tenna_hurt);
        var impactfx = instance_create(x + 20 + random(8), (y - 180) + random(8), obj_animation);
        impactfx.sprite_index = spr_attack_slap2;
        impactfx.image_xscale = 2;
        impactfx.image_yscale = 2;
        impactfx.depth = depth - 20;
        impactfx.image_speed = 0.5;
    }
}
draw_set_color(c_maroon);
if (i_ex(susie))
    draw_line_width(susie.x + 35, susie.y + 25, susie.xprevious + 25, -90, 3);
if (i_ex(shadowguy))
    draw_line_width(shadowguy.x, shadowguy.y - 10, shadowguy.x, -90, 3);
