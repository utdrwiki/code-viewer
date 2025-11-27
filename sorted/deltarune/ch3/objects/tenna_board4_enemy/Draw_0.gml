if (digit_flash_timer > 0)
    digit_flash_timer--;
if (scr_isphase("menu") || scr_isphase("acting") || ilovetv_increase == 99)
    digit_alpha = scr_movetowards(digit_alpha, 1, 0.1);
else
    digit_alpha = scr_movetowards(digit_alpha, 0, 0.1);
if (digit_alpha > 0 && hidetvcount == false)
{
    var _first_digit = ilovetv div 10;
    var _second_digit = ilovetv % 10;
    var _col_factor = sin((digit_flash_timer / digit_flash_duration) * pi);
    var _col2 = merge_color(c_red, c_white, 0.5);
    var _col = merge_color(c_red, _col2, _col_factor);
    if (ilovetv == 99)
    {
        _col_factor = (sin(current_time / 30) * 0.5) + 0.5;
        _col = merge_color(c_orange, c_yellow, _col_factor);
    }
    var _xx = 280;
    var _yy = 20;
    if (!i_ex(obj_shadowman_sharpshoot_cursor))
    {
        draw_sprite_ext(spr_tv_counter_numbers, _first_digit, _xx, _yy, 2, 2, 0, _col, digit_alpha);
        draw_sprite_ext(spr_tv_counter_numbers, _second_digit, _xx + 40, _yy, 2, 2, 0, _col, digit_alpha);
    }
}
if (state == 3 && (hurttimer >= 0 || i_ex(obj_shadowman_sharpshoot_target)))
{
    tenna_actor.x = -1000;
    tenna_actor.y = -1000;
    draw_sprite_ext(hurtsprite, 0, camerax() + 525 + shakex + hurtspriteoffx, cameray() + 255 + hurtspriteoffy, 2, 2, 0, image_blend, 1);
}
if (state == 0)
{
    fsiner += 1;
    siner += 0.16666666666666666;
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = sparedsprite;
}
if (becomeflash == 0)
{
    flash = 0;
    tenna_actor.flash = flash;
}
becomeflash = 0;
