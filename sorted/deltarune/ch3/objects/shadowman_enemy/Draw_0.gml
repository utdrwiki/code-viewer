firstframe++;
if (firstframe == 1 && room != room_dw_teevie_large_01)
    exit;
if (image_alpha == 0 && i_ex(obj_tenna_board4_enemy))
    exit;
draw_set_color(c_white);
scr_enemy_drawhurt_generic();
if (state == 4)
{
    thissprite = idlesprite;
    draw_monster_body_part(thissprite, siner, x, y);
}
if (state == 0)
{
    if (idlesprite == spr_shadowman_firing)
    {
        var xx = 0;
        var yy = 0;
        var index = 0;
        guntimer++;
        if (guntimer == 29)
        {
            xx = 10;
            index = 1;
        }
        draw_sprite_ext(spr_shadowman_gun, index, x + 10 + xx, y + 70 + yy, 2, 2, 0, c_white, 1);
    }
    fsiner += 1;
    siner += 0.16666666666666666;
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself] && idlesprite != spr_shadowman_firing && !i_ex(obj_shadowman_sharpshoot_cursor))
        thissprite = sparedsprite;
    draw_monster_body_part(thissprite, siner, x, y);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (darken == 1 && darkenalpha < 0.45)
    darkenalpha += 0.05;
else if (darken == 0 && darkenalpha > 0)
    darkenalpha -= 0.05;
if (darkenalpha > 0 && state == 0 && image_alpha == 1)
{
    d3d_set_fog(true, c_black, 0, 1);
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself] && !i_ex(obj_shadowman_sharpshoot_cursor))
        thissprite = sparedsprite;
    draw_sprite_ext(thissprite, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, darkenalpha);
    d3d_set_fog(false, c_black, 0, 0);
}
if (i_ex(obj_shadowman_sharpshoot_cursor) && obj_shadowman_sharpshoot_cursor.disableactui == true)
    exit;
if (acting == 30)
{
    var b = 180 - (sharpshootlength * 0.911);
    ossafe_fill_rectangle_color(camerax() + 240, cameray() + 290, camerax() + 240 + b, cameray() + 300, c_aqua, c_aqua, c_aqua, c_aqua, 0);
    draw_sprite_ext(spr_poppup_hourglass, 1, camerax() + 240, cameray() + 295, 2, 2, 0, c_white, 1);
}
