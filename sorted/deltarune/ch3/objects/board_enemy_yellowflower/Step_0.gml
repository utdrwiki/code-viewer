scr_board_enemy_step_init();
scr_board_enemy_sword_collision();
scr_depth_board();
scr_board_enemy_hurt_state();
if ((room == room_board_1_sword && obj_mainchara_board.swordlv > 1) || room != room_board_1_sword)
{
    if (sprite_index == spr_board_flower_alt_closed)
        sprite_index = spr_board_flower_alt;
    if (sprite_index == spr_board_flower_telegraph)
        image_index += (1/3);
    else if (sprite_index == spr_board_flower_telegraph_alt)
        image_index += (1/3);
    else
        image_index += (irandom(3) / 20);
    image_speed = 0.05;
}
else
{
    image_speed = 0;
}
if (room == room_board_2_sword)
{
    sword_immunity_lv = 0;
    if (obj_mainchara_board.sword == false)
        active_hitbox = false;
    if (active_hitbox == false)
    {
        if (obj_mainchara_board.sword == true)
        {
            active_hitbox = true;
            aggressive = true;
        }
    }
}
else if (obj_mainchara_board.swordlv == 1)
{
    active_hitbox = false;
}
else
{
    active_hitbox = true;
    aggressive = true;
}
if (obj_board_controller.kris_object.leftdoorway == true && aggressive)
{
    bubbletimer++;
    if (bubbletimer == 16 && (sprite_index == spr_board_flower || sprite_index == spr_board_flower_alt))
    {
        sprite_index = spr_board_flower_telegraph;
        if (room == room_board_1_sword)
            sprite_index = spr_board_flower_telegraph_alt;
    }
    if (bubbletimer == 30 && (sprite_index == spr_board_flower_telegraph || sprite_index == spr_board_flower_telegraph_alt))
    {
        sprite_index = spr_board_flower;
        if (room == room_board_1_sword)
            sprite_index = spr_board_flower_alt;
    }
    if (aggressive == true && hurttimer == 0)
    {
        if (bubbletimer >= 30 || (sprite_index == spr_board_flower_aqua && bubbletimer >= -10))
        {
            bubbletimer = choose(-30, -16, -60);
            if (sprite_index == spr_board_flower_aqua)
                bubbletimer = choose(-30, -20, -40);
            if (slow == true)
                bubbletimer = choose(-100, -125, -110);
            with (instance_create(x + 16, y + 16, obj_board_enemy_pellet))
            {
                depth = other.depth - 1;
                if (other.alt)
                    depth = 100000;
            }
        }
    }
}
