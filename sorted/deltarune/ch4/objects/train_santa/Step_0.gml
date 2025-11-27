if (state == "init")
{
    if (position == 0)
    {
        var _tower_height = 5;
        for (var i = 1; i < _tower_height; i++)
        {
            var _santa = instance_create_depth(x, y - (i * 10), depth, obj_train_santa);
            _santa.position = i;
        }
    }
    state = "tower";
    image_alpha = 2;
}
else if (state == "tower")
{
    x = xstart + (sin((current_time / 100) + position) * 2);
    if (position == 0)
    {
        var _ground_y = y;
        if (place_meeting(x, y, obj_train_piece_parent))
        {
            snd_play(snd_impact);
            snd_play(snd_fall);
            snd_play_pitch(snd_santa_laugh, random_range(1, 1.5));
            with (obj_train_santa)
            {
                state = "falling";
                hspeed = (position % 2) ? 0.7 : 1.5;
                ground_y = _ground_y;
                vspeed = -5;
                gravity = 0.5;
            }
        }
    }
}
else if (state == "falling")
{
    y = min(y, ground_y);
    if (y >= ground_y && vspeed > 0)
    {
        if (vspeed < 0.5)
        {
            hspeed = 0;
            gravity = 0;
            vspeed = 0;
            snd_play_pitch(snd_santa_laugh_low_energy, 1);
        }
        else
        {
            snd_play_pitch(snd_santa_laugh, random_range(1, 1.5));
            vspeed = -vspeed * 0.7;
        }
    }
    image_alpha -= 0.02;
    if (image_alpha < 0)
        instance_destroy();
}
image_angle -= (hspeed * 10);
