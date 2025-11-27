draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (room == room_board_1)
{
    if (keycount > 0)
    {
        draw_sprite_ext(spr_board_key, 6, x + 8, y + 10 + 0, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_inventory_counter, keycount, x + 8 + 18, y + 10 + 34 + 0, 2, 2, 0, c_white, 1);
    }
    if (qcount)
    {
        draw_sprite_ext(spr_board_inventory_q, 0, x + 8, y + 10 + 48, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_inventory_counter, qcount, x + 8 + 18, y + 10 + 34 + 48, 2, 2, 0, c_white, 1);
    }
    if (lancer != 0)
    {
        draw_sprite_ext(spr_board_lancer_down, 1, x + 8, y + 10 + 96, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_inventory_counter, lancer, x + 8 + 18, y + 10 + 34 + 96, 2, 2, 0, c_white, 1);
    }
    if (sunmoonstone != 0)
        draw_sprite_ext(spr_board_sunmoonstone, 1, x + 8, y + 10 + 144, 2, 2, 0, c_white, 1);
    if (rouxlsblock != 0)
        draw_sprite_ext(spr_board_rouxlsblock, 1, x + 8, y + 10 + 192, 2, 2, 0, c_white, 1);
}
if (room == room_board_2)
{
    if (camera == true)
    {
        var photocount = global.flag[1041] + global.flag[1042] + global.flag[1043] + global.flag[1227];
        draw_sprite_ext(spr_board_playercamera_pickup, 0, x + 8, (y + 10 + 0) - 2, 2, 2, 0, c_white, 1);
        if (photocount > 0)
        {
            draw_sprite_ext(spr_board_inventory_photocounter, 0, x + 8, y + 10 + 30, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_board_inventory_counter, photocount, x + 8 + 18, y + 10 + 34 + 0, 2, 2, 0, c_white, 1);
        }
    }
    if (qcount == 1)
        draw_sprite_ext(spr_board_b2tennaglasses, 0, x + 8, y + 10 + 48, 2, 2, 0, c_white, 1);
    if (qcount == 2)
        draw_sprite_ext(spr_board_b2tennaglasses, 2, x + 8, y + 10 + 48, 2, 2, 0, c_white, 1);
    if (lancer != 0)
    {
        draw_sprite_ext(spr_board_lancer_down, 1, x + 8, y + 10 + 96, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_inventory_counter, lancer, x + 8 + 18, y + 10 + 34 + 96, 2, 2, 0, c_white, 1);
    }
    if (ninfriendo && b2drawninfriendo)
        draw_sprite_ext(spr_board_inventory_ninfriendo, global.flag[1017], x + 8, y + 10 + 144, 2, 2, 0, c_white, 1);
    if (rouxlsblock != 0)
        draw_sprite_ext(spr_board_rouxlsblock, 1, x + 8, y + 10 + 192, 2, 2, 0, c_white, 1);
}
if (room == room_board_3)
{
    if (qcount)
    {
        draw_sprite_ext(spr_board_inventory_q, 0, x + 8, y + 10 + 0, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_inventory_counter, qcount, x + 8 + 18, y + 10 + 34 + 0, 2, 2, 0, c_white, 1);
    }
    if (lancer > 0)
    {
        draw_sprite_ext(spr_board_lancer_down, 0, x + 8, y + 10 + 48, 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_board_inventory_counter, lancer, x + 8 + 18, y + 10 + 34 + 48, 2, 2, 0, c_white, 1);
    }
    if (obj_mainchara_board.camera == true)
        draw_sprite_ext(spr_board_playercamera_pickup, 0, x + 8, (y + 10 + 96) - 2, 2, 2, 0, c_white, 1);
}
