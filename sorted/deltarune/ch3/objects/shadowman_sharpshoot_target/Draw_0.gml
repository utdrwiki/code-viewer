if (shake > 0)
    shake--;
var shakex = shake - (random(shake) * 2);
var shakey = shake - (random(shake) * 2);
if (type != 3 && type != 4 && type != 5 && type != 7 && type != 8)
    draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index == spr_zapper_sharpshoot || sprite_index == spr_zapper_spare_sharpshoot)
{
    if (fadein && _alpha < 0.5)
        _alpha += 0.1;
    if (!fadein && _alpha > 0)
        _alpha -= 0.1;
    d3d_set_fog(true, c_black, 0, 1);
    draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, _alpha);
    d3d_set_fog(false, c_black, 0, 0);
    if ((i_ex(parentid) && (global.mercymod[parentid.myself] + parentid.sharpshootmercy) < 100) || spare == true)
    {
        if (sprite_index == spr_zapper_sharpshoot)
        {
            changecolortimer += 0.5;
            buttonblend = merge_color(c_red, c_yellow, 0.5 + (sin(changecolortimer) * 0.5));
            draw_sprite_ext(spr_zapper_sharpshoot2, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, buttonblend, 1);
        }
        if (sprite_index == spr_zapper_spare_sharpshoot)
            draw_sprite_ext(spr_zapper_spare_sharpshoot2, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, buttonblend, 1);
    }
}
if (sprite_index == spr_pippins_sharpshoot || sprite_index == spr_pippins_sharpshoot2 || sprite_index == spr_pippins_sharpshoot3)
{
    draw_sprite_ext(spr_pippins_sharpshoot4, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, 1);
    if (fadein && _alpha < 0.5)
        _alpha += 0.1;
    if (!fadein && _alpha > 0)
        _alpha -= 0.1;
    d3d_set_fog(true, c_black, 0, 1);
    draw_sprite_ext(spr_pippins_sharpshoot4, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, _alpha);
    d3d_set_fog(false, c_black, 0, 0);
    if ((i_ex(parentid) && (global.mercymod[parentid.myself] + parentid.sharpshootmercy) < 100) || spare == true)
        draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, 1);
}
if (sprite_index == spr_shutta_sharpshoot || sprite_index == spr_shutta_sharpshoot2)
{
    draw_sprite_ext(spr_shutta_sharpshoot, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, 1);
    if (fadein && _alpha < 0.5)
        _alpha += 0.1;
    if (!fadein && _alpha > 0)
        _alpha -= 0.1;
    d3d_set_fog(true, c_black, 0, 1);
    draw_sprite_ext(spr_shutta_sharpshoot, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, _alpha);
    d3d_set_fog(false, c_black, 0, 0);
    if ((spare == false && i_ex(parentid) && (global.mercymod[parentid.myself] + parentid.sharpshootmercy) < 100) || (spare == true && sparehp > 0))
        draw_sprite_ext(spr_shutta_sharpshoot2, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, 1);
}
