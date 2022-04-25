ossafe_game_end_ch1 = function() //gml_Script_ossafe_game_end_ch1
{
    if (!global.is_console)
        game_end()
    else
        game_restart()
    return;
}

