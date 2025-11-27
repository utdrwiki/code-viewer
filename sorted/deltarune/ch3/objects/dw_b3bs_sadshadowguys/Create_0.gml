con = 0;
pipnpc = instance_create(750, 276, obj_npc_room);
pipnpc.extflag = "poppins";
for (var i = 0; i < 5; i++)
{
    consolemarker[i] = scr_dark_marker(250 + (98 * i), 252, spr_ch3_dw_b3bs_console);
    consolemarker[i].image_index = 1;
    consolemarker[i].image_speed = 0;
    consolemarker[i].depth = 97000;
    sadshad[i] = instance_create(252 + (98 * i), 242, obj_npc_room);
    sadshad[i].sprite_index = spr_shadowman_playgamesad;
    sadshad[i].extflag = "sadshad";
    boardshad[i] = scr_board_marker(264 + (98 * i), 164, spr_dw_b3bs_sadshadowguys, 0.05);
    with (boardshad[i])
    {
        image_index = i * pi * 4;
        image_speed += (((i % 2) == 0) * 0.01);
    }
}
with (instance_create(192, 96, obj_board_screen))
{
    screenwidth = 576;
    screenheight = 160;
    depth = 100000;
}
