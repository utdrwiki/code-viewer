var shoot_wait_time = 15;
if (type == 1)
    shoot_wait_time = 22;
if (room == room_board_1_sword)
{
    if (obj_mainchara_board.swordlv > 1)
    {
        image_speed = 0.2;
        spd = 3;
        active_hitbox = true;
    }
    if (obj_mainchara_board.swordlv == 1)
    {
        image_speed = 0.1;
        spd = 2;
    }
    if (obj_mainchara_board.swordlv > 2)
        hp = 1;
}
if (type == 3)
    image_speed = 0;
var chaseplayer = true;
if (136 && obj_mainchara_board.swordlv > 1)
    aggressive = true;
if (!aggressive)
{
    active_hitbox = false;
    chaseplayer = false;
}
updatetimer++;
if ((room == room_board_dungeon_2 || room == room_board_dungeon_3) && type == 2)
{
}
else if (spearbosscon < 2)
{
    if (updatetimer == 2)
    {
        if (move_type == 1 && movecon == 1)
            path_speed = 0;
        updatetimer = 0;
        exit;
    }
    else if (move_type == 1 && movecon == 1)
    {
        path_speed = spd;
        if (bulletimer > shoot_wait_time || delay > 0)
            path_speed = 0;
    }
}
scr_board_enemy_step_init();
if (room == room_board_dungeon_3 && type == 0)
    state = "init";
if (delay > 0)
    delay--;
if (type == 3)
{
    spd = 0;
    type = 0;
    state = "stationary";
}
if (state == "move" && delay == 0 && ((hurttimer == 0 && movecon < 3) || movecon == 3))
{
    if (movecon == 0)
    {
        if (spearbosscon == 2)
        {
            move_type = 1;
            spd = 6;
        }
        if (spearboss == true || spearbosscon == 1)
            move_type = 0;
        if (obj_board_controller.kris_object.atdoorway == true)
            move_type = 0;
        if (chaseplayer == false)
            move_type = 0;
        if (move_type == 1)
        {
            is_moving = true;
            var x_cell = floor(obj_board_controller.kris_object.x / global.cell_size);
            var y_cell = floor((obj_board_controller.kris_object.y + 18) / global.cell_size);
            var position_x = (x_cell * global.cell_size) + (global.cell_size / 2);
            var position_y = (y_cell * global.cell_size) + (global.cell_size / 2);
            if (mp_grid_path(global.grid, path, x + 16, y + 16, position_x, position_y, false))
            {
                path_start(path, spd, path_action_stop, false);
                movecon = 1;
            }
            else
            {
                move_type = 0;
            }
        }
        if (move_type == 0)
        {
            movedir = choose(0, 1, 2, 3);
            if (spearboss == true)
                movedir = choose(0, 2);
            repeat (4)
            {
                if (movedir == 0 && place_meeting(x + 32, y, obj_board_solid))
                    movedir = 1;
                if (movedir == 1 && place_meeting(x, y - 32, obj_board_solid))
                    movedir = 2;
                if (movedir == 2 && place_meeting(x - 32, y, obj_board_solid))
                    movedir = 3;
                if (movedir == 3 && place_meeting(x, y + 32, obj_board_solid))
                    movedir = 0;
            }
            movecon = 1;
        }
        if (move_type == 3)
        {
        }
    }
    if (movecon == 1)
    {
        movetimer++;
        if (move_type == 0 && bulletimer <= shoot_wait_time && delay == 0)
        {
            var stop = 0;
            repeat (spd)
            {
                if (stop == 0)
                {
                    if (movedir == 0)
                        x += 1;
                    if (movedir == 1)
                        y -= 1;
                    if (movedir == 2)
                        x -= 1;
                    if (movedir == 3)
                        y += 1;
                    if (place_meeting(x, y, obj_board_solid) || place_meeting(x, y, obj_board_solid_monster) || x < 160 || x > 448 || y < 96 || y > 256)
                    {
                        if (movedir == 0)
                        {
                            x -= 1;
                            movedir = 2;
                        }
                        else if (movedir == 1)
                        {
                            y += 1;
                            movedir = 3;
                        }
                        else if (movedir == 2)
                        {
                            x += 1;
                            movedir = 0;
                        }
                        else if (movedir == 3)
                        {
                            y -= 1;
                            movedir = 1;
                        }
                    }
                    if (movedir == 0 || movedir == 2)
                    {
                        if ((x % 32) == 0)
                        {
                            movecon = 0;
                            movetimer = 0;
                            stop = 1;
                            if (distance_to_object(obj_board_controller.kris_object) < distance_to_become_aggressive && spearboss == false && image_blend != c_gray)
                                move_type = 1;
                        }
                    }
                    if (movedir == 1 || movedir == 3)
                    {
                        if ((y % 32) == 0)
                        {
                            movecon = 0;
                            movetimer = 0;
                            stop = 1;
                            if (distance_to_object(obj_board_controller.kris_object) < distance_to_become_aggressive && spearboss == false && image_blend != c_gray)
                                move_type = 1;
                        }
                    }
                }
            }
        }
        if (move_type == 1)
        {
            is_moving_timer++;
            if (bulletimer > shoot_wait_time || delay > 0)
            {
                is_moving_timer--;
            }
            else if ((is_moving_timer >= 16 && spd == 2) || (is_moving_timer >= 12 && spd == 3) || (is_moving_timer >= 9 && spd == 4) || (is_moving_timer >= 5 && spd == 6) || (is_moving_timer >= 5 && spd == 8))
            {
                var x_cell = floor((x + 16) / global.cell_size);
                var y_cell = floor((y + 16) / global.cell_size);
                x = x_cell * global.cell_size;
                y = y_cell * global.cell_size;
                movecon = 0;
                movetimer = 0;
                is_moving_timer = 0;
                is_moving = false;
                path_end();
                speed = 0;
                if (distance_to_object(obj_board_controller.kris_object) >= (distance_to_become_aggressive - 20))
                    move_type = 0;
            }
        }
    }
}
scr_depth_board();
scr_board_enemy_sword_collision();
scr_board_enemy_hurt_state();
if (bulletimer > shoot_wait_time)
{
    if (show_outline == false)
        sprite_index = _sprAngry;
    else
        sprite_index = _sprAngryOutline;
}
else if (show_outline == false)
{
    sprite_index = _sprIdle;
}
else
{
    sprite_index = _sprIdleOutline;
}
if (delay > 0)
{
    movetimer = 0;
    movecon = 0;
    if (bulletimer > 10)
        bubbletimer = 10;
}
if (type == 1 && movecon == 1 && hurttimer == 0 && obj_board_controller.kris_object.leftdoorway == true && spearbosscon != 2 && chaseplayer == true)
{
    bulletimer++;
    if (bulletimer >= 30)
    {
        bulletimer = choose(-20, -10, 0);
        if (spearboss == true)
            bulletimer = choose(0, 5, 10);
        var shoot_dir = movedir;
        inst = collision_rectangle(x - 40, y, x + 32 + 40, y + 500, obj_mainchara_board, false, true);
        if (inst != -4)
            shoot_dir = 3;
        inst = collision_rectangle(x + 32, y - 40, x - 500, y + 32 + 40, obj_mainchara_board, false, true);
        if (inst != -4)
            shoot_dir = 2;
        inst = collision_rectangle(x, y - 40, x + 500, y + 32 + 40, obj_mainchara_board, false, true);
        if (inst != -4)
            shoot_dir = 0;
        inst = collision_rectangle(x - 40, y + 32, x + 32 + 40, y - 500, obj_mainchara_board, false, true);
        if (inst != -4)
            shoot_dir = 1;
        if (shoot_dir == 3 || spearboss == true)
        {
            bullet = instance_create(x + 16, y + 16 + 32, obj_board_enemy_spear);
            bullet.image_angle = 270;
            bullet.direction = 270;
            bullet.spd = 20;
        }
        else if (shoot_dir == 2)
        {
            bullet = instance_create((x + 16) - 2 - 4 - 32, y + 16, obj_board_enemy_spear);
            bullet.image_angle = 180;
            bullet.direction = 180;
            bullet.spd = 20;
        }
        else if (shoot_dir == 0)
        {
            bullet = instance_create(((x + 16) - 2 - 4) + 32, y + 16, obj_board_enemy_spear);
            bullet.image_angle = 0;
            bullet.direction = 0;
            bullet.spd = 20;
        }
        else if (shoot_dir == 1)
        {
            bullet = instance_create(x + 16, (y + 16) - 32, obj_board_enemy_spear);
            bullet.image_angle = 90;
            bullet.direction = 90;
            bullet.spd = 20;
        }
    }
}
if (type == 2 && movecon == 1 && hurttimer == 0 && obj_board_controller.kris_object.leftdoorway == true)
{
    bulletimer++;
    if (bulletimer >= 30)
    {
        bulletimer = choose(-30, -35, -40);
        if (spearboss == true)
            bulletimer = choose(0, 5);
        bullet = instance_create(x + 16, y + 16, obj_board_enemy_fire);
    }
}
if (spearboss == true && spearbosscon == 0 && obj_mainchara_board.x < board_tilex(10))
{
    spearbosscon = 1;
    active_hitbox = true;
    wall = instance_create(board_tilex(11), board_tiley(3), obj_board_puzzle_wall);
    wall.sprite_index = spr_board_door_left;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(11), board_tiley(4), obj_board_puzzle_wall);
    wall.sprite_index = spr_board_door_left;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    snd_stop(snd_board_door_close);
    snd_play_pitch(snd_board_door_close, 1.2);
    with (obj_board_puzzle_wall)
        scr_board_depth();
}
