scr_84_set_draw_font("main");
draw_set_color(c_white);
if (state == 3 && hurttimer >= 0)
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
    if (minigametransition_con == 0)
        tenna_actor.flash = flash;
}
becomeflash = 0;
