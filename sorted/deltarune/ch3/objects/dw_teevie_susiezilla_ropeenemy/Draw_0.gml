var targpointx = x;
var targpointy = y + 58;
if (view_current == 0)
{
    if (!release)
    {
        if (point_distance(targpointx, targpointy, obj_mainchara.x + 20, obj_mainchara.y + 68) < 120)
        {
            snd_stop(snd_fall);
            snd_play_x(snd_fall, 1, 0.8);
            release = true;
        }
    }
    if (release)
    {
        if (dangle < -12)
        {
            if (global.interact == 0)
                dangle *= 0.85;
            fakey = dangle;
        }
        else if (global.interact == 0)
        {
            siner++;
            fakey = lerp(fakey, abs(sin(siner / 20) * 100) * -1, 0.25);
            x = lerp(x, xstart + (cos(siner / 40) * 120), 0.01);
        }
    }
}
draw_sprite_ext(spr_pxwhite, 0, x, cameray(), 4, cameray() + y + fakey, 0, #5F3417, 1);
draw_set_color(c_white);
gpu_set_blendmode(bm_add);
for (var i = 0; i < 5; i++)
{
    var aura = (i * 9) + ((siner * 0.25 * 3) % 9);
    var aurax = (aura * 0.75) + (sin(aura / 4) * 4);
    var auray = 45 * scr_ease_in(aura / 45, 1);
    var aurayscale = min(80 / sprite_height, 1);
    draw_sprite_ext(sprite_index, image_index, x - (aurax / 180), (fakey + y) - ((auray / 82) * aurayscale), image_xscale + (aurax / 36), image_yscale + ((auray / 36) * aurayscale), image_angle, c_red, image_alpha * (1 - (auray / 45)) * 0.5);
}
gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y + fakey, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_susiezilla_shadow, 0, x, y + 60, 1 + (fakey / 800), 1 + (fakey / 800), 0, c_white, 0.5 + (fakey / 1600));
var ymod = y + 58;
draw_set_color(c_white);
