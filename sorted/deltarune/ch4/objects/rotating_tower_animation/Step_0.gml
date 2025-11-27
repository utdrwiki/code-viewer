if (con == 2)
{
    timer++;
    var frame = floor(min(frame_count - 1, timer / animation_speed));
    if (frame != last_frame)
        advance_frame(frame);
    if ((timer % 20) == 1)
        snd_play(snd_rumble, 0.3);
    obj_rotating_tower_controller_new.tower_xshake = ((floor(timer / 2) % 2) * 2) - 1;
    last_frame = frame;
    if (last_frame == (frame_count - 1))
    {
        con = 3;
        obj_rotating_tower_controller_new.tower_xshake = 0;
    }
}
