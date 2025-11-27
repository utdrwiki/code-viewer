if (pause_caterpillar)
{
    if (pause_caterpillar_con == 0)
    {
        pause_caterpillar_con = 1;
        with (obj_mainchara)
        {
            fun = 1;
            sprite_index = dsprite;
            image_index = 0;
        }
        with (obj_caterpillarchara)
        {
            fun = 1;
            sprite_index = dsprite;
            image_index = 0;
        }
    }
    if (pause_caterpillar_con == 1 && !d_ex())
    {
        pause_caterpillar = false;
        pause_caterpillar_con = 0;
        with (obj_mainchara)
            fun = 0;
        with (obj_caterpillarchara)
            fun = 0;
    }
}
if (con < 0)
    exit;
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 20;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    var times_played = scr_flag_get(1034);
    scr_flag_set(1034, times_played + 1);
    c_sel(ra);
    c_autodepth(0);
    c_depth(95110);
    c_walkdirect(494, 250, 20);
    c_delayfacing(21, "d");
    c_delaycmd(25, "soundplay", snd_wing);
    c_delaycmd4(25, "jump", 494, 240, 26, 8);
    c_delaycmd(31, "sprite", spr_ralsei_racing_sit);
    c_delaycmd(36, "sprite", spr_ralsei_racing_watch);
    c_sel(kr);
    c_autodepth(0);
    c_depth(95000);
    c_facing("d");
    c_autowalk(0);
    c_walkdirect(536, 312, 10);
    c_sel(su);
    c_autodepth(0);
    c_depth(95100);
    c_walkdirect_wait(581, 300, 10);
    c_autowalk(0);
    c_sprite(spr_susie_racing_walk);
    c_sound_play(snd_noise);
    c_walk_wait("d", 4, 4);
    c_sel(kr);
    c_sound_play(snd_noise);
    c_walk_wait("d", 4, 4);
    c_sprite(spr_kris_racing_walk);
    c_walk_wait("u", 4, 4);
    c_sel(su);
    c_walk_wait("u", 4, 4);
    c_sel(kr);
    c_imagespeed(0.2);
    c_walkdirect(558, 257, 20);
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect_wait(611, 240, 20);
    c_halt();
    c_sel(kr);
    c_halt();
    c_sel(kr);
    c_sound_play(snd_wing);
    c_jump(554, 240, 26, 8);
    c_delaycmd(9, "sprite", spr_kris_racing_play);
    c_sel(su);
    c_jump(615, 239, 26, 8);
    c_wait(8);
    c_sprite(spr_susie_racing_play);
    c_halt();
    c_wait(5);
    c_imagespeed(0.2);
    c_var_instance(id, "racing_active", true);
    c_waitcustom();
}
if (racing_active && customcon == 1 && !d_ex())
{
    if (racing_game == -4)
    {
        race_won = false;
        racing_kris_moved = 0;
        racing_game = instance_create(0, 0, obj_ch3_green_room_racing_game);
        with (racing_game)
            start_game();
    }
    else
    {
        var _moved = false;
        with (racing_game)
            _moved = player_moved();
        if (_moved)
        {
            kris_move_buffer = 20;
            racing_kris_moved++;
            with (kr_actor)
                image_speed = 0.2;
        }
        else
        {
            with (kr_actor)
            {
                image_index = 0;
                image_speed = 0;
            }
        }
        var race_finish = false;
        if (racing_game.game_won)
        {
            race_won = true;
            race_finish = true;
        }
        if (racing_game.game_lost)
            race_finish = true;
        if (race_finish)
        {
            with (kr_actor)
            {
                image_index = 0;
                image_speed = 0;
            }
            racing_active = false;
            with (racing_game)
                clean_up();
            racing_game = -4;
        }
    }
}
if (con == 20 && customcon == 1 && !racing_active)
{
    con = 21;
    alarm[0] = 30;
    c_wait_if(id, "racing_active", "=", false);
    c_waitcustom_end();
    c_var_instance(id, "customcon", 0);
    c_sel(su);
    c_halt();
    c_sel(su);
    c_sprite(spr_susie_racing_look);
    c_wait(60);
    if (racing_kris_moved == 0)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* ..^1. you've gotta press the buttons^1, dumbass./%", "obj_ch3_green_room_racing_slash_Step_0_gml_187_0");
        c_talk_wait();
    }
    else if (!race_won)
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* Man^1, it's like you're not even looking at the screen./%", "obj_ch3_green_room_racing_slash_Step_0_gml_195_0");
        c_talk_wait();
    }
    else
    {
        scr_flag_set(1035, 1);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E2* Kris^1, you won!/", "obj_ch3_green_room_racing_slash_Step_0_gml_203_0");
        c_facenext("susie", "M");
        c_msgnextloc("\\EM* How the heck..^1. alright^1, we're done./%", "obj_ch3_green_room_racing_slash_Step_0_gml_205_0");
        c_talk_wait();
    }
    c_sel(ra);
    c_jump(494, 250, 26, 8);
    c_delayfacing(9, "d");
    c_sel(kr);
    c_sound_play(snd_wing);
    c_jump(558, 257, 26, 8);
    c_delaycmd(9, "sprite", spr_kris_racing_walk);
    c_sel(su);
    c_jump(611, 240, 26, 8);
    c_wait(8);
    c_sprite(spr_susie_racing_walk);
    c_halt();
    c_wait(5);
    c_sel(kr);
    c_imagespeed(0.2);
    c_walkdirect(536, 312, 10);
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect_wait(581, 300, 10);
    c_sound_play(snd_noise);
    c_walk_wait("d", 4, 4);
    c_sel(kr);
    c_sound_play(snd_noise);
    c_walk_wait("d", 4, 4);
    c_sprite(spr_krisd_dark);
    c_walk_wait("u", 4, 4);
    c_sel(su);
    c_sprite(spr_susie_walk_down_dw);
    c_walk_wait("u", 4, 4);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 22 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
}
