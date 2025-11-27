if (act == 1)
{
    xoff = -sprite_width / 2;
    yoff = -sprite_height / 2;
}
else
{
    xoff = 0;
    yoff = 0;
}
if (act < 3)
{
    draw_sprite_ext(sprite_index, image_index, x + xoff, y + yoff, image_xscale, image_yscale, 0, c_white, 1);
}
else
{
    var _yoff = 8;
    if (sprite_index == spr_mike_m)
        _yoff = 0;
    if (sprite_index == spr_mike_l)
        _yoff = -12;
    draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width, sprite_height - (cutoff * 0.75), x, y + yy + (cutoff * 0.75), 2, 2, c_white, 1);
    cutoff = lerp(cutoff, sprite_height, 0.5);
    yy = lerp(yy, _yoff, 0.5);
}
if (blush && act != 1)
{
    blush_alpha = lerp(blush_alpha, 1, 0.05);
    if (sprite_index == spr_mike_s)
    {
        var bx = 8;
        var by = 12;
        draw_sprite_ext(spr_blush, 0, x + 50 + (bx * image_xscale), y + (by * image_yscale), 1, 1, 0, c_white, blush_alpha);
        draw_sprite_ext(spr_blush, 0, (x + 50) - (bx * image_xscale), y + (by * image_yscale), 1, 1, 0, c_white, blush_alpha);
    }
    else if (sprite_index == spr_mike_m)
    {
        var bx = 7;
        var by = 20;
        var bxx = 50 - (round((sin((image_index + 2) / 2) * 8) / 4) * 4);
        bx2 += ((bxx - bx2) * 0.75);
        draw_sprite_ext(spr_blush, 0, x + bx2 + (bx * image_xscale), y + (by * image_yscale), 1, 1, 0, c_white, blush_alpha);
        draw_sprite_ext(spr_blush, 0, (x + bx2) - (bx * image_xscale), y + (by * image_yscale), 1, 1, 0, c_white, blush_alpha);
    }
    else if (sprite_index == spr_mike_l)
    {
        var bx = 6;
        var by = 20;
        draw_sprite_ext(spr_blush, 0, x + 26 + (bx * image_xscale), y + (by * image_yscale), 1, 1, 0, c_white, blush_alpha);
        draw_sprite_ext(spr_blush, 0, (x + 26) - (bx * image_xscale), y + (by * image_yscale), 1, 1, 0, c_white, blush_alpha);
    }
}
else
{
    blush_alpha = scr_approach(blush_alpha, 0, 0.1);
}
