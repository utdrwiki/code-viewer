if (createdwall == false && obj_mainchara_board.x < board_tiley(12))
{
    createdwall = true;
    wall = instance_create(board_tilex(0), board_tiley(2), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_left_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(0), board_tiley(3), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_left_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(0), board_tiley(4), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_left_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(0), board_tiley(5), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_left_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    snd_stop(snd_board_door_close);
    snd_play_pitch(snd_board_door_close, 1.2);
    instance_create(x, y, obj_shake);
}
