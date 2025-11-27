if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("0")))
        room_goto(room_dw_churchb_gersonstudy);
}
with (hammerTreasure)
{
    siner++;
    with (shine)
        image_alpha = (sin(other.siner / 15) * 0.25) + 0.75;
    if (myinteract != 0)
    {
        with (shine)
            instance_destroy();
    }
}
if (global.plot >= 242)
{
    with (cup)
    {
        marker.image_index += 0.25;
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* What!? You emerged from the green flame.../", "obj_dw_gerson_study_slash_Step_0_gml_25_0");
            msgnextloc("* ..^1. Well^1, you may as well head back through./", "obj_dw_gerson_study_slash_Step_0_gml_26_0");
            msgnextloc("* This study has fallen to naught more than a lonely shack./%", "obj_dw_gerson_study_slash_Step_0_gml_27_0");
            if (talked)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Warriors^1! Gather your courage^1, and return through the green flame./%", "obj_dw_gerson_study_slash_Step_0_gml_32_0");
            }
            d_make();
            myinteract = 999;
            talked++;
        }
        if (myinteract == 999 && !d_ex())
        {
            myinteract = 0;
            marker.image_index = 0;
            global.interact = 0;
        }
    }
}
if (jack_look)
{
    if (d_ex())
    {
        if (_blush != -4)
        {
            with (_blush)
                image_alpha = 0;
            jack_marker.image_speed = 0.2;
        }
        jack_marker.sprite_index = spr_npc_jackenstein_cleaning_look;
    }
    else
    {
        jack_look = false;
        jack_marker.sprite_index = spr_npc_jackenstein_cleaning;
    }
}
if (cute_active && !d_ex() && global.interact == 0)
{
    cute_active = false;
    _blush = instance_create(jack_marker.x, jack_marker.y, obj_afterimage);
    _blush.sprite_index = spr_npc_jackenstein_cleaning_blush;
    _blush.image_xscale = 2;
    _blush.image_yscale = 2;
    _blush.image_alpha = 3;
    jack_marker.image_speed = 0.6;
    with (jack_marker)
        scr_delay_var("image_speed", 0.2, 90);
}
if (fountain_active && !d_ex())
{
    fountain_active = false;
    instance_create(camerax(), cameray(), obj_gerson_fountain);
}
if (table_active && !d_ex())
{
    table_active = false;
    instance_create(camerax(), cameray(), obj_gerson_table);
}
if (con < 0)
    exit;
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    c_pannable(1);
    c_pan(168, cameray() - 60, 30);
    var kr_x_pos = 469;
    var kr_y_pos = 618;
    var kr_walktime = scr_calculate_move_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos, 6);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "u");
    var su_x_pos = 517;
    var su_y_pos = 632;
    var su_walktime = scr_calculate_move_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos, 6);
    c_sel(su);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "u");
    var ra_x_pos = 424;
    var ra_y_pos = 637;
    var ra_walktime = scr_calculate_move_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos, 6);
    c_sel(ra);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "u");
    c_wait(45);
    c_speaker("no_name");
    c_msgsetloc(0, "* \"The Axe which nests beyond the pyre/", "obj_dw_gerson_study_slash_Step_0_gml_151_0");
    c_msgnextloc("* Awakes from rest by golden choir/", "obj_dw_gerson_study_slash_Step_0_gml_152_0");
    c_msgnextloc("* 3 tunes bekiss'd in dulcet wire/", "obj_dw_gerson_study_slash_Step_0_gml_153_0");
    c_msgnextloc("* Which whispers in the darkest mire.\"/%", "obj_dw_gerson_study_slash_Step_0_gml_154_0");
    c_talk_wait();
    if (scr_flag_get(1548) == 0)
    {
        scr_flag_set(1548, 1);
        c_wait(30);
        c_sel(su);
        c_autowalk(0);
        c_imagespeed(0.2);
        c_sprite(spr_susie_head_scratch_dw);
        c_addxy(0, -6);
        c_speaker("susie");
        c_msgsetloc(0, "\\E0* ..^1. huh./", "obj_dw_gerson_study_slash_Step_0_gml_170_0");
        c_msgnextloc("\\E1* ..^1. uh.../", "obj_dw_gerson_study_slash_Step_0_gml_171_0");
        c_msgnextloc("\\EA* ..^1. It sounds like there's some sort of \\cYcool axe\\cW./%", "obj_dw_gerson_study_slash_Step_0_gml_172_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_halt();
        c_sel(ra);
        c_sprite(spr_ralsei_turn_left_subtle);
        c_wait_box(2);
        c_sel(su);
        c_autowalk(1);
        c_facing("l");
        c_addxy(0, 6);
        c_wait_talk();
        c_wait(15);
        c_sel(su);
        c_sprite(spr_susie_walk_left_dw_unhappy);
        c_sel(ra);
        c_emote("!", 30);
        c_facing("u");
        c_jump_in_place(6, 6);
        c_speaker("susie");
        c_msgsetloc(0, "\\EC* ..^1. Ralsei?/%", "obj_dw_gerson_study_slash_Step_0_gml_201_0");
        c_talk_wait();
        c_wait(30);
        c_sel(ra);
        c_sprite(spr_ralsei_surprised_right);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EQ* Um-- huh? Sorry^1, maybe the old man knows something about it?/%", "obj_dw_gerson_study_slash_Step_0_gml_210_0");
        c_talk_wait();
        c_wait(15);
        c_sel(ra);
        c_facing("r");
        if (scr_flag_get(850) < 3)
        {
            c_sel(su);
            c_facing("l");
            c_speaker("susie");
            c_msgsetloc(0, "\\E2* Nah^1, screw it. We'll find it ourselves./%", "obj_dw_gerson_study_slash_Step_0_gml_226_0");
            c_talk_wait();
        }
        else
        {
            c_sel(su);
            c_facing("d");
            c_speaker("susie");
            c_msgsetloc(0, "\\EA* ..^1. Yeah^1, maybe we could ask him./%", "obj_dw_gerson_study_slash_Step_0_gml_235_0");
            c_talk_wait();
        }
    }
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_facing("r");
    c_sel(kr);
    c_walkdirect_wait(kr_x_pos, kr_actor.y, 8);
    c_facing("d");
    c_pannable(1);
    c_pan(168, cameray(), 16);
    c_wait(17);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 11 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
}
if (con == 20 && !d_ex())
{
    con = 21;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (convo_flag == "opened_door")
    {
        c_speaker("gerson");
        c_msgsetloc(0, "* Seems the Central Door up the stairs is open now./", "obj_dw_gerson_study_slash_Step_0_gml_305_0");
        c_msgnextloc("* That oughta lead where you gotta go./", "obj_dw_gerson_study_slash_Step_0_gml_306_0");
        c_msgnextloc("* ..^1. what do ya reckon that Knight fellow is^1, anyhoo...?/", "obj_dw_gerson_study_slash_Step_0_gml_307_0");
        c_facenext("susie", "D");
        c_msgnextloc("\\ED* I don't..^1. really know^1, I guess.../", "obj_dw_gerson_study_slash_Step_0_gml_309_0");
        c_msgnextloc("\\E0* Last night^1, in the Light World..^1. I saw them./", "obj_dw_gerson_study_slash_Step_0_gml_310_0");
        c_msgnextloc("\\E1* Was too dark to see much^1, but guess they're a Lightner./", "obj_dw_gerson_study_slash_Step_0_gml_311_0");
        c_msgnextloc("\\E0* Who they actually are^1, I have no idea./", "obj_dw_gerson_study_slash_Step_0_gml_312_0");
        c_msgnextloc("\\ED* I..^1. can't think of anyone as messed up as them./", "obj_dw_gerson_study_slash_Step_0_gml_313_0");
        c_msgnextloc("\\Ee* Making fountains..^1. kidnapping people.. like.../", "obj_dw_gerson_study_slash_Step_0_gml_314_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Why do ya reckon they're doin' it?/", "obj_dw_gerson_study_slash_Step_0_gml_316_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* ..^1. Huh? I..^1. I dunno. Maybe they just.../", "obj_dw_gerson_study_slash_Step_0_gml_318_0");
        c_msgnextloc("\\ED* I mean^1, maybe..^1. they just wanna see everything burn./", "obj_dw_gerson_study_slash_Step_0_gml_319_0");
        c_msgnextloc("\\E2* Too bad we're gonna kick their ass first!/", "obj_dw_gerson_study_slash_Step_0_gml_320_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* ..^1. Geheheh^1, that so? Well^1, good luck to you all!/%", "obj_dw_gerson_study_slash_Step_0_gml_322_0");
        c_talk_wait();
    }
    else if (convo_flag == "letter")
    {
        c_speaker("gerson");
        c_msgsetloc(0, "* Oh^1, jes' workin' on a little personal letter!/", "obj_dw_gerson_study_slash_Step_0_gml_376_0");
        c_msgnextloc("* ..^1. Miss^1, ya mind proofreadin' what I got so far?/", "obj_dw_gerson_study_slash_Step_0_gml_377_0");
        c_facenext("susie", "K");
        c_msgnextloc("\\EK* Ugh..^1. fine./", "obj_dw_gerson_study_slash_Step_0_gml_379_0");
        c_msgnextloc("\\EH* ..^1. Hey^1, all you've written is \"The\"!!/", "obj_dw_gerson_study_slash_Step_0_gml_380_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* So I have^1, so I have^1! Ha ha^1! I'll keep goin' then!/%", "obj_dw_gerson_study_slash_Step_0_gml_382_0");
        c_talk_wait();
    }
    else if (convo_flag == "letter_jack")
    {
        c_speaker("gerson");
        c_msgsetloc(0, "* Well^1, we got a new big friend in here^1! And me.../", "obj_dw_gerson_study_slash_Step_0_gml_413_0");
        c_msgnextloc("* Still workin' bit by bit on my letter!/", "obj_dw_gerson_study_slash_Step_0_gml_414_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* Hey^1, what's that drawing in the corner...?/", "obj_dw_gerson_study_slash_Step_0_gml_416_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* That? ..^1. just a doodle o' you fellas!/", "obj_dw_gerson_study_slash_Step_0_gml_418_0");
        c_facenext("susie", "7");
        c_msgnextloc("\\E7* Wait a sec^1, you drew it wrong!/", "obj_dw_gerson_study_slash_Step_0_gml_420_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Oh? Here^1, take the pen then../%", "obj_dw_gerson_study_slash_Step_0_gml_422_0");
        c_talk_wait();
        c_snd_play(snd_magicmarker);
        c_wait(15);
        if (scr_flag_get(701) == 1)
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E9* See^1, Kris wasn't saying \"SUSIE RULEZ.\"/", "obj_dw_gerson_study_slash_Step_0_gml_467_0");
            c_facenext("gerson", 0);
            c_msgnextloc("* Geh ha ha^1, a classic mistake^1, that!/%", "obj_dw_gerson_study_slash_Step_0_gml_469_0");
            c_talk_wait();
        }
        else
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E9* Gotta draw yourself in too^1, dumbass./", "obj_dw_gerson_study_slash_Step_0_gml_477_0");
            c_facenext("gerson", 0);
            c_msgnextloc("* Hmm^1, I'm missin' my shell./", "obj_dw_gerson_study_slash_Step_0_gml_479_0");
            c_facenext("susie", "A");
            c_msgnextloc("\\EA* Yeah^1, you haven't earned that yet./%", "obj_dw_gerson_study_slash_Step_0_gml_481_0");
            c_talk_wait();
        }
    }
    else if (convo_flag == "letter_sheet")
    {
        c_speaker("gerson");
        c_msgsetloc(0, "* Oh^1, just finishin' up my letter^1, I suppose.../", "obj_dw_gerson_study_slash_Step_0_gml_488_0");
        c_facenext("susie", "6");
        c_msgnextloc("\\E6* Huh? Thought you said you were done./", "obj_dw_gerson_study_slash_Step_0_gml_490_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Nah^1, a writer ain't ever satisfied!/", "obj_dw_gerson_study_slash_Step_0_gml_492_0");
        c_facenext("susie", "A");
        c_msgnextloc("\\EA* Heh. That sounds annoying./", "obj_dw_gerson_study_slash_Step_0_gml_494_0");
        c_facenext("gerson", 0);
        c_msgnextloc("* Oh^1, it sure is^1! Geh hahaha!/%", "obj_dw_gerson_study_slash_Step_0_gml_496_0");
        c_talk_wait();
    }
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 21 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
}
if (con == 100 && !d_ex())
{
    con = 101;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 102 && !i_ex(obj_cutscene_master))
{
    con = 103;
    alarm[0] = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_pannable(1);
    c_pan(160, 370, 1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(120);
    c_var_instance(fireplace_grow_marker, "visible", 1);
    c_sound_play(snd_locker);
    c_shake();
    c_wait(30);
    c_var_instance(fireplace_grow_marker, "image_index", 1);
    c_var_instance(plaque_marker, "y", plaque_marker.ystart - 22);
    c_sound_play(snd_locker);
    c_shake();
    c_wait(30);
    c_var_instance(fireplace_grow_marker, "image_index", 2);
    c_var_instance(plaque_marker, "y", plaque_marker.ystart - 48);
    c_sound_play(snd_locker);
    c_shake();
    c_wait(30);
    c_wait(60);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(90);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 104 && !i_ex(obj_cutscene_master))
{
    con = 99;
    with (obj_musicer_dw_gerson_study)
        instance_destroy();
    snd_stop_all();
    room_goto(room_dw_church_secretpiano);
}
if (con == 200 && !d_ex())
{
    con = 201;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 202 && !i_ex(obj_cutscene_master))
{
    con = 203;
    alarm[0] = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    c_sel(ra);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_pannable(1);
    c_pan(160, 300, 5);
    c_wait(6);
    c_pan(160, 0, 90);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(120);
    c_var_instance(gerson_door, "image_index", 1);
    c_sound_play(snd_locker);
    c_shake();
    c_wait(60);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 30);
    c_wait(90);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 204 && !i_ex(obj_cutscene_master))
{
    con = 99;
    with (obj_musicer_dw_gerson_study)
        instance_destroy();
    if (scr_flag_get(848) > 0)
        scr_flag_set(847, 3);
    else
        scr_flag_set(847, 2);
    room_goto(room_dw_church_organpuzzle);
}
