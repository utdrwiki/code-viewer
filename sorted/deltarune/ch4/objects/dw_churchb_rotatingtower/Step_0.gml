var glowactive = false;
if (scr_trigcheck("propactive") || stayactive)
    glowactive = 1;
if (stayactive == -1)
    glowactive = 0;
if (!init)
{
    var proploc = scr_heromarker(undefined, "prop1");
    prop = instance_create(proploc[0] + 150, proploc[1] + 90 + 10, obj_dw_church_prophecy);
    prop.extflag = "heroes2";
    prop.fade_edges = true;
    proploc = scr_heromarker(undefined, "prop2");
    prop2 = instance_create(proploc[0] + 150, proploc[1] + 90, obj_dw_church_prophecy);
    prop2.extflag = "love";
    prop2.fade_edges = true;
    if (global.plot <= 238.6)
    {
        var tower = 1010;
        tower.col_blend = 0;
        towercon = 0;
    }
    with (obj_solidblocksized)
    {
        if (x == 600 && y == 600)
            instance_destroy();
    }
    if (global.tempflag[90] == 0.1)
    {
        global.tempflag[90] = 0;
        var pos = scr_heromarker("kris", "top");
        setxy(pos[0], pos[1], 1049);
    }
    init = 1;
}
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("1")))
    {
        var pos = scr_heromarker(undefined, "cut2warp");
        instance_create(pos[0] + 20, pos[1] + 20, obj_climb_kris);
        scr_setparty(0);
        if (con < 2)
            con = 2;
        sucon = 4;
        sutime = 0;
        monologuecon = -1;
        monowatch = 0;
        monotime = 0;
        monocon = 0;
        obj_mainchara.visible = false;
        obj_mainchara.freeze = true;
        obj_mainchara.cutscene = true;
        camerax_set(466);
        with (obj_rotating_tower_controller_new)
        {
            tower_y = 860;
            tower_angle = 294.55;
            appearance = 0;
            col_blend = 1;
        }
    }
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("2")))
    {
        var pos = scr_heromarker("kris", "top");
        setxy(pos[0], pos[1], 1049);
        scr_setparty(0);
        if (con < 2)
            con = 2;
        sucon = 4;
        sutime = 0;
        monologuecon = -1;
        monowatch = 0;
        monotime = 0;
        monocon = 0;
        with (obj_rotating_tower_controller_new)
        {
            tower_y = 860;
            tower_angle = 294.55;
            appearance = 0;
            col_blend = 1;
        }
    }
}
if (con == 0)
{
    if (scr_trigcheck("cut1"))
        con = 0.5;
}
if (con == 0.5)
{
    global.interact = 1;
    con = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (roomglow)
    {
        var actors = [];
        with (obj_actor)
            array_push(actors, id);
        for (var i = 0; i < array_length(actors); i++)
            create_highlight(actors[i]);
    }
    var krpos1 = scr_heromarker("kris", "cut1");
    var supos1 = scr_heromarker("susie", "cut1");
    var campos1 = scr_heromarker(undefined, "cam1");
    var campos2 = scr_heromarker(undefined, "cam2");
    var krdist1 = max(round(point_distance(kr_actor.x, kr_actor.y, krpos1[0], krpos1[1]) / 4), 1);
    var sudist1 = max(round(point_distance(su_actor.x, su_actor.y, supos1[0], supos1[1]) / 6), 1);
    var longdist = max(krdist1, sudist1);
    c_pannable(1);
    c_pan(campos1[0], campos1[1], longdist);
    c_sel(kr);
    c_walkdirect(krpos1[0], krpos1[1], longdist);
    c_delayfacing(krdist1 + 1, "u");
    c_sel(su);
    c_walkdirect(supos1[0], supos1[1], longdist);
    c_delayfacing(longdist + 1, "u");
    c_wait(sudist1);
    c_wait(15);
    c_customfunc(function()
    {
        var gen = scr_genmarker("blockoff");
        var blockoff = instance_create(gen.x, gen.y, obj_solidblocksized);
        with (blockoff)
        {
            sprite_index = spr_pxwhite;
            scr_sizeexact(10, gen.sprite_height);
            scr_depth();
            image_blend = c_black;
            depth += 5000;
            visible = true;
        }
    });
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Kris^1! Kris...!/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_199_0");
    c_msgnextloc("\\E7* Hey^1, look^1! It's me!!/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_200_0");
    c_msgnextloc("\\E2* \"The girl with hope crossed on her heart.\"/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_201_0");
    c_msgnextloc("\\E9* Man^1, that's..^1. That's bad ass^1, isn't it!?/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_202_0");
    c_msgnextloc("\\E7* You think there's anything else about us?/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_203_0");
    c_msgnextloc("\\E9* Don't just stand there^1, let's keep looking!/%", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_204_0");
    c_talk();
    c_wait_talk();
    c_sel(su);
    c_facing("r");
    c_panobj(kr_actor, 15);
    c_wait(14);
    c_customfunc(function()
    {
        global.facing = 0;
    });
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_customfunc(function()
    {
        with (obj_actor)
        {
            if (name == "susie")
                other.fakesu = scr_marker_ext(x, y, spr_susie_walk_right_dw, 2, 2, 0, 0, image_blend, depth);
        }
        with (roomglow)
            create_highlight(other.fakesu);
    });
    c_terminatekillactors();
}
if (con == 1)
{
    if (!instance_exists(obj_cutscene_master))
    {
        sucon = 1;
        scr_setparty(0);
        global.plot = 238.6;
        global.facing = 0;
        global.interact = 0;
        con = 2;
    }
}
if (con == 2)
{
    con = 3;
    var pos = scr_heromarker("susie", "top");
    endsu = scr_marker_ext(pos[0], pos[1], spr_susie_walk_left_dw, 2, 2, 0, 0, c_white, undefined, 1);
    with (roomglow)
        create_highlight(other.endsu);
}
if (con == 3)
{
    if (scr_trigcheck("cut2begin"))
    {
        with (endsu)
        {
            var pos = scr_heromarker("susie", "cut2end");
            var waittime = scr_returnwait_instance(id, pos[2], 12);
            scr_lerpvar("x", x, pos[0], waittime);
            scr_lerpvar("y", y, pos[1], waittime);
            sprite_index = spr_susie_run_excited_left;
            image_speed = 0.25;
            scr_delay_var("sprite_index", 430, waittime + 1);
            scr_delay_var("image_speed", 0, waittime + 1);
            scr_delay_var("image_index", 0, waittime + 1);
        }
        con = 4;
    }
}
if (con == 4)
{
    if (scr_trigcheck("cut2begin2"))
    {
        global.interact = 1;
        var pos = scr_heromarker("susie", "cut2end");
        if (scr_checklocation(endsu, pos[0], pos[1], 1))
            con = 5;
    }
}
if (con == 5)
{
    con = 6;
    global.facing = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var actorsource = endsu;
    actor_count++;
    su = __jj + 1;
    su_actor = instance_create(actorsource.x, actorsource.y, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = actorsource.sprite_index;
    su_actor.depth = actorsource.depth;
    with (actorsource)
        visible = 0;
    var campos = scr_heromarker(undefined, "cut2campos");
    with (roomglow)
    {
        var actors = [];
        with (obj_actor)
            array_push(actors, id);
        for (var i = 0; i < array_length(actors); i++)
            create_highlight(actors[i]);
    }
    with (obj_floorshadow)
    {
        if (target == other.su_actor)
            other.suactorshadow = id;
    }
    stayactive = 1;
    var krpos1 = scr_heromarker("kris", "krend");
    var campos1 = scr_heromarker(undefined, "cut2campos");
    var krdist1 = max(round(point_distance(kr_actor.x, kr_actor.y, krpos1[0], krpos1[1]) / 4), 1);
    var longdist = krdist1;
    c_pannable(1);
    c_pan(campos1[0], campos1[1], longdist);
    c_sel(kr);
    c_walkdirect(krpos1[0], krpos1[1], longdist);
    c_delayfacing(krdist1 + 1, "u");
    var delaytime = 20;
    c_wait(delaytime);
    c_sel(su);
    c_sprite(spr_susie_shocked_behind);
    c_sndplay(snd_wing);
    c_shakeobj_x(8, 0, 2);
    c_var_instance(suactorshadow, "ignorepreset", true);
    c_var_instance(suactorshadow, "yoff", -18);
    c_wait(max((krdist1 + 1) - delaytime, 1));
    c_speaker("susie");
    c_msgsetloc(0, "\\Ep* H..^1. hey.../", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_453_0");
    c_msgnextloc("\\Eq* Wh-what does that mean...? That I.../", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_454_0");
    c_msgnextloc("\\Ep* I.../", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_455_0");
    c_msgnextloc("\\Eq* Kris^1, I..^1. I've gotta find the next one!/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_456_0");
    c_msgnextloc("\\EM* You^1, uh..^1. you can stay here!/%", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_457_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_var_instance(suactorshadow, "ignorepreset", false);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_look_down);
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_look_back);
    c_wait_talk();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_run_serious_right);
    c_imagespeed(0.25);
    c_flip("x");
    c_walk("l", 12, 240);
    c_wait(15);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_var_instance(id, "stayactive", 0);
    c_pannable(0);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 6 && !i_ex(obj_cutscene_master))
{
    con = 7;
    global.facing = 0;
    global.interact = 0;
    global.plot = 238.65;
}
if (sucon == 1)
{
    var waittime = 1;
    with (fakesu)
    {
        image_speed = 0.25;
        var pos = scr_heromarker("susie", "surunto");
        waittime = scr_returnwait_instance(id, pos[2], 8);
        scr_lerpvar("x", x, pos[0], waittime);
    }
    scr_delay_var("sucon", 2, waittime);
    sucon = -1;
}
if (sucon == 2)
{
    with (fakesu)
    {
        sprite_index = spr_susie_walk_up_dw;
        image_speed = 0;
        image_index = 0;
    }
    var jumptime = 12;
    var trig = scr_trigcheck("sutrig1");
    if (trig)
    {
        sutime = 0;
        sucon = -1;
        scr_delay_var("sucon", 3, jumptime);
        with (fakesu)
        {
            var pos = scr_heromarker("susie", "surunto");
            x = pos[0] - 2;
            y = pos[1] + 20;
            sprite_index = spr_susie_dw_jump_ball;
            image_speed = 0.25;
            var position = [];
            position = [x, y];
            with (obj_climbstarter)
            {
                if (exitmarkerflag == "bot")
                {
                    position[0] = x - 8;
                    position[1] = (y + 10) - 40;
                }
            }
            snd_play(snd_jump);
            scr_jump_to_point(position[0], position[1], 14, jumptime, 1);
        }
    }
}
if (sucon == 3)
{
    with (obj_climbstarter)
    {
        if (exitmarkerflag == "bot")
            other.suclimb = instance_create(x + 20, y - 40, obj_climb_susie);
    }
    safe_delete(fakesu);
    sucon = 4;
}
with (obj_roomglow)
    active = glowactive;
with (obj_dw_church_prophecy)
    active = glowactive;
if (towercon == 0)
{
    var tower = 1010;
    if (floor(tower.tower_angle) != 294)
        towercon = 1;
}
else if (towercon < 10)
{
    var tower = 1010;
    towercon++;
    tower.col_blend = towercon / 10;
    global.plot = 238.61;
}
if (i_ex(obj_climb_kris))
{
    ialpha += 0.05;
    if (i_ex(monologue_writer))
    {
        monologue_writer.writingx = camerax() + 80;
        monologue_writer.writingy = cameray() + 340;
    }
}
else
{
    ialpha -= 0.05;
    if (i_ex(monologue_writer))
        monologue_writer._writex = 1000;
}
ialpha = clamp(ialpha, 0, 0.6);
layer_background_alpha(back_id, ialpha * (towercon / 10));
if (monocon == 0)
{
    if (i_ex(monologue_writer))
    {
        monocon = 1;
        monotime = 0;
    }
}
if (monocon == 1)
{
    if (i_ex(monologue_writer))
    {
        if (monologue_writer.halt > 0)
        {
            monotime++;
            var max_timer = (global.lang == "ja") ? 100 : 70;
            if (monotime >= max_timer)
            {
                with (obj_writer)
                    forcebutton1 = 1;
                monotime = 0;
                monocon = 0;
            }
        }
    }
}
with (organiknpc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_645_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_646_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* I am the philosopher./", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_650_0");
        msgnextloc("* Haven't you heard of Hyperlink Blocked?/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_651_0");
        msgnext("\\C2 ");
        if (chose == -1)
            d_make();
        else
            global.choice = chose;
        myinteract = 4;
    }
    if (myinteract == 4 && global.choice != -1)
    {
        k_d(1);
        chose = global.choice;
        if (global.choice == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I feel like I haven't heard of it^1,/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_667_0");
            msgnextloc("* But I don't know why./%", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_668_0");
        }
        if (global.choice == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* You haven't heard of it!/", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_673_0");
            msgnextloc("* Is that right^1, is that right?/%", "obj_dw_churchb_rotatingtower_slash_Step_0_gml_674_0");
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
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
if (global.interact == 0)
{
    with (obj_trigger)
    {
        if (extflag == "nomenu")
        {
            if (place_meeting(x, y, obj_climb_kris) || place_meeting(x, y, obj_mainchara))
            {
                with (obj_darkcontroller)
                    charcon = 0;
            }
        }
    }
}
