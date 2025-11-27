if (battle_ready)
{
    var trig = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "watercooler")
        {
            if (place_meeting(x, y, obj_mainchara) || myinteract == 3)
            {
                other.des = id;
                trig = true;
            }
        }
    }
    if (trig)
    {
        scr_tempsave();
        battle_ready = false;
        watercon = 1;
    }
}
if (watercon == 1)
{
    watertimer++;
    if (watertimer == 1)
    {
        snd_play_x(snd_b, 1, 0.8);
        with (watercooler)
        {
            excl = instance_create(x + 20, y - 24, obj_excblcon);
            scr_doom(excl, 20);
        }
        global.interact = 1;
    }
    if (watertimer == 35)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 8, 1, 1.1);
    }
    if (watertimer == 65)
    {
        watercooler.depth = -1;
        encounterno = 139;
        encounterflag = 587;
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, watercooler);
        watercon = 2;
        watertimer = 0;
        create_crater();
        scr_delay_var("cleanup", 1, 120);
    }
}
if (cleanup == 1)
{
    cleanup = 0;
    with (obj_trigger_interact)
        instance_destroy();
}
if (watercon == 2 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        watercon = -1;
        scr_flag_set(1188, global.flag[50]);
    }
}
if (con == 1 && !d_ex() && global.interact == 0)
{
    con = 2;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a crater...)/%", "obj_room_ranking_c_slash_Step_0_gml_93_0");
    var _d = d_make();
    _d.stay = 5;
}
if (con == 2 && !d_ex())
{
    con = 3;
    scr_speaker("no_name");
    msgsetloc(0, "* (Inside was 200 POINTs!)/%", "obj_room_ranking_c_slash_Step_0_gml_103_0");
    var _d = d_make();
    _d.stay = 5;
    scr_var_delay("con", 4, 1);
    display = instance_create(0, 0, obj_dw_points_fake_ui);
    with (display)
        display_points(200);
}
if (con == 4 && !d_ex())
{
    con = 5;
    snd_play(snd_item);
    with (display)
        show_point_increase();
    scr_speaker("no_name");
    msgsetloc(0, "* (200 POINTs was added to your SCORE.)/%", "obj_room_ranking_c_slash_Step_0_gml_122_0");
    d_make();
    scr_var_delay("con", 6, 1);
}
if (con == 6 && !d_ex() && i_ex(display) && !display.increase_points)
{
    con = 0;
    global.interact = 0;
    scr_flag_set(1221, 1);
    with (display)
        instance_destroy();
}
