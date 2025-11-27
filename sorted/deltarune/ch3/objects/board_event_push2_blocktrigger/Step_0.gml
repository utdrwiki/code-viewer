if (place_meeting(x, y, obj_pushableblock_board))
{
    var mycount = instance_number(object_index);
    snd_play_pitch(snd_coin, 1.5 - (mycount / 8));
    instance_destroy();
}
