remprog[3] = remprog[2];
remprog[2] = remprog[1];
remprog[1] = remprog[0];
remprog[0] = prog;
gpu_set_alphatestenable(true);
draw_enable_alphablend(false);
prog = clamp01(timer / lifetime);
if (reverse)
    prog = 1 - prog;
var _dissolveprog = scr_ease_out(prog, ease_power);
gpu_set_alphatestref(prog * 255);
if (reverse)
    image_index = 1;
else
    image_index = 0;
if (move_x != 0 || move_y != 0)
{
    var _move_x = move_x * prog;
    var _move_y = move_y * prog;
    gpu_set_alphatestref((reverse ? prog : remprog[2]) * 255);
    gpu_set_fog(true, c_gray, 0, 1);
    draw_self_offset(0, 0);
    gpu_set_alphatestref(remprog[0] * 255);
    gpu_set_fog(true, c_black, 0, 1);
    draw_self_offset(0, 0);
    draw_set_blend_mode(bm_add);
    gpu_set_alphatestref((reverse ? remprog[2] : prog) * 255);
    gpu_set_fog(true, c_white, 0, 1);
    draw_self_offset(0, 0);
}
else
{
    draw_self();
}
draw_set_blend_mode(bm_normal);
gpu_set_fog(false, c_black, 0, 1);
draw_enable_alphablend(true);
gpu_set_alphatestenable(false);
gpu_set_alphatestref(128);
if (timer < 15)
{
    gpu_set_blendmode(bm_add);
    var _blend = merge_color(#888888, c_black, timer / 15);
    var _ease = scr_ease_out(timer / 15, 3);
    draw_sprite_ext(spr_titan_star_centered, 2, x + 348, y + 288, image_xscale + _ease, image_yscale + _ease, image_angle, _blend, image_alpha);
    gpu_set_blendmode(bm_normal);
}
if (con == 0)
{
    if (scr_debug() && sunkus_kb_check_pressed(101))
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    if (timer == 0)
        snd_play(snd_laz_titan);
    timer++;
    if (timer >= lifetime)
        con = 2;
    if (scr_debug())
    {
    }
}
if (con == 2)
{
    if (scr_debug() && sunkus_kb_check_pressed(101))
    {
        timer = 0;
        con = 0;
        pcount = 0;
        py_start = 180;
    }
}
