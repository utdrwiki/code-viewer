if (init == 0)
{
    var pos = scr_heromarker(undefined, "blockblock");
    blockblock = instance_create(pos[0], pos[1], obj_solidblock);
    scr_sizeexact(pos[2].sprite_width, pos[2].sprite_height, blockblock);
    scr_populatechars();
    pos = scr_heromarker("kris", "left1");
    leftx = pos[0];
    lefty = pos[1];
    pos = scr_heromarker("kris", "right1");
    rightx = pos[0];
    righty = pos[1];
    pos = scr_heromarker("kris", "left2");
    leftx2 = pos[0];
    lefty2 = pos[1];
    pos = scr_heromarker("kris", "right2");
    rightx2 = pos[0];
    righty2 = pos[1];
    init = 1;
}
if (scr_debug())
{
    if ((keyboard_check(ord("W")) && keyboard_check_pressed(ord("V"))) || global.tempflag[90] == 48)
    {
        global.tempflag[90] = 0;
        var pos = scr_heromarker("kris", "pos1");
        setxy(pos[0], pos[1], kris);
        setxy(pos[0], pos[1], ralsei);
        setxy(pos[0], pos[1], susie);
        scr_caterpillar_interpolate("all");
        con = 4;
    }
}
if (con == 0)
{
    if (scr_trigcheck("cut1"))
    {
        blockit = true;
        global.plot = 241;
        scr_speaker("ralsei");
        msgsetloc(0, "\\E5* Susie..^1. I.../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_59_0");
        msgnextloc("\\Ed* There's a few things I still can't say^1, but.../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_60_0");
        msgnextloc("\\EQ* From now on^1, I want to.../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_61_0");
        msgnextloc("\\EB* I want to..^1. tell you everything I can./", "obj_dw_churchb_extinguisher_slash_Step_0_gml_62_0");
        scr_anyface_next("susie", "7");
        msgnextloc("\\E7* ..^1. So^1, uh^1, know any codes to any doors?/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_64_0");
        scr_anyface_next("ralsei", "K");
        msgnextloc("\\EK* Umm..^1. No^1, haha. I do not./%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_66_0");
        scr_walkntalk_start(undefined, undefined, 0);
        roomloop = 1;
        con = 1;
    }
}
if (con == 1 && !d_ex())
{
    scr_walkntalk_stop();
    roomloop = 0;
    con = 2;
    unblock = true;
}
if (con == 2)
{
    if (scr_trigcheck("cut2"))
    {
        blockit = true;
        scr_speaker("susie");
        msgsetloc(0, "\\EK* ..^1. then^1, uh^1, anything about Noelle...?/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_87_0");
        scr_anyface_next("ralsei", "L");
        msgnextloc("\\EL* Umm.../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_89_0");
        msgnextloc("\\EK* I know which items of ours she can equip?/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_90_0");
        msgnextloc("\\EX* Then again^1, YOU'RE supposed to equip Ribbons.../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_91_0");
        scr_anyface_next("susie", "A");
        msgnextloc("\\EA* 'kay^1, you actually know jack. Great./%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_93_0");
        scr_walkntalk_start(undefined, undefined, 0);
        roomloop2 = 1;
        global.plot = 242;
        con = 3;
    }
}
if (con == 3 && !d_ex())
{
    scr_walkntalk_stop();
    roomloop2 = 0;
    con = 4;
    unblock = true;
}
if (con == 4)
{
    if (churchswitch.myinteract != 0)
    {
        global.interact = 1;
        con = 4.5;
    }
}
if (con == 4.5 && !d_ex())
{
    snd_play(snd_impact);
    churchswitch.marker.image_index = 0;
    showglass = true;
    con = 5;
    var pos = scr_heromarker(undefined, "noreturn");
    noreturn = instance_create(pos[0], pos[1], obj_solidblock);
    scr_sizeexact(pos[2].sprite_width, pos[2].sprite_height, noreturn);
    safe_delete(blockblock);
}
if (con == 5)
{
    con = 6;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_shake();
    var krpos1 = scr_heromarker("kris", "pos1");
    var supos1 = scr_heromarker("susie", "pos1");
    var rapos1 = scr_heromarker("ralsei", "pos1");
    var lookat = scr_heromarker(undefined, "lookat");
    var walkspeed = 6;
    var krdist1 = max(point_distance(kris.x, kris.y, krpos1[0], krpos1[1]) / walkspeed, 1);
    var sudist1 = max(point_distance(susie.x, susie.y, supos1[0], supos1[1]) / walkspeed, 1);
    var radist1 = max(point_distance(ralsei.x, ralsei.y, rapos1[0], rapos1[1]) / walkspeed, 1);
    var waitfull1 = max(krdist1, radist1, sudist1, 30);
    var krstartface = direction_to_object_bbox(kris, lookat[2], 1);
    var sustartface = direction_to_object_bbox(ralsei, lookat[2], 1);
    var rastartface = direction_to_object_bbox(ralsei, lookat[2], 1);
    var campos = scr_heromarker(undefined, "campos");
    var cards = ["d", "r", "u", "l"];
    krstartface = cards[krstartface];
    sustartface = cards[sustartface];
    rastartface = cards[rastartface];
    c_sel(kr);
    c_facing(krstartface);
    c_sel(su);
    c_facing(sustartface);
    c_sel(ra);
    c_facing(rastartface);
    c_wait(30);
    c_pan(campos[0], campos[1], 15);
    c_sel(kr);
    c_walkdirect(krpos1[0], krpos1[1], krdist1);
    c_delayfacing(krdist1 + 2, "u");
    c_sel(su);
    c_walkdirect(supos1[0], supos1[1], sudist1);
    c_delayfacing(sudist1 + 2, "u");
    c_sel(ra);
    c_walkdirect(rapos1[0], rapos1[1], radist1);
    c_delayfacing(radist1 + 2, "u");
    c_wait(waitfull1);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* I suppose this leads back to the start.../%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_195_0");
    c_talk_wait();
    var lerptime = 24;
    c_var_instance(extinguisher, "x", campos[0] - 40);
    c_var_lerp_instance(extinguisher, "x", campos[0] - 40, extinguisher.xstart, lerptime, -2, "out");
    c_wait(lerptime);
    c_sel(su);
    c_facing("l");
    c_sel(kr);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_msgstay(5);
    c_speaker("extinguisher");
    c_msgsetloc(0, "* ..^1. Do you three want to know the code to the door?/%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_213_0");
    c_talk_wait();
    c_msgstay(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. uhh^1, yeah./%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_218_0");
    c_talk_wait();
    c_msgstay(5);
    c_speaker("extinguisher");
    c_msgsetloc(0, "* It's 2202!/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_223_0");
    c_msgnextloc("* Haha^1, it's written on me^1! Since I'm the most important!/%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_224_0");
    c_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_sel(su);
    c_sprite(spr_susie_surprised_left);
    c_wait_box(1);
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_wait_talk();
    c_msgstay(5);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_smile);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Umm^1, thanks!/%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_244_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EB* .../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_254_0");
    c_facenext("ralsei", "M");
    c_msgnextloc("\\EM* .../", "obj_dw_churchb_extinguisher_slash_Step_0_gml_256_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* We'll..^1. go seal the fountain./", "obj_dw_churchb_extinguisher_slash_Step_0_gml_258_0");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* ..^1. okay!/%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_260_0");
    c_talk();
    c_wait_box(0);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_wait_box(2);
    c_sel(ra);
    c_facing("r");
    c_wait_box(4);
    c_sel(su);
    c_facing("u");
    c_wait_talk();
    var pantime = 16;
    c_panobj(kr_actor, pantime);
    c_wait(pantime + 1);
    c_customfunc(function()
    {
        global.facing = 0;
    });
    c_sel(kr);
    c_facing("d");
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 6 && !instance_exists(obj_cutscene_master))
{
    global.plot = 242.3;
    global.interact = 0;
    global.facing = 0;
    scr_caterpillar_interpolate("all");
    solblock = instance_create(extinguisher.x, 0, obj_solidblock);
    scr_sizeexact(63, room_height, solblock);
    con = 7;
}
if (con == 7)
{
    var lowesty = max(kris.bbox_bottom, susie.bbox_bottom, ralsei.bbox_bottom) + 12;
    for (var i = 0; i < array_length(glass); i++)
    {
        with (glass[i])
        {
            if (y > lowesty)
            {
                var fade = scr_afterimage();
                fade.image_alpha = image_alpha;
                var block = instance_create(x, y, obj_solidblocksized);
                scr_sizeexact(sprite_width, sprite_height, block);
                instance_destroy();
            }
        }
    }
}
scr_walkntalk_action();
with (extinguisher)
{
    var chickentalking = false;
    if (instance_exists(obj_cutscene_master))
    {
        with (obj_cutscene_master)
        {
            if (!variable_instance_exists(id, "_speaker"))
                _speaker = "";
            if (_speaker == "extinguisher")
                chickentalking = true;
        }
    }
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* The Lightners' service has never gone on without me^1, ka-ka!/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_348_0");
        msgnextloc("* I must be the most important of all^1, ka-ka!/%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_349_0");
        if (global.plot < 225)
            global.flag[867] = 1;
        d_make();
        myinteract = 999;
        talked++;
    }
    if ((myinteract > 3 || chickentalking) && d_ex())
    {
        var trig = 0;
        with (obj_writer)
        {
            if (halt)
                trig = 1;
        }
        if (!i_ex(obj_writer))
            trig = 1;
        if (!trig)
            siner++;
        else
            siner = 0;
        marker.image_angle = lerp(marker.image_angle, sin(siner / 3) * 8, 0.5);
    }
    if (myinteract == 999 && !d_ex())
    {
        marker.image_angle = 0;
        siner = 0;
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
with (chicknpc)
{
    if (other.con == 3)
        myinteract = 0;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* I'm the most important^1, ka-ka!/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_404_0");
        msgnextloc("* No matter what^1, I'm still here!/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_405_0");
        msgnextloc("* Do you want to know what I know!? Ka-ka!/", "obj_dw_churchb_extinguisher_slash_Step_0_gml_406_0");
        scr_anyface_next("susie", "1");
        msgnextloc("\\E1* ..^1. not now^1, dude./%", "obj_dw_churchb_extinguisher_slash_Step_0_gml_408_0");
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract > 3 && d_ex())
    {
        var trig = 0;
        with (obj_writer)
        {
            if (halt)
                trig = 1;
            if (scr_getmsgno() >= 3)
                trig = 1;
        }
        if (!i_ex(obj_writer))
            trig = 1;
        if (!trig)
            siner++;
        else
            siner = 0;
        marker.image_angle = lerp(marker.image_angle, sin(siner / 3) * 8, 0.5);
    }
    if (myinteract == 999 && !d_ex())
    {
        marker.image_angle = 0;
        siner = 0;
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
if (blockit == true)
{
    layer_set_visible("TILES_ENTRANCEBLOCK", false);
    with (obj_genmarker)
    {
        if (extflag == "entranceblock")
        {
            var block = instance_create(x, y, obj_solidblock);
            scr_sizeexact(sprite_width, sprite_height, block);
            block.extflag = "doblock";
        }
    }
    blockit = false;
}
if (unblock == true)
{
    if (camerax() >= 84)
    {
        layer_set_visible("TILES_ENTRANCEBLOCK", true);
        with (obj_solidblock)
        {
            if (variable_instance_exists(id, "extflag"))
            {
                if (extflag == "doblock")
                    instance_destroy();
            }
        }
        unblock = false;
    }
}
