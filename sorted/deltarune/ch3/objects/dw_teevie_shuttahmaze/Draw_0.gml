var show = true;
if (show && scr_debug())
{
    var count = 0;
    var space = 10;
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("T")))
    {
        var snd = 358;
        snd_stop(snd);
        snd_play_x(snd, 1, 1.2);
        scr_lerp_imageblend(id, c_black, c_white, 10);
        scr_lerpvar("tralpha", 0, 1, 4);
        scr_lerpvar("trscale", 0, 1, 18, -1, "out");
    }
}
with (treasure)
{
    if (image_index == 1)
    {
        if (!variable_instance_exists(id, "siner"))
            siner = 0;
        siner++;
        draw_sprite_ext(spr_gameshow_crowd_tiny, siner / 4, x + 20, y + 20 + (sin(siner / 2) * 2), 1 * other.trscale, 1 * other.trscale, 0, other.image_blend, other.tralpha);
    }
}
