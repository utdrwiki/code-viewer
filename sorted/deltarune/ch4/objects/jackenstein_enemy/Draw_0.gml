if (stopdrawing)
    exit;
scr_enemy_drawhurt_generic();
if (state == 0)
{
    fsiner += 1;
    siner += 0.16666666666666666;
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = sparedsprite;
    draw_sprite_ext(thissprite, siner, x, y + (sin(siner / 1.35) * 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (flashcon == 1)
{
    flashtimer--;
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(thissprite, siner, x, y + (sin(siner / 1.35) * 8), image_xscale, image_yscale, image_angle, image_blend, flashtimer / 10);
    d3d_set_fog(false, c_black, 0, 0);
    if (flashtimer == 0)
        flashcon = 0;
}
