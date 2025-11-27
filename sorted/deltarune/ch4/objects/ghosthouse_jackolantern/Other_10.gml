with (obj_your_tutu)
{
    if (vanished != 2)
    {
        alarm[0] = -1;
        alarm[1] = -1;
        vanished = -1;
    }
}
with (obj_ghosthouse_trigger)
    active = false;
fully_aggro = true;
direction = scr_at_player(x, y);
path_end();
friction = 0.1;
speed = 6;
