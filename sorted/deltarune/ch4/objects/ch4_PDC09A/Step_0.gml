if (dess_blocker && global.plot >= 60)
{
    dess_blocker = false;
    with (dess_collider)
        instance_destroy();
}
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    if (obj_mainchara.y > 400)
    {
        if (obj_mainchara.x > 600)
        {
            with (obj_homealone_dancing_santa)
            {
                if (x > 710 && y >= 450)
                    alarm[0] = 1;
            }
        }
        else
        {
            with (obj_homealone_dancing_santa)
            {
                if (x > 150 && x < 170 && y >= 450)
                    alarm[0] = 1;
            }
        }
    }
    else
    {
        with (obj_homealone_dancing_santa)
        {
            if (x > 460 && x < 480 && y > 300)
                alarm[0] = 1;
        }
    }
}
if (con == 2)
{
    con = 3;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(no);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_wait(10);
    var small_text = stringsetloc("My, mom collects them...", "obj_ch4_PDC09A_slash_Step_0_gml_64_0");
    scr_smallface(0, "noelle", 4, 370, 224, small_text);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Hahaha!!^1! What the heck is this!?\\f0/%", "obj_ch4_PDC09A_slash_Step_0_gml_66_0");
    c_talk_wait();
    c_wait(90);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Okay. How the hell do you turn it off./", "obj_ch4_PDC09A_slash_Step_0_gml_73_0");
    c_facenext("noelle", "2");
    c_msgnextloc("\\E2* Umm^1, just hold down the button!/", "obj_ch4_PDC09A_slash_Step_0_gml_75_0");
    c_msgnextloc("\\E4* Though^1, for some weird reason^1, turning it off takes power?/", "obj_ch4_PDC09A_slash_Step_0_gml_76_0");
    c_msgnextloc("\\E3* So it takes forever on the low battery ones^1, faha./%", "obj_ch4_PDC09A_slash_Step_0_gml_77_0");
    c_talk_wait();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 55;
    con = 99;
    scr_flag_set(726, 1);
    if (obj_mainchara.x > 600)
    {
        with (obj_homealone_dancing_santa)
        {
            if (x > 710 && y >= 450)
                alarm[0] = 1;
        }
    }
    else
    {
        with (obj_homealone_dancing_santa)
        {
            if (x > 420 && x < 600 && y >= 440)
                alarm[0] = 1;
        }
    }
}
if (con == 10 && global.interact == 0)
{
    con = 11;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EB* What is this^1, a tennis ball machine?/", "obj_ch4_PDC09A_slash_Step_0_gml_137_0");
    c_facenext("noelle", 4);
    c_msgnextloc("\\E4* Close^1! It's a holiday treat launcher with automatic scheduling!/", "obj_ch4_PDC09A_slash_Step_0_gml_139_0");
    c_msgnextloc("\\E0* Just one click^1, and.../%", "obj_ch4_PDC09A_slash_Step_0_gml_140_0");
    c_talk_wait();
    c_pannable(1);
    c_pan(camerax(), cameray() - 40, 15);
    c_var_instance(id, "launch_treat", true);
    c_wait(60);
    c_pan(camerax(), cameray(), 15);
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EJ* Just goes to show you my dad's sense of humor^1, faha.../%", "obj_ch4_PDC09A_slash_Step_0_gml_154_0");
    c_talk_wait();
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 11 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    con = 99;
    scr_flag_set(728, 1);
}
if (launch_treat)
{
    launch_treat = false;
    with (obj_homealone_treat_launcher)
        shoot_treat = true;
}
if (con == 20 && !d_ex() && global.interact == 0)
{
    con = 21;
    global.interact = 1;
    scr_speaker("susie");
    msgsetloc(0, "\\EK* ..^1. what the heck is this?/", "obj_ch4_PDC09A_slash_Step_0_gml_191_0");
    scr_anyface_next("noelle", 8);
    msgnextloc("\\E8* Um^1, it's a..^1. holiday treat catcher^1! ..^1. you know?/%", "obj_ch4_PDC09A_slash_Step_0_gml_193_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 21 && !d_ex())
{
    con = 22;
    global.typer = 23;
    msgsetloc(0, "\\EH* ..^1. anyone want to tell me it's normal to have one? Nobody...?/%", "obj_ch4_PDC09A_slash_Step_0_gml_204_0");
    d_make();
}
if (con == 22 && !d_ex())
{
    con = 99;
    global.interact = 0;
    global.facing = 0;
}
