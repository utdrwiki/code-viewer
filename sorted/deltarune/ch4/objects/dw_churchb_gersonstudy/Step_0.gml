scr_populatechars();
if (!depthinit)
{
    var targlayer = "BACKGROUND_GIVEDEPTH";
    layer_set_visible(targlayer, 0);
    var elements = layer_get_all_elements(targlayer);
    for (var i = 0; i < array_length(elements); i++)
    {
        if (layer_get_element_type(elements[i]) == 4)
        {
            var sprite = layer_sprite_get_sprite(elements[i]);
            var xloc = scr_even(layer_sprite_get_x(elements[i]));
            var yloc = scr_even(layer_sprite_get_y(elements[i]));
            var xscale = layer_sprite_get_xscale(elements[i]);
            var yscale = layer_sprite_get_yscale(elements[i]);
            var mark = scr_marker_ext(xloc, yloc, sprite, xscale, yscale, 0, 0, undefined, undefined, 0);
            with (mark)
            {
                scr_depth_alt();
                if (sprite_index == bg_dw_gerson_desk)
                    depth += 100;
            }
        }
    }
    if (!gersonrebattle)
    {
        targlayer = "BACKGROUND_GIVEDEPTH_TEMP";
        layer_set_visible(targlayer, 0);
        elements = layer_get_all_elements(targlayer);
        for (var i = 0; i < array_length(elements); i++)
        {
            if (layer_get_element_type(elements[i]) == 4)
            {
                var sprite = layer_sprite_get_sprite(elements[i]);
                var xloc = scr_even(layer_sprite_get_x(elements[i]));
                var yloc = scr_even(layer_sprite_get_y(elements[i]));
                var xscale = layer_sprite_get_xscale(elements[i]);
                var yscale = layer_sprite_get_yscale(elements[i]);
                var mark = scr_marker_ext(xloc, yloc, sprite, xscale, yscale, 0, 0, undefined, undefined, 0);
                with (mark)
                    scr_depth_alt();
            }
        }
    }
    if (gersonrebattle)
    {
        global.plot = 239.2;
        con = 6;
        with (obj_solidblock)
        {
            if (image_blend == #5900FF)
                instance_destroy();
        }
        var fireplaceblocker = findspriteinfo(spr_debug_lightning_area);
        with (instance_create(fireplaceblocker.x, fireplaceblocker.y, obj_solidblock))
        {
            sprite_index = fireplaceblocker.sprite_index;
            image_xscale = fireplaceblocker.image_xscale;
            image_yscale = fireplaceblocker.image_yscale;
        }
        var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
            {
                var info = scr_assetgetinfo(spritesArray[i]);
                blueflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
                with (blueflame)
                {
                    roomtarg = 295;
                    entrance = 8;
                    color = "blue";
                }
            }
            if (layer_sprite_get_sprite(spritesArray[i]) == 1021)
            {
                var info = scr_assetgetinfo(spritesArray[i]);
                with (instance_create(info[2], info[3], obj_solidblock))
                {
                    sprite_index = spr_pxwhite;
                    image_blend = c_black;
                    depth = layer_get_depth("Tiles_new_midground") - 10;
                    scr_size(info[4], info[5]);
                }
            }
        }
    }
    depthinit = 1;
    if (scr_debug())
    {
        if (global.tempflag[90] == 0.5)
        {
            global.tempflag[90] = 0;
            var pos = scr_heromarker("kris", "debugwarp");
            setxy(pos[0], pos[1], 1049);
            setxy(pos[0] + 80, pos[1], 1235);
            scr_caterpillar_interpolate("all");
        }
    }
}
if (con == 1)
{
    global.interact = 1;
    if (i_ex(susie) && i_ex(kris))
    {
        con = -1;
        scr_delay_var("con", 2, 2);
    }
}
if (con == 2)
{
    con = 3;
    var krpos1 = scr_heromarker("kris", "pos1");
    var krpos2 = scr_heromarker("kris", "pos2");
    var supos1 = scr_heromarker("susie", "pos1");
    var supos2 = scr_heromarker("susie", "pos2");
    var supos3 = scr_heromarker("susie", "pos3");
    var walkspeed = 2;
    var walktime = max(round(abs(krpos1[0] - krpos2[0]) / walkspeed), 1);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(krpos1[0], krpos1[1]);
    c_walkdirect(krpos2[0], krpos2[1], walktime);
    c_sel(su);
    c_setxy(supos1[0], supos1[1]);
    c_walkdirect(supos2[0], supos2[1], walktime);
    c_wait(walktime);
    c_var_instance(id, "excl", 1);
    c_wait(20);
    c_sel(su);
    walkspeed = 8;
    walktime = max(round(abs(supos2[0] - supos3[0]) / walkspeed), 1);
    c_walkdirect(supos3[0], supos3[1], walktime);
    c_sel(kr);
    var pos = findspriteinfo(spr_krisl_dark, "DEBUG_ASSETS");
    c_walkdirect(pos.x, pos.y, walktime + 15);
    c_wait(walktime);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, I was right!^1! It's the old man's study!/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_165_0");
    c_msgnextloc("\\EN* He must've been..^1. leading us here^1, right?/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_166_0");
    c_msgnextloc("\\E9* Now all we gotta do is get ahold of him.../%", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_167_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_facing("r");
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_look_down);
    c_wait_talk();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !instance_exists(obj_cutscene_master))
{
    global.plot = 239.1;
    scr_caterpillar_interpolate("all");
    global.facing = 0;
    global.interact = 0;
    con = 4;
    scr_tempsave();
}
if (con == 4)
{
    if (scr_trigcheck("cut2"))
    {
        global.interact = 1;
        con = 5;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        c_msgruncheck(true);
        c_speaker("susie");
        c_msgsetloc(0, "\\ED* ..^1. hey^1, Kris./", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_214_0");
        c_msgnextloc("\\EN* You think he'd..^1. want to come to our Castle Town?/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_215_0");
        c_msgnextloc("\\E9* I mean^1, obviously he would^1, right?/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_216_0");
        c_msgnextloc("\\ED* .../", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_217_0");
        c_msgnextloc("\\ES* Might mean..^1. taking the hammer^1, but.../", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_218_0");
        c_msgnextloc("\\E9* ..^1. I'm sure he'd be cool with it though^1, right?/%", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_219_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_flip("x");
        c_sprite(spr_susie_walk_right_dw_look_down);
        c_wait_box(2);
        c_sprite(spr_susie_walk_back_arm);
        c_wait_box(4);
        c_sprite(spr_susie_walk_right_dw_look_down);
        c_wait_box(5);
        c_flip("x");
        c_facing("l");
        c_wait_talk();
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
}
if (con == 5 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.plot = 239.2;
    con = 6;
}
if (excl == 1)
{
    excl = 0;
    with (obj_actor)
    {
        if (name == "susie")
        {
            var doomtime = 20;
            with (scr_marker_ext(x + 20, y - 20, spr_exc, 2, 2, undefined, undefined, undefined, depth - 1, undefined, doomtime))
            {
                vspeed = -3;
                gravity = 0.7;
                scr_limitval_upper(id, "y", y);
            }
        }
    }
}
with (shop)
{
    scr_depth(marker, 60);
    if (myinteract == 3)
    {
        didgetitem = -1;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_284_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_285_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        if (global.flag[1593] == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's an unmanned table of item...)/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_292_0");
            msgnextloc("* (..^1. take some?)/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_293_0");
            msgnext("\\C2 ");
            d_make();
            myinteract = 10;
        }
        else
        {
            var price = 99;
            if (global.flag[1594] > 0)
                price = 100;
            if (!instance_exists(obj_moneydisplay))
                instance_create(0, 0, obj_moneydisplay);
            scr_speaker("no_name");
            msgsetsubloc(0, "* (It's a Rhapsotea. Take it for $~1?)/", string(price), "obj_dw_churchb_gersonstudy_slash_Step_0_gml_307_0");
            msgnext("\\C2 ");
            d_make();
            myinteract = 20;
        }
    }
    if (myinteract == 10 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            global.flag[1593] = 1;
            scr_speaker("susie");
            msgsetloc(0, "\\E5* Hey^1, that's the old man's^1, dumbass!/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_321_0");
            msgnextloc("\\EK* You gotta leave some money or something.../%", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_322_0");
        }
        if (global.choice == 1)
        {
            global.flag[1593] = 2;
            scr_speaker("susie");
            msgsetloc(0, "\\EL* ..^1. yeah^1, that's not the cool type of stealing./%", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_328_0");
        }
        d_make(undefined, undefined, 4);
        myinteract = 11;
    }
    if (myinteract == 11 && !d_ex())
        myinteract = 3;
    if (myinteract == 20 && global.choice != -1)
    {
        with (obj_moneydisplay)
            instance_destroy();
        if (global.choice == 1)
        {
            k_d();
            myinteract = 0;
            global.interact = 0;
        }
        if (global.choice == 0)
        {
            myinteract = 0;
            k_d(1);
            var price = 99;
            if (global.flag[1594] > 0)
                price = 100;
            var haveroom = scr_inventoryspace() + scr_pocketspace();
            var havegold = false;
            if (global.gold >= price)
                havegold = true;
            if (haveroom && havegold)
            {
                var paidtoomuch = false;
                var paidexact = false;
                if (price == 99 && global.gold > 99)
                {
                    paidtoomuch = true;
                    price = 100;
                }
                if (price == 99 && global.gold == 99)
                    paidexact = true;
                if (paidtoomuch)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EC* ..^1. Dude^1, that's a $100. It costs $99./", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_371_0");
                    msgnextloc("\\E1* We gotta^1, uh..^1. make change./", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_372_0");
                    msgnextloc("\\E0* .../", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_373_0");
                    msgnextloc("\\EK* Nah^1, screw it. I'm not doing that./", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_374_0");
                    scr_anyface_next("no_name", 0);
                    msgnextloc("* (You paid an extra $1 for the Rhapsotea...)/", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_376_0");
                    msgnext(scr_itemget_anytype_text(61, "item"));
                    didgetitem = 6;
                    global.gold -= price;
                    global.flag[1594]++;
                }
                else if (paidexact)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EY* Check it. Perfect change^1, loser./", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_385_0");
                    scr_anyface_next("no_name", 0);
                    msgnext(scr_itemget_anytype_text(61, "item"));
                    didgetitem = 2;
                    global.gold -= price;
                }
                else
                {
                    global.gold -= price;
                    msgset(0, scr_itemget_anytype_text(61, "item"));
                    didgetitem = 0;
                    global.flag[1594]++;
                }
            }
            if (!haveroom)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* Dude^1, you can't even hold it. Too much stuff./", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_403_0");
                msgnextloc("\\EC* The hell are you lugging around^1, anyway?/%", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_404_0");
            }
            if (!havegold)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* Wrong bill^1, dumbass^1. That's not enough!/%", "obj_dw_churchb_gersonstudy_slash_Step_0_gml_409_0");
            }
            d_make();
            myinteract = 99;
        }
    }
    if (myinteract == 99 && d_ex())
    {
        if (didgetitem != -1 && i_ex(obj_writer))
        {
            if (scr_getmsgno() == didgetitem)
            {
                debug_print("got item");
                didgetitem = -1;
                snd_play(snd_equip);
            }
        }
    }
    if (myinteract == 99 && !d_ex())
    {
        global.interact = 0;
        myinteract = 0;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("T")))
        global.gold = 4;
    if (keyboard_check_pressed(ord("1")))
    {
        debug_print("100 gold");
        global.gold = 100;
    }
    if (keyboard_check_pressed(ord("2")))
    {
        debug_print("99 gold");
        global.gold = 99;
    }
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("0")))
        room_goto(room_dw_church_gersonstudy);
}
