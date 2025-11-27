if (!init)
{
    var pos = scr_heromarker(undefined, "prop3");
    prophecy3 = instance_create(scr_even(pos[0] + 150), scr_even(pos[1] + 90), obj_dw_church_prophecy);
    prophecy3.extflag = "gallery";
    prophecy3.fade_edges = true;
    prophecy3.siner = 120;
    scr_depth(prophecy3);
    with (obj_genmarker)
    {
        if (extflag == "propgirl" || extflag == "propgirl_up")
        {
            prophecy = instance_create(scr_even((x + 150) - 68), scr_even((y + 90) - 30), obj_dw_church_prophecy);
            prophecy.extflag = choose("love", "heroes2", "heroes2");
            prophecy.alwaysactive = true;
            prophecy.notext = true;
            with (prophecy)
                siner = instance_number(object_index) * 360;
            if (extflag == "propgirl_up")
                prophecy.depth = 50005;
            prophecy.fade_edges = true;
        }
    }
    if (global.tempflag[90] == 1)
    {
        pos = scr_heromarker("kris", "warp1");
        setxy(pos[0], pos[1], 1049);
        setxy(pos[0], pos[1], 1235);
        global.facing = pos[2].image_index;
        global.tempflag[90] = 0;
        scr_caterpillar_interpolate("all");
    }
    with (obj_marker)
    {
        if (sprite_index == spr_organ_enemy)
            sprite_index = spr_npc_organik_0_talk;
        if (sprite_index == spr_npc_organik_1)
            sprite_index = spr_npc_organik_1_talk;
        if (sprite_index == spr_npc_organik_2)
            sprite_index = spr_npc_organik_2_talk;
        if (sprite_index == spr_npc_organik_3)
            sprite_index = spr_npc_organik_3_talk;
        var getmask = mask_index;
        var getshad = asset_get_index(sprite_get_name(sprite_index) + "_bake");
        if (sprite_exists(getshad))
        {
            sprite_index = getshad;
            mask_index = getmask;
        }
        else
        {
        }
        var yoff = 0;
        switch (sprite_index)
        {
            case spr_organ_enemy_petrified_bake:
                yoff = -18;
                break;
            case spr_dw_churchb_npcstatue_watercooler_bake:
                yoff = 0;
                break;
            case spr_npc_church_wafer_statue_bake:
                yoff = -26;
                break;
            case spr_dw_churchb_npcstatue_incenseturtle_bake:
                yoff = -20;
                break;
            case spr_dw_churchb_npcstatue_guei_bake:
                yoff = -16;
                break;
            case spr_dw_churchb_npcstatue_bibliox_bake:
                yoff = -22;
                break;
            case spr_dw_churchb_npcstatue_cupstack1_bake:
                yoff = -6;
                break;
            case spr_dw_churchb_npcstatue_cupstack2_bake:
                yoff = -6;
                break;
            case spr_dw_churchb_npcstatue_cupstack3_bake:
                yoff = -6;
                break;
            case spr_npc_organik_0_talk_bake:
                yoff = -18;
                break;
            case spr_npc_organik_2_talk_bake:
                yoff = -18;
                break;
            case spr_npc_organik_1_talk_bake:
                yoff = -18;
                break;
            case spr_npc_organik_3_talk_bake:
                yoff = -18;
                break;
            case spr_dw_churchb_pedastal:
                yoff = -32;
                break;
            case spr_dw_churchb_starwalker:
                yoff = -12;
                break;
        }
        if (sprite_index == spr_npc_sign)
        {
            with (scr_sprhighlight(id, 16764994))
                darkness = 1;
        }
        var thelayerdepth = layer_get_depth("TILES") - 1000;
        galleryshadow = scr_marker_ext(x, y + (sprite_height * 3) + yoff, sprite_index, image_xscale, image_yscale * -2, image_speed, image_index, c_black, thelayerdepth);
    }
    susie = scr_marker_ext(x, y, spr_susie_walk_up_dw, 2, 2, undefined, undefined, undefined, undefined, 1);
    with (susie)
    {
        spos = [];
        ind = 0;
        con = 0;
        for (var i = 0; i < 20; i++)
        {
            with (obj_sumarker)
            {
                if (extflag == string(i))
                {
                    setxy(scr_even(x), scr_even(y));
                    array_push(other.spos, id);
                }
            }
        }
        for (var i = 0; i < array_length(spos); i++)
        {
            if (spos[i].extflag == string(global.flag[1560]))
                ind = i + 1;
        }
        x = spos[ind].x;
        y = spos[ind].y;
        name = "susie";
        with (obj_roomglow)
            create_highlight(other.id);
    }
    scr_populatechars();
    init = 1;
}
with (susie)
{
    scr_depth();
    var walkspeed = 8;
    if (obj_mainchara.x < bbox_right)
        walkspeed = 10;
    var trigspace = 130;
    dist = distance_to_object(obj_mainchara);
    if (con == 0)
    {
        var trig = 0;
        if (dist < trigspace)
            trig = 1;
        if (obj_mainchara.x < (bbox_right + trigspace))
            trig = 1;
        if (trig)
        {
            ind++;
            var movewait = scr_returnwait_instance(id, spos[ind], walkspeed);
            scr_lerpvar("x", x, spos[ind].x, movewait);
            scr_lerpvar("y", y, spos[ind].y, movewait);
            scr_delay_var("con", con++, movewait + 1);
            scr_delay_var("image_speed", 0, movewait + 1);
            scr_delay_var("image_index", 0, movewait + 1);
            var facedir = direction_to_object_bbox(id, spos[ind], true);
            switch (facedir)
            {
                case 0:
                    sprite_index = spr_susie_walk_down_dw;
                    break;
                case 1:
                    sprite_index = spr_susie_walk_right_dw;
                    break;
                case 2:
                    sprite_index = spr_susie_walk_up_dw;
                    break;
                case 3:
                    sprite_index = spr_susie_walk_left_dw;
                    break;
            }
            image_speed = 0.25;
            var targsprite = 410;
            switch (spos[ind].image_index)
            {
                case 0:
                    targsprite = 410;
                    break;
                case 1:
                    targsprite = 428;
                    break;
                case 2:
                    targsprite = 430;
                    break;
                case 3:
                    targsprite = 422;
                    break;
            }
            scr_delay_var("sprite_index", targsprite, movewait + 1);
            global.flag[1560] = ind;
            con = -1;
        }
    }
}
if (cutscene == 0)
{
    if (scr_trigcheck("cut1"))
    {
        cutscene = 1;
        global.interact = 1;
    }
}
if (cutscene == 1)
{
    cutscene++;
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
    var campos = scr_heromarker(undefined, "campos1");
    var krpos = scr_heromarker("kris", "pos1");
    var supos = scr_heromarker("susie", "pos1");
    var krdist = scr_returnwait_instance(kris, krpos[2], 6);
    var sudist = scr_returnwait_instance(susie, supos[2], 6);
    var camdist = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 4);
    var camdistret = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 4);
    c_pannable(1);
    c_pan(campos[0], campos[1], camdist);
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], krdist);
    c_delayfacing(krdist + 1, "u");
    c_sel(su);
    c_walkdirect(supos[0], supos[1], sudist);
    c_delayfacing(sudist + 1, "u");
    c_wait(max(sudist, krdist, camdist));
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgset(0, "* Kris..^1. before^1, I didn't think I could be a hero./");
    c_msgnext("* I wasn't good enough. I mean^1, I was..^1. bad./");
    c_msgnext("* I still kinda am bad. In some ways^1, I guess./%");
    c_talk();
    c_wait_talk();
    c_panobj(kr_actor, camdistret);
    c_wait(camdistret);
    c_pannable(0);
    c_actortocaterpillar();
    c_actortokris();
    c_terminatekillactors();
}
if (cutscene == 2 && !instance_exists(obj_cutscene_master))
{
    scr_caterpillar_interpolate("all");
    global.flag[1560] = 1;
    global.interact = 0;
    global.facing = 0;
    cutscene++;
}
if (cutscene == 3)
{
    if (scr_trigcheck("cut2"))
    {
        cutscene = 4;
        global.interact = 1;
    }
}
if (cutscene == 4)
{
    cutscene++;
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
    var campos = scr_heromarker(undefined, "campos2");
    var krpos = scr_heromarker("kris", "pos2");
    var supos = scr_heromarker("susie", "pos2");
    var krdist = scr_returnwait_instance(kris, krpos[2], 6);
    var sudist = scr_returnwait_instance(susie, supos[2], 6);
    var camdist = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 4);
    var camdistret = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 4);
    c_pannable(1);
    c_pan(campos[0], campos[1], camdist);
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], krdist);
    c_delayfacing(krdist + 1, "u");
    c_sel(su);
    c_walkdirect(supos[0], supos[1], sudist);
    c_delayfacing(sudist + 1, "u");
    c_wait(max(sudist, krdist, camdist));
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgset(0, "* But now^1, I..^1. I got hope crossed on my heart./");
    c_msgnext("* Hope^1, written in truth. Written somewhere.../");
    c_msgnext("* Written somewhere no one can erase!/");
    c_msgnext("* Like^1, uh^1, a superduper permanent marker^1! Heheh./");
    c_msgnext("* Damn^1, I'm hyped up now^1, Kris!/");
    c_msgnext("* Let's find the old man and kick that Knight's ass!!/%");
    c_talk();
    c_wait_talk();
    c_panobj(kr_actor, camdistret);
    c_wait(camdistret);
    c_pannable(0);
    c_actortocaterpillar();
    c_actortokris();
    c_terminatekillactors();
}
if (cutscene == 5 && !instance_exists(obj_cutscene_master))
{
    scr_caterpillar_interpolate("all");
    global.flag[1560] = 2;
    global.interact = 0;
    global.facing = 0;
    cutscene++;
}
with (gueiadmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* An awful beast^1! A relief this creature was before our time./", "obj_dw_churchb_gallery_slash_Step_0_gml_405_0");
        msgnextloc("* From the body shape^1, it seems to have eaten meat and fire./%", "obj_dw_churchb_gallery_slash_Step_0_gml_406_0");
        d_make();
        myinteract = 999;
        talked++;
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
with (organadmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Ahhh..^1. overachiever!/%", "obj_dw_churchb_gallery_slash_Step_0_gml_437_0");
        d_make();
        myinteract = 999;
        talked++;
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
with (biblioxadmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* The stone tablets carved in mansbeard^1, a font of knowledge./", "obj_dw_churchb_gallery_slash_Step_0_gml_468_0");
        msgnextloc("* Spellings were different back then. And better./%", "obj_dw_churchb_gallery_slash_Step_0_gml_469_0");
        d_make();
        myinteract = 999;
        talked++;
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
with (wateradmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Look how realistic the rendering of the water is by the stone./", "obj_dw_churchb_gallery_slash_Step_0_gml_500_0");
        msgnextloc("* To our progenitors^1, this must've been the peak of beauty!/%", "obj_dw_churchb_gallery_slash_Step_0_gml_501_0");
        d_make();
        myinteract = 999;
        talked++;
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
with (waferadmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* How rustic our ancestors were. No headdress in sight./", "obj_dw_churchb_gallery_slash_Step_0_gml_533_0");
        msgnextloc("* They must've concerned themselves only with their work.../", "obj_dw_churchb_gallery_slash_Step_0_gml_534_0");
        var seeds = stringsetloc("* We should be like them^1! We should eat only nuts and seeds./%", "obj_dw_churchb_gallery_slash_Step_0_gml_535_0");
        msgnext(seeds);
        if (talked)
        {
            scr_speaker("no_name");
            msgset(0, seeds);
        }
        d_make();
        myinteract = 999;
        talked++;
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
with (baltadmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* A beautiful specimen^1, although only the hard carapace remains./", "obj_dw_churchb_gallery_slash_Step_0_gml_573_0");
        msgnextloc("* If only we could see its delicate pieces.../", "obj_dw_churchb_gallery_slash_Step_0_gml_574_0");
        msgnextloc("* It may have had beautiful feathers^1, or even a fleshy posterior./%", "obj_dw_churchb_gallery_slash_Step_0_gml_575_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* A beautiful specimen!/%", "obj_dw_churchb_gallery_slash_Step_0_gml_580_0");
        }
        d_make();
        myinteract = 999;
        talked++;
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
with (intronpc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Welcome to Club Apatheia./", "obj_dw_churchb_gallery_slash_Step_0_gml_614_0");
        msgnextloc("* This is an archaeological exhibit./%", "obj_dw_churchb_gallery_slash_Step_0_gml_615_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Today's history^1, tomorrow's archaeology./%", "obj_dw_churchb_gallery_slash_Step_0_gml_620_0");
        }
        d_make();
        myinteract = 999;
        talked++;
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
with (welcomesign)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* \"The Gallery of Ancient Faces.\"/%", "obj_dw_churchb_gallery_slash_Step_0_gml_651_0");
        d_make();
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
with (watercooler)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a stone cooler. Not particularly useful.)/%", "obj_dw_churchb_gallery_slash_Step_0_gml_674_0");
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
with (cupadmirer)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* These ancient once-celled organisms^1, seem to have lived a simple life./", "obj_dw_churchb_gallery_slash_Step_0_gml_703_0");
        msgnextloc("* Look how they band together. Lessons could be learned^1, could be learned./%", "obj_dw_churchb_gallery_slash_Step_0_gml_704_0");
        d_make();
        myinteract = 999;
        talked++;
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
if (famcon == 0)
{
    var trig = 0;
    for (var i = 0; i < array_length(familiars); i++)
    {
        if (familiars[i].myinteract)
            trig = 1;
    }
    if (trig)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (A familiar looking statue.)/%", "obj_dw_churchb_gallery_slash_Step_0_gml_740_0");
        global.interact = 1;
        d_make();
        famcon = 1;
    }
}
if (famcon == 1 && !d_ex())
{
    for (var i = 0; i < array_length(familiars); i++)
        familiars[i].myinteract = 0;
    famcon = 0;
    global.interact = 0;
}
if (enemcon == 0)
{
    with (angyboy)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* I'm waiting to turn to stone. Hurry up^1, will you?/%", "obj_dw_churchb_gallery_slash_Step_0_gml_772_0");
            d_make();
            myinteract = 999;
            talked++;
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
    if (angysign.myinteract)
    {
        enemcon = 1;
        angysign.myinteract = 999;
        angyboy.myinteract = 999;
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a statue stand..^1. it has your name on it.)/%", "obj_dw_churchb_gallery_slash_Step_0_gml_805_0");
        d_make();
    }
}
if (enemcon == 1 && !d_ex())
{
    timer++;
    var jumptime = 18;
    var fadetime = 8;
    if (timer == 8)
    {
        global.facing = 1;
        with (angyboy.marker)
        {
            scr_lerpvar("image_alpha", image_alpha, 0, fadetime, 2, "out");
            with (galleryshadow)
                scr_lerpvar("image_alpha", image_alpha, 0, fadetime, 2, "out");
        }
        angymarker = scr_marker_ext(angyboy.marker.x - 16 - 2, (angyboy.marker.y - 16) + 2, spr_dw_churchb_organikenemy_marker, 2, 2, 0, 0, c_white, angyboy.marker.depth + 1);
    }
    if (timer == (8 + fadetime))
    {
        snd_play(snd_jump);
        snd_play_delay(snd_wing, jumptime, 1, 1.2);
        var targx = obj_mainchara.x + 60;
        var targy = obj_mainchara.y - 42;
        with (angymarker)
            scr_jump_to_point(targx, targy, 20, jumptime);
    }
    if (timer > (8 + fadetime))
        scr_depth_alt(angymarker);
    if (timer == (8 + jumptime + fadetime))
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Yes^1, you will be a fossil too^1, won't you?/%", "obj_dw_churchb_gallery_slash_Step_0_gml_849_0");
        d_make();
        enemcon = 2;
        timer = 0;
    }
}
if (enemcon == 2 && !d_ex())
{
    timer++;
    if (timer == 8)
    {
        angymarker.depth = 5000;
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (timer == 32)
    {
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, undefined, angymarker);
        enemcon = 3;
    }
}
if (enemcon == 3)
{
    var check = global.flag[encounterflag];
    if (check != 0)
    {
        angysign.x = room_width * 2;
        angysign.marker.galleryshadow.x = room_width * 2;
        if (check == 1)
        {
            angyboy.x = room_width * 2;
            enemcon = 999;
        }
        else
        {
            debug_print("now");
            angyboy.marker.image_alpha = 1;
            angyboy.marker.galleryshadow.image_alpha = 1;
            angyboy.talked = 0;
            angyboy.myinteract = 0;
            enemcon = 4;
        }
    }
}
if (enemcon == 4)
{
    with (angyboy)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* A huge fossil^1, falling down^1, breaking^1, smashing EVERYTHING!/", "obj_dw_churchb_gallery_slash_Step_0_gml_908_0");
            msgnextloc("* HAHAHA^1! I myself^1, will be crushed as well!/%", "obj_dw_churchb_gallery_slash_Step_0_gml_909_0");
            d_make();
            myinteract = 999;
            talked++;
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
}
if (i_ex(staradmirer))
{
    with (staradmirer)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* He looks so..^1. original./%", "obj_dw_churchb_gallery_slash_Step_0_gml_944_0");
            d_make();
            myinteract = 999;
            talked++;
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
}
if (i_ex(starwalker))
{
    with (starwalker)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            msgsetloc(0, "* (An original looking statue.)/%", "obj_dw_churchb_gallery_slash_Step_0_gml_975_0");
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
}
var propactive = scr_trigcheck("propact");
roomglow.active = true;
with (obj_dw_church_prophecy)
    active = propactive;
