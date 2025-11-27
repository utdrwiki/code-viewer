if (createdwall == false && (obj_mainchara_board.y < board_tiley(6) && obj_mainchara_board.y > board_tiley(1)))
{
    createdwall = true;
    wall = instance_create(board_tilex(5), board_tiley(0), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_up_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(6), board_tiley(0), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_up_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(5), board_tiley(7), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_down_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    wall = instance_create(board_tilex(6), board_tiley(7), obj_board_icepuzzle_wall);
    wall.sprite_index = spr_board_door_down_glacier;
    wall.image_xscale = 2;
    wall.image_yscale = 2;
    wall.image_speed = 0.5;
    snd_stop(snd_board_door_close);
    snd_play_pitch(snd_board_door_close, 1.2);
    instance_create(x, y, obj_shake);
}
