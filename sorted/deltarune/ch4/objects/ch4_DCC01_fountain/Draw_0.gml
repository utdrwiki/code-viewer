timer++;
if (con == 0)
{
    if (timer == 1)
        snd_play(snd_titan_wingshut, 1, 0.65);
    if (timer == 64)
    {
        fountainmakesound = snd_play(snd_fountain_make, 1, 0.2);
        snd_pitch_time(fountainmakesound, 0.8, 12);
    }
}
if (con < 2)
{
    with (fountain_marker)
        scr_afterimage().image_alpha = 0.3;
    for (var i = 0; i < array_length(fountain_loop); i++)
    {
        if (fountain_loop[i].sprite_index != spr_tower_fizzleout)
        {
            with (fountain_loop[i])
            {
                with (scr_afterimage())
                {
                    image_alpha = 0.3;
                    depth = other.depth + 2;
                }
            }
        }
    }
}
if ((con == 1 && timer >= 60) || (con > 1 && con <= 10))
{
    var indent = 0.98;
    shader_set(shd_fountaineffect);
    shader_set_uniform_f(u_iPosOffset, 0, cameray() / 480);
    shader_set_uniform_f(u_iResolution, 280 * indent, 480);
    shader_set_uniform_f(u_uvs, s_uvs[0], s_uvs[1], s_uvs[2] - s_uvs[0], s_uvs[3] - s_uvs[1]);
    var col = scr_make_color_hsv(current_time / 400, 50, (sin(current_time / 1600) * 10) + 70);
    var t = 1;
    if (con == 2)
    {
        t = 0.2;
        fountainanimtimer = fountainanimtimer + 2 + (t * 80);
    }
    else if (con == 1)
    {
        t = 1 - clamp((timer - 120) / 84, 0, 0.8);
        fountainanimtimer = fountainanimtimer + 2 + (t * 80);
    }
    else
    {
        fountainanimtimer += 2;
    }
    shader_set_uniform_f(u_iTime, fountainanimtimer / 50);
    col = merge_color(col, merge_color(c_teal, c_white, 0.5), t);
    draw_sprite_ext(bg_fountain1, 0, (0.5 * camerawidth()) - (140 * indent), camera_get_view_y(view_camera[0]), (280 * indent) / sprite_get_width(bg_fountain1), 480 / sprite_get_height(bg_fountain1), 0, col, 1);
    shader_reset();
}
if (con == 1)
{
    var delay = 180;
    var enddelay = 132;
    if (timer == delay)
    {
        for (var i = 0; i < 4; i++)
        {
            fountain_loop[i].sprite_index = spr_tower_fizzleout;
            fountain_loop[i].image_index = 0;
            fountain_loop[i].image_speed = 0.4;
        }
        snd_pitch_time(fountainmakesound, 0.15, 52);
    }
    if (timer == (delay + 28))
    {
        for (var i = 0; i < 4; i++)
            fountain_loop[i].visible = 0;
    }
    if (timer > (delay + enddelay))
    {
        con = 2;
        timer = 0;
        snd_volume(fountainmakesound, 0, 5);
        snd_play(snd_petrify, 0.8, 0.5);
    }
}
if (con == 2)
{
    if (timer == 5)
        snd_play(snd_petrify, 0.8, 0.45);
    var spd = 6;
    if ((timer % spd) == 0 && timer < (9 * spd))
    {
        var xx = camerax() + (0.5 * camerawidth()) + 6;
        var yy = (cameray() + cameraheight()) - (80 * (timer / spd));
        petrify_sequence[floor(timer / spd)] = scr_dark_marker(xx, yy, spr_tower_petrification);
        with (petrify_sequence[floor(timer / spd)])
        {
            image_index = 0;
            image_speed = 0.5;
            depth = other.depth - 2000;
            scr_delay_var("image_speed", 0, 19);
        }
        var afterimgidx = floor(timer / spd) - 2;
        if (afterimgidx >= 0 && afterimgidx < array_length(petrify_sequence) && (timer % spd) == 0)
        {
            with (petrify_sequence[afterimgidx])
            {
                var ai = scr_afterimage();
                ai.depth = other.depth - 2000;
                scr_lerpvar_instance(ai, "image_xscale", ai.image_xscale, ai.image_xscale + 0.1, 30);
                ai.image_blend = c_white;
                ai.image_index = image_index;
                ai.image_speed = 0;
            }
        }
    }
    if (timer == (10 * spd))
    {
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    var eyeappeardelay = 60;
    if (timer == (eyeappeardelay + 20))
    {
        var xx = (camerax() + (0.5 * camerawidth())) - 50;
        var yy = (cameray() + (0.5 * cameraheight())) - 120;
        with (instance_create_depth(xx, yy, depth - 2500, obj_marker))
        {
            sprite_index = spr_tower_petrifycrack1;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        with (instance_create_depth(xx, yy, depth - 2500, obj_marker))
        {
            sprite_index = spr_tower_petrifycrack1_debris;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        snd_play(snd_petrify_gravel, 0.2, 1);
    }
    if (timer == (eyeappeardelay + 35))
    {
        var xx = camerax() + (0.5 * camerawidth()) + 60;
        var yy = cameray() + (0.5 * cameraheight()) + 220;
        with (instance_create_depth(xx, yy, depth - 2500, obj_marker))
        {
            sprite_index = spr_tower_petrifycrack2;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        with (instance_create_depth(xx, yy, depth - 2500, obj_marker))
        {
            sprite_index = spr_tower_petrifycrack2_debris;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        snd_play(snd_petrify_gravel, 0.25, 0.9);
    }
    if (timer == (eyeappeardelay + 50))
    {
        var xx = (camerax() + (0.5 * camerawidth())) - 80;
        var yy = cameray() + (0.5 * cameraheight()) + 50;
        with (instance_create_depth(xx, yy, depth - 2500, obj_marker))
        {
            depth = other.depth - 2500;
            sprite_index = spr_tower_petrifycrack3;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        with (instance_create_depth(xx, yy, depth - 2500, obj_marker))
        {
            depth = other.depth - 2500;
            sprite_index = spr_tower_petrifycrack3_debris;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        snd_play(snd_petrify_gravel, 0.18, 1.03);
    }
    if (timer == (eyeappeardelay + 140))
    {
        var xx = camerax() + (0.5 * camerawidth());
        var yy = cameray() + (0.5 * cameraheight()) + 26;
        with (instance_create_depth(xx, yy, depth - 2100, obj_marker))
        {
            sprite_index = spr_tower_handburst;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
        with (instance_create_depth(xx, yy, depth - 2400, obj_marker))
        {
            sprite_index = spr_tower_handburst_debris;
            image_speed = 0.25;
            scr_darksize();
            scr_delay_var("hspeed", 14, 32);
            scr_delay_var("image_speed", 0, ((sprite_get_number(sprite_index) - 1) * 1) / image_speed);
        }
    }
    if (timer == (eyeappeardelay + 170))
    {
        var randoffset = choose(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
        var xx = camerax() + (0.5 * camerawidth());
        var yy = cameray() + (0.5 * cameraheight()) + 26;
        for (var i = 0; i < 12; i++)
        {
            with (instance_create_depth(xx + random_range(0, 20), yy + random_range(-240, 40), depth - 2900, obj_marker))
            {
                sprite_index = spr_tower_handburst_debris_isolated;
                image_speed = 0;
                image_index = (randoffset + i) % 12;
                scr_darksize();
                hspeed = random_range(-5, 5) + 12 + (i * 3);
                vspeed = -12 - random_range(4 * (i % 4), 8 * (i % 4));
                gravity = 3;
                scr_doom(self, 100);
            }
        }
    }
    if (timer == (eyeappeardelay + 138))
        snd_play(snd_petrify_gravel_thunder, 1, 1);
    if (timer == (eyeappeardelay + 166))
    {
        var xx = 0.5 * camerawidth();
        var yy = cameray() + (0.5 * cameraheight()) + 26;
        with (instance_create_depth(xx, yy, depth - 2300, obj_marker))
        {
            sprite_index = spr_tower_handburst_foreground;
            scr_darksize();
        }
    }
    if (timer == (eyeappeardelay + 164))
        snd_play(snd_petrify_wallblast, 1, 1);
    var handstart = eyeappeardelay + 168;
    var handdelay = eyeappeardelay + 80;
    if (timer == (handstart + 2))
        scr_pan_lerp(640, cameray(), 4, 0);
    if (timer >= handstart)
    {
        if (timer == handstart)
        {
            var xx = (0.5 * camerawidth()) - 280;
            var yy = cameray() + (0.5 * cameraheight()) + 26;
            hand = instance_create_depth(xx, yy, depth - 2150, obj_marker);
            with (hand)
            {
                sprite_index = spr_tower_titanhand;
                hspeed = 150;
                scr_lerpvar("hspeed", hspeed, 0, 12, 1, "out");
                scr_darksize();
            }
        }
        obj_mainchara.cutscene = 1;
    }
    if (hand != -4)
    {
        var idx = hand.image_index;
        if (idx == 220)
            snd_play(snd_petrify_titanblast, 1, 1);
        if (idx == 257)
        {
            beam = instance_create(hand.x, hand.y, obj_marker);
            with (beam)
            {
                sprite_index = spr_tower_titanbeam_start;
                scr_delay_var("sprite_index", 1836, 20);
                scr_darksize();
                depth = other.depth - 2500;
                scr_lerpvar("x", other.hand.x + 288, other.hand.x + 432, 10);
                scr_lerpvar("y", other.hand.y + 112, other.hand.y + -80, 10);
                image_angle = -35;
            }
        }
        if (idx == 296)
        {
            hand.image_index = 294;
            loops++;
            if (loops == 10)
                con = 10;
        }
    }
}
if (con >= 10)
{
    if (hand.image_index == 296)
        hand.image_index = 294;
}
if (con == 10)
{
    con = 11;
    instance_destroy(base_marker);
    instance_destroy(fountain_marker);
    var xx = 324;
    var yy = 1260;
    for (var i = 0; i < 6; i++)
    {
        with (instance_create(xx, yy + (80 * i) + 20, obj_marker))
        {
            scr_darksize();
            sprite_index = spr_tower_petrifiedbase;
            image_speed = 0;
            depth = other.depth;
        }
    }
    with (instance_create(xx, yy + 400 + 12, obj_marker))
    {
        scr_darksize();
        sprite_index = spr_tower_base_gradient;
        image_speed = 0;
        depth = other.depth - 1;
        image_xscale = 2;
        image_yscale = 2;
    }
    callback();
}
