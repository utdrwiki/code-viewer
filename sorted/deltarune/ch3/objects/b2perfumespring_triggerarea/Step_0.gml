if (active)
{
    buffer--;
    if (myinteract == 3)
    {
        myinteract = 4;
        global.interact = 1;
        scr_boardlancer_voice();
        msgsetloc(0, "COME ON IN^1! THIS FRESH AND FRUITY JAMBOREE WILL HEAL YOUR HP!/%", "obj_b2perfumespring_triggerarea_slash_Step_0_gml_12_0");
        bw_make();
    }
    if (myinteract == 4 && !bw_ex())
    {
        myinteract = 0;
        global.interact = 0;
        buffer = 3;
    }
    var _blocked = 0;
    if (bw_ex() || i_ex(obj_board_playercamera))
        _blocked = 1;
    timer++;
    if ((timer % 15) == 0 && !bw_ex() && global.interact == 0 && !_blocked)
    {
        var sauce = -4;
        with (obj_board_trigger)
        {
            if (extflag == "b2inthesauce")
                sauce = id;
        }
        var dosound = false;
        with (obj_mainchara_board)
        {
            if (place_meeting(x, y, obj_b2perfumespring_triggerarea) || place_meeting(x, y, sauce))
            {
                if (stink == 1)
                    stink = 0;
                dosound = true;
                myhealth += 3;
            }
        }
        if (dosound)
        {
            snd_stop(snd_power);
            snd_play(snd_power);
        }
    }
}
