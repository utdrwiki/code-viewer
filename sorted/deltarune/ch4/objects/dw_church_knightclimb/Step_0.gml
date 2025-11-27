var xx = camerax();
var yy = cameray();
var krx = 0;
var kry = 0;
scr_populatechars();
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("2")))
            setxy(3300, 2260, 27);
    }
    if (global.tempflag[90])
    {
        global.tempflag[90] = 0;
        global.facing = 2;
        var pos = scr_heromarker("kr", "b");
        setxy(pos[0], pos[1], kris);
        pos = scr_heromarker("su", "b");
        setxy(pos[0], pos[1], susie);
        pos = scr_heromarker("ra", "b");
        setxy(pos[0], pos[1], ralsei);
        scr_caterpillar_interpolate("all");
        scr_caterpillar_facing(2, "all");
    }
}
if (global.interact == 0 && i_ex(obj_climb_kris) && con == 11)
{
    timer++;
    buffer--;
    krx = obj_climb_kris.x;
    kry = obj_climb_kris.y;
    if (!buffer)
    {
        with (obj_trigger)
        {
            if (place_meeting(x, y, obj_climb_kris))
            {
                if (id != other.mylasttrig)
                {
                    other.mylasttrig = id;
                    other.buffer = 15;
                }
                if (extflag == "sword1")
                {
                    if (other.timer >= 60)
                    {
                        var bul = instance_create((round((krx - 20) / 40) * 40) + 20, yy + 60, obj_climb_bullet_knightattack);
                        other.timer = 0;
                    }
                }
                if (extflag == "sword2")
                {
                    if (other.timer >= 40)
                    {
                        var xloc = 0;
                        if ((other.swordcount % 2) == 0)
                            xloc = 1;
                        if ((other.swordcount % 3) == 0)
                            xloc = 2;
                        var bul = instance_create(x + 40 + (80 * xloc) + 20, yy + 60, obj_climb_bullet_knightattack);
                        other.timer = 0;
                    }
                }
                if (extflag == "sword4")
                {
                    if (other.timer == 50)
                    {
                        var bul = instance_create(x + 40 + 20 + 120, yy + 60, obj_climb_bullet_knightattack);
                        bul = instance_create(x + 40 + 20 + 360, yy + 60, obj_climb_bullet_knightattack);
                        bul = instance_create(x + 40 + 20 + 600, yy + 60, obj_climb_bullet_knightattack);
                    }
                    if (other.timer >= 100)
                    {
                        var bul = instance_create(x + 40 + 20 + 0, yy + 60, obj_climb_bullet_knightattack);
                        bul = instance_create(x + 40 + 20 + 240, yy + 60, obj_climb_bullet_knightattack);
                        other.timer = 0;
                    }
                }
                if (extflag == "sword10")
                {
                    if (other.timer >= 40)
                    {
                        var xloc = (round((krx - 20) / 40) * 40) + 20;
                        var bul = instance_create(xloc, yy + 60, obj_climb_bullet_knightattack);
                        other.timer = 0;
                    }
                }
                if (extflag == "sword11")
                {
                    if (other.timer >= 30)
                    {
                        var xloc = (round((krx - 20) / 40) * 40) + 20 + choose(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, -40);
                        xloc = clamp(xloc, 3220, 3380);
                        var bul = instance_create(xloc, yy + 60, obj_climb_bullet_knightattack);
                        bul.delay = 30;
                        other.timer = 0;
                    }
                }
                if (extflag == "sword12")
                {
                    if (other.timer == 40)
                    {
                        var bul = instance_create(x + 40 + 20 + 0, yy + 60, obj_climb_bullet_knightattack);
                        bul.delay = 30;
                        bul = instance_create(x + 40 + 20 + 80, yy + 60, obj_climb_bullet_knightattack);
                        bul.delay = 35;
                        bul = instance_create(x + 40 + 20 + 160, yy + 60, obj_climb_bullet_knightattack);
                        bul.delay = 40;
                    }
                    if (other.timer >= 80)
                    {
                        var bul = instance_create(x + 40 + 20 + 40, yy + 60, obj_climb_bullet_knightattack);
                        bul.delay = 30;
                        bul = instance_create(x + 40 + 20 + 120, yy + 60, obj_climb_bullet_knightattack);
                        bul.delay = 35;
                        other.timer = 0;
                    }
                }
                if (extflag == "sword14")
                {
                    if (other.timer == 30)
                    {
                        for (var i = 0; i < 5; i++)
                        {
                            var bul = instance_create(x + 40 + 20 + (40 * (-2 + (i * 2))), yy + 60, obj_climb_bullet_knightattack);
                            bul.delay = 30 + (i * 5);
                        }
                    }
                    if (other.timer >= 60)
                    {
                        for (var i = 0; i < 4; i++)
                        {
                            var bul = instance_create(x + 20 + 40 + (40 * (-1 + (i * 2))), yy + 60, obj_climb_bullet_knightattack);
                            bul.delay = 30 + (5 * i);
                        }
                        other.timer = 0;
                    }
                }
            }
        }
    }
    var endseq = false;
    var noswards = true;
    with (obj_climb_bullet_knightattack)
    {
        if (bbox_top < (obj_climb_kris.bbox_bottom + 20))
            noswards = false;
    }
    if (scr_trigcheck_ext("climbend", 27) && noswards)
    {
        con = 12;
        with (obj_climb_kris)
            forceclimb = true;
        with (obj_darkcontroller)
            charcon = 0;
    }
}
if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "introcut")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1 && !i_ex(obj_climb_kris))
    {
        con = 1;
        scr_delay_var("con", 2, 15);
        global.interact = 1;
    }
    var pos = scr_heromarker("kr", "b");
    setxy(pos[0], pos[1], kris);
    pos = scr_heromarker("su", "b");
    setxy(pos[0], pos[1], susie);
    pos = scr_heromarker("ra", "b");
    setxy(pos[0], pos[1], ralsei);
    scr_caterpillar_interpolate("all");
    scr_caterpillar_facing(2, "all");
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_walkdirect(3158, 7018, 30);
    c_sel(su);
    c_walkdirect(3098, 7014, 30);
    c_sel(ra);
    c_autowalk(0);
    c_sprite(spr_ralsei_walk_up);
    c_imagespeed(0.2);
    c_walkdirect_wait(3210, 7018, 30);
    c_halt();
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E4* We should be able to get to the Fountain from here./", "obj_dw_church_knightclimb_slash_Step_0_gml_232_0");
    c_msgnextloc("\\EE* All we have to do is climb up this.../", "obj_dw_church_knightclimb_slash_Step_0_gml_233_0");
    c_msgnextloc("\\EC* ..^1. huh?/%", "obj_dw_church_knightclimb_slash_Step_0_gml_234_0");
    c_talk_wait();
    c_pannable(1);
    c_mus2("initloop", "knight_appears.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 90);
    c_var_instance(id, "camera_pan", true);
    c_wait(80);
    c_var_lerp_instance(roaring_knight, "image_index", 0, 2, 12);
    c_wait(30);
    c_var_lerp_instance(roaring_knight, "image_index", 3, 0, 12);
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* Hey!!/%", "obj_dw_church_knightclimb_slash_Step_0_gml_257_0");
    c_talk_wait();
    c_wait(30);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_turn_around);
    c_var_lerp_instance(roaring_knight, "image_index", 0, 6, 24);
    c_wait(45);
    c_customfunc(function()
    {
        knight_notice();
    });
    c_wait_if(id, "knight_continue", "=", true);
    c_var_instance(roaring_knight, "sprite_index", spr_roaringknight_slosh_flash);
    c_var_instance(roaring_knight, "image_index", 0);
    c_var_instance(roaring_knight, "image_speed", 0.4);
    c_var_instance(wind_effect, "con", 1);
    c_var_instance(id, "wind_state", 1);
    c_delaycmd4(15, "var", id, "wind_state", 2);
    c_wait(15);
    c_sel(kr);
    c_autowalk(0);
    c_sel(su);
    c_autowalk(0);
    c_sel(ra);
    c_autowalk(0);
    var pos = scr_heromarker("gen", "campos");
    c_var_instance(id, "camera_y_target", pos[1]);
    c_var_instance(id, "camera_pan", true);
    c_wait(60);
    c_wait(15);
    c_sel(kr);
    c_sprite(spr_kris_block_up_wind);
    c_imageindex(0);
    c_var_lerp_instance(kr_actor, "image_speed", 0.6, 0, 90);
    c_var_instance(kr_actor, "vspeed", 5);
    c_var_instance(kr_actor, "friction", 0.4);
    c_sel(su);
    c_halt();
    c_sprite(spr_susie_block_up_wind);
    c_imageindex(0);
    c_var_lerp_instance(su_actor, "image_speed", 0.6, 0, 90);
    c_var_instance(su_actor, "vspeed", 5);
    c_var_instance(su_actor, "friction", 0.4);
    c_sel(ra);
    c_halt();
    c_sprite(spr_ralsei_walk_up_windy);
    c_imageindex(0);
    c_var_instance(ralsei_scarf_marker, "depth", ra_actor.depth - 10);
    c_var_instance(ralsei_scarf_marker, "x", 3208);
    c_var_instance(ralsei_scarf_marker, "y", 7020);
    c_var_instance(ralsei_scarf_marker, "image_speed", 0.6);
    c_var_instance(ralsei_scarf_marker, "visible", 1);
    c_var_instance(ralsei_scarf_marker, "vspeed", 5);
    c_var_instance(ralsei_scarf_marker, "friction", 0.4);
    c_var_instance(ra_actor, "vspeed", 5);
    c_var_instance(ra_actor, "friction", 0.4);
    c_wait(10);
    c_var_lerp_to_instance(ralsei_scarf_marker, "image_speed", 0, 80);
    c_wait(80);
    c_var_instance(ralsei_scarf_marker, "image_index", 0);
    c_script_instance(id, snd_volume, 0, 395, 0, 30);
    c_var_instance(wind_effect, "con", 0);
    c_wait(30);
    c_script_instance(id, snd_stop, 0, 395);
    c_sel(su);
    c_var_instance(su_actor, "vspeed", 0);
    c_var_instance(su_actor, "friction", 0);
    c_sel(kr);
    c_var_instance(kr_actor, "vspeed", 0);
    c_var_instance(kr_actor, "friction", 0);
    c_sel(ra);
    c_var_instance(ra_actor, "vspeed", 0);
    c_var_instance(ra_actor, "friction", 0);
    c_wait(30);
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_autowalk(1);
    c_facing("u");
    c_var_instance(ralsei_scarf_marker, "visible", 0);
    c_sel(kr);
    c_autowalk(1);
    c_facing("u");
    c_msgside("top");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* The..^1. the Knight...!/", "obj_dw_church_knightclimb_slash_Step_0_gml_410_0");
    c_facenext("susie", 19);
    c_msgnextloc("\\EJ* Damn it^1! You aren't stopping us this time!/%", "obj_dw_church_knightclimb_slash_Step_0_gml_412_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_point);
    c_shakeobj();
    c_wait_talk();
    c_sel(su);
    c_autowalk(0);
    pos = scr_heromarker("su", "suclimb");
    c_sprite(spr_susie_run_up);
    c_imagespeed(0.4);
    c_walkdirect(pos[0], pos[1], 15);
    c_wait(15);
    c_snd_play(snd_jump);
    c_sprite(spr_susie_dw_fall_ball);
    pos = scr_assetloc("DEBUG_ASSETS", "dspr_suballstart");
    c_setxy(pos[0], pos[1]);
    pos = scr_assetloc("DEBUG_ASSETS", "dspr_suballend");
    c_autowalk(0);
    c_jump(pos[0], pos[1], 8, 8);
    c_wait(8);
    pos = scr_assetloc("DEBUG_ASSETS", "dspr_suclimbing");
    c_setxy(pos[0], pos[1]);
    c_sprite(spr_susie_climb);
    c_wait(5);
    c_imagespeed(0.25);
    c_var("vspeed", -8);
    c_sel(ra);
    c_walk("u", 4, 4);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* S-Susie^1! Wait!!/%", "obj_dw_church_knightclimb_slash_Step_0_gml_463_0");
    c_talk_wait();
    c_sel(ra);
    c_autowalk(1);
    pos = scr_heromarker("ra", "raclimb");
    c_walkdirect(pos[0], pos[1], 15);
    c_wait(15);
    c_snd_play(snd_jump);
    c_imagespeed(0.4);
    pos = scr_assetloc("DEBUG_ASSETS", "dspr_raballstart");
    c_setxy(pos[0], pos[1]);
    c_autowalk(0);
    c_sprite(spr_ralsei_jump_ball);
    c_addxy(16, 0);
    c_imagespeed(0.4);
    pos = scr_assetloc("DEBUG_ASSETS", "dspr_raballend");
    c_autowalk(0);
    c_jump(pos[0], pos[1], 8, 8);
    c_wait(9);
    pos = scr_assetloc("DEBUG_ASSETS", "dspr_raclimb");
    c_setxy(pos[0], pos[1]);
    c_sprite(spr_ralsei_climb);
    c_addxy(-16, 0);
    c_wait(5);
    c_imagespeed(0.25);
    c_var("vspeed", -8);
    c_mus2("volume", 0, 30);
    c_wait(30);
    c_waitcustom();
}
if (con == 3 && customcon == 1)
{
    con = 4;
    customcon = 0;
    with (tile_cover)
        instance_destroy();
    c_waitcustom_end();
    c_sel(kr);
    c_walkdirect_wait(kr_actor.x, 6944, 20);
    c_pannable(1);
    c_pan(camerax(), cameray() - 80, 20);
    c_wait(31);
    c_mus("free_all");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 4 && !i_ex(obj_cutscene_master))
{
    with (roaring_knight)
        instance_destroy();
    scr_losechar();
    con = 9;
    with (obj_caterpillarchara)
        visible = false;
    with (obj_mainchara)
        cutscene = 0;
    global.plot = 194;
    scr_tempsave();
}
if (con == 9)
{
    var trig = 0;
    with (obj_climbstartertrig)
    {
        if (exitmarkerflag == "knightstart")
        {
            myinteract = 3;
            trig = 1;
        }
    }
    with (obj_caterpillarchara)
        visible = false;
    if (trig)
    {
        con = 10;
        mus_play_ext("creepychase.ogg", 1, 0.7, 1.2);
    }
}
if (con == 10 && i_ex(obj_climb_kris))
{
    timer = 60;
    con = 11;
    global.interact = 0;
}
if (con == 11)
{
    var trig = 0;
    with (obj_climb_kris)
    {
        other.hitcount = hitcount;
        if (exitcon || forceclimb)
        {
            trig = 1;
            invincible = true;
        }
    }
    if (trig)
    {
        with (obj_climb_bullet_knightattack)
        {
        }
        with (obj_darkcontroller)
            charcon = 0;
        con = 12;
    }
}
if (con == 12 && !i_ex(obj_climb_kris))
{
    global.interact = 1;
    if (hitcount == 0)
        debug_print("flawless!");
    if (!i_ex(obj_afterimage))
    {
        con = 13;
        scr_delay_var("con", 14, 1);
    }
}
if (con == 14)
{
    global.tempflag[90] = 1;
    room_goto(room_dw_church_knightclimb_post);
}
if (camera_pan)
{
    camera_pan_timer++;
    if (camera_pan_timer == 1)
        scr_lerpvar("camera_y_pos", cameray(), camera_y_target, 90, 3, "inout");
    camera_set_view_pos(view_get_camera(0), camerax(), camera_y_pos);
    if (camera_pan_timer >= 100)
    {
        camera_pan = false;
        camera_pan_timer = 0;
    }
}
if (wind_state != 0)
{
    if (wind_state == 1)
    {
        wind_sound = snd_loop(snd_paper_surf);
        snd_volume(wind_sound, 1, 1);
    }
    else if (wind_state == 2)
    {
        snd_pitch_time(wind_sound, 2, 60);
    }
    wind_state = 0;
}
