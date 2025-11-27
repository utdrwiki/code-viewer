if (switch_game_screen)
{
    switch_game_screen_timer++;
    if (switch_game_screen_timer == 1)
    {
        with (evaluation_screen)
            show_overlay(8);
    }
    if (switch_game_screen_timer == 9)
    {
        transition_to_state(switch_game_screen_target, 8);
        with (evaluation_screen)
            instance_destroy();
    }
    if (switch_game_screen_timer == 32)
    {
        switch_game_screen = false;
        switch_game_screen_timer = 0;
    }
}
