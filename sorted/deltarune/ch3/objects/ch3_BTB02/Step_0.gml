if (con == 0 && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(1940, 240, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_grasp;
    te_actor.preset = 0;
    c_sel(te);
    c_tenna_preset(11);
    c_pannable(1);
    c_pan(camerax(), -40, 12);
    c_sel(kr);
    if (kr_actor.y > 190)
    {
        c_walkdirect_speed(kr_actor.x, 190, 6);
        c_delaywalkdirect(7, dustpile.x + 30, 190, 12);
    }
    else
    {
        c_walkdirect(dustpile.x + 30, 190, 12);
    }
    c_sel(su);
    if (su_actor.y > 182)
    {
        c_walkdirect(su_actor.x, 182, 8);
        c_delaywalkdirect(9, dustpile.x + 30, 183, 12);
    }
    else
    {
        c_walkdirect(dustpile.x + 30, 183, 18);
    }
    c_sel(ra);
    if (ra_actor.y > 190)
    {
        c_walkdirect(ra_actor.x, 190, 14);
        c_delaywalkdirect(15, dustpile.x + 30, 190, 12);
    }
    else
    {
        c_walkdirect(dustpile.x + 30, 190, 22);
    }
    c_wait(30);
    c_pannable(1);
    c_pan(1440, -40, 70);
    c_wait(71);
    c_msgside("bottom");
    c_sel(te);
    c_tenna_preset(11);
    c_speaker("tenna");
    c_msgsetloc(0, "* L-look everyone!^1! It'll be fine!^1! I'm cutting edge!^1! I'm new!^1! I'm TV!!!/%", "obj_ch3_BTB02_slash_Step_0_gml_44_0");
    c_talk_wait();
    c_tenna_preset(10);
    c_sel(te);
    c_sprite(spr_tenna_dance_cane);
    c_imagespeed(1);
    c_speaker("tenna");
    c_msgsetloc(0, "* Three-colors^1, cathode raytube!^1! Make you laugh^1, make you cry!^1!/", "obj_ch3_BTB02_slash_Step_0_gml_54_0");
    c_msgnextloc("* Entertainment that never gets old!!/%", "obj_ch3_BTB02_slash_Step_0_gml_88_0_b");
    c_talk_wait();
    c_var_instance(id, "staff_leave", true);
    c_var_instance(id, "staff_leave_loop", true);
    c_var_lerp_instance(te_actor, "image_speed", 1, 2, 60);
    c_wait(60);
    c_var_instance(id, "staff_leave_loop", false);
    c_wait_if(id, "staff_leave", "=", false);
    c_sel(te);
    c_halt();
    c_tenna_sprite(spr_tenna_desperate);
    c_imageindex(1);
    c_tenna_preset(9);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* H-hey^1, stop!^1! Don't go...!!/%", "obj_ch3_BTB02_slash_Step_0_gml_75_0");
    c_talk_wait();
    c_speaker("tenna");
    c_tenna_sprite(spr_tenna_grasp_anim);
    c_tenna_preset(12);
    c_msgsetloc(0, "* Darnit^1, this is all that little spammy MAILMAN'S fault!!/%", "obj_ch3_BTB02_slash_Step_0_gml_83_0");
    c_talk_wait();
    c_tenna_preset(13);
    c_sprite(spr_tenna_grasp_anim_b);
    c_imagespeed(0.5);
    c_msgsetloc(0, "* He..^1. he told me he was gonna teach me how to use technology!!/%", "obj_ch3_BTB02_slash_Step_0_gml_88_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_preset(15);
    c_tenna_sprite(spr_tenna_evil);
    c_var_instance(te_actor, "xscale", -2);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* H..^1. How to plug in and make^1! It^1! BIG...!/%", "obj_ch3_BTB02_slash_Step_0_gml_100_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_evil);
    c_var_instance(te_actor, "xscale", 2);
    c_tenna_preset(15);
    c_shakeobj();
    c_msgsetloc(0, "* And where is HE!?/%", "obj_ch3_BTB02_slash_Step_0_gml_106_0");
    c_talk_wait();
    c_var_instance(id, "staff_leave", true);
    c_var_instance(id, "staff_leave_loop", true);
    c_speaker("tenna");
    c_tenna_preset(12);
    c_msgsetloc(0, "* Arrrgh^1, if I could get my hands on.../%", "obj_ch3_BTB02_slash_Step_0_gml_115_0");
    c_talk_wait();
    c_imagespeed(0);
    c_tenna_sprite(spr_tenna_desperate);
    c_imageindex(0);
    c_tenna_preset(9);
    c_msgsetloc(0, "* Wait^1, where are you going!?/%", "obj_ch3_BTB02_slash_Step_0_gml_123_0");
    c_talk_wait();
    c_sel(te);
    c_halt();
    c_tenna_sprite(spr_tenna_desperate);
    c_imageindex(1);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* Stop!^1! Help me!^1! Help!!/%", "obj_ch3_BTB02_slash_Step_0_gml_134_0");
    c_talk_wait();
    c_wait_if(id, "staff_leave", "=", false);
    c_sel(te);
    c_tenna_preset(13);
    c_wait(1);
    c_var_instance(te_actor, "wobbleamt", 10);
    c_var_instance(te_actor, "wobbletime", 2);
    c_var_instance(te_actor, "wobblestate", 10);
    c_tenna_sprite(spr_tenna_grasp_c);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* Does anyone know what an e-mail is???/%", "obj_ch3_BTB02_slash_Step_0_gml_149_0");
    c_talk_wait();
    c_var_instance(id, "staff_cleanup", true);
    c_pan(1157, -40, 60);
    c_wait(75);
    c_pan(1219, 0, 40);
    c_sel(kr);
    c_walkdirect(dustpile.x + 240, 199, 40);
    c_sel(su);
    c_delaywalkdirect(12, dustpile.x + 180, 183, 30);
    c_sel(ra);
    c_delaywalkdirect(18, dustpile.x + 140, 189, 30);
    c_wait(50);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    with (obj_mainchara)
        cutscene = 0;
    global.interact = 0;
    global.facing = 0;
    global.plot = 270;
    if (global.tempflag[90] != 0)
        global.tempflag[90] = 0;
    with (dustpile_block)
        instance_destroy();
    with (dustpile_readable)
        instance_destroy();
    con = 99;
}
if (staff_leave)
{
    staff_leave_timer++;
    if (staff_leave_timer == 1)
    {
        with (staff_markers[staff_index])
            scr_flip("x");
    }
    if (staff_leave_timer == 15)
    {
        with (staff_markers[staff_index])
            scr_lerpvar("x", x, camerax() - 200, 60);
    }
    if (staff_leave_timer == 30)
    {
        staff_index++;
        staff_leave_timer = 0;
        if (staff_leave_loop)
        {
            if (staff_index >= array_length_1d(staff_markers))
                staff_leave = false;
        }
        else
        {
            staff_leave = false;
        }
    }
}
if (staff_cleanup)
{
    staff_cleanup = false;
    camenary_hover = false;
    var i = array_length_1d(staff_markers) - 1;
    while (i >= 0)
    {
        with (staff_markers[i])
            instance_destroy();
        i--;
    }
}
