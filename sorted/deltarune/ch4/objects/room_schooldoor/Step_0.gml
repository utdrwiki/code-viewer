if (global.chapter == 4)
{
    if (con == 0 && !d_ex() && global.interact == 0)
    {
        con = 1;
        global.interact = 1;
        snd_play(snd_locker);
        with (obj_darkdoor)
            image_index = 1;
        door_cover = scr_marker(280, cameray(), spr_pixel_white);
        door_cover.image_xscale = 15;
        door_cover.image_yscale = 15;
        door_cover.image_blend = c_black;
        wall_cover = scr_marker(280, 60, spr_pixel_white);
        wall_cover.image_xscale = 15;
        wall_cover.image_yscale = 15;
        wall_cover.image_blend = c_black;
        with (wall_cover)
            scr_depth();
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_mus2("volume", 0, 30);
        tv = actor_count + 1;
        tv_actor = instance_create(300, cameray() - 200, obj_actor);
        scr_actor_setup(tv, tv_actor, "tv");
        tv_actor.sprite_index = spr_tv_broken_no_stand;
        c_sel(tv);
        c_autodepth(0);
    }
    if (con == 1)
    {
        con = 5;
        alarm[0] = 1;
        global.facing = 2;
        with (obj_caterpillarchara)
        {
            fun = 1;
            sprite_index = usprite;
            image_index = 0;
        }
        c_sel(kr);
        c_walkdirect(285, 93, 6);
        c_sel(su);
        c_walkdirect_wait(313, 87, 6);
        c_facing("u");
        c_sel(kr);
        c_facing("u");
        c_pannable(1);
        c_pan(151, 0, 6);
        c_wait(15);
        c_sel(su);
        c_facing("l");
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* Kris^1! Wait a sec^1! Let's go get Tenna!/%", "obj_room_schooldoor_slash_Step_0_gml_73_0");
        c_talk_wait();
        c_sel(kr);
        c_facing("d");
        c_sel(su);
        c_walkdirect_wait(295, 290, 30);
        c_sel(tv);
        c_setxy(290, 240);
        c_stickto(su_actor, -10);
        c_wait(60);
        c_sel(su);
        c_walkdirect_wait(295, 108, 30);
        c_wait(5);
        c_sel(tv);
        c_stickto_stop();
        c_autowalk(0);
        c_sound_play(snd_wing);
        c_walkdirect_wait(290, 12, 5);
        c_wait(10);
        c_sel(su);
        c_walkdirect_wait(313, 86, 10);
        c_facing("u");
        c_sel(kr);
        c_facing("u");
        c_sel(tv);
        c_visible(0);
        c_var_instance(door_cover, "visible", 0);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Alright^1, let's go!/%", "obj_room_schooldoor_slash_Step_0_gml_114_0");
        c_talk_wait();
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    if (con == 6 && !i_ex(obj_cutscene_master))
    {
        con = 99;
        with (door_cover)
            instance_destroy();
        with (obj_caterpillarchara)
        {
            fun = 1;
            sprite_index = usprite;
        }
        with (obj_mainchara)
            cutscene = 1;
        if (instance_exists(obj_caterpillarchara))
        {
            with (obj_caterpillarchara)
                instance_destroy();
        }
        with (obj_dw_transition_interactable)
        {
            myinteract = 1;
            global.interact = 1;
            con = 3;
        }
        with (obj_border_controller)
            hide_border(0.025);
    }
}
