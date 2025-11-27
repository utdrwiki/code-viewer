scr_enemy_drawhurt_generic();
if (state == 0)
{
    fsiner += 1;
    animsiner++;
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = sparedsprite;
    var headoffsetx = 2;
    var headoffsety = 0;
    if (global.mercymod[myself] >= global.mercymax[myself])
    {
        scr_enemy_drawidle_generic(0.16666666666666666);
    }
    else if (beardcon == 0)
    {
        beardtimer = 0;
        draw_monster_body_part(thissprite, 0, x, y);
        if (thissprite != sparedsprite)
            draw_monster_body_part(spr_bibliox_head, animsiner / 5, x + headoffsetx + (sin(animsiner / 10) * 2), y + headoffsety);
    }
    else if (beardcon == 1)
    {
        if (beardtimer < 32)
            beardtimer++;
        draw_monster_body_part(spr_bibliox_base, 0, x, y);
        draw_monster_body_part(spr_bibliox_head_beard_stroke, beardtimer / 3, x + headoffsetx, y + headoffsety);
    }
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (acting == 20 && i_ex(obj_proofread_controller_new))
{
    var b;
    if (!proofeasy)
        b = 220 - (obj_proofread_controller_new.acttimer * 2);
    else
        b = 200 - obj_proofread_controller_new.acttimer;
    ossafe_fill_rectangle_color(camerax() + 200, cameray() + 295, camerax() + 200 + b, cameray() + 305, c_aqua, c_aqua, c_aqua, c_aqua, 0);
    draw_sprite_ext(spr_poppup_hourglass, 1, camerax() + 200, cameray() + 300, 2, 2, 0, c_white, image_alpha);
}
