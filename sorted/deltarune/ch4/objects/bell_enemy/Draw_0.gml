scr_enemy_drawhurt_generic();
if (state == 0)
{
    thissprite = idlesprite;
    fsiner++;
    animsiner++;
    if (global.mercymod[myself] >= global.mercymax[myself])
    {
        draw_monster_body_part(spr_bell_spare, 0, x + 3, y - 8);
    }
    else
    {
        draw_monster_body_part(thissprite, 6, x - (sin(animsiner / 3) * 2), y);
        draw_monster_body_part(thissprite, 5, x - (sin(animsiner / 6) * 2), y);
        draw_monster_body_part(thissprite, 4, x, y + (sin(animsiner / 6) * 2));
        draw_monster_body_part(thissprite, 3, x, y - (sin(animsiner / 6) * 2));
        draw_monster_body_part(thissprite, 2, x, y);
        draw_monster_body_part(thissprite, 1, x + (sin(animsiner / 6) * 2), y);
    }
}
if (state == 10)
{
    if (spinattackcon == 0)
    {
        spinattacktimer++;
        if (spinattacktimer == 1)
            draw_monster_body_part(spr_bell_enemy_spin_pose, 2, x, y - 4);
        if (spinattacktimer == 2)
            draw_monster_body_part(spr_bell_enemy_spin_pose, 2, x, y + 3);
        if (spinattacktimer == 3)
            draw_monster_body_part(spr_bell_enemy_spin_pose, 2, x, y - 2);
        if (spinattacktimer == 4)
            draw_monster_body_part(spr_bell_enemy_spin_pose, 2, x, y + 1);
        if (spinattacktimer >= 7 || spinattacktimer < 11)
            draw_monster_body_part(spr_bell_enemy_spin_pose, 2, x, y);
        if (spinattacktimer == 11)
        {
            spinattacktimer = 0;
            spinattackcon = 1;
            bell = instance_create(x + 41, y + 45, obj_bell_spin_attack);
            bell.creatorid = id;
        }
    }
    animsiner++;
    draw_monster_body_part(thissprite, 6, x - (sin(animsiner / 3) * 2), y);
    draw_monster_body_part(thissprite, 5, x - (sin(animsiner / 6) * 2), y);
    draw_monster_body_part(thissprite, 1, x + (sin(animsiner / 6) * 2), y);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
