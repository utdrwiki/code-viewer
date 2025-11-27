timer++;
scr_populatechars();
if (!init)
{
    var pos = scr_heromarker("susie", "sustart");
    susie = scr_marker_ext(pos[0], pos[1], spr_susie_walk_up_dw, 2, 2, undefined, undefined, undefined, undefined, 1);
    susie.name = "susie";
    with (roomglow)
        create_highlight(other.susie, true, true, -2);
    with (obj_genmarker)
    {
        if (extflag == "GIRLPROP" || extflag == "GIRLPROP_STAY")
        {
            var doadd = false;
            if (extflag == "GIRLPROP")
                doadd = true;
            var prop = instance_create(scr_even((x + 150) - 68), scr_even((y + 90) - 30), obj_dw_church_prophecy);
            prop.extflag = choose("love", "heroes2", "heroes2");
            with (prop)
            {
                notext = true;
                alwaysactive = true;
                siner = instance_number(object_index) * 360;
                noback = true;
                fade_edges = true;
                scr_depth();
                depth += 120000;
                nodestroysound = true;
                nodestroysparkles = true;
            }
            if (doadd)
                array_push(other.moveprops, prop);
        }
    }
    pos = scr_heromarker(undefined, "MAINPROPLOC");
    cutcentx = pos[0] + 150;
    cutcenty = pos[1] + 90;
    prop1 = instance_create(cutcentx, cutcenty, obj_dw_church_prophecy);
    with (prop1)
    {
        alwaysactive = true;
        extflag = "initial2";
        notext = true;
        depth += 2;
        fade_edges = true;
    }
    prop1text = instance_create(cutcentx, cutcenty, obj_dw_church_prophecy);
    with (prop1text)
    {
        textonly = true;
        extflag = "laststory";
        depth = 0;
    }
    prop2 = instance_create(cutcentx, cutcenty, obj_dw_church_prophecy);
    with (prop2)
    {
        extflag = "initial2";
        notext = true;
        depth += 4;
        nodestroysparkles = true;
        fade_edges = true;
    }
    prop2text = instance_create(cutcentx, cutcenty, obj_dw_church_prophecy);
    with (prop2text)
    {
        textonly = true;
        extflag = "savetheworlds";
        depth = 0;
    }
    init = 1;
}
with (obj_floorshadow)
    instance_destroy();
if (con == 0)
{
    if (scr_trigcheck("cut1begin"))
    {
        mus_fade(global.currentsong[1], 120);
        con = 1;
        global.interact = 1;
        global.facing = 3;
        cutscene_master = scr_cutscene_make();
        actor_count = 0;
        kr = 0;
        kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
        scr_actor_setup(kr, kr_actor, "kris");
        kr_actor.sprite_index = obj_mainchara.sprite_index;
        kr_actor.depth = obj_mainchara.depth;
        with (obj_mainchara)
        {
            scr_delay_var("visible", false, 1);
            scr_delay_var("y", 0, 1);
        }
        actor_count++;
        su = array_length(global.cinstance) + 1;
        su_actor = instance_create(susie.x, susie.y, obj_actor);
        scr_actor_setup(su, su_actor, "susie");
        su_actor.sprite_index = susie.sprite_index;
        su_actor.depth = susie.depth;
        with (susie)
            scr_delay_var("visible", false, 1);
        var spritesArray = layer_get_all_elements("CUTSCENE_ASSETS_PART1");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 1550)
            {
                var info = scr_assetgetinfo(spritesArray[i]);
                actor_count++;
                ger = array_length(global.cinstance) + 2;
                ger_actor = instance_create(info[2], info[3], obj_actor);
                scr_actor_setup(ger, ger_actor, "gerson");
                ger_actor.sprite_index = layer_sprite_get_sprite(spritesArray[i]);
                with (ger_actor)
                {
                    name = "gerson";
                    usprite = spr_gerson_walk_armor_left;
                    rsprite = spr_gerson_walk_armor_right;
                    dsprite = spr_gerson_walk_armor_right;
                    lsprite = spr_gerson_walk_armor_right;
                    image_blend = c_black;
                }
                scr_depth(ger_actor);
            }
        }
        with (obj_actor)
        {
            with (obj_roomglow)
                create_highlight(other.id, true, false);
        }
        var krpos = scr_heromarker("kris", "krstart");
        var krdist = scr_returnwait_instance(kr_actor, krpos[2], 4);
        var supos = scr_heromarker("susie", "sustart");
        var campos = scr_heromarker(undefined, "camstart");
        c_sel(kr);
        c_walkdirect(krpos[0], krpos[1], krdist);
        c_delayfacing(krdist + 1, "l");
        c_pannable(1);
        c_pan(campos[0], campos[1], krdist);
        c_wait(krdist + 1);
        c_wait(15);
        c_sel(su);
        c_facing("r");
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\EM* Kris!? Hey^1, didn't I tell you to wait for a sec!?/", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_181_0");
        c_msgnextloc("\\Ep* If..^1. there's something about me here^1, then..^1. I.../%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_182_0");
        c_talk_wait();
        c_customfunc(function()
        {
            propmove1 = true;
            propmovetimer = 0;
        });
        c_wait(8);
        c_sel(kr);
        c_facing("u");
        c_sel(su);
        c_facing("u");
        c_waitcustom();
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Huh...?/%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_201_0");
        c_talk_wait();
        c_wait(8);
        c_sndplay(snd_motor_ghost);
        c_customfunc(function()
        {
            prop1text.alwaysactive = true;
        });
        c_wait(30);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* The last..^1. prophecy...?/", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_215_0");
        c_msgnextloc("\\ED* Is this.../", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_216_0");
        c_msgnextloc("\\EZ* What happens..^1. at the end...?/%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_217_0");
        c_talk_wait();
        c_wait(8);
        c_var_instance(id, "propmove2", true);
        c_var_instance(id, "propmovetimer", 0);
        c_waitcustom();
        c_sndplay(snd_dtrans_heavypassing);
        c_customfunc(function()
        {
            prop2.alwaysactive = true;
        });
        c_wait(15);
        c_sndplay(snd_motor_ghost);
        c_customfunc(function()
        {
            prop2text.alwaysactive = true;
        });
        c_wait(30);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* ..^1. huh? It's.../", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_244_0");
        c_msgnextloc("\\EZ* It's telling us how to save the world...?/", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_245_0");
        c_msgnextloc("\\E7* Hey^1, Kris^1, this'll make everything easy^1, right!?/%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_246_0");
        c_talk_wait();
        c_customfunc(function()
        {
            propmove3 = true;
            propmovetimer = 0;
        });
        c_waitcustom();
        c_wait(1);
        c_sel(su);
        c_sprite(spr_susie_shocked_behind);
        c_shakeobj();
        c_wait(64);
        c_speaker("susie");
        c_msgsetloc(0, "\\EI* Hey^1, I..^1. I was reading that!/%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_267_0");
        c_talk_wait();
        c_wait(30);
        c_sel(kr);
        c_facing("l");
        c_sel(su);
        c_facing("l");
        var campos2 = scr_heromarker(undefined, "campos2");
        c_pan(campos2[0], campos[1], 30);
        c_wait(30);
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* ..^1. Old man?/%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_281_0");
        c_talk_wait();
        c_wait(4);
        c_sel(ger);
        c_sprite(spr_gerson_walk_armor_left);
        c_wait(15);
        c_sel(ger);
        c_wait(8);
        c_autowalk(0);
        c_var("hspeed", -4);
        c_var("image_speed", 0.25);
        var supos3 = scr_heromarker("susie", "sustep");
        var sudist3 = scr_returnwait_instance(supos[2], supos3[2], 4);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* W-wait!!!/%", "obj_dw_churchb_darkclimb_scene_slash_Step_0_gml_299_0");
        c_talk();
        c_sel(su);
        c_walkdirect(supos3[0], supos3[1], sudist3);
        c_wait(sudist3);
        c_wait_talk();
        c_sel(ger);
        c_var("hspeed", -10);
        c_wait(8);
        var supos2 = scr_heromarker("susie", "surunto");
        var krpos2 = scr_heromarker("kris", "krrunto");
        var sudist2 = scr_returnwait_instance(supos3[2], supos2[2], 10);
        var krdist2 = scr_returnwait_instance(krpos[2], krpos2[2], 10);
        var campos3 = scr_heromarker(undefined, "campos3");
        c_sel(su);
        c_walkdirect(supos2[0], supos2[1], sudist2);
        c_sel(kr);
        c_walkdirect(krpos2[0], krpos2[1], krdist2);
        c_pan(campos3[0], campos3[1], max(krdist2, sudist2));
        c_wait(max(krdist2, sudist2));
        c_var_instance(id, "crackglass", 1);
        c_sel(kr);
        c_facing("d");
        c_autowalk(0);
        c_imagespeed(0);
        c_imageindex(0);
        c_shakeobj();
        c_sel(su);
        c_autowalk(0);
        c_imagespeed(0);
        c_imageindex(0);
        c_sprite(spr_susie_sheeh_flip);
        c_shakeobj();
        c_waitcustom();
        c_sel(su);
        c_var("vspeed", -2);
        c_var("gravity", 1);
        c_sel(kr);
        c_var("vspeed", -2);
        c_var("gravity", 1);
        c_wait(15);
        c_fadeout(15);
        c_wait(60);
        c_var_instance(id, "con", 2);
    }
}
if (con == 2)
{
    global.tempflag[90] = 1;
    room_goto(room_dw_churchb_darkclimb);
}
for (var i = 0; i < array_length(glass); i++)
{
    with (glass[i])
    {
        var targalpha = 0.2;
        if (place_meeting(x, y, obj_mainchara) || place_meeting(x, y, obj_caterpillarchara) || place_meeting(x, y, obj_actor) || place_meeting(x, y, other.susie))
            targalpha = 0.8;
        image_alpha = lerp(image_alpha, targalpha, 0.125);
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")))
    {
        propmove1 = true;
        propmovetimer = 0;
    }
    if (keyboard_check_pressed(ord("2")))
    {
        propmove2 = true;
        propmovetimer = 0;
    }
    if (keyboard_check_pressed(ord("3")))
    {
        crackglass = 1;
        gltimer = 0;
    }
}
if (propmove1)
{
    propmovetimer++;
    var movetime = 12;
    if (propmovetimer == 1)
    {
        snd_play(snd_dtrans_heavypassing);
        var dcon = 0;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_motor_ghost, 4, 0.8, 0.8);
        snd_play_delay(snd_motor_ghost, 6, 0.8, 0.6);
    }
    if (propmovetimer < movetime)
    {
        var count = array_length(moveprops);
        for (var i = 0; i < count; i++)
        {
            with (moveprops[i])
            {
                x = xstart + (sin(siner / (movetime - (other.propmovetimer / 2))) * 4);
                y = ystart + (cos(siner / (movetime - (other.propmovetimer / 2))) * 4);
            }
        }
    }
    if (propmovetimer == movetime)
    {
        var count = array_length(moveprops);
        for (var i = 0; i < count; i++)
        {
            with (moveprops[i])
            {
                var dir = ((i / count) * 360) - 33;
                var targx = other.cutcentx + lengthdir_x(340, dir);
                var targy = other.cutcenty + lengthdir_y(240, dir);
                scr_lerpvar("x", x, targx, 60, -1, "out");
                scr_lerpvar("y", y, targy, 60, -1, "out");
            }
        }
    }
    if (propmovetimer == (movetime + 60))
    {
        c_waitcustom_end();
        propmove1 = false;
    }
}
if (propmove2)
{
    propmovetimer++;
    var movetime = 12;
    if (propmovetimer == 1)
    {
        snd_play(snd_dtrans_heavypassing);
        var dcon = 0;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_motor_ghost, 4, 0.8, 0.8);
        snd_play_delay(snd_motor_ghost, 6, 0.8, 0.6);
    }
    if (propmovetimer < movetime)
    {
        with (prop1)
        {
            x = xstart + (sin(siner / (movetime - (other.propmovetimer / 2))) * 4);
            y = ystart + (cos(siner / (movetime - (other.propmovetimer / 2))) * 4);
        }
        with (prop1text)
        {
            x = xstart - (sin(siner / (movetime - (other.propmovetimer / 2))) * 4);
            y = ystart - (cos(siner / (movetime - (other.propmovetimer / 2))) * 4);
        }
    }
    if (propmovetimer == movetime)
    {
        var dir = 90;
        with (prop1)
        {
            var targx = other.cutcentx + lengthdir_x(380, dir);
            var targy = other.cutcenty + lengthdir_y(260, dir);
            scr_lerpvar("x", x, targx, 60, -1, "out");
            scr_lerpvar("y", y, targy, 60, -1, "out");
        }
        with (prop1text)
        {
            var targx = other.cutcentx + lengthdir_x(380, dir);
            var targy = other.cutcenty + lengthdir_y(260, dir);
            scr_lerpvar("x", x, targx, 60, -1, "out");
            scr_lerpvar("y", y, targy, 60, -1, "out");
            alwaysactive = false;
        }
    }
    if (propmovetimer == (movetime + 30))
    {
        c_waitcustom_end();
        propmove2 = false;
    }
}
if (propmove3)
{
    propmovetimer++;
    var movetime = 34;
    if (propmovetimer == 1)
    {
        snd_play(snd_dtrans_heavypassing);
        var dcon = 0;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_dtrans_heavypassing, 3 * dcon, 0.7 - (dcon / 8));
        dcon++;
        snd_play_delay(snd_motor_ghost, 4, 0.8, 0.8);
        snd_play_delay(snd_motor_ghost, 6, 0.8, 0.6);
        prop2text.alwaysactive = false;
    }
    if (propmovetimer < movetime)
    {
        var shake = max(12 - (propmovetimer / 2), 2);
        with (prop2)
        {
            x = xstart + (sin(siner / shake) * 4);
            y = ystart + (cos(siner / shake) * 4);
        }
        with (prop2text)
        {
            x = xstart - (sin(siner / shake) * 4);
            y = ystart - (cos(siner / shake) * 4);
        }
    }
    var throwtime = 24;
    if (propmovetimer == (movetime - throwtime))
    {
        with (scr_marker_ext(camerax() - 32, cameray() + 240, spr_gerson_hammer_trowable3, -2, 2, 0, 0, c_gray, 500))
        {
            scr_jump_to_point(other.cutcentx, other.cutcenty, 24, throwtime, true);
            scr_lerpvar("image_angle", 0, -359, throwtime);
            scr_doom(id, throwtime + 1);
        }
    }
    if (propmovetimer == movetime)
    {
        snd_stop(snd_dtrans_heavypassing);
        snd_stop(snd_motor_ghost);
        c_waitcustom_end();
        prop2text.x = room_width * 2;
        prop2.destroy = true;
        prop2.breakdelay = 45;
        var _count = array_length(moveprops);
        for (var i = 0; i < _count; i++)
        {
            with (moveprops[i])
            {
                var delay = (i + 1) * 2;
                scr_delay_var("destroy", 1, delay);
                snd_play_delay(snd_break1, delay, 0.9 - (i / (_count * 8)), 0.95);
                breakdelay = other.prop2.breakdelay - delay;
            }
        }
    }
}
if (crackglass == 1)
{
    gltimer++;
    var delaytime = 20;
    if (gltimer == 1)
    {
        var killer = -4;
        with (obj_genmarker)
        {
            if (extflag == "breakableglass")
                killer = id;
        }
        for (var i = 0; i < array_length(glass); i++)
        {
            with (glass[i])
            {
                if (place_meeting(x, y, killer))
                    array_push(other.shatter, id);
            }
        }
        for (var i = 0; i < array_length(shatter); i++)
        {
            var spr = 1252;
            with (shatter[i])
            {
                for (var j = 0; j < sprite_get_number(spr); j++)
                {
                    with (scr_marker_ext(x + choose(2, -2), y + choose(2, -2), spr, 2, 2, undefined, j, undefined, depth))
                    {
                        direction = random(360);
                        scr_delay_var("gravity", 0.5 + random(0.1), delaytime);
                        scr_delay_var("friction", 0, delaytime);
                        scr_delay_var("speed", 2, delaytime);
                        scr_doom(id, 120);
                    }
                }
                instance_destroy();
            }
        }
        var snd = snd_play_complex(0, 0, undefined);
        snd_add_complex(snd, 0, 236, 0.6, 0.4, (delaytime - 1) + 2, -1, 0);
        snd_add_complex(snd, 1, 390, 0.8, 0.5, (delaytime - 1) + 0, -1, 0);
        snd_add_complex(snd, 2, 390, 0.71, 0.5, (delaytime - 1) + 0, -1, 0);
        snd_add_complex(snd, 3, 269, 0.7, 0.95, (delaytime - 1) + 0, -1, 0);
        snd_add_complex(snd, 4, 321, 1, 0.95, 0, -1, 0);
    }
    if (gltimer == delaytime)
        c_waitcustom_end();
}
