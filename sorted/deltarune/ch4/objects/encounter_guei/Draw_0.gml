var _x = l_region;
if (view_current == 0)
    siner++;
var count = round((width + margin) / 20);
if (makeindex == -2)
    makeindex = round(count / 2) + irandom_range(-4, 4);
for (var i = 0; i < count; i++)
{
    var xloc = _x + (sin(siner / 30) * 16) + (i * 20) + (margin / 2) + (sin((i + 1) / 4) * 8);
    var yloc = y + (cos((((i + 1) * 30) + siner) / 30) * 10);
    var bonusalph = clamp((240 - abs(obj_mainchara.x - xloc)) / 240, -0.25, 0.25);
    draw_sprite_ext(sprite_index, (siner + (i * 1.4) + 0) / 6, xloc + (sin((i + 1 + siner) / 16) * 16), yloc + (cos(siner / 12) * 8), 2, 2, 0, c_white, (0.05 + bonusalph) * image_alpha);
    draw_sprite_ext(sprite_index, (siner + (i * 1.4) + 1) / 6, xloc + (sin(siner / 2) * 2) + (sin((i + 1 + siner) / 16) * 16), yloc + (cos(siner / 12) * 8), 2, 2, 0, c_white, (0.025 + bonusalph) * image_alpha);
    if (i == makeindex)
    {
        if (chaser == 0)
        {
            snd_play(snd_ghostappear, 0.5, 2);
            chaser = scr_marker_ext(xloc, yloc, sprite_index, 2, 2, 0, (siner + (i * 1.4) + 1) / 6, undefined, 500);
            chaser.image_alpha = 0;
            chaser.alpha = 0;
            with (chaser)
                scr_lerpvar("alpha", 0, 1, 20, 2, "out");
        }
        else
        {
            with (chaser)
            {
                if (other.con < 2)
                {
                    draw_sprite_ext(other.sprite_index, (other.siner + (i * 1.4) + 0) / 6, x, y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, alpha);
                    draw_sprite_ext(other.sprite_index, (other.siner + (i * 1.4) + 1) / 6, x + (sin(other.siner / 2) * 2), y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, alpha * 0.5);
                }
                else
                {
                    var prog = clamp(other.timer / 20, 0, 1);
                    sprite_index = spr_guei_idle_nowisp;
                    draw_sprite_ext(other.sprite_index, (other.siner + (i * 1.4) + 0) / 6, x, y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, alpha - (prog * 2));
                    draw_sprite_ext(other.sprite_index, (other.siner + (i * 1.4) + 1) / 6, x + (sin(other.siner / 2) * 2), y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, (alpha * 0.5) - (prog * 2));
                    draw_sprite_ext(sprite_index, other.siner / 4, x - (60 * (1 - prog)), y - (80 * (1 - prog)), 2, 2, 0, c_white, prog * 4);
                }
                draw_set_color(c_red);
                var _xloc = (x + 16) - 30;
                var _yloc = ((y + 30) - 44) + 12;
                draw_set_color(c_white);
            }
        }
    }
}
with (obj_mainchara)
{
}
