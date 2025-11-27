var blackflash = false;
if (flashtimer == 10 || flashtimer == 9 || flashtimer == 6 || flashtimer == 5 || flashtimer == 2 || flashtimer == 1)
    blackflash = true;
if (hurttimer == 10 || hurttimer == 9 || hurttimer == 6 || hurttimer == 5 || hurttimer == 2 || hurttimer == 1)
    blackflash = true;
var aaa = 0;
if (show_outline == true && global.flag[8] == 0)
{
    if (blackflash == true)
        d3d_set_fog(true, c_white, 0, 1);
    else
        d3d_set_fog(true, c_black, 0, 1);
    draw_sprite_ext(sprite_index, image_index, (round(x / 2) * 2) - 2, round((y + aaa) / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(sprite_index, image_index, (round(x / 2) * 2) + 2, round((y + aaa) / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, (round((y + aaa) / 2) * 2) - 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, (round((y + aaa) / 2) * 2) + 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    d3d_set_fog(false, c_black, 0, 0);
}
draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round((y + aaa) / 2) * 2, image_xscale, image_yscale, 0, image_blend, image_alpha);
if (global.flag[8] == 0)
{
    if (blackflash == true)
    {
        if (sprite_index == spr_board_deer_leftsprite)
            hurt_sprite = spr_board_deer_left_hurt;
        if (sprite_index == spr_board_deer_rightsprite)
            hurt_sprite = spr_board_deer_right_hurt;
        if (sprite_index == spr_board_deer_upsprite)
            hurt_sprite = spr_board_deer_up_hurt;
        if (sprite_index == spr_board_deer_downsprite)
            hurt_sprite = spr_board_deer_down_hurt;
        draw_sprite_ext(hurt_sprite, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
if (flashtimer > 0)
    flashtimer--;
if (hurttimer2 > 0)
    hurttimer2--;
