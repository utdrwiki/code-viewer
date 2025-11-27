if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
if (active && help && obj_board_camera.con == 0 && !bw_ex() && global.interact == 0)
{
    helptimer++;
    if (helptimer == 10)
        helpalpha = 1;
    if (helptimer >= 30)
    {
        helpalpha = 0;
        helptimer = 0;
    }
    draw_sprite_ext(spr_board_lancercactus_help, lang, x + 138, y - 8, 2, 2, 0, c_white, helpalpha);
}
