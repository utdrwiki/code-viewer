if (convo_type == 1)
{
    if (con == 0)
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
    }
    if (con == 2)
    {
        con = 3;
        alarm[0] = 30;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sel(kr);
        c_setxy(200, 70);
        c_walkdirect(200, 77, 15);
        c_sel(su);
        c_setxy(218, 63);
        c_facing("susieunhappy");
        c_walkdirect(218, 71, 15);
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
        c_wait(30);
        c_sel(kr);
        c_facing("r");
        c_sel(su);
        c_facing("l");
        c_msgside("bottom");
        c_speaker("susie");
        c_msgsetloc(0, "\\ED* (..^1. damn. His arm got toasted in the Dark World^1, and now...)/", "obj_room_town_hospital_hallway_slash_Step_0_gml_42_0");
        c_msgnextloc("\\EV* (Kris^1, what are we gonna do?)/", "obj_room_town_hospital_hallway_slash_Step_0_gml_43_0");
        c_msgnextloc("\\EV* (Maybe if we healed him him in the Dark World^1, his arm would...)/", "obj_room_town_hospital_hallway_slash_Step_0_gml_44_0");
        c_msgnextloc("\\E6* (Wait^1! We can't show BERDLY our Dark World..^1. can we?)/", "obj_room_town_hospital_hallway_slash_Step_0_gml_45_0");
        c_msgnextloc("\\E0* (..^1. let's just..^1. see if he gets better. For now.)/%", "obj_room_town_hospital_hallway_slash_Step_0_gml_46_0");
        c_talk_wait();
        c_sel(kr);
        c_facing("d");
        c_sel(su);
        c_facing("d");
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 4 && !i_ex(obj_cutscene_master))
    {
        scr_flag_set(758, 1);
        global.interact = 0;
        global.facing = 0;
        con = 99;
    }
}
if (convo_type == 2)
{
    if (con < 0)
    {
        var start_convo = false;
        with (obj_mainchara)
        {
            if (scr_trigcheck("berdlycheck"))
                start_convo = true;
        }
        con = start_convo ? 0 : -1;
    }
    if (con == 0)
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
        with (obj_caterpillarchara)
            follow = 0;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sel(kr);
        c_facing("u");
        c_sel(su);
        c_facing("u");
        c_speaker("susie");
        c_msgsetloc(0, "\\E1* What? You wanna go in by yourself? ..^1. whatever./%", "obj_room_town_hospital_hallway_slash_Step_0_gml_108_0");
        c_talk_wait();
        c_var_lerp_instance(blackall, "image_alpha", 0, 1, 10);
        c_wait(10);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 2 && !i_ex(obj_cutscene_master))
    {
        scr_flag_set(759, 1);
        global.interact = 3;
        con = 99;
        global.entrance = 3;
        instance_create(0, 0, obj_persistentfadein);
        room_goto(room_hospital_room2);
    }
}
if (convo_type == 3)
{
    if (con == 0)
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
    }
    if (con == 2)
    {
        con = 3;
        alarm[0] = 30;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_sel(kr);
        c_setxy(200, 70);
        c_walkdirect(200, 77, 15);
        c_sel(su);
        c_setxy(218, 71);
        c_facing("u");
        c_var_lerp_instance(blackall, "image_alpha", 1, 0, 15);
        c_wait(15);
        c_sel(su);
        c_facing("l");
        c_sel(kr);
        c_facing("r");
        c_wait(15);
        c_msgside("bottom");
        c_speaker("susie");
        c_msgsetloc(0, "\\E0* ..^1. Berdly's in there^1, right?/", "obj_room_town_hospital_hallway_slash_Step_0_gml_174_0");
        c_msgnextloc("\\E2* Heh. Don't give me bird flu or whatever he has./%", "obj_room_town_hospital_hallway_slash_Step_0_gml_175_0");
        c_talk_wait();
        c_sel(kr);
        c_facing("d");
        c_sel(su);
        c_facing("d");
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 4 && !i_ex(obj_cutscene_master))
    {
        scr_flag_set(759, 2);
        global.interact = 0;
        global.facing = 0;
        con = 99;
    }
}
