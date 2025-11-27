scr_populatechars();
if (!init)
{
    var pos = scr_heromarker(undefined, "prop3");
    prophecy3 = instance_create(scr_even(pos[0] + 150), scr_even(pos[1] + 90), obj_dw_church_prophecy);
    prophecy3.extflag = "boss3";
    init = 1;
}
if (global.fighting == 1)
    domake = false;
array_push(plspeed, obj_mainchara.px);
if (array_length(plspeed) > 8)
    array_delete(plspeed, 0, 1);
var plspeedavg = 0;
for (var i = 0; i < array_length(plspeed); i++)
    plspeedavg += plspeed[i];
plspeedavg = plspeedavg / array_length(plspeed);
if (battlecon == 0 && domake)
{
    var trig = 0;
    var _dir = 0;
    with (obj_trigger)
    {
        if (scr_trigcheck("encounter"))
        {
            trig = 1;
            if (obj_mainchara.x < (bbox_left + (sprite_width / 2)))
                _dir = 1;
            else
                _dir = 0;
        }
    }
    if (trig == 1)
    {
        if (global.flag[encounterflag] != 0)
            _dir = !_dir;
        var xloc = scr_genmarker("left").x;
        if (_dir == 1)
            xloc = scr_genmarker("right").x;
        with (instance_create(xloc, cameray(), obj_encounter_incenseturtle))
        {
            depth = layer_get_depth("PILLARS_FG") + 1;
            dir = !_dir;
            encounterno = other.encounterno;
            encounterflag = other.encounterflag;
        }
        battletimer = 200;
        battlecon = 1;
    }
}
if (battlecon == 1)
{
    if (global.interact == 0)
        battletimer--;
    if (battletimer <= 0)
        battlecon = 0;
}
with (pillarnpc)
{
    var gotegg = global.flag[931];
    if (myinteract == 3)
    {
        makedoor = false;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_89_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_90_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* Treasure? There is no treasure..^1. only experience./", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_95_0");
        msgnextloc("* The other side of your mind..^1. did you miss something there?/", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_96_0");
        msgnext("\\C2 ");
        myinteract = 4;
        if (talked || global.flag[1606] > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* We are all liars now. Yes^1, it's fun being a liar./%", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_104_0");
            myinteract = 999;
        }
        d_make();
        talked++;
    }
    if (myinteract == 4 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 1)
        {
            if (gotegg)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* It's absolutely true. Oh^1, sink me^1, the unbeliever. I should be a statue./%", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_121_0");
                global.flag[1606] = 2;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Of course you didn't. There's nothing to miss./", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_127_0");
                msgnextloc("* Those who can't speak the truth are liars./", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_128_0");
                msgnextloc("* And none of us can know the truth now^1, so we're all liars!/", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_129_0");
                msgnextloc("* Look for yourself^1! There's nothing back there^1, is there?/%", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_130_0");
                global.flag[1606] = 1;
                makedoor = true;
            }
        }
        if (global.choice == 0)
        {
            if (gotegg)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Liar^1! Your hands are shining. You took and made^1, took and made./", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_140_0");
                msgnextloc("* Tickets and cards^1, drawn in gray^1, a trace - repeated^1, repeated^1! - it's all so clear!/", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_141_0");
                msgnextloc("* ..^1. though^1, it would be a lie if I said I understood it!/%", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_142_0");
                global.flag[1606] = 2;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* You speak the truth so confidently./", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_148_0");
                msgnextloc("* You are safe now^1, but you have the makings of a liar./%", "obj_dw_churchc_angelprophecy_encounter_slash_Step_0_gml_149_0");
                talked = 0;
            }
        }
        d_make();
        myinteract = 999;
    }
    if (myinteract > 3 && d_ex())
    {
        var trig = 0;
        if (!i_ex(obj_writer))
            trig = 1;
        with (obj_writer)
        {
            if (halt)
                trig = 1;
        }
        if (!trig)
            marker.image_index += 0.25;
    }
    if (myinteract == 999 && !d_ex())
    {
        if (makedoor)
        {
            makedoor = false;
            scr_shakescreen();
            snd_play(snd_locker);
            with (obj_dw_churchc_angelprophecy_encounter)
                event_user(1);
        }
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
propact = scr_trigcheck("propact");
obj_dw_church_prophecy.active = propact;
roomglow.active = propact;
