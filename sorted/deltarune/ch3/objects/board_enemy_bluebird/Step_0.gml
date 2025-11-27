if (room == room_board_dungeon_2)
    active_hitbox = true;
updatetimer++;
if (updatetimer == 2)
{
    updatetimer = 0;
    path_speed = pathspd;
}
else
{
    path_speed = 0;
    exit;
}
scr_board_enemy_step_init();
scr_board_enemy_sword_collision();
scr_board_enemy_hurt_state();
if (i_ex(obj_board_enemy_bluebird_path))
{
    target_x = obj_board_enemy_bluebird_path.x;
    target_y = obj_board_enemy_bluebird_path.y;
}
bulletimer++;
if (bulletimer == 30 && room != room_board_dungeon_2)
{
    bulletimer = choose(-60, -30, 0);
    bullet = instance_create(x + 16 + lengthdir_x(8, 45), y + 16 + lengthdir_y(8, 45), obj_board_enemy_spear);
    bullet.direction = 45;
    bullet.image_xscale = 3;
    bullet.image_yscale = 3;
    bullet.image_speed = 0;
    bullet.spd = 16;
    bullet.sprite_index = spr_board_blue_bird_feather;
    bullet = instance_create(x + 16 + lengthdir_x(8, 135), y + 16 + lengthdir_y(8, 135), obj_board_enemy_spear);
    bullet.direction = 135;
    bullet.image_xscale = 3;
    bullet.image_yscale = 3;
    bullet.image_speed = 0;
    bullet.spd = 16;
    bullet.sprite_index = spr_board_blue_bird_feather;
    bullet = instance_create(x + 16 + lengthdir_x(8, 225), y + 16 + lengthdir_y(8, 225), obj_board_enemy_spear);
    bullet.direction = 225;
    bullet.image_xscale = 3;
    bullet.image_yscale = 3;
    bullet.image_speed = 0;
    bullet.spd = 16;
    bullet.sprite_index = spr_board_blue_bird_feather;
    bullet = instance_create(x + 16 + lengthdir_x(8, 315), y + 16 + lengthdir_y(8, 315), obj_board_enemy_spear);
    bullet.direction = 315;
    bullet.image_xscale = 3;
    bullet.image_yscale = 3;
    bullet.image_speed = 0;
    bullet.spd = 16;
    bullet.sprite_index = spr_board_blue_bird_feather;
}
if (room == room_board_dungeon_2)
{
    if (y != obj_mainchara_board.y && y != 96 && y != 256)
        image_index += 1;
    else
        image_index = 0;
    y = obj_mainchara_board.y;
    if (obj_mainchara_board.x > (x - 32))
        obj_mainchara_board.x = x - 32;
}
else
{
    if (!i_ex(obj_board_enemy_bluebird_path) && pathspd > 0)
        pathspd -= 0.4;
    var path_pos = path_position;
    path_end();
    x = target_x;
    y = target_y;
    path_start(path_bluebird2, pathspd, path_action_continue, false);
    path_position = path_pos;
}
if (x < 128)
    x = 128;
if (x > 480)
    x = 480;
if (y < 96)
    y = 96;
if (y > 256)
    y = 256;
