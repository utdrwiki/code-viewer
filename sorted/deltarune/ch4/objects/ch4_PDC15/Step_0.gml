if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (open_fence)
{
    open_fence = false;
    if (i_ex(obj_noellehouse_fence))
    {
        with (obj_noellehouse_fence)
            open_fence = true;
    }
}
if (close_fence)
{
    close_fence = false;
    if (i_ex(obj_noellehouse_fence))
    {
        with (obj_noellehouse_fence)
            close_fence = true;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_pan(140, 0, 70);
    c_sel(kr);
    c_setxy(190, 138);
    c_walkdirect(313, 138, 70);
    c_sel(su);
    c_facing("susieunhappy");
    c_setxy(155, 132);
    c_delaywalkdirect(10, 279, 132, 70);
    c_wait(40);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(90);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. well^1, what the hell do we do now?/%", "obj_ch4_PDC15_slash_Step_0_gml_60_0");
    c_talk_wait();
    c_var_instance(id, "rain_start", true);
    c_wait(80);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_look_up);
    c_halt();
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* ..^1. great. Now it's raining./", "obj_ch4_PDC15_slash_Step_0_gml_76_0");
    c_msgnextloc("\\E1* Least your house is close. Let's go./%", "obj_ch4_PDC15_slash_Step_0_gml_77_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_facing("u");
    c_wait_talk();
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
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
    with (obj_noellehouse_fence)
        hide_fence = true;
    con = 99;
}
if (rain_start)
{
    rain_start = false;
    global.plot = 100;
    with (obj_border_controller)
        set_custom_effect(2);
    instance_create(0, 0, obj_lw_rain_effect);
}
