draw_self();
var maxcats = min(cats, 20);
for (var i = 0; i < maxcats; i++)
{
    scale[i] = scr_approach(scale[i], 2, 0.25);
    xx[i] += (lengthdir_x(10 * scale[i], (i / maxcats) * 360) - xx[i]) * 0.2;
    yy[i] += (lengthdir_y(5 * scale[i], (i / maxcats) * 360) - yy[i]) * 0.2;
    draw_sprite_ext(spr_mike_cat_face, 0, x + xx[i], y + yy[i], scale[i], scale[i], sin(i + (current_time / 200)) * 10, c_aqua, 1);
}
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (i_ex(obj_mike_minigame_controller))
{
    var drawnum = cats;
    var shift = 0;
    with (obj_mike_minigame_controller)
    {
        drawnum = myscore;
        shift = 36;
    }
    var xxx = (x - 64) + shift;
    var i = drawnum;
    var k = 0;
    var digityoffset = 136;
    var col;
    while (i >= 0)
    {
        scoreflash -= 0.1;
        col = merge_color(c_white, c_yellow, clamp01(scoreflash));
        draw_sprite_ext(spr_timer_digits, 0, xxx - (20 * k), y - digityoffset, 2, 2, 0, c_dkgray, 1);
        draw_sprite_ext(spr_timer_digits, i % 10, xxx - (20 * k), y - digityoffset, 2, 2, 0, col, 1);
        i = floor(i / 10);
        if (i == 0)
            break;
        k++;
    }
    draw_sprite_ext(spr_plueypoints, 0, xxx + 56, (y - digityoffset) + 50, 2, 2, 0, col, 1);
}
