if (con == 0)
{
    var cont = 0;
    var bell = 0;
    with (obj_bell_small_playable)
    {
        if (extflag == "treasure")
        {
            if (rung == true && con == 0)
            {
                cont = 1;
                bell = id;
            }
        }
    }
    if (cont == 1)
    {
        con = 1;
        snd_play(snd_won);
        treasure = instance_create(bell.x - 20, bell.y + 8, obj_treasure_room);
        treasure.depth = bell.depth + 1;
        scr_darksize(treasure);
        treasure.gravity = 0.7;
        scr_limitval_upper(treasure, "y", 1732);
    }
}
if (con == 1)
{
    if (treasure.y >= 1732)
    {
        treasure.gravity = 0;
        treasure.vspeed = 0;
        snd_play(snd_impact);
        con = 2;
    }
}
