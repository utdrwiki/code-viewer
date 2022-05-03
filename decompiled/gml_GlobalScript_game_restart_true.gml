game_restart_true = function() //gml_Script_game_restart_true
{
    snd_free_all()
    room_goto(room_restart_true)
    return;
}

