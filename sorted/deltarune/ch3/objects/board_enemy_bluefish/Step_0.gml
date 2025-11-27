updatetimer++;
if (updatetimer == 2)
{
    updatetimer = 0;
    exit;
}
if (state == "init")
    image_speed = 0;
scr_board_enemy_step_init();
var my_x_cell = floor((x + 16) / global.cell_size);
var my_y_cell = floor((y + 16) / global.cell_size);
var my_tile_x = my_x_cell * global.cell_size;
var my_tile_y = my_y_cell * global.cell_size;
var kris_x_cell = floor((obj_board_controller.kris_object.x + 16) / global.cell_size);
var kris_y_cell = floor((obj_board_controller.kris_object.y + 16) / global.cell_size);
var kris_tile_x = kris_x_cell * global.cell_size;
var kris_tile_y = kris_y_cell * global.cell_size;
var collision_obj = 322;
var collision_chase_obj = 322;
if (room == room_board_1_sword || room == room_board_2_sword)
{
    collision_obj = 1065;
    collision_chase_obj = 709;
}
var aa = 0;
if (silverfish == true && silverfishcon == 0)
    aa = 1;
if (room == room_board_2_sword)
{
    if (!aggressive)
    {
        if (obj_mainchara_board.sword == true)
            aggressive = true;
    }
}
if (state == "move" && hurttimer == 0 && aa == 0)
{
    if (movecon == 0)
    {
        if (dashcon == 1)
        {
            dashtimer++;
            if (room == room_board_1_sword || room == room_board_2_sword)
            {
                if (dashtimer == 8)
                    image_index = 0;
                if (dashtimer > 15)
                {
                    dashcon = 0;
                    dashtimer = 0;
                }
            }
            else if (dashtimer > 5)
            {
                dashcon = 0;
                dashtimer = 0;
                image_index = 0;
            }
        }
        else
        {
            if (move_type == 0)
            {
                spd = 3;
                var chasekris = false;
                if (my_y_cell == kris_y_cell && obj_board_controller.kris_object.atdoorway == false && aggressive)
                {
                    if (x < obj_board_controller.kris_object.x)
                        movedir = 0;
                    else
                        movedir = 2;
                    if (movedir == 0)
                    {
                        inst = collision_rectangle(x + 1, y + 2, obj_mainchara_board.x + 16, y + 30, collision_chase_obj, false, true);
                        if (inst == -4)
                            chasekris = true;
                        if (chasekris == true)
                            test = movedir;
                    }
                    if (movedir == 2)
                    {
                        inst = collision_rectangle(x + 1, y + 2, obj_mainchara_board.x + 16, y + 30, collision_chase_obj, false, true);
                        if (inst == -4)
                            chasekris = true;
                        if (chasekris == true)
                            test = movedir;
                    }
                    if (chasekris == true)
                    {
                        move_type = 1;
                        spd = 15;
                        image_index = 1;
                        snd_play_x(snd_wallclaw, 0.4, 1.2);
                    }
                }
                else if (my_x_cell == kris_x_cell && obj_board_controller.kris_object.atdoorway == false && obj_mainchara_board.swordlv > 1)
                {
                    if (y < obj_board_controller.kris_object.y)
                        movedir = 3;
                    else
                        movedir = 1;
                    if (movedir == 3)
                    {
                        inst = collision_rectangle(x + 1, y + 2, x + 31, obj_mainchara_board.y + 16, collision_chase_obj, false, true);
                        if (inst == -4)
                            chasekris = true;
                        if (chasekris == true)
                            test = movedir;
                    }
                    if (movedir == 1)
                    {
                        inst = collision_rectangle(x + 1, y + 30, x + 31, obj_mainchara_board.y + 16, collision_chase_obj, false, true);
                        if (inst == -4)
                            chasekris = true;
                        if (chasekris == true)
                            test = movedir;
                    }
                    if (chasekris == true)
                    {
                        move_type = 1;
                        spd = 15;
                        image_index = 1;
                        snd_play_x(snd_wallclaw, 0.4, 1.2);
                    }
                }
                if (chasekris == false)
                {
                    movedir = choose(0, 1, 2, 3);
                    movetype = 0;
                    spd = 3;
                    repeat (4)
                    {
                        if (movedir == 0 && place_meeting(x + 32, y, collision_obj))
                            movedir = 1;
                        if (movedir == 1 && place_meeting(x, y - 32, collision_obj))
                            movedir = 2;
                        if (movedir == 2 && place_meeting(x - 32, y, collision_obj))
                            movedir = 3;
                        if (movedir == 3 && place_meeting(x, y + 32, collision_obj))
                            movedir = 0;
                    }
                }
            }
            movecon = 1;
        }
    }
    if (movecon == 1)
    {
        var stop = 0;
        if (move_type == 0)
        {
            var chasekris = false;
            if (my_y_cell == kris_y_cell && obj_board_controller.kris_object.atdoorway == false && obj_mainchara_board.swordlv > 1)
            {
                if (x < obj_board_controller.kris_object.x)
                {
                    inst = collision_rectangle(x + 1, y + 2, obj_mainchara_board.x + 16, y + 30, obj_board_solid, false, true);
                    if (inst == -4)
                        chasekris = true;
                    if (chasekris == true)
                        test = movedir;
                }
                else
                {
                    inst = collision_rectangle(x + 1, y + 2, obj_mainchara_board.x + 16, y + 30, obj_board_solid, false, true);
                    if (inst == -4)
                        chasekris = true;
                    if (chasekris == true)
                        test = movedir;
                }
                if (chasekris == true)
                {
                    movetimer++;
                    if (movetimer > 2)
                    {
                        if (x < obj_board_controller.kris_object.x)
                            movedir = 0;
                        else
                            movedir = 2;
                        move_type = 1;
                        movetimer = 0;
                        spd = 15;
                        image_index = 1;
                        snd_play_x(snd_wallclaw, 0.4, 1.2);
                    }
                }
            }
            else if (my_x_cell == kris_x_cell && obj_board_controller.kris_object.atdoorway == false && obj_mainchara_board.swordlv > 1)
            {
                if (y < obj_board_controller.kris_object.y)
                {
                    inst = collision_rectangle(x + 1, y + 2, x + 31, obj_mainchara_board.y + 16, obj_board_solid, false, true);
                    if (inst == -4)
                        chasekris = true;
                    if (chasekris == true)
                        test = movedir;
                }
                else
                {
                    inst = collision_rectangle(x + 1, y + 30, x + 31, obj_mainchara_board.y + 16, obj_board_solid, false, true);
                    if (inst == -4)
                        chasekris = true;
                    if (chasekris == true)
                        test = movedir;
                }
                if (chasekris == true)
                {
                    movetimer++;
                    if (movetimer > 2)
                    {
                        if (y < obj_board_controller.kris_object.y)
                            movedir = 3;
                        else
                            movedir = 1;
                        move_type = 1;
                        movetimer = 0;
                        spd = 15;
                        image_index = 1;
                        snd_play_x(snd_wallclaw, 0.4, 1.2);
                    }
                }
            }
            if (chasekris == false)
                movetimer = 0;
        }
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
                if (place_meeting(x, y, collision_obj) || x < 160 || x > 448 || y < 96 || y > 256)
                {
                    if (move_type == 1)
                    {
                        movecon = 0;
                        move_type = 0;
                        dashcon = 1;
                        if (movedir == 0 || movedir == 2)
                            move_snap(32, 0);
                        if (movedir == 1 || movedir == 3)
                            move_snap(0, 32);
                        break;
                    }
                    else if (movedir == 0)
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
                        stop = 1;
                    }
                }
                if (movedir == 1 || movedir == 3)
                {
                    if ((y % 32) == 0)
                    {
                        movecon = 0;
                        stop = 1;
                    }
                }
            }
        }
    }
}
if (movedir == 0)
    sprite_index = spr_board_bluefish_r;
if (movedir == 1)
    sprite_index = spr_board_bluefish_u;
if (movedir == 2)
    sprite_index = spr_board_bluefish_l;
if (movedir == 3)
    sprite_index = spr_board_bluefish_d;
if (silverfish == true)
{
    if (movedir == 0)
    {
        sprite_index = spr_board_silverfish_r;
        hurt_sprite = spr_board_silverfish_r_hurt;
    }
    if (movedir == 1)
    {
        sprite_index = spr_board_silverfish_u;
        hurt_sprite = spr_board_silverfish_u_hurt;
    }
    if (movedir == 2)
    {
        sprite_index = spr_board_silverfish_l;
        hurt_sprite = spr_board_silverfish_l_hurt;
    }
    if (movedir == 3)
    {
        sprite_index = spr_board_silverfish_d;
        hurt_sprite = spr_board_silverfish_d_hurt;
    }
}
scr_depth_board();
if (room == room_board_2_sword)
    sword_immunity_lv = 0;
scr_board_enemy_sword_collision();
scr_board_enemy_hurt_state();
if (silverfish == true && hp < 1)
{
    with (obj_board_enemy_lizard)
        state = "die";
}
if (silverfish == true && silverfishcon == 0)
{
    if (obj_mainchara_board.x < board_tilex(7))
    {
        silverfishcon = 1;
        with (obj_board_dungeon_3_jingle_controller)
            con = 1;
    }
}
if (board_1_type == 1)
{
    if (x < 256)
        x = 256;
    if (x > 352)
        x = 352;
    if (y < 192)
        y = 192;
    if (y > 224)
        y = 224;
}
if (board_1_type == 2)
{
    if (x < 160)
        x = 160;
    if (x > 352)
        x = 352;
    if (y < 192)
        y = 192;
    if (y > 192)
        y = 192;
}
if (board_1_type == 3)
{
    if (x < 288)
        x = 288;
    if (x > 384)
        x = 384;
    if (y < 192)
        y = 192;
    if (y > 224)
        y = 224;
}
