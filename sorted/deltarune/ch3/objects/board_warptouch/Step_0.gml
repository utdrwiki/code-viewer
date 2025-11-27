if (room == room_dw_puzzlecloset_3)
    active = true;
if (active)
{
    var triggered = false;
    var char;
    if (place_meeting(x, y, obj_mainchara_board))
    {
        char = instance_place(x, y, obj_mainchara_board);
        if (char.name == "kris")
            triggered = true;
        if (i_ex(char) && room == room_dw_puzzlecloset_3)
            triggered = true;
        if (room != room_board_1)
        {
            if (char.cantleave == false && char.controlled == false)
                triggered = true;
        }
    }
    if (triggered == true && obj_board_camera.con == 0)
    {
        if (facing != -1)
        {
            with (char)
                scr_delay_var("facing", other.facing, 15);
        }
        if (!i_ex(obj_board_transition))
        {
            if (audio_exists(playsound))
                snd_play(playsound);
        }
        with (obj_board_camera)
        {
            shift = "warp";
            warpx = other.warpx;
            warpy = other.warpy;
            playerX = other.playerX;
            playerY = other.playerY;
            global.interact = 1;
        }
    }
}
