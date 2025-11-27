spdtimer++;
if (spdtimer > 60 && spdtimer < 180)
    spd = lerp(6, 3, (spdtimer - 60) / 120);
if (spdtimer >= 180)
    spd = 3;
if (state == "init")
{
    image_index += 0.25;
    if (image_index >= 5)
    {
        image_index = 0;
        sprite_index = spr___;
        state = "move";
        active_hitbox = true;
    }
}
if (state == "move" && hurttimer == 0)
{
    if (movecon == 0)
    {
        if (move_type == 0)
        {
            movedir = choose(0, 1, 2, 3);
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
        if (move_type == 1)
        {
            is_moving = true;
            var x_cell = floor(obj_mainchara_board.x / global.cell_size);
            var y_cell = floor((obj_mainchara_board.y + 18) / global.cell_size);
            var position_x = (x_cell * global.cell_size) + (global.cell_size / 2);
            var position_y = (y_cell * global.cell_size) + (global.cell_size / 2);
            mp_grid_path(global.grid, path, x + 16, y + 16, position_x, position_y, false);
            path_start(path, 3.5, path_action_stop, false);
            if (!mp_grid_path(global.grid, path, x + 16, y + 16, position_x, position_y, false))
                cantfindpath = true;
            movecon = 1;
        }
    }
    if (movecon == 1)
    {
        movetimer++;
        if (move_type == 0)
        {
            var stop = 0;
            repeat (spd)
            {
                if (stop == 0)
                {
                    if (movedir == 0)
                    {
                        x += 1;
                        image_index = 1;
                    }
                    if (movedir == 1)
                    {
                        y -= 1;
                        image_index = 2;
                    }
                    if (movedir == 2)
                    {
                        x -= 1;
                        image_index = 3;
                    }
                    if (movedir == 3)
                    {
                        y += 1;
                        image_index = 0;
                    }
                    if (movedir == 0 || movedir == 2)
                    {
                        if ((x % 32) == 0)
                        {
                            movecon = 0;
                            movetimer = 0;
                            stop = 1;
                        }
                    }
                    if (movedir == 1 || movedir == 3)
                    {
                        if ((y % 32) == 0)
                        {
                            movecon = 0;
                            movetimer = 0;
                            stop = 1;
                        }
                    }
                }
            }
            if ((stop == 1 && i_ex(obj_shadow_mantle_enemy) && obj_shadow_mantle_enemy.dashcon == 0) || (i_ex(obj_shadow_mantle_enemy) && obj_shadow_mantle_enemy.hp < 5))
            {
                var any_enemy_pathing = false;
                for (var i = 0; i < instance_number(obj___); i += 1)
                {
                    enemy[i] = instance_find(obj___, i);
                    if (enemy[i].move_type == 1)
                        any_enemy_pathing = true;
                }
                if (any_enemy_pathing == false)
                    move_type = 1;
            }
        }
        if (move_type == 1)
        {
            is_moving_timer++;
            if ((is_moving_timer >= 8 && path_speed == 4) || (is_moving_timer >= 9 && path_speed == 3.5) || (is_moving_timer >= 11 && path_speed == 3) || (is_moving_timer >= 16 && path_speed == 2))
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
            }
        }
    }
}
scr_depth_board();
if (state == "move" && hit == 0)
{
    if (x == xprevious && xprevious == xprev2 && y == yprevious && yprevious == yprev2)
        cantfindpath = true;
    xprev2 = xprevious;
    yprev2 = yprevious;
}
alivetimer++;
if ((alivetimer >= 300 && state != "disappear") || (cantfindpath && state != "disappear"))
{
    state = "disappear";
    sprite_index = spr___no;
    image_index = 1;
    active_hitbox = false;
    snd_stop(snd_board_unsummon);
    snd_play(snd_board_unsummon);
    path_end();
    movecon = 0;
    movetimer = 0;
    is_moving_timer = 0;
    is_moving = false;
    speed = 0;
}
if (place_meeting(x, y, obj_board_swordhitbox) && hurttimer == 0 && state != "disappear")
{
    path_end();
    hurttimer = 12;
    snd_stop(snd_face_hit);
    snd_play(snd_face_hit);
    active_hitbox = false;
    hitdir = obj_mainchara_board.facing;
    hit = 1;
}
if (place_meeting(x, y, obj_board_solid))
{
    x = xprevious;
    y = yprevious;
    speed = 0;
    path_end();
}
if (hit == 1)
    active_hitbox = false;
