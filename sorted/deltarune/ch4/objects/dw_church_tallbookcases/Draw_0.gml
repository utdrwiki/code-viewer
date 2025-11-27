if (global.interact == 0)
    siner++;
animindex++;
if (gueicheck)
{
    var version = 0;
    if (global.flag[encounterflag] != 0)
        version = 1;
    var gueicount = 5;
    if (version == 1)
    {
        gueicount = 3;
        gueitoskip = 99;
    }
    var xspace = 320;
    var i;
    for (i = 0; i < gueicount; i++)
    {
        if (i != gueitoskip && !dontdraw)
        {
            var side = 1;
            if ((i % 2) == 0)
                side = -1;
            var yloc = 382;
            var range = 140;
            var bonusspace = 0;
            if (version == 1)
            {
                yloc -= 48;
                range = 60;
                if (i == 2)
                    bonusspace = 320;
                movespeed = 15;
            }
            var xloc = 320 + (sin(siner / movespeed) * range * side) + (xspace * i) + bonusspace;
            var bonusalph = clamp((240 - abs(obj_mainchara.x - xloc)) / 240, 0.125, 0.35);
            if (i != dontdraw)
            {
                draw_sprite_ext(spr_guei_chase, (animindex + (i * 1.4) + 0) / 6, xloc, yloc + (cos(animindex / 12) * 8), 2, 2, 0, c_white, (0.05 + bonusalph) * image_alpha);
                draw_sprite_ext(spr_guei_chase, (animindex + (i * 1.4) + 1) / 6, xloc + (sin(animindex / 2) * 2), yloc + (cos(animindex / 12) * 8), 2, 2, 0, c_white, (0.025 + bonusalph) * image_alpha);
            }
            draw_set_color(c_red);
            draw_set_color(c_white);
        }
    }
    with (chaser)
    {
        if (other.con < 2)
        {
            draw_sprite_ext(spr_guei_chase, (other.siner + (i * 1.4) + 0) / 6, x, y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, alpha);
            draw_sprite_ext(spr_guei_chase, (other.siner + (i * 1.4) + 1) / 6, x + (sin(other.siner / 2) * 2), y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, alpha * 0.5);
        }
        else
        {
            var prog = clamp(other.timer / 20, 0, 1);
            sprite_index = spr_guei_idle_nowisp;
            draw_sprite_ext(spr_guei_chase, (other.siner + (i * 1.4) + 0) / 6, x, y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, alpha - (prog * 2));
            draw_sprite_ext(spr_guei_chase, (other.siner + (i * 1.4) + 1) / 6, x + (sin(other.siner / 2) * 2), y + (cos(other.siner / 12) * 8), 2, 2, 0, image_blend, (alpha * 0.5) - (prog * 2));
            draw_sprite_ext(sprite_index, other.siner / 4, x - (60 * (1 - prog)), y - (80 * (1 - prog)), 2, 2, 0, c_white, prog * 4);
        }
    }
}
