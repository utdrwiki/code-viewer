if (used == false)
{
    if (place_meeting(x, y, obj_mainchara_board) || place_meeting(x, y, obj_board_enemy_black_deer))
        pressed = 1;
    else
        pressed = 0;
}
else
{
    exit;
}
if (pressed)
{
    if (pressinit == 0)
        snd_play_pitch(snd_noise, 1.4);
    pressinit = 1;
    var a = 0;
    for (var i = 0; i < instance_number(obj_board_dungeon3_switch); i++)
    {
        button[i] = instance_find(obj_board_dungeon3_switch, i);
        if (button[i].pressed == true)
            a++;
    }
    if (a == 2 && used == false)
    {
        with (obj_board_dungeon3_switch)
            used = true;
        with (obj_board_puzzle_wall)
            instance_destroy();
        obj_mainchara_board.controlled = false;
        with (obj_board_enemy_black_deer)
        {
            abouttoregaincontrol = true;
            hp = 1;
            maxhp = 1;
        }
        instance_create(x, y, obj_shake);
        snd_play(snd_impact);
        wall = instance_create(board_tilex(0), board_tiley(3), obj_board_puzzle_wall);
        wall.sprite_index = spr_board_door_right;
        wall.image_xscale = 2;
        wall.image_yscale = 2;
        wall.image_speed = 0.5;
        wall = instance_create(board_tilex(0), board_tiley(4), obj_board_puzzle_wall);
        wall.sprite_index = spr_board_door_right;
        wall.image_xscale = 2;
        wall.image_yscale = 2;
        wall.image_speed = 0.5;
        with (obj_board_puzzle_wall)
            scr_depth_board();
    }
}
else
{
    if (pressinit == 1)
        snd_play_pitch(snd_noise, 1.1);
    pressinit = 0;
}
