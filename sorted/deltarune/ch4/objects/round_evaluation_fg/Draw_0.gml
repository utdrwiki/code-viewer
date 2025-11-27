if (darknesscon == 1)
{
    if (darknessalpha < 2)
    {
        depth = -999999999;
        darknessalpha += 0.05;
    }
    if (darknessalpha == 2)
    {
        darknesscon = 2;
        with (obj_round_evaluation)
            depth = 990101;
        room_goto(room_ch3_gameshowroom);
    }
}
else if (darknesscon == 2)
{
    with (obj_round_evaluation)
        persistent = false;
    persistent = false;
    if (darknessalpha > 0)
        darknessalpha -= 0.05;
    if (darknessalpha == 0)
    {
        with (obj_round_evaluation)
            show_vignette(8);
        with (obj_round_evaluation_fg)
            instance_destroy();
    }
}
if (darknesscon > 0)
{
    var yextra = 0;
    if (room == room_dw_rhythm)
        yextra = 100;
    draw_sprite_ext(spr_dw_gameshow_bg, 0, 0, 0 + yextra, 2, 2, 0, c_black, darknessalpha);
    draw_sprite_part_ext(spr_susieu_dark_scene, 0, 0, 0, 26, 28, 165, 165 + yextra, 2.08, 2, c_black, darknessalpha);
    draw_sprite_part_ext(spr_ralsei_up_scene, 0, 0, 0, 21, 24, 249, 173 + yextra, 2.1, 2, c_black, darknessalpha);
    draw_sprite_ext(spr_dw_gameshow_podium_2, 0, 268, 214 + yextra, 2, 2, 0, c_black, darknessalpha);
    draw_sprite_part_ext(spr_dw_tvland_lights, 0, 80, 48, 28, 8, 128, 48 + yextra, 1, 1, c_black, darknessalpha);
    draw_sprite_part_ext(spr_dw_tvland_lights, 0, 80, 48, 28, 8, 512, 48 + yextra, -1, 1, c_black, darknessalpha);
    draw_set_color(c_black);
    draw_set_alpha(darknessalpha);
    ossafe_fill_rectangle(178, 221 + yextra, 180, 223 + yextra);
    ossafe_fill_rectangle(180, 221 + yextra, 217, 227 + yextra);
    ossafe_fill_rectangle(238, 221 + yextra, 301, 227 + yextra);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
