switch (drawpos)
{
    case 0:
        draw_sprite_ext(spr_tenna_snap_arm, 0, x + scr_even(armxpos), y + scr_even(armypos), 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_tenna_snap_body, 0, x, y, 2, 2, 0, c_white, 1);
        break;
    case 1:
        draw_sprite_ext(spr_tenna_snap_arm_f2, 0, x + scr_even(armxpos), y + scr_even(armypos), 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_tenna_snap_body_f2, 0, x, y, 2, 2, 0, c_white, 1);
        break;
    case 2:
        draw_sprite_ext(spr_tenna_snap, animindex, x, y, 2, 2, 0, c_white, 1);
        break;
}
