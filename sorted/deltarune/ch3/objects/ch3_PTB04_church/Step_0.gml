if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_kris_run_down);
    c_imagespeed(0.25);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_sel(su);
    c_walkdirect(415, 670, 130);
    c_wait(20);
    c_msgside("top");
    c_msgzurasu(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* Down here^1, past the church!!/%", "obj_ch3_PTB04_church_slash_Step_0_gml_43_0");
    c_talk();
    c_wait(1);
    c_pannable(1);
    c_panspeed(0, 5, 60);
    c_wait(120);
    c_wait_talk();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(31);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 3;
    global.entrance = 5;
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_town_shelter);
    con = 99;
}
