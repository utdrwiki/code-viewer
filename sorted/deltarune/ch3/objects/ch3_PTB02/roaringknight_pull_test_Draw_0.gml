var handx = 42;
var handy = 40;
var drawlaser = 1;
var lasertimer = 0;
if (con == 0)
{
    handframe = 0;
    triheight = 0;
    con = 1;
}
if (con == 1)
{
    con = 2;
    scr_var_delay("con", 3, 12);
    scr_lerpvar("handframe", 0, 3, 16, 2, "in");
}
if (con == 3)
{
    snd_play_x(snd_spearappear, 1, 0.8);
    snd_play_x(snd_spearappear, 1, 0.5);
    snd_play_x(snd_spearappear, 1, 0.6);
    scr_lerpvar("triheight", 0, 100, 80, -2, "out");
    con = 4;
}
if (con >= 4 && con < 7)
{
    handx += random(2);
    x = xstart + random(1);
    snd_play_x(snd_spearappear, 0.2, 0.5 + random(0.3));
    triheight += (sin(timer / 2) * 2);
}
if (con == 7)
{
    scr_lerpvar("triheight", triheight, 0, 20, 3, "in");
    scr_lerpvar("handframe", 3, 0, 16, 0, "in");
    if (susie_active)
    {
        susie_display = true;
        if (i_ex(obj_ch3_PTB02))
        {
            susie_grab_x = obj_ch3_PTB02.su_actor.x;
            susie_grab_y = obj_ch3_PTB02.su_actor.y;
        }
    }
    con = 9;
}
timer++;
draw_sprite_ext(base_sprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
hand_x_pos = x + handx;
hand_y_pos = y + handy;
draw_sprite_ext(spr_roaringknight_arm_reach_grow, handframe, hand_x_pos, hand_y_pos, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (susie_display)
{
    if (!susie_grab_sfx)
    {
        susie_grab_sfx = true;
        base_sprite = spr_roaringknight_look_down_full;
        snd_play(snd_noise);
        scr_shakeobj();
    }
    draw_sprite_ext(spr_susie_dw_fell_grab, 0, susie_grab_x, susie_grab_y, 2, 2, 0, c_white, 1);
}
if (drawlaser && triheight > 0)
{
    var triy = y + handy + 12;
    var trix = x + handx + 16;
    draw_set_blend_mode(bm_add);
    draw_set_alpha(0.6 + (sin(timer / 3) * 0.1));
    draw_set_color(c_purple);
    draw_triangle(trix, triy, camerax() - 100, triy + triheight, camerax() - 80, triy - triheight, false);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
    if (con >= 4 && con < 7)
    {
        var particle = instance_create(camerax() - 80, triy + random_range(-triheight * 0.8, triheight * 0.8), obj_marker);
        with (particle)
        {
            sprite_index = spr_ball_small_nooutline;
            image_xscale = 0.2;
            image_yscale = 2;
            image_alpha = 0.5;
            scr_doom(id, 30);
            scr_lerpvar("x", x, trix, 30, 2, "in");
            scr_lerpvar("y", y, triy, 30, 2, "in");
            scr_lerpvar("image_xscale", image_xscale, 2, 30, "in");
            scr_lerpvar("image_yscale", image_yscale, 0.2, 30, "in");
            scr_lerpvar("image_alpha", 0.8, 0, 30, "in");
        }
    }
}
