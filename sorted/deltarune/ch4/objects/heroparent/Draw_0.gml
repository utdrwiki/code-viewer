if (global.chapter == 4 && showdarkness && (global.encounterno == 176 || global.encounterno == 186))
    d3d_set_fog(true, c_black, 0, 1);
if (hurt == 1 && state != 8 && global.hp[global.char[myself]] > 0)
{
    if (global.faceaction[myself] != 4)
    {
        specdraw = 1;
        draw_sprite_ext(hurtsprite, hurtindex, (x - 20) + (hurtindex * 10), y, 2, 2, 0, image_blend, image_alpha);
    }
    else
    {
        specdraw = 1;
        thissprite = defendsprite;
        index = defendtimer;
        draw_sprite_ext(defendsprite, defendtimer, (x - 20) + (hurtindex * 10), y, 2, 2, 0, image_blend, image_alpha);
    }
}
if (specdraw == 0 && state != 8)
{
    sprite_index = thissprite;
    image_index = index;
    if (image_xscale == -2)
        draw_sprite_ext(thissprite, index, x, y, -2, 2, 0, image_blend, image_alpha);
    else
        draw_sprite_ext(thissprite, index, x, y, 2, 2, 0, image_blend, image_alpha);
    if (flash == 1)
    {
        fsiner += 1;
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(thissprite, index, x, y, 2, 2, 0, image_blend, (-cos(fsiner / 5) * 0.4) + 0.6);
        d3d_set_fog(false, c_black, 0, 0);
    }
}
if (state == 8)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
specdraw = 0;
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (global.targeted[myself] == 1 && global.mnfight == 1 && global.chapter == 1)
    draw_sprite_ext(spr_chartarget, siner / 10, x, y, 2, 2, 0, c_white, 1);
if (global.chapter == 4 && showdarkness && (global.encounterno == 176 || global.encounterno == 186))
    d3d_set_fog(false, c_black, 0, 0);
