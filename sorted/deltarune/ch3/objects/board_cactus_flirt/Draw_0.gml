image_blend = c_white;
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
spinetimer++;
if ((spinetimer % 6) == 0)
    spineindex++;
sinval = abs(sin(spineindex / 3)) / 2;
image_blend = merge_color(#CBC83D, c_white, 0.5 + sinval);
draw_sprite_ext(spr_board_cactus_spines, 0, x, y, 2, 2, 0, image_blend, 1);
image_blend = c_white;
if (active)
{
    var blushamount = 0;
    var krx = kr.x + 16;
    var kry = kr.y + 16;
    var dist = 0;
    dist = point_distance(x + 16, y + 16, krx, kry);
    if (dist < 48)
    {
        blushamount = 1;
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, blushamount);
    }
}
