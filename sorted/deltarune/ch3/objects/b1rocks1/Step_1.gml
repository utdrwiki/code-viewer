if (npcwalk == 2)
{
    var splat = false;
    with (ralsei)
    {
        if (place_meeting(x, y, obj_board_boulder))
            splat = true;
    }
    ralsei.iframes = 2;
    if (rahit == 0 && splat == true)
    {
        snd_play(snd_splat);
        rahit = 1;
        ralsei.iframes = 180;
        ralsei.visible = false;
        splatmarker = instance_create(round(ralsei.x / 2) * 2, round(ralsei.y / 2) * 2, obj_board_splattered_ralsei);
        splatmarker.splatside = splatside;
        ralseiwashit = 1;
        var ratalk = stringsetloc("Oops.", "obj_b1rocks1_slash_Step_1_gml_19_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
        npcwalk = 3;
        npcwalktimer = 0;
    }
}
