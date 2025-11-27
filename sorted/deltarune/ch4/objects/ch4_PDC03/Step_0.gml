if (global.plot < 25 && shyren_move)
{
    shyren_siner += 0.3;
    shyren_marker.y = shyren_marker.ystart + (sin(shyren_siner / 3) * 2);
}
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 99;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(411, 460);
    c_sel(su);
    c_setxy(408, 480);
    c_pannable(1);
    c_pan(260, 230, 1);
    c_wait(2);
    c_wait(60);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 90);
    c_wait(30);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_krisu);
    c_imagespeed(0.25);
    c_walkdirect(411, 366, 40);
    c_delaywalkdirect(41, 491, 362, 50);
    c_delaycmd(41, "sprite", spr_kris_walk_right_church);
    c_delaycmd(85, "imagespeed", 0);
    c_delaycmd(90, "sprite", spr_kris_walk_left_church);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_walk_up_church);
    c_imagespeed(0.25);
    c_walkdirect(408, 360, 50);
    c_delaywalkdirect(56, 460, 356, 40);
    c_delaycmd(56, "sprite", spr_susie_walk_right_church);
    c_delaycmd(90, "imagespeed", 0);
    c_wait(90);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Hell yeah^1, back of the bus./", "obj_ch4_PDC03_slash_Step_0_gml_68_0");
    c_msgnextloc("\\EL* Your mom can barely see us back here./%", "obj_ch4_PDC03_slash_Step_0_gml_69_0");
    c_talk_wait();
    c_wait(5);
    c_soundplay(snd_wing);
    c_sel(kr);
    c_sprite(spr_krisu);
    c_walk("d", 2, 3);
    c_sel(su);
    c_sprite(spr_susie_walk_up_church);
    c_walk("d", 2, 3);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_look_side_church);
    c_imageindex(1);
    c_msc(1421);
    c_talk_wait();
    c_waitcustom();
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 90;
    customcon = 0;
    c_waitcustom_end();
    c_mus2("volume", 0, 30);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(60);
    c_speaker("no_name");
    c_msgsetloc(0, "* (Your eyes closed instantly...)/%", "obj_ch4_PDC03_slash_Step_0_gml_111_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 20 && customcon == 1 && !d_ex())
{
    con = 21;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. Yeah^1, she'd probably notice if you started snoring./%", "obj_ch4_PDC03_slash_Step_0_gml_137_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_up_church);
    c_wait(5);
    c_pan(260, 30, 90);
    c_wait(120);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_speaker("no_name");
    c_msgsetloc(0, "* Welcome^1, everyone. Thank you for coming again today^1, on this glorious day of days.../", "obj_ch4_PDC03_slash_Step_0_gml_152_0");
    c_msgnextloc("* Please stand for the opening song./%", "obj_ch4_PDC03_slash_Step_0_gml_153_0");
    c_talk_wait();
    c_var_instance(alvin_marker, "image_speed", 0);
    c_mus2("volume", 0, 30);
    c_var_instance(id, "everybody_stand", true);
    c_wait(40);
    c_var_instance(id, "song_start", true);
    c_var_instance(noelle_marker, "sprite_index", spr_noelle_choir);
    c_var_instance(noelle_marker, "image_speed", 0.05);
    c_var_instance(toriel_marker, "sprite_index", spr_toriel_choir);
    c_var_instance(toriel_marker, "image_speed", 0.05);
    c_var_instance(snowydad_marker, "sprite_index", spr_snowy_dad_choir);
    c_var_instance(snowydad_marker, "image_speed", 0.05);
    c_var_instance(cattydad_marker, "sprite_index", spr_catty_dad_choir);
    c_var_instance(cattydad_marker, "image_speed", 0.05);
    c_var_instance(shyren_marker, "image_index", 0);
    c_var_instance(shyren_marker, "image_speed", 0.05);
    c_waitcustom();
}
if (everybody_stand)
{
    everybody_stand = false;
    for (var i = 0; i < array_length_1d(pews); i++)
    {
        if (i == 1)
            continue;
        var current_pew = pews[i];
        var delay_time = ((i % 2) == 0) ? choose(5, 10, 20) : choose(3, 8, 15);
        scr_script_delayed(scr_lerpvar_instance, delay_time, current_pew, "y", current_pew.y, current_pew.y - 10, 20 + choose(0, -2, 2));
    }
}
if (everybody_sit)
{
    everybody_sit = false;
    for (var i = 0; i < array_length_1d(pews); i++)
    {
        if (i == 1)
            continue;
        var current_pew = pews[i];
        var delay_time = ((i % 2) == 0) ? choose(5, 10, 20) : choose(3, 6, 15);
        scr_script_delayed(scr_lerpvar_instance, delay_time, current_pew, "y", current_pew.y, current_pew.ystart, 20 + choose(0, -2, 2));
    }
}
if (song_start)
{
    song_start = false;
    if (i_ex(obj_ch4_PDC03_choir_song))
    {
        with (obj_ch4_PDC03_choir_song)
            start_song = true;
    }
}
if (con == 21 && customcon == 1 && !i_ex(obj_ch4_PDC03_choir_song))
{
    con = 99;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(noelle_marker, "sprite_index", spr_noelle_church);
    c_var_instance(noelle_marker, "image_speed", 0);
    c_var_instance(toriel_marker, "sprite_index", spr_toriel_walk_down_church);
    c_var_instance(toriel_marker, "image_index", 0);
    c_var_instance(toriel_marker, "image_speed", 0);
    c_var_instance(snowydad_marker, "sprite_index", spr_snowy_dad_choir);
    c_var_instance(snowydad_marker, "image_index", 0);
    c_var_instance(snowydad_marker, "image_speed", 0);
    c_var_instance(cattydad_marker, "sprite_index", spr_catty_dad_church);
    c_var_instance(cattydad_marker, "image_index", 0);
    c_var_instance(cattydad_marker, "image_speed", 0);
    c_var_instance(shyren_marker, "image_index", 1);
    c_var_instance(shyren_marker, "image_speed", 0);
    c_wait(30);
    c_var_instance(pews[3], "sprite_index", spr_catty_mom_back_no1);
    c_var_instance(pews[3], "image_speed", 0.25);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_speaker("no_name");
    c_msgsetloc(0, "* You may now close your hymnals./%", "obj_ch4_PDC03_slash_Step_0_gml_267_0");
    c_talk_wait();
    c_var_instance(alvin_marker, "image_speed", 0);
    c_var_instance(noelle_marker, "sprite_index", spr_noelle_church);
    c_var_instance(pews[1], "sprite_index", spr_rudy_back_arms_down);
    c_var_instance(pews[1], "image_speed", 0);
    c_var_instance(id, "everybody_sit", true);
    c_mus2("volume", 1, 30);
    c_pan(260, 230, 90);
    c_wait(90);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_look_side_church);
    c_imageindex(1);
    c_imagespeed(0);
    c_var_instance(pews[2], "visible", 0);
    c_var_instance(catty_marker, "visible", 1);
    c_var_instance(alvin_marker, "x", 525);
    c_var_instance(alvin_marker, "y", 140);
    c_script_instance(pews[4], scr_emote, 0, "!", 30);
    c_script_instance(pews[5], scr_emote, 0, "!", 30);
    c_var_instance(id, "mkid_turn", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* (Hey^1, I didn't know Noelle was so good at singing...)/", "obj_ch4_PDC03_slash_Step_0_gml_307_0");
    c_msgnextloc("\\EL* (Damn. Let's wave lighters next time.)/", "obj_ch4_PDC03_slash_Step_0_gml_308_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Now^1, for the reading of the holy words./", "obj_ch4_PDC03_slash_Step_0_gml_310_0");
    c_msgnextloc("* Everyone please welcome Catty Cattenheimer to the stand./%", "obj_ch4_PDC03_slash_Step_0_gml_311_0");
    c_talk();
    c_wait_box(3);
    c_imageindex(0);
    c_var_instance(alvin_marker, "sprite_index", spr_npc_alvin_face_left);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_waittalk();
    c_var_instance(alvin_marker, "image_speed", 0);
    c_pan(260, 30, 90);
    c_wait(100);
    c_var_instance(catty_marker, "sprite_index", spr_catty_omg);
    c_var_instance(catty_marker, "image_speed", 0.25);
    c_speaker("catty");
    c_msgsetloc(0, "\\E4* Like^1, hey everybody^1! What's up!^1! Is this thing on?? LOL!!!/", "obj_ch4_PDC03_slash_Step_0_gml_335_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Catty^1, do you..^1. er..^1. have the reading papers?/%", "obj_ch4_PDC03_slash_Step_0_gml_337_0");
    c_talk();
    c_wait_box(2);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_var_instance(catty_marker, "sprite_index", spr_catty_omg);
    c_var_instance(catty_marker, "image_speed", 0);
    c_waittalk();
    c_var_instance(alvin_marker, "image_speed", 0);
    c_var_instance(catty_marker, "sprite_index", spr_npc_catty);
    c_var_instance(catty_marker, "image_speed", 0.25);
    c_var_instance(noelle_marker, "sprite_index", spr_noelle_church_cringe);
    c_var_instance(toriel_marker, "sprite_index", spr_toriel_cringe);
    c_var_instance(snowydad_marker, "sprite_index", spr_snowy_dad_cringe);
    c_var_instance(shyren_marker, "sprite_index", spr_shyren_cringe);
    c_speaker("catty");
    c_msgsetloc(0, "\\E2* No^1, I'm like good^1! I like^1, memorized it!/%", "obj_ch4_PDC03_slash_Step_0_gml_360_0");
    c_talk_wait();
    c_var_instance(catty_marker, "sprite_index", spr_npc_catty);
    c_var_instance(catty_marker, "image_speed", 0);
    c_var_instance(catty_marker, "image_index", 0);
    c_wait(60);
    c_var_instance(alvin_marker, "sprite_index", spr_npc_alvin_face_left_unhappy);
    c_wait(15);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_speaker("no_name");
    c_msgsetloc(0, "* You^1, er..^1. memorized it./%", "obj_ch4_PDC03_slash_Step_0_gml_376_0");
    c_talk_wait();
    c_var_instance(alvin_marker, "image_speed", 0);
    c_var_instance(catty_marker, "image_speed", 0.25);
    c_msgzurasu(1);
    c_speaker("catty");
    c_msgsetloc(0, "\\E8* Yeah!!^1! Like^1, so is everyone^1, like^1, ready to rock!? Woo!/", "obj_ch4_PDC03_slash_Step_0_gml_385_0");
    c_msgnextloc("\\E2* Three^1, two^1, one^1, GO-sies!!!/%", "obj_ch4_PDC03_slash_Step_0_gml_386_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(catty_marker, "sprite_index", spr_catty_omg);
    c_var_instance(catty_marker, "image_speed", 0.25);
    c_pan(260, 270, 100);
    c_wait(100);
    c_waittalk();
    c_var_instance(id, "speech_start", true);
    c_wait(10);
    c_sel(su);
    c_sprite(spr_susie_look_side_church);
    c_imageindex(1);
    c_imagespeed(0);
    c_msgside("bottom");
    c_msc(1246);
    c_talk_wait();
    c_waitcustom();
}
if (mkid_turn)
{
    mkid_turn_timer++;
    if (mkid_turn_timer == 30)
    {
        pews[4].sprite_index = spr_snowy_ut_l;
        pews[5].sprite_index = spr_mkid_ut_r_unhappy;
    }
    if (mkid_turn_timer == 90)
    {
        pews[4].sprite_index = spr_snowy_ut;
        pews[5].sprite_index = spr_mkid_ut;
        mkid_turn = false;
    }
}
if (con == 30 && !d_ex() && customcon == 1)
{
    con = 70;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("susie");
    c_msgsetloc(0, "\\EW* (Jeez^1, look at you acting so holy.)/", "obj_ch4_PDC03_slash_Step_0_gml_445_0");
    c_msgnextloc("\\EV* (C'mon^1, don't think I haven't heard the rumors.)/", "obj_ch4_PDC03_slash_Step_0_gml_446_0");
    c_msgnextloc("\\EW* (Y'know..^1. when you and Catti were kids.)/", "obj_ch4_PDC03_slash_Step_0_gml_447_0");
    c_msgnextloc("\\EY* (Didn't you try to summon a demon?)/", "obj_ch4_PDC03_slash_Step_0_gml_448_0");
    c_msgnextloc("\\E2* (I'm surprised they even let you in here..^1. heheheh.)/%", "obj_ch4_PDC03_slash_Step_0_gml_449_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_imageindex(0);
    c_wait_box(3);
    c_sel(su);
    c_imageindex(1);
    c_wait_box(4);
    c_sel(su);
    c_imageindex(0);
    c_waittalk();
    c_wait(60);
    c_sel(su);
    c_imageindex(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* (..^1. then again^1, this place does seem pretty...)/", "obj_ch4_PDC03_slash_Step_0_gml_477_0");
    c_msgnextloc("\\EK* (..^1. Uh^1, tolerant.)/%", "obj_ch4_PDC03_slash_Step_0_gml_478_0");
    c_talk_wait();
    c_sel(su);
    c_imageindex(0);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* (Huh? Fruit juice?)/", "obj_ch4_PDC03_slash_Step_0_gml_487_0");
    c_msgnextloc("\\E7* (If I can last until the end^1, we'll get fruit juice?)/", "obj_ch4_PDC03_slash_Step_0_gml_488_0");
    c_msgnextloc("\\EK* (..^1. is that the reason you're trying to pay attention?)/%", "obj_ch4_PDC03_slash_Step_0_gml_489_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_imageindex(1);
    c_waittalk();
    c_wait(60);
    c_sel(su);
    c_imageindex(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* (Well^1, OK.)/%", "obj_ch4_PDC03_slash_Step_0_gml_506_0");
    c_talk_wait();
    c_waitcustom();
}
if (speech_start)
{
    speech_start = false;
    if (i_ex(obj_ch4_PDC03_catty_preach))
    {
        with (obj_ch4_PDC03_catty_preach)
            start_speech = true;
    }
}
if (speech_stop)
{
    speech_stop = false;
    if (i_ex(obj_ch4_PDC03_catty_preach))
    {
        with (obj_ch4_PDC03_catty_preach)
            stop_speech = true;
    }
}
if (con == 40 && !d_ex() && customcon == 1)
{
    con = 99;
    customcon = 0;
    c_waitcustom_end();
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Alright^1, now we're talking!/", "obj_ch4_PDC03_slash_Step_0_gml_546_0");
    c_msgnextloc("\\EL* Let's see what the hell you've got here./", "obj_ch4_PDC03_slash_Step_0_gml_547_0");
    var total_item_amount = 0;
    var list_dialogue = "";
    scr_itemcheck_inventory_and_pocket(1);
    var darkcandy_check = haveit || scr_flag_get(101) > 0 || scr_flag_get(102) > 0 || scr_flag_get(128) > 0 || scr_flag_get(140) > 0;
    if (darkcandy_check)
    {
        total_item_amount++;
        var item_dialogue = stringsetloc("* Smellable stickers.", "obj_ch4_PDC03_slash_Step_0_gml_564_0");
        list_dialogue = list_dialogue + item_dialogue;
    }
    var revive_item_id = 0;
    var revive_item_ids = [2, 30, 31];
    for (var i = 0; i < array_length_1d(revive_item_ids); i++)
    {
        scr_itemcheck_inventory_and_pocket(revive_item_ids[i]);
        if (haveit)
        {
            revive_item_id = revive_item_ids[i];
            break;
        }
    }
    if (revive_item_id > 0)
    {
        total_item_amount++;
        scr_itemremove(revive_item_id);
        if (list_dialogue != "")
            list_dialogue = list_dialogue + "&";
        var item_dialogue = stringsetloc("* A peppermint (crunch).", "obj_ch4_PDC03_slash_Step_0_gml_592_0");
        list_dialogue = list_dialogue + item_dialogue;
    }
    var burger_check = false;
    var burger_item_ids = [8, 22];
    for (var i = 0; i < array_length_1d(burger_item_ids); i++)
    {
        scr_itemcheck_inventory_and_pocket(burger_item_ids[i]);
        if (haveit)
        {
            burger_check = true;
            break;
        }
    }
    if (burger_check)
    {
        total_item_amount++;
        if (list_dialogue != "")
            list_dialogue = list_dialogue + "&";
        var item_dialogue = stringsetloc("* Some burnt crumbs...", "obj_ch4_PDC03_slash_Step_0_gml_619_0");
        list_dialogue = list_dialogue + item_dialogue;
    }
    if (list_dialogue != "")
    {
        list_dialogue = list_dialogue + "/";
        c_msgnext(list_dialogue);
    }
    list_dialogue = stringsetloc("* A nibbled pencil...", "obj_ch4_PDC03_slash_Step_0_gml_640_0");
    if (global.lweapon == 6)
        list_dialogue = stringsetloc("* A cool pencil...", "obj_ch4_PDC03_slash_Step_0_gml_644_0");
    if (global.lweapon == 13)
        list_dialogue = stringsetloc("* Mechanical pencil...", "obj_ch4_PDC03_slash_Step_0_gml_649_0");
    if (global.lweapon == 12)
        list_dialogue = stringsetloc("* An eraser...", "obj_ch4_PDC03_slash_Step_0_gml_654_0");
    if (global.lweapon == 16)
        list_dialogue = stringsetloc("* A cactus needle...", "obj_ch4_PDC03_slash_Step_0_gml_663_0");
    if (global.lweapon == 17)
        list_dialogue = stringsetloc("* A glass shard...", "obj_ch4_PDC03_slash_Step_0_gml_668_0");
    if (scr_itemcheck_inventory_and_pocket(16) > 0)
    {
        total_item_amount++;
        var item_text = stringsetloc("* A piece of a CD...", "obj_ch4_PDC03_slash_Step_0_gml_660_0");
        list_dialogue = list_dialogue + "&" + item_text;
    }
    var tension_check = false;
    var tension_item_ids = [27, 28, 29];
    for (var i = 0; i < array_length_1d(tension_item_ids); i++)
    {
        scr_itemcheck_inventory_and_pocket(tension_item_ids[i]);
        if (haveit)
        {
            tension_check = true;
            break;
        }
    }
    if (tension_check)
    {
        total_item_amount++;
        var item_dialogue = stringsetloc("* Orange hard candy.", "obj_ch4_PDC03_slash_Step_0_gml_682_0");
        list_dialogue = list_dialogue + "&" + item_dialogue;
    }
    c_msgnext(list_dialogue + "/");
    if (total_item_amount == 0)
    {
        con = 70;
        var non_pencil = global.lweapon >= 16;
        if (global.lang == "ja" && !non_pencil)
            non_pencil = global.lweapon == 13;
        if (!non_pencil)
        {
            var tool = (global.lweapon == 12) ? stringsetloc("an eraser", "obj_ch4_PDC03_slash_Step_0_gml_700_0") : stringsetloc("a pencil", "obj_ch4_PDC03_slash_Step_0_gml_700_1");
            c_msgnextsubloc("\\EK* ..^1. why do you have ~1 but no paper?/", tool, "obj_ch4_PDC03_slash_Step_0_gml_702_0");
        }
        c_msgnextloc("\\E6* Huh? It's your..^1. sword?/", "obj_ch4_PDC03_slash_Step_0_gml_703_0");
        c_msgnextloc("\\E9* HAHAHA!^1! Seriously!?/", "obj_ch4_PDC03_slash_Step_0_gml_704_0");
        var susie_item = stringsetloc("hairbrush", "obj_ch4_PDC03_slash_Step_0_gml_711_0");
        if (global.charweapon[2] == 6)
            susie_item = stringsetloc("toy axe", "obj_ch4_PDC03_slash_Step_0_gml_715_0");
        if (global.charweapon[2] == 17)
            susie_item = stringsetloc("electric toothbrush", "obj_ch4_PDC03_slash_Step_0_gml_720_0");
        if (global.charweapon[2] == 7)
            susie_item = stringsetloc("weird card", "obj_ch4_PDC03_slash_Step_0_gml_725_0");
        if (global.charweapon[2] == 24)
            susie_item = stringsetloc("dirty toothbrush", "obj_ch4_PDC03_slash_Step_0_gml_746_0");
        c_msgnextsubloc("\\EK* ..^1. well^1, explains the ~1 in MY pocket./", susie_item, "obj_ch4_PDC03_slash_Step_0_gml_728_0");
        c_msgnextloc("\\EN* Here^1, I'll.../%", "obj_ch4_PDC03_slash_Step_0_gml_729_0");
        c_talk();
        var wait_box_offset = non_pencil ? -1 : 0;
        c_wait_box(1 + wait_box_offset);
        c_sel(su);
        c_imageindex(0);
        c_wait_box(3 + wait_box_offset);
        c_sel(su);
        c_imageindex(1);
        c_wait_box(5 + wait_box_offset);
        c_soundplay(snd_suslaugh);
        c_var_instance(id, "susie_laugh", true);
        c_sel(su);
        c_sprite(spr_susie_laugh_church);
        c_imagespeed(0.2);
        c_wait_box(6 + wait_box_offset);
        c_sel(su);
        c_sprite(spr_susie_look_side_church);
        c_imagespeed(0);
        c_imageindex(1);
        c_wait_box(7 + wait_box_offset);
        c_sel(su);
        c_imageindex(0);
        c_waittalk();
        c_wait(30);
        c_sel(su);
        c_sprite(spr_susie_church_pocket_search);
        c_imageindex(0);
        c_imagespeed(0.15);
        c_speaker("susie");
        c_msgsetloc(0, "\\EE* Wait^1, right^1, these aren't my clothes. What's IN here?/%", "obj_ch4_PDC03_slash_Step_0_gml_774_0");
        c_talk_wait();
        c_imagespeed(0);
        c_wait(30);
        c_soundplay(snd_noise);
        c_sprite(spr_susie_paper_read);
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Woah^1, what's this paper?/%", "obj_ch4_PDC03_slash_Step_0_gml_787_0");
        c_talk_wait();
        c_wait(30);
        c_sprite(spr_susie_paper_surprise);
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* No way./%", "obj_ch4_PDC03_slash_Step_0_gml_796_0");
        c_talk_wait();
        c_wait(30);
        c_sprite(spr_susie_paper_read);
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* \"Dear Catty^1, thank you for the honor of this junior dance.\"/", "obj_ch4_PDC03_slash_Step_0_gml_805_0");
        c_msgnextloc("\\E7* \"Your eyes are like whirlpools of molten cat food...\"/", "obj_ch4_PDC03_slash_Step_0_gml_806_0");
        c_msgnextloc("\\E7* \"..^1. the expensive kind you have to buy at the pet store.\"/", "obj_ch4_PDC03_slash_Step_0_gml_807_0");
        c_msgnextloc("\\E7* Signed..^1. Asriel!?/", "obj_ch4_PDC03_slash_Step_0_gml_808_0");
        c_msgnextloc("\\E9* HAHAHAHAH!!^1! HAHAHAHA!!!/%", "obj_ch4_PDC03_slash_Step_0_gml_809_0");
        c_talk();
        c_wait_box(3);
        c_sel(su);
        c_sprite(spr_susie_paper_surprise);
        c_wait_box(4);
        c_soundplay(snd_suslaugh);
        c_sel(su);
        c_var_instance(id, "susie_laugh", true);
        c_sprite(spr_susie_laugh_church);
        c_imagespeed(0.2);
        c_waittalk();
        c_wait(15);
        c_sprite(spr_susie_paper_read);
        c_imagespeed(0);
        c_wait(30);
        scr_itemget(60);
        var sentence_end = (noroom == 0) ? "/" : "/%";
        c_speaker("susie");
        c_msgsetsubloc(0, "\\E3* Hey^1, c'mon^1! Don't act like you weren't laughing^1, too!~1", sentence_end, "obj_ch4_PDC03_slash_Step_0_gml_835_0");
        if (noroom == 0)
        {
            c_msgnextloc("\\EK* Look..^1. uh^1, here. This was in here^1, too. Peace offering./", "obj_ch4_PDC03_slash_Step_0_gml_836_0");
            c_facenext("no_name", 0);
            c_msgnextloc("* (You got the Ancient Chocolate. It was absorbed into the JUNK BALL.)/%", "obj_ch4_PDC03_slash_Step_0_gml_838_0");
            c_talk();
            c_wait_box(1);
            c_sel(su);
            c_sprite(spr_susie_look_side_church);
            c_imageindex(1);
            c_wait_box(3);
            c_imageindex(0);
            c_soundplay(snd_item);
            c_waittalk();
        }
        else
        {
            c_talk_wait();
        }
        c_sel(su);
        c_sprite(spr_susie_look_side_church);
        c_imageindex(1);
        c_speaker("susie");
        c_msgsetloc(0, "\\E2* Must've been hard always being the cooler one^1, huh^1, Kris?/%", "obj_ch4_PDC03_slash_Step_0_gml_862_0");
        c_talk_wait();
        c_wait(30);
        c_speaker("no_name");
        c_msgsetloc(0, "* (...)&* (...)&* (You nodded.)/%", "obj_ch4_PDC03_slash_Step_0_gml_868_0");
        c_talk_wait();
        c_sel(su);
        c_imageindex(0);
        c_waitcustom();
    }
    else
    {
        var sentence_end = darkcandy_check ? "/" : "/%";
        if (total_item_amount == 5)
            c_msgnextsubloc("\\E9* Hell yeah^1, this'll keep us alive for days!~1", sentence_end, "obj_ch4_PDC03_slash_Step_0_gml_881_0");
        else
            c_msgnextsubloc("\\EL* Nice^1, that should be enough.~1", sentence_end, "obj_ch4_PDC03_slash_Step_0_gml_884_0");
        if (darkcandy_check)
        {
            c_msgnextloc("\\EL* All right^1, let's mess with the stickers first./", "obj_ch4_PDC03_slash_Step_0_gml_890_0");
            c_facenext("no_name", 0);
            c_msgnextloc("* (You inhaled the stickers' aroma.)&* (Smells like marshmallows.)/", "obj_ch4_PDC03_slash_Step_0_gml_892_0");
            c_facenext("susie", "A");
            c_msgnextloc("\\EA* Fragrant^1, but not overpowering./", "obj_ch4_PDC03_slash_Step_0_gml_894_0");
            c_msgnextloc("\\EL* .../%", "obj_ch4_PDC03_slash_Step_0_gml_895_0");
            c_talk();
            c_wait_box(5);
            c_sel(su);
            c_imageindex(1);
            c_wait_box(7);
            c_sel(su);
            c_imageindex(0);
            c_wait_box(10);
            c_sel(su);
            c_imageindex(1);
            c_waittalk();
            c_msc(1248);
            c_talk_wait();
        }
        else
        {
            c_talk_wait();
            c_sel(su);
            c_imageindex(0);
            con = 70;
        }
        c_waitcustom();
    }
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 60;
    customcon = 0;
    good_place = true;
    c_waitcustom_end();
    c_speaker("no_name");
    c_msgsetloc(0, "* (You put the sticker under your eye.)/%", "obj_ch4_PDC03_slash_Step_0_gml_937_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_laugh_church);
    c_imagespeed(0.2);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Haha^1, trying to look like your band outfit?/", "obj_ch4_PDC03_slash_Step_0_gml_945_0");
    c_msgnextloc("\\EA* Here./%", "obj_ch4_PDC03_slash_Step_0_gml_946_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_look_side_church);
    c_imagespeed(0);
    c_imageindex(0);
    c_waittalk();
    c_wait(15);
    c_sprite(spr_susie_sticker_kris);
    c_soundplay(snd_bump);
    c_wait(20);
    c_sprite(spr_susie_look_side_church);
    c_imagespeed(0);
    c_imageindex(1);
    c_wait(15);
    c_sprite(spr_kris_sticker_susie);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(kr);
    c_visible(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Now both sides are equal./%", "obj_ch4_PDC03_slash_Step_0_gml_980_0");
    c_talk_wait();
    c_wait(30);
    c_waitcustom();
}
if (con == 60 && !d_ex() && customcon == 1)
{
    con = 70;
    customcon = 0;
    scr_flag_set(700, 1);
    for (var i = 0; i < 4; i++)
        scr_itemremove(1);
    c_waitcustom_end();
    c_sel(su);
    if (!good_place)
        c_sprite(spr_kris_sticker_susie_alt);
    c_imagespeed(0.15);
    c_imageindex(0);
    c_sel(kr);
    c_visible(0);
    c_wait(28);
    c_soundplay(snd_bump);
    c_wait(12);
    c_sel(su);
    c_imagespeed(0);
    c_wait(30);
    if (good_place)
        c_sprite(spr_susie_sticker_look);
    else
        c_sprite(spr_susie_sticker_look_alt);
    c_imageindex(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* Huh!? Hey^1, who said you could put stickers there!?/", "obj_ch4_PDC03_slash_Step_0_gml_1036_0");
    c_msgnextloc("\\EY* You know what that means^1, dumbass./%", "obj_ch4_PDC03_slash_Step_0_gml_1037_0");
    c_talk_wait();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_walk_up_church);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(kr);
    c_sprite(spr_krisu);
    c_imagespeed(0);
    c_imageindex(0);
    c_visible(1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_sticker_look);
    c_imageindex(0);
    c_sel(kr);
    c_visible(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Well^1, that used up all of them./%", "obj_ch4_PDC03_slash_Step_0_gml_1072_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_look_side_church);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(kr);
    c_sprite(spr_krisu);
    c_imagespeed(0);
    c_imageindex(0);
    c_visible(1);
    c_waitcustom();
}
if (con == 70 && !d_ex() && customcon == 1)
{
    con = 80;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "speech_stop", true);
    c_waitcustom();
}
if (con == 80 && customcon == 1 && !i_ex(obj_ch4_PDC03_catty_preach))
{
    con = 90;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    c_wait(30);
    c_var_instance(pews[2], "visible", 1);
    c_var_instance(catty_marker, "visible", 0);
    c_var_instance(alvin_marker, "x", 485);
    c_var_instance(alvin_marker, "y", 114);
    c_var_instance(alvin_marker, "sprite_index", spr_npc_alvin);
    c_var_instance(noelle_marker, "sprite_index", spr_noelle_church);
    c_var_instance(toriel_marker, "sprite_index", spr_toriel_walk_down_church);
    c_var_instance(snowydad_marker, "sprite_index", spr_snowy_dad_choir);
    c_var_instance(cattydad_marker, "sprite_index", spr_catty_dad_church);
    c_var_instance(shyren_marker, "sprite_index", spr_shyren_choir);
    c_pan(260, 30, 100);
    c_wait(110);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_var_instance(cattydad_marker, "sprite_index", spr_catty_dad_church_thumbs_up);
    c_msgside("top");
    c_speaker("no_name");
    c_msgsetloc(0, "* Thus concludes the first reading./", "obj_ch4_PDC03_slash_Step_0_gml_1141_0");
    c_msgnextloc("* Now^1, for today's sermon^1, we once again share a passage by my late father^1, Gerson Boom./", "obj_ch4_PDC03_slash_Step_0_gml_1142_0");
    c_msgnextloc("* He always managed to put into words what we could never quite say ourselves./", "obj_ch4_PDC03_slash_Step_0_gml_1143_0");
    c_msgnextloc("* Now^1, let us begin.../%", "obj_ch4_PDC03_slash_Step_0_gml_1144_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(cattydad_marker, "sprite_index", spr_catty_dad_church);
    c_wait_talk();
    c_var_instance(alvin_marker, "image_speed", 0);
    c_mus2("volume", 0, 60);
    c_wait(30);
    c_var_instance(alvin_marker, "image_speed", 0.1);
    c_speaker("no_name");
    c_msgsetloc(0, "* We shall never know the pieces of the prophecy lost to time./", "obj_ch4_PDC03_slash_Step_0_gml_1163_0");
    c_msgnextloc("* But^1, was everything important truly written down in those words?/", "obj_ch4_PDC03_slash_Step_0_gml_1164_0");
    c_msgnextloc("* Myself^1, I see a blank page as an invitation to write.../", "obj_ch4_PDC03_slash_Step_0_gml_1165_0");
    c_msgnextloc("* To take the future and.../%", "obj_ch4_PDC03_slash_Step_0_gml_1166_0");
    c_talk();
    c_wait_box(3);
    c_var_instance(blackall, "depth", 50000);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait_talk();
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* (Listening to this^1, your eyes became heavy...)/%", "obj_ch4_PDC03_slash_Step_0_gml_1179_0");
    c_talk_wait();
    c_wait(61);
    c_waitcustom();
}
if (con == 90 && customcon == 1 && !d_ex())
{
    con = 100;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    c_pan(262, 262, 1);
    c_sel(su);
    c_setxy(465, 354);
    c_sprite(spr_susie_walk_right_church);
    c_halt();
    c_var_instance(id, "npc_setup", true);
    c_wait(60);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\E5* Kris^1! Hey^1, Kris^1! Get up!/%", "obj_ch4_PDC03_slash_Step_0_gml_1213_0");
    c_talk_wait();
    c_var_instance(blackall, "image_alpha", 0);
    c_sel(su);
    c_imagespeed(0.3);
    c_facing("d");
    c_sprite(spr_susie_walk_down_church);
    c_walk_wait("u", 2, 6);
    c_halt();
    c_wait(8);
    c_halt();
    c_walkdirect(465, 360, 12);
    c_sprite(spr_susie_kick_down_church);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_soundplay(snd_impact);
    c_shake();
    c_wait(4);
    c_imageindex(3);
    c_wait(20);
    c_sprite(spr_susie_walk_down_church);
    c_halt();
    c_walkdirect_wait(465, 354, 8);
    c_sprite(spr_susie_walk_right_church);
    c_halt();
    c_wait(15);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* We don't have any time to waste!/%", "obj_ch4_PDC03_slash_Step_0_gml_1252_0");
    c_talk_wait();
    c_soundplay(snd_wing);
    c_sel(kr);
    c_walk_wait("u", 2, 5);
    c_sprite(spr_kris_walk_left_church);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* We have to get to the bottom of this!/%", "obj_ch4_PDC03_slash_Step_0_gml_1263_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_church_2_cups);
    c_soundplay(snd_wing);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* The bottom of these two sweet^1, sweet^1, cups of juice./%", "obj_ch4_PDC03_slash_Step_0_gml_1273_0");
    c_talk_wait();
    c_sprite(spr_susie_church_cup_offering);
    c_wait(5);
    c_sprite(spr_susie_church_1_cup);
    c_sel(kr);
    c_sprite(spr_kris_church_cup);
    c_wait(30);
    c_sel(kr);
    c_visible(0);
    c_sel(su);
    c_sprite(spr_susie_kris_church_toast);
    c_soundplay(snd_bell);
    c_wait(15);
    c_sprite(spr_susie_church_1_cup);
    c_sel(kr);
    c_visible(1);
    c_wait(30);
    c_sel(kr);
    c_visible(0);
    c_soundplay(snd_noise);
    c_soundplay(snd_wing);
    c_mus2("initloop", "sink_noise.ogg", 0);
    c_sel(su);
    c_sprite(spr_susie_kris_church_drink);
    c_imagespeed(0.25);
    c_var_instance(id, "random_shake", true);
    c_wait(90);
    c_var_instance(id, "random_shake", false);
    c_mus2("stop");
    c_mus("free_all");
    c_sel(su);
    c_setxy(465, 354);
    c_sel(kr);
    c_sprite(spr_kris_church_punch_mouth);
    c_visible(1);
    c_sel(su);
    c_sprite(spr_susie_church_punch_mouth);
    c_imagespeed(0);
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Ahh./", "obj_ch4_PDC03_slash_Step_0_gml_1337_0");
    c_msgnextloc("\\EL* Church flavor./", "obj_ch4_PDC03_slash_Step_0_gml_1338_0");
    c_msgnextloc("\\E0* Anyway^1, you go ask around about the Shelter codes./", "obj_ch4_PDC03_slash_Step_0_gml_1339_0");
    c_msgnextloc("\\E1* Me? I'll make sure there's nothing hidden.../%", "obj_ch4_PDC03_slash_Step_0_gml_1340_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_walk_left_church);
    c_imagespeed(0.25);
    c_walkdirect(408, 360, 30);
    c_delaywalkdirect(31, 388, 458, 30);
    c_delaycmd(31, "sprite", spr_susie_walk_down_church);
    c_delaycmd(62, "imagespeed", 0);
    c_wait(10);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_kris_walk_left_church);
    c_imagespeed(0.25);
    c_walkdirect(411, 365, 30);
    c_delaycmd(31, "sprite", spr_kris_walk_down_church);
    c_delaycmd(31, "imagespeed", 0);
    c_delaycmd(31, "imageindex", 0);
    c_wait(20);
    c_panspeed(0, 3, 30);
    c_wait(90);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* ..^1. in here./%", "obj_ch4_PDC03_slash_Step_0_gml_1374_0");
    c_msgside("top");
    c_talk_wait();
    c_var_instance(id, "create_susie_npc", true);
    c_panobj(kr_actor, 60);
    c_mus2("initloop", "church_lw.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    c_wait(61);
    c_pannable(0);
    c_actortokris();
    c_terminatekillactors();
}
if (create_susie_npc)
{
    create_susie_npc = false;
    with (obj_ch4_PDC04)
        create_susie_npc();
}
if (con == 100 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 25;
    con = 99;
    with (obj_ch4_PDC04)
        npc_setup = true;
    with (susie_marker)
        instance_destroy();
    with (obj_caterpillarchara)
    {
        fun = 1;
        follow = 0;
        visible = 0;
    }
}
if (npc_setup)
{
    npc_setup = false;
    for (var i = 0; i < array_length_1d(pews); i++)
        pews[i].visible = 0;
    shyren_move = false;
    with (noelle_marker)
        instance_destroy();
    with (toriel_marker)
        instance_destroy();
    with (snowydad_marker)
        instance_destroy();
    with (cattydad_marker)
        instance_destroy();
    with (shyren_marker)
        instance_destroy();
    with (alvin_marker)
        instance_destroy();
    with (catty_marker)
        instance_destroy();
    bowl_marker.visible = 1;
    with (obj_ch4_PDC04)
        post_nap = true;
}
if (susie_laugh)
{
    susie_laugh = false;
    pews[0].sprite_index = spr_alphysr_unhappy;
    pews[7].sprite_index = spr_npc_bratty_unhappy;
    pews[5].sprite_index = spr_mkid_sweatdrop;
    pews[4].sprite_index = spr_snowy_sweatdrop;
    alarm[1] = 90;
}
if (random_shake)
{
    shake_timer++;
    if (shake_timer >= 2)
    {
        shake_timer = 0;
        with (su_actor)
        {
            x = 465 + choose(-2, -1, 1, 2);
            y = 354 + choose(-2, -1, 1, 2);
        }
    }
}
