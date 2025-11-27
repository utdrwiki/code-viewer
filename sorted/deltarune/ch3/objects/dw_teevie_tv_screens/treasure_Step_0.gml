if (init == 0)
{
    for (var i = 0; i < width; i++)
    {
        var tile_x = i;
        for (var j = 0; j < height; j++)
        {
            var tile_y = j;
            var is_animated = !(tile_x == 3 && tile_y == 2);
            var new_screen = new scr_teevie_screen(new Vector2(tile_x, tile_y));
            new_screen.init();
            if (!is_animated)
                new_screen.disable_animation();
            _screen_list[array_length(_screen_list)] = new_screen;
        }
    }
    init = 1;
}
for (var i = 0; i < array_length(_screen_list); i++)
{
    var screen = _screen_list[i];
    var screencon = screen.get_screen_con();
    if (mode == 0)
    {
        if (screencon == 0)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 8) == 0)
            {
                if (screen.get_screen_offset() == 0)
                    screen.set_screen_offset(1);
                else
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 1)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 2) == 0)
            {
                if (screen.get_screen_offset() == 0)
                    screen.set_screen_offset(1);
                else
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 15)
            {
                var random_timer = -100 + floor(random(100));
                screen.set_screen_timer(random_timer);
                screen.set_screen_con(0);
                screen.set_screen_sprite(spr_dw_teevie_tv_shows);
                screen.set_screen();
            }
        }
        else if (screencon == 2)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 4) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 4)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 3)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 4) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 11)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 4)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 4) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 4)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 5)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 4) == 0)
            {
                var offset = screen.get_screen_offset();
                if (offset < 7)
                    screen.set_screen_offset(offset + 1);
            }
            if (abs(screen.get_screen_timer()) >= 20)
                screen.set_static();
        }
        else if (screencon == 6)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 4) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 4)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 7)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 6) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 2)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 8)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 6) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 2)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
        else if (screencon == 9)
        {
            if (screen.is_animated())
                screen.increment_screen_timer();
            if ((abs(screen.get_screen_timer()) % 6) == 0)
            {
                var offset = screen.get_screen_offset();
                screen.set_screen_offset(offset + 1);
                if (screen.get_screen_offset() == 2)
                    screen.set_screen_offset(0);
            }
            if (abs(screen.get_screen_timer()) >= 120)
                screen.set_static();
        }
    }
}
if (treasure_sequence)
{
    treasure_timer++;
    if (global.interact == 0)
    {
        global.interact = 1;
        scr_shakescreen();
        snd_play(snd_closet_impact);
        show_treasure();
    }
    if (treasure_timer >= 20)
    {
        global.interact = 0;
        treasure_sequence = false;
        treasure_timer = 0;
    }
}
