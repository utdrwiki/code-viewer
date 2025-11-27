scr_enemy_drawhurt_generic();
if (state == 0)
{
    fsiner += 1;
    animsiner++;
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = sparedsprite;
    draw_monster_body_part(spr_guei_arm_back, (animsiner + 2) / 6, x, y);
    draw_monster_body_part(spr_guei_body, animsiner / 6, x, y);
    draw_monster_body_part(spr_guei_head, animsiner / 6, x, y);
    draw_monster_body_part(spr_guei_arm_front, (animsiner + 4) / 6, x, y);
    draw_monster_body_part_ext(spr_guei_wisp1, animsiner / 6, x + (sin(animsiner / 6) * 2), y + (cos(animsiner / 6) * 2), image_xscale, image_yscale, 0, c_white, sin(animsiner / 14) * 0.5);
    draw_monster_body_part_ext(spr_guei_wisp2, animsiner / 6, x - (sin(animsiner / 6) * 2), y - (cos(animsiner / 6) * 2), image_xscale, image_yscale, 0, c_white, sin((animsiner + 7) / 14) * 0.5);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
