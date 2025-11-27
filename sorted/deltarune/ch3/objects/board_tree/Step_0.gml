if (init == 0)
{
    if (changetree)
        sprite_index = treeoverride;
    if (image_blend == c_blue)
        image_blend = c_white;
    init = 1;
}
if (wither == 1)
{
    wither = 2;
    sprite_index = spr_board_tree_withered;
    dir = 0;
}
if (active)
{
    if (sndbuff > 0)
        sndbuff--;
    if (instance_exists(obj_board_swordhitbox))
    {
        if (place_meeting(x, y, obj_board_swordhitbox))
        {
            var sword = instance_place(x, y, obj_board_swordhitbox);
            if (sword.swordlv > defense)
            {
                instance_create(centerx(), centery(), obj_board_enemydefeatsplash);
                if (y == 64 && obj_board_swordhitbox.facing == 2)
                {
                    var extratree = instance_place(x, y - 32, object_index);
                    if (i_ex(extratree))
                    {
                        with (extratree)
                            instance_destroy();
                        debug_message("killed extra tree");
                    }
                }
                if (y == 288 && obj_board_swordhitbox.facing == 0)
                {
                    var extratree = instance_place(x, y + 32, object_index);
                    if (i_ex(extratree))
                    {
                        with (extratree)
                            instance_destroy();
                        debug_message("killed extra tree");
                    }
                }
                if (x == 480 && obj_board_swordhitbox.facing == 1)
                {
                    var extratree = instance_place(x + 32, y, object_index);
                    if (i_ex(extratree))
                    {
                        with (extratree)
                            instance_destroy();
                        debug_message("killed extra tree");
                    }
                }
                if (x == 128 && obj_board_swordhitbox.facing == 3)
                {
                    var extratree = instance_place(x - 32, y, object_index);
                    if (i_ex(extratree))
                    {
                        with (extratree)
                            instance_destroy();
                        debug_message("killed extra tree");
                    }
                }
                instance_destroy();
            }
            else if (sndbuff <= 0)
            {
                snd_stop(snd_board_sword_metal);
                snd_play(snd_board_sword_metal);
                sndbuff = 10;
            }
        }
    }
    if (room == room_board_dungeon_2)
    {
        if (instance_exists(obj_board_enemy_deer_ice_spell))
        {
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
                var count = 6;
                for (var i = 0; i < count; i++)
                {
                    var fx = scr_board_marker((block.x + 16) - 2, (block.y + 16) - 2, spr_board_snowflake, 0.3, 100000, 2);
                    fx.direction = ((360 / count) * i) + 45;
                    fx.speed = 8;
                    fx.friction = 0.6;
                    scr_doom(fx, 10);
                    fx = scr_board_marker((block.x + 16) - 2, (block.y + 16) - 2, spr_board_snowflake, 0.3, 100000, 2);
                    fx.direction = (360 / count) * i;
                    fx.speed = 4;
                    fx.friction = 0.3;
                    scr_doom(fx, 10);
                }
                instance_destroy();
            }
        }
    }
}
image_speed = remspeed;
if (obj_board_camera.con != 0 || global.interact == 1)
    image_speed = 0;
