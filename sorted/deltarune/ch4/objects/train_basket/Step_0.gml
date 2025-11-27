if (hit)
    exit;
if (place_meeting(x, y, obj_train_piece_parent))
{
    hit = true;
    snd_play(snd_impact);
    with (ball1)
    {
        depth = -11;
        fall_x = x - 20;
        fall_y = y + 15;
        fall_height = 10;
        fall_duration = 16;
        falling = true;
    }
    with (ball2)
    {
        depth = -11;
        fall_x = x + 10;
        fall_y = y + 20;
        fall_height = 10;
        fall_duration = 12;
        falling = true;
    }
    with (ball3)
    {
        depth = -11;
        fall_x = x;
        fall_y = y + 50;
        fall_height = 20;
        fall_duration = 20;
        falling = true;
    }
}
