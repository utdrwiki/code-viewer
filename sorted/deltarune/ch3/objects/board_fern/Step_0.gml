depth = 999989;
if (room == room_board_1 || room == room_board_2)
{
    if (active)
        scr_depth_board();
    exit;
}
if (room != room_dw_b3bs_mysterypuzzle && room != room_dw_b3bs_extrapuzzle)
{
    if (kris == 0)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                other.kris = id;
        }
    }
    if (i_ex(kris))
    {
        if (kris.sword == true)
        {
            sndbuff--;
            if (place_meeting(x, y, obj_board_swordhitbox))
            {
                var sword = instance_place(x, y, obj_board_swordhitbox);
                if (sword.swordlv > defense)
                {
                    myhealth--;
                    if (myhealth <= 0)
                    {
                        instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                        instance_destroy();
                    }
                }
                else if (sndbuff <= 0)
                {
                    snd_stop(snd_board_sword_metal);
                    snd_play(snd_board_sword_metal);
                    sndbuff = 10;
                }
            }
            if (place_meeting(x, y, obj_board_enemy_deer_ice_spell))
            {
                snd_stop(snd_board_splash);
                snd_play(snd_board_splash);
                block = instance_create(x, y, obj_pushableblock_board);
                block.sprite_index = spr_board_pushableblock_ice;
                block.custom_sprite = spr_board_pushableblock_ice;
                block.image_xscale = 1;
                block.image_yscale = 1;
                var x_cell = floor(block.x / global.cell_size);
                var y_cell = floor((block.y + 18) / global.cell_size);
                var position_x = (x_cell * global.cell_size) + (global.cell_size / 2);
                var position_y = (y_cell * global.cell_size) + (global.cell_size / 2);
                block.x = position_x - 16;
                block.y = position_y - 16;
                for (var i = 0; i < 4; i++)
                {
                    fx = scr_board_marker(block.x + 16, block.y + 16, spr_board_snowflake, 0.3, depth, 2);
                    fx.direction = (360 / count) * i;
                    scr_doom(fx, 12);
                }
                instance_destroy();
            }
        }
    }
    scr_depth_board();
    image_speed = remspeed;
    if (i_ex(obj_board_camera))
    {
        if (obj_board_camera.con != 0)
            image_speed = 0;
    }
    if (global.interact == 1)
        image_speed = 0;
}
