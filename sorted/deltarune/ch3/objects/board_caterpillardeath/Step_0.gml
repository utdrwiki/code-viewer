if (init == 0)
{
    init = 1;
    if (name == "ralsei")
    {
        usprite = spr_board_ralsei_walk_up;
        dsprite = spr_board_ralsei_walk_down;
        lsprite = spr_board_ralsei_walk_left;
        rsprite = spr_board_ralsei_walk_right;
    }
    if (name == "kris")
    {
        usprite = spr_board_kris_walk_up;
        dsprite = spr_board_kris_walk_down;
        lsprite = spr_board_kris_walk_left;
        rsprite = spr_board_kris_walk_right;
    }
    if (forcedDirection == -1)
        direction = irandom(4) * 90;
    snd_play_pitch(snd_fall, 0.6);
    speed = 2;
    friction = -1;
}
if (x < 0 || x > 640 || y < 0 || y > room_height)
    instance_destroy();
timer++;
facing++;
if (facing > 3)
    facing = 0;
switch (facing)
{
    case 0:
        sprite_index = dsprite;
        break;
    case 1:
        sprite_index = rsprite;
        break;
    case 2:
        sprite_index = usprite;
        break;
    case 3:
        sprite_index = lsprite;
        break;
}
