scr_populatechars();
if (scr_debug())
{
    if (keyboard_check_pressed(ord("P")))
    {
        safe_delete(gerson);
        gerson = 0;
        hidecater = 1;
        gcon = 0;
        ccon = 0;
        setxy(746, 384, 1049);
        con = 10;
    }
}
if (!init)
{
    if (makerightblock)
    {
        var pos = scr_heromarker(undefined, "steelstaff");
        rightblock = instance_create(pos[0], pos[1], obj_dw_church_steelstaff);
    }
    init = true;
}
if (!darkinit)
{
    with (obj_genmarker)
    {
        if (extflag == "lightspot")
        {
            with (instance_create(x, y, obj_light_following))
                size = 120;
        }
    }
    with (obj_dw_church_glowtile)
        x += room_width;
    darkness = instance_create(0, 0, obj_darkness_overlay);
    slight = instance_create(susie.x, susie.y, obj_light_following);
    slight.target = susie;
    slight.xoff = 26;
    slight.yoff = 46;
    rlight = instance_create(ralsei.x, ralsei.y, obj_light_following);
    rlight.target = ralsei;
    rlight.xoff = 18;
    rlight.yoff = 40;
    klight = instance_create(kris.x, kris.y, obj_light_following);
    klight.target = kris;
    klight.xoff = 18;
    klight.yoff = 38;
    glight = instance_create(gerson.x, gerson.y, obj_light_following);
    glight.target = gerson;
    glight.xoff = 36;
    glight.yoff = 44;
    with (obj_doorAny)
    {
        if (y > 1000)
            setxy(room_width, room_height);
    }
    darkinit = 1;
}
if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "cs1")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1)
    {
        leavecon = 1;
        global.interact = 1;
        con = 1;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        ger = actor_count + 1;
        ger_actor = instance_create(gerson.x, gerson.y, obj_actor);
        scr_actor_setup(ger, ger_actor, "nicecream");
        ger_actor.sprite_index = gerson.sprite_index;
        ger_actor.usprite = gerson.usprite;
        ger_actor.dsprite = gerson.dsprite;
        ger_actor.rsprite = gerson.rsprite;
        ger_actor.lsprite = gerson.lsprite;
        ger_actor.name = "gerson";
        scr_depth(ger_actor);
        gerson.visible = false;
        global.facing = 1;
        slight.target = su_actor;
        rlight.target = ra_actor;
        klight.target = kr_actor;
        glight.target = ger_actor;
    }
    if (obj_mainchara.y > 1040)
    {
        obj_mainchara.y = 1040;
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EH* Get back here dumbass!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_173_0");
        d_make();
        con = 0.1;
    }
}
if (con == 0.1 && !d_ex())
{
    global.facing = 2;
    global.interact = 0;
    con = 0;
}
if (con == 1)
{
    forceside = 0;
    con = -2;
    scr_doom(clamper, 8);
    clamper = 0;
    c_pannable(1);
    c_pan(1040, 611, 21);
    c_sel(kr);
    c_walkdirect_speed(1288, 840, 4);
    c_sel(ger);
    c_walkdirect_speed(1320, 880, 4);
    c_sel(su);
    c_walkdirect_speed(1336, 772, 4);
    c_sel(ra);
    c_walkdirect_speed(1386, 830, 4);
    c_wait(45);
    c_sel(kr);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* Damn^1, another stupid maze./", "obj_dw_church_darkmaze_slash_Step_0_gml_224_0");
    c_msgnextloc("\\E1* Hey old man^1, which way to your study?/%", "obj_dw_church_darkmaze_slash_Step_0_gml_225_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_sel(su);
    c_facing("d");
    c_sel(ger);
    c_facing("d");
    c_wait_talk();
    c_wait(5);
    c_sel(ger);
    c_facing("r");
    c_wait(10);
    c_facing("l");
    c_wait(10);
    c_facing("u");
    c_wait(10);
    c_facing("l");
    c_wait(15);
    c_sprite(spr_gerson_beard_thinking_neutral);
    c_animate(0, 6, 0.1);
    c_wait(48);
    c_speaker("gerson");
    c_msgsetloc(0, "* Hmm-a-rmm.../%", "obj_dw_church_darkmaze_slash_Step_0_gml_256_0");
    c_talk_wait();
    c_wait(8);
    c_sprite(spr_gerson_look_diagonal);
    c_speaker("gerson");
    c_msgsetloc(0, "* Left^1! Left^1, it was./%", "obj_dw_church_darkmaze_slash_Step_0_gml_261_0");
    c_talk_wait();
    c_sel(ger);
    c_walk("u", 8, 6);
    c_wait(6);
    c_walk("l", 12, 300);
    c_wait(30);
    c_sel(su);
    c_walkdirect(726, 802, 50);
    c_wait(5);
    c_sel(ra);
    c_walkdirect(682, 828, 50);
    c_var_instance(id, "con", 2);
    c_pannable(1);
    c_wait(30);
    c_panobj(kr_actor, 8);
    c_wait(8);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_var_instance(id, "hidecater", 1);
    c_terminatekillactors();
}
if (con == 2 && !i_ex(cutscene_master))
{
    cutscene_master = 0;
    con = 3;
    timer = 0;
}
if (con == 3)
{
    safe_delete(clamper);
    sumark = scr_marker_ext(766, 798, spr_susie_walk_left_dw_unhappy, 2, 2, 0, undefined, undefined, undefined, 1);
    ramark = scr_marker_ext(804, 826, spr_ralsei_left, 2, 2, undefined, undefined, undefined, undefined, 1, undefined);
    germark = scr_marker_ext(680, 830, spr_gerson_outfit_walk, 2, 2, 0, 0, c_white, undefined, 1, undefined, undefined);
    klight.target = kris;
    slight.target = sumark;
    rlight.target = ramark;
    glight.target = germark;
    global.interact = 0;
    global.facing = 0;
    with (obj_mainchara)
        scr_even(round(x), scr_even(y));
    con = 4;
}
if (con == 4)
{
    var trig = "";
    with (obj_trigger)
    {
        if (extflag == "cs2")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = "L";
        }
    }
    with (obj_trigger)
    {
        if (extflag == "cs3")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = "R";
        }
    }
    if (trig == "L")
    {
        timer = 0;
        con = 5;
    }
}
if (con == 5)
{
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    actor_count = 0;
    kr = 0;
    kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
    scr_actor_setup(kr, kr_actor, "kris");
    kr_actor.sprite_index = obj_mainchara.sprite_index;
    kr_actor.depth = obj_mainchara.depth;
    klight.target = kr_actor;
    with (obj_mainchara)
        visible = 0;
    con = 6;
}
if (con == 6)
{
    con = -1;
    c_pannable(1);
    c_pan(440, 638, 50);
    c_sel(kr);
    c_walkdirect(900, 840, 50);
    c_wait(51);
    c_facing("l");
    c_wait(10);
    c_speaker("gerson");
    c_msgsetloc(0, "* Hmm..^1. could've sworn it was here. Let's try..^1. up./%", "obj_dw_church_darkmaze_slash_Step_0_gml_363_0");
    c_talk_wait();
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_walk_cane_right);
    c_var_instance(germark, "image_speed", 0.125);
    c_var_instance(germark, "hspeed", 12);
    c_wait(30);
    c_var_instance(sumark, "sprite_index", spr_susie_walk_down_dw_unhappy);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* (I'm gonna be sworing if he can't figure this out...)/%", "obj_dw_church_darkmaze_slash_Step_0_gml_372_0");
    c_talk_wait();
    c_var_instance(sumark, "sprite_index", spr_susie_walk_right_dw_unhappy);
    c_var_instance(sumark, "image_speed", 0.16666666666666666);
    c_var_instance(sumark, "hspeed", 12);
    c_wait(8);
    c_var_instance(ramark, "image_speed", 0.16666666666666666);
    c_var_instance(ramark, "sprite_index", spr_ralsei_walk_right_unhappy);
    c_var_instance(ramark, "hspeed", 12);
    c_wait(40);
    c_panobj(kr_actor, 20);
    c_wait(20);
    c_var_instance(id, "con", 7);
    c_pannable(0);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 7)
{
    if (!i_ex(cutscene_master))
    {
        with (obj_dw_church_glowtile)
            x = xstart;
        safe_delete(upblock);
        layer_set_visible("FAKE_TILES", false);
        upblock = 0;
        timer = 0;
        global.interact = 0;
        global.facing = 0;
        con = 8;
        safe_delete(sumark);
        safe_delete(ramark);
        safe_delete(germark);
        klight.target = kris;
        sumark = scr_marker_ext(1302, 386, spr_susie_up_dw, 2, 2, 0, undefined, undefined, undefined, 1);
        ramark = scr_marker_ext(1364, 390, spr_ralsei_walk_up, 2, 2, undefined, undefined, undefined, undefined, 1, undefined);
        germark = scr_marker_ext(1322, 332, spr_gerson_outfit_walk, 2, 2, 0, 0, c_white, undefined, 1, undefined, undefined);
        slight.target = sumark;
        rlight.target = ramark;
        glight.target = germark;
    }
}
if (con == 8)
{
    var trig = "none";
    with (obj_trigger)
    {
        if (extflag == "cs3" && place_meeting(x, y, obj_mainchara))
            trig = "up";
    }
    if (trig == "up")
    {
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        actor_count = 0;
        kr = 0;
        kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
        scr_actor_setup(kr, kr_actor, "kris");
        kr_actor.sprite_index = obj_mainchara.sprite_index;
        kr_actor.depth = obj_mainchara.depth;
        klight.target = kr_actor;
        with (obj_mainchara)
            visible = 0;
        con = 9;
    }
}
if (con == 9)
{
    con = -1;
    c_pannable(1);
    c_pan(1040, 200, 30);
    c_sel(kr);
    c_walkdirect(1342, 436, 30);
    c_wait(45);
    c_var_instance(id, "forceside", 1);
    c_speaker("gerson");
    c_msgsetloc(0, "* Left here..^1. oh^1, it was left here./%", "obj_dw_church_darkmaze_slash_Step_0_gml_461_0");
    c_talk_wait();
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_walk_cane);
    c_var_instance(germark, "image_speed", 0.16666666666666666);
    c_var_instance(germark, "hspeed", -8);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* .../", "obj_dw_church_darkmaze_slash_Step_0_gml_468_0");
    c_msgnextloc("\\EL* I'm going right./%", "obj_dw_church_darkmaze_slash_Step_0_gml_469_0");
    c_talk_wait();
    c_wait(6);
    c_var_instance(sumark, "sprite_index", spr_susie_walk_right_dw_unhappy);
    c_var_instance(sumark, "hspeed", 8);
    c_var_instance(sumark, "image_speed", 0.16666666666666666);
    c_wait(15);
    c_var_instance(ramark, "sprite_index", spr_ralsei_walk_down_unhappy);
    c_wait(30);
    c_var_instance(ramark, "hspeed", 6);
    c_var_instance(ramark, "sprite_index", spr_ralsei_walk_right_unhappy);
    c_var_instance(ramark, "image_speed", 0.16666666666666666);
    c_wait(55);
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_var_instance(id, "con", 10);
    c_pannable(0);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 10 && !i_ex(cutscene_master))
{
    klight.target = kris;
    timer = 0;
    global.interact = 0;
    global.facing = 0;
    con = 11;
    safe_delete(sumark);
    safe_delete(ramark);
    safe_delete(germark);
    sumark = scr_marker_ext(2044, 350, spr_susie_walk_right_dw, 2, 2, 0, undefined, undefined, undefined, 1);
    ramark = scr_marker_ext(2154, 354, spr_ralsei_surprised_left, 2, 2, undefined, undefined, undefined, undefined, 1, undefined);
    germark = scr_marker_ext(-640, -480, spr_gerson_outfit_walk_cane, 2, 2, 0, 0, c_white, undefined, 1, undefined, undefined);
    slight.target = sumark;
    rlight.target = ramark;
    glight.target = germark;
}
if (con == 11)
{
    con = 12;
    gcon = 1;
    ccon = 1;
}
if (gcon == 1)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "gersontopleft")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
        gcon = 1.1;
}
if (gcon == 1.1)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "gersontopleft2")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    with (obj_dw_church_glowtile)
    {
        if (extflag == "1157")
        {
            if (!pressed)
                trig = 0;
        }
    }
    if (trig == 1)
    {
        setxy(1160, 378, germark);
        global.interact = 1;
        cutscene_master = scr_cutscene_make();
        actor_count = 0;
        kr = 0;
        kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
        scr_actor_setup(kr, kr_actor, "kris");
        kr_actor.sprite_index = obj_mainchara.sprite_index;
        kr_actor.depth = obj_mainchara.depth;
        klight.target = kr_actor;
        with (obj_mainchara)
            visible = 0;
        gcon = 2;
    }
}
if (gcon == 2)
{
    gcon = -1;
    var _dist = round(point_distance(obj_mainchara.x, obj_mainchara.y, 746, 384) / 2) + 1;
    var camy = cameray();
    c_sel(kr);
    c_walkdirect(746, 384, _dist);
    c_pannable(1);
    c_pan(528, camy, 60);
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_walk_cane);
    c_var_instance(germark, "image_speed", 0.125);
    c_lerp_var_instance(germark, "x", 1160, 920, 60);
    c_wait(60);
    c_var_instance(germark, "image_speed", 0);
    c_var_instance(germark, "image_index", 0);
    c_wait(1);
    c_var_instance(id, "gcon", 3);
    c_actortokris();
    c_terminatekillactors();
}
if (gcon == 3)
{
    klight.target = kris;
    global.facing = 1;
    scr_speaker("gerson");
    global.choicemsg[0] = stringsetloc("#Further Left", "obj_dw_church_darkmaze_slash_Step_0_gml_587_0");
    global.choicemsg[1] = stringsetloc("#Susie", "obj_dw_church_darkmaze_slash_Step_0_gml_588_0");
    global.choicemsg[2] = stringsetloc("Back Down", "obj_dw_church_darkmaze_slash_Step_0_gml_589_0");
    global.choicemsg[3] = stringsetloc("Nowhere", "obj_dw_church_darkmaze_slash_Step_0_gml_590_0");
    msgsetloc(0, "* Oh^1, ya went this way. Hmm^1, hmm./", "obj_dw_church_darkmaze_slash_Step_0_gml_592_0");
    msgnextloc("* Y'know^1, I've got a mighty hunch this ain't the right way./", "obj_dw_church_darkmaze_slash_Step_0_gml_593_0");
    msgnextloc("* ..^1. Though^1, I do like goin' the wrong way./", "obj_dw_church_darkmaze_slash_Step_0_gml_594_0");
    msgnextloc("* You get better ideas that way./", "obj_dw_church_darkmaze_slash_Step_0_gml_595_0");
    msgnextloc("* Now^1, what d'ya you think? Where do we go? No wrong answer./", "obj_dw_church_darkmaze_slash_Step_0_gml_596_0");
    msgnext("\\C4 ");
    global.msc = -99;
    global.choice = -1;
    d_make();
    gcon = 4;
}
if (gcon == 4)
{
    if (d_ex())
    {
        if (scr_getmsgno() == 2)
            germark.sprite_index = spr_gerson_look_diagonal;
        if (scr_getmsgno() == 3)
            germark.sprite_index = spr_gerson_outfit_walk_cane;
        if (scr_getmsgno() == 4)
        {
            germark.sprite_index = spr_gerson_beard_thinking;
            germark.image_index += 0.125;
        }
        if (scr_getmsgno() == 5)
        {
            germark.sprite_index = spr_gerson_outfit_walk_cane;
            germark.image_index = 0;
        }
    }
}
if (gcon == 4 && global.choice != -1)
{
    germark.sprite_index = spr_gerson_outfit_walk_cane;
    k_d(1);
    if (global.choice == 0)
    {
        scr_speaker("gerson");
        msgsetloc(0, "* Makin' your own path^1, I see. Respect^1, respect./", "obj_dw_church_darkmaze_slash_Step_0_gml_631_0");
        msgnextloc("* Well^1, let's go on!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_632_0");
        d_make();
        gcon = 5;
    }
    else if (global.choice == 1)
    {
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("Stay#out of#trouble", "obj_dw_church_darkmaze_slash_Step_0_gml_640_0");
        global.choicemsg[1] = stringsetloc("Increase#amount of#trouble", "obj_dw_church_darkmaze_slash_Step_0_gml_641_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("gerson");
        msgsetloc(0, "* You're a good pal^1, ain't ya. Keepin' an eye on your friend./", "obj_dw_church_darkmaze_slash_Step_0_gml_646_0");
        msgnextloc("* You helpin' her stay out of trouble?/", "obj_dw_church_darkmaze_slash_Step_0_gml_647_0");
        msgnext("\\C2 ");
        d_make();
        gcon = 7;
        animsequence = -1;
    }
    else if (global.choice == 2)
    {
        scr_speaker("gerson");
        msgsetloc(0, "* There's no harm in lookin' back. You mighta missed something./", "obj_dw_church_darkmaze_slash_Step_0_gml_656_0");
        msgnextloc("* But^1, when you finally turn forward once again.../", "obj_dw_church_darkmaze_slash_Step_0_gml_657_0");
        msgnextloc("* Don't be shocked if the world has changed./%", "obj_dw_church_darkmaze_slash_Step_0_gml_658_0");
        d_make();
        animsequence = 12;
        gcon = 10;
    }
    else if (global.choice == 3)
    {
        animsequence = 300;
        var weirdroute = 0;
        if (scr_sideb_active())
            weirdroute = 1;
        if (weirdroute)
        {
            scr_speaker("gerson");
            msgsetloc(0, "* Nowhere.../", "obj_dw_church_darkmaze_slash_Step_0_gml_672_0");
            msgnextloc("* Your words just now^1, 's got a peculiar ring to 'em./", "obj_dw_church_darkmaze_slash_Step_0_gml_673_0");
            msgnextloc("* I can tell..^1. you're havin' some relationship trouble^1, ain't ya./", "obj_dw_church_darkmaze_slash_Step_0_gml_674_0");
            msgnextloc("* I've seen it all^1, y'know. At your age.../", "obj_dw_church_darkmaze_slash_Step_0_gml_675_0");
            msgnextloc("* If things go cold^1, you might think your whole world's endin'./", "obj_dw_church_darkmaze_slash_Step_0_gml_676_0");
            msgnextloc("* But y'know^1, things go on. You'll grow up.../", "obj_dw_church_darkmaze_slash_Step_0_gml_677_0");
            msgnextloc("* Just keep livin'. Everything will be all right^1, sooner or later.../%", "obj_dw_church_darkmaze_slash_Step_0_gml_678_0");
        }
        else
        {
            scr_speaker("gerson");
            msgsetloc(0, "* Nowhere^1, eh?/", "obj_dw_church_darkmaze_slash_Step_0_gml_683_0");
            msgnextloc("* I'm sure you'll get there eventually.../", "obj_dw_church_darkmaze_slash_Step_0_gml_684_0");
            msgnextloc("* So what's the rush?/%", "obj_dw_church_darkmaze_slash_Step_0_gml_685_0");
        }
        d_make();
        gcon = 10;
    }
}
if (gcon == 5 && d_ex())
{
    if (scr_getmsgno() == 0)
        germark.sprite_index = spr_gerson_outfit_walk_cane_look_up;
    if (scr_getmsgno() == 1)
        germark.sprite_index = spr_gerson_outfit_walk_cane;
}
if (gcon == 5 && !d_ex())
    gcon = 5.1;
if (gcon == 5.1)
{
    cutscene_master = scr_cutscene_make();
    gcon = -1;
    c_wait(15);
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_walk_cane);
    c_var_instance(germark, "image_speed", 0.16666666666666666);
    c_var_instance(germark, "hspeed", -6);
    c_wait(60);
    c_pannable(1);
    c_panobj(1049, 30);
    c_wait(30);
    c_var_instance(id, "gcon", 5.2);
    c_pannable(0);
    c_wait(18);
    c_terminatekillactors();
}
if (gcon == 5.2)
{
    if (!i_ex(obj_cutscene_master))
    {
        safe_delete(fakegerblock);
        setxy(room_width * 4, room_height * 4, glight);
        klight.target = kris;
        global.interact = 0;
        global.facing = 0;
        gcon = 5.3;
        safe_delete(germark);
        germark = scr_marker_ext(146, 298, spr_gerson_outfit_walk_cane, 2, 2, undefined, undefined, undefined, undefined, 1);
        glight.target = germark;
        gerint = instance_create(156, 340, obj_trigger_interact);
        with (gerint)
        {
            scr_sizeexact(58, 26);
            strict = true;
        }
    }
}
if (gcon == 5.3)
{
    var trig = 0;
    with (obj_treasure_room)
    {
        if (talked == 1 && !d_ex())
            trig = 1;
    }
    if (trig == 1)
    {
        with (obj_treasure_room)
            myinteract = 99;
        global.interact = 1;
        gcon = -1;
        scr_delay_var("gcon", 5.4, 15);
        forceside = 1;
        timer = 0;
        safe_delete(gerint);
        gerint = 0;
    }
    if (trig == 0 && gerint.myinteract == 3)
    {
        global.interact = 1;
        gcon = 5.31;
        scr_speaker("gerson");
        msgsetloc(0, "* Hmm^1, a treasure^1, is it? Here^1, why don't you take it?/%", "obj_dw_church_darkmaze_slash_Step_0_gml_766_0");
        d_make();
    }
}
if (gcon == 5.31 && !d_ex())
{
    global.interact = 0;
    gerint.myinteract = 0;
    gcon = 5.3;
}
if (gcon == 5.4)
{
    global.facing = 1;
    cutscene_master = scr_cutscene_make();
    gcon = 5.45;
}
if (gcon == 5.45)
{
    gcon = -1;
    c_speaker("gerson");
    c_msgsetloc(0, "* Well now..^1. suppose there ain't much after all./", "obj_dw_church_darkmaze_slash_Step_0_gml_789_0");
    c_msgnextloc("* But even if your path don't lead nowhere.../", "obj_dw_church_darkmaze_slash_Step_0_gml_790_0");
    c_msgnextloc("* Least you got some exercise goin' down it. Geh heh heh./%", "obj_dw_church_darkmaze_slash_Step_0_gml_791_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_laugh_left);
    c_var_instance(germark, "image_speed", 0.125);
    c_wait_box(1);
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_walk_cane);
    c_var_instance(germark, "image_speed", 0);
    c_var_instance(germark, "image_index", 0);
    c_wait_box(2);
    c_var_instance(germark, "sprite_index", spr_gerson_beard_thinking);
    c_var_instance(germark, "image_speed", 0.125);
    c_var_instance(germark, "image_index", 0);
    c_wait_talk();
    c_var_instance(germark, "image_speed", 0);
    c_wait(30);
    c_var_instance(id, "gcon", 5.5);
    c_terminatekillactors();
}
if (gcon == 5.5 && !i_ex(obj_cutscene_master))
{
    gtimer++;
    if (gtimer == 1)
    {
        germark.sprite_index = spr_gerson_outfit_walk_cane_right;
        germark.image_speed = 0.16666666666666666;
        with (germark)
            scr_lerpvar("y", y, 386, 15);
    }
    if (gtimer == 17)
        germark.hspeed = 6;
    if (gtimer > 17 && germark.x > (camerax() + 640 + 8 + 128))
    {
        timer = 0;
        safe_delete(germark);
        setxy(room_width * 4, room_height * 4, glight);
        global.facing = 0;
        with (obj_treasure_room)
            myinteract = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (For some reason you felt healthier to a minuscule degree.)/", "obj_dw_church_darkmaze_slash_Step_0_gml_837_0");
        msgnextloc("* (Your Max HP increased by 1.)/%", "obj_dw_church_darkmaze_slash_Step_0_gml_838_0");
        d_make();
        gcon = 5.6;
    }
}
if (gcon == 5.6 && !d_ex())
{
    debug_print("before: global.maxhp[1]=" + string(global.maxhp[1]));
    global.maxhp[1] = global.maxhp[1] + 1;
    debug_print("after: global.maxhp[1]=" + string(global.maxhp[1]));
    scr_healall(999);
    gcon = 100;
    global.interact = 0;
}
if (gcon == 7 && d_ex() && i_ex(obj_writer))
{
    if (scr_getmsgno() == 0 && animsequence == 0)
    {
        debug_print("yes");
        germark.sprite_index = spr_gerson_outfit_laugh_left;
        germark.image_index += 0.125;
    }
    if (scr_getmsgno() == 1)
    {
        germark.sprite_index = spr_gerson_beard_thinking;
        germark.image_index += 0.125;
    }
    if (scr_getmsgno() == 2)
        germark.sprite_index = spr_gerson_beard_thinking;
}
if (gcon == 7 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
    {
        animsequence = 10;
        scr_speaker("gerson");
        msgsetloc(0, "* Geheh. C'mon^1, no need to mumble./", "obj_dw_church_darkmaze_slash_Step_0_gml_882_0");
        msgnextloc("* She's trustin' you^1, alright? Just keep it in mind./%", "obj_dw_church_darkmaze_slash_Step_0_gml_883_0");
    }
    else
    {
        animsequence = 11;
        scr_speaker("gerson");
        msgsetloc(0, "* Aha^1, now there's some confidence./", "obj_dw_church_darkmaze_slash_Step_0_gml_889_0");
        msgnextloc("* Everyone makes trouble when they're young./", "obj_dw_church_darkmaze_slash_Step_0_gml_890_0");
        msgnextloc("* It's more alarmin' to me if someone doesn't!/", "obj_dw_church_darkmaze_slash_Step_0_gml_891_0");
        msgnextloc("* ..^1. You three must have some terrific adventures^1! Geheheh./%", "obj_dw_church_darkmaze_slash_Step_0_gml_892_0");
    }
    d_make();
    gcon = 10;
}
if (gcon == 10)
{
    if (d_ex() && i_ex(obj_writer))
    {
        if (global.choice == 0 && animsequence == 10)
        {
            if (scr_getmsgno() == 0)
            {
                germark.sprite_index = spr_gerson_outfit_walk_cane_look_up;
                germark.image_index += 0.125;
            }
            if (scr_getmsgno() == 1)
            {
                germark.sprite_index = spr_gerson_outfit_walk_cane;
                germark.image_index = 0;
            }
        }
        if (global.choice == 1 && animsequence == 11)
        {
            if (scr_getmsgno() == 0)
            {
                germark.sprite_index = spr_gerson_outfit_laugh_left;
                germark.image_index += 0.125;
            }
            if (scr_getmsgno() == 1)
            {
                germark.sprite_index = spr_gerson_outfit_walk_cane;
                germark.image_index = 0;
            }
            if (scr_getmsgno() == 2)
            {
                germark.sprite_index = spr_gerson_outfit_walk_cane_look_side;
                germark.image_index = 0;
            }
            if (scr_getmsgno() == 3)
            {
                germark.sprite_index = spr_gerson_outfit_walk_cane;
                germark.image_index = 0;
            }
        }
        if (global.choice == 2 && animsequence == 12)
        {
            if (scr_getmsgno() == 1)
            {
                germark.sprite_index = spr_gerson_beard_thinking;
                germark.image_index += 0.125;
            }
            if (scr_getmsgno() == 2)
                germark.sprite_index = spr_gerson_look_diagonal;
        }
        if (animsequence == 300)
        {
            var weirdroute = 0;
            if (scr_sideb_active())
                weirdroute = 1;
            if (!weirdroute)
            {
                if (scr_getmsgno() == 0)
                {
                    germark.sprite_index = spr_gerson_beard_thinking;
                    germark.image_index += 0.125;
                }
                if (scr_getmsgno() == 2)
                {
                    germark.sprite_index = spr_gerson_outfit_laugh_left;
                    germark.image_index += 0.125;
                }
            }
            if (weirdroute)
            {
                if (scr_getmsgno() == 0)
                {
                    germark.sprite_index = spr_gerson_beard_thinking_neutral;
                    germark.image_index += 0.125;
                }
                if (scr_getmsgno() == 1)
                {
                    germark.sprite_index = spr_gerson_shifty;
                    germark.image_index = 0;
                }
                if (scr_getmsgno() == 2)
                {
                    germark.sprite_index = spr_gerson_shifty;
                    germark.image_index = 3;
                }
                if (scr_getmsgno() == 3)
                {
                    germark.sprite_index = spr_gerson_outfit_laugh_left;
                    germark.image_index += 0.125;
                }
                if (scr_getmsgno() == 4)
                {
                    germark.image_index = 0;
                    germark.sprite_index = spr_gerson_outfit_walk_cane;
                }
                if (scr_getmsgno() == 5)
                {
                    germark.image_index = 0;
                    germark.sprite_index = spr_gerson_bow_shake;
                }
                if (scr_getmsgno() == 6)
                {
                    germark.image_index = 0;
                    germark.sprite_index = spr_gerson_outfit_walk_cane;
                }
            }
        }
    }
}
if (gcon == 10 && !d_ex())
{
    germark.sprite_index = spr_gerson_outfit_walk_cane;
    germark.image_index = 0;
    gcon = 10.1;
}
if (gcon == 10.1)
{
    cutscene_master = scr_cutscene_make();
    actor_count = 0;
    kr = 0;
    kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
    scr_actor_setup(kr, kr_actor, "kris");
    kr_actor.sprite_index = obj_mainchara.sprite_index;
    kr_actor.depth = obj_mainchara.depth;
    with (obj_mainchara)
        visible = 0;
    gcon = -1;
    c_wait(15);
    c_var_instance(germark, "sprite_index", spr_gerson_outfit_walk_cane_right);
    c_var_instance(germark, "image_speed", 0.16666666666666666);
    c_wait(1);
    c_var_instance(germark, "y", 372);
    c_wait(1);
    c_var_instance(germark, "y", 366);
    c_wait(1);
    c_var_instance(germark, "y", 360);
    c_wait(1);
    c_var_instance(germark, "hspeed", 8);
    c_wait(50);
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(21);
    c_var_instance(id, "gcon", 99);
    c_pannable(0);
    c_actortokris();
    c_terminatekillactors();
}
if (gcon == 99 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    safe_delete(germark);
    setxy(room_width * 4, room_height * 4, glight);
    germark = 0;
    gcon = 100;
}
if (ccon == 1)
{
    candyint = instance_create(2088, 424, obj_trigger_interact);
    candyint.strict = 1;
    scr_size(2.5, 1, candyint);
    sumark.sprite_index = spr_susie_candydig;
    sumark.image_speed = 0.125;
    setxy(2042, 346, sumark);
    sucandyint = instance_create(2042, 404, obj_trigger_interact);
    sucandyint.strict = 1;
    sucandyint.talked = 0;
    scr_sizeexact(34, 35, sucandyint);
    racandyint = instance_create(2154, 406, obj_trigger_interact);
    racandyint.strict = 1;
    racandyint.talked = 0;
    scr_sizeexact(40, 40, racandyint);
    global.interact = 0;
    global.facing = 0;
    ccon = 4;
}
if (ccon == 4)
{
    if (candyint.myinteract == 3)
    {
        forceside = 1;
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Don't take any", "obj_dw_church_darkmaze_slash_Step_0_gml_1114_0");
        global.choicemsg[1] = stringsetloc("#Take One", "obj_dw_church_darkmaze_slash_Step_0_gml_1115_0");
        scr_speaker("no_name");
        msgsetloc(0, "* (A container of candy. It says \"Please take one.\")/", "obj_dw_church_darkmaze_slash_Step_0_gml_1118_0");
        msgnext("\\C2 ");
        d_make();
        ccon = 5;
    }
    if (sucandyint.myinteract == 3)
    {
        forceside = 1;
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EA* Dude^1, the old man was wrong./", "obj_dw_church_darkmaze_slash_Step_0_gml_1130_0");
        msgnextloc("\\E2* This is totally the right way./", "obj_dw_church_darkmaze_slash_Step_0_gml_1131_0");
        scr_anyface_next("ralsei", "U");
        msgnextloc("\\EU* Umm^1, Susie..^1. I don't think you should take that many.../%", "obj_dw_church_darkmaze_slash_Step_0_gml_1133_0");
        sucandyint.talked++;
        d_make();
        sucandyint.myinteract = 4;
    }
    if (sucandyint.myinteract == 4 && !d_ex())
    {
        sucandyint.myinteract = 0;
        global.interact = 0;
    }
    if (racandyint.myinteract == 3)
    {
        forceside = 1;
        global.interact = 1;
        scr_speaker("ralsei");
        msgsetloc(0, "\\EU* .../%", "obj_dw_church_darkmaze_slash_Step_0_gml_1152_0");
        racandyint.talked++;
        d_make();
        racandyint.myinteract = 4;
    }
    if (racandyint.myinteract == 4 && !d_ex())
    {
        racandyint.myinteract = 0;
        global.interact = 0;
    }
}
if (ccon == 5 && global.choice != -1)
{
    k_d(1);
    if (global.choice == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems like an inherently unstable situation.)/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1172_0");
        d_make();
        ccon = 4.1;
    }
    if (global.choice == 1)
    {
        if (global.flag[872] < 1)
        {
            if (scr_inventoryspace())
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You took a candy. You got \\cYDarker Candy\\cW.)/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1183_0");
                scr_itemget(1);
                snd_play(snd_item);
                global.flag[872]++;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You checked if you have room in your pockets for even a Candy.)/", "obj_dw_church_darkmaze_slash_Step_0_gml_1190_0");
                msgnextloc("* (This involved taking every item out of your pocket and looking at it.)/", "obj_dw_church_darkmaze_slash_Step_0_gml_1191_0");
                msgnextloc("* (You don't have room.)/", "obj_dw_church_darkmaze_slash_Step_0_gml_1192_0");
                msgnextloc("* (Also^1, you looked like a nerd.)/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1193_0");
            }
            d_make();
            ccon = 4.1;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You put your hand in the bowl of candy...)/", "obj_dw_church_darkmaze_slash_Step_0_gml_1201_0");
            msgnextloc("* (..^1. huh!? The center of gravity has shifted...!)/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1202_0");
            d_make();
            with (candyint)
                x = room_width * 4;
            with (sucandyint)
                x = room_width * 4;
            with (racandyint)
                x = room_width * 4;
            ccon = 6;
            global.flag[1501] = 2;
        }
    }
}
if (ccon == 4.1 && !d_ex())
{
    with (candyint)
        myinteract = 0;
    global.interact = 0;
    ccon = 4;
}
if (ccon == 6 && !d_ex())
{
    fixsusie = 1;
    forceside = 1;
    ccon = -1;
    global.flag[872] = 3;
    candymarker.image_index = global.flag[872];
    candymess = scr_marker_ext(2142, 426, spr_church_candybowl_candymess, 2, 2, undefined, undefined, undefined, 999900, undefined, undefined);
    snd_play(snd_glassbreak);
    cutscene_master = scr_cutscene_make();
    c_var_instance(sumark, "sprite_index", spr_susie_sheeh);
    c_var_instance(sumark, "image_speed", 0);
    c_lerp_var_instance(sumark, "x", sumark.x, 2026, 3);
    c_var_instance(ramark, "sprite_index", spr_ralsei_shocked_left);
    c_lerp_var_instance(ramark, "x", 2154, 2201, 4);
    c_lerp_var_instance(ramark, "y", 354, 348, 2, 2, "out");
    c_wait(2);
    c_lerp_var_instance(ramark, "y", 348, 354, 2, 2, "in");
    c_wait(2);
    c_wait(30);
    c_var_instance(sumark, "sprite_index", spr_susie_walk_down_dw_unhappy);
    c_var_instance(ramark, "sprite_index", spr_ralsei_walk_left_unhappy);
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* Kris^1, you greedy dumbass./%", "obj_dw_church_darkmaze_slash_Step_0_gml_1250_0");
    c_talk_wait();
    c_wait(2);
    c_var_instance(sumark, "image_speed", 0.125);
    c_var_instance(sumark, "sprite_index", spr_susie_walk_up_dw);
    c_lerp_var_instance(sumark, "y", 350, 326, 6);
    c_wait(6);
    c_var_instance(sumark, "sprite_index", spr_susie_walk_right_dw_unhappy);
    c_lerp_var_instance(sumark, "x", 2026, 2130, 16);
    c_wait(16);
    c_var_instance(sumark, "image_speed", 0);
    c_var_instance(sumark, "image_index", 0);
    c_var_instance(sumark, "sprite_index", spr_susie_walk_down_dw_unhappy);
    c_wait(15);
    c_var_instance(sumark, "sprite_index", spr_susie_dw_eatcandycrouched);
    c_var_instance(ramark, "sprite_index", spr_ralsei_walk_left_sad_subtle);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Now we have to eat them off the ground./%", "obj_dw_church_darkmaze_slash_Step_0_gml_1268_0");
    c_talk_wait();
    c_var_instance(id, "ccon", 7);
    c_terminatekillactors();
}
if (ccon == 7)
{
    fixsusie = 0;
    scr_depth(ramark);
    scr_depth_alt(sumark);
    global.interact = 0;
    global.facing = 0;
    safe_delete(racandyint);
    safe_delete(sucandyint);
    safe_delete(candyint);
    racandyint = instance_create(2202, 410, obj_trigger_interact);
    racandyint.talked = 0;
    racandyint.strict = true;
    scr_sizeexact(34, 30, racandyint);
    sucandyint = instance_create(2132, 364, obj_trigger_interact);
    sucandyint.strict = true;
    sucandyint.talked = 0;
    scr_sizeexact(46, 42, sucandyint);
    candyint = instance_create(2142, 426, obj_trigger_interact);
    candyint.strict = true;
    candyint.talked = 0;
    scr_sizeexact(52, 14, candyint);
    candytimer = 0;
    ccon = 8;
}
if (ccon == 8)
{
    if (global.interact == 0)
    {
        candytimer++;
        sumark.image_index += 0.125;
        var _volume = clamp((400 - point_distance(kris.x, kris.y, 2178, 408)) / 100, 0, 1);
        if ((candytimer % 10) == 0)
        {
            scr_shakeobj(sumark, 4, 1);
            snd_play(snd_txtsus, 0.5 * _volume, 0.6 + random_range(0.8, 1.2));
        }
        if (((candytimer + 5) % 10) == 0 && racandyint.talked == 1)
        {
            scr_shakeobj(ramark, 4, 1);
            snd_play(snd_txtral, 0.5 * _volume, 0.6 + random_range(0.8, 1.2));
        }
        if (((candytimer + 3) % 10) == 0 && candyint.myinteract == 4)
            scr_shakeobj(kris, 4, 1);
    }
    if (racandyint.myinteract == 3)
    {
        global.interact = 1;
        if (racandyint.talked == 0)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EL* Umm.../", "obj_dw_church_darkmaze_slash_Step_0_gml_1344_0");
            scr_anyface_next("susie", "H");
            msgnextloc("\\EH* Ralsei stop being such a wimp and help!/", "obj_dw_church_darkmaze_slash_Step_0_gml_1346_0");
            msgnextloc("\\E5* Like^1, at least pretend to eat the candy or something!/", "obj_dw_church_darkmaze_slash_Step_0_gml_1347_0");
            scr_anyface_next("ralsei", "K");
            msgnextloc("\\EK* Umm^1, got it...!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1349_0");
            d_make();
            ccon = 9;
            candytimer = 0;
        }
        else
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EU* I'm..^1. just concentrating on unwrapping them.../%", "obj_dw_church_darkmaze_slash_Step_0_gml_1357_0");
            d_make();
            racandyint.myinteract = 4;
        }
    }
    if (racandyint.myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        racandyint.myinteract = 0;
    }
    if (sucandyint.myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EM* This is all because we didn't eat it faster./%", "obj_dw_church_darkmaze_slash_Step_0_gml_1373_0");
        d_make();
        sucandyint.myinteract = 4;
    }
    if (sucandyint.myinteract == 4 && !d_ex())
    {
        global.interact = 0;
        sucandyint.myinteract = 0;
    }
    if (candyint.myinteract == 3)
    {
        candyint.myinteract = 4;
        kris.freeze = 1;
        kris.ignoredepth = 1;
        kris.cutscene = 1;
        var howlongtoeat = 60;
        with (candyint)
            scr_delay_var("myinteract", 5, howlongtoeat);
        kris.fun = 1;
        if (kris.y <= 358)
            kris.sprite_index = spr_kris_injured;
        else
            kris.sprite_index = spr_krisu_kneel;
    }
    if (candyint.myinteract == 5 && global.interact == 0)
    {
        kris.fun = 0;
        kris.freeze = 0;
        kris.cutscene = 0;
        kris.ignoredepth = 0;
        global.interact = 0;
        candyint.myinteract = 0;
        global.facing = 0;
    }
}
if (ccon == 9)
{
    if (!d_ex())
    {
        candytimer++;
        if (candytimer == 15)
        {
            ramark.sprite_index = spr_ralsei_stool;
            ramark.image_xscale = -2;
            with (ramark)
                setxy(x + 12 + 30, y + 6);
            global.interact = 0;
            racandyint.myinteract = 0;
            racandyint.talked = 1;
            ccon = 8;
            candytimer = 0;
        }
    }
}
if (con < 99)
{
    if (piano.con == 1)
    {
        if (piano.solved == 1)
        {
            global.interact = 1;
            with (obj_doorAny)
                setxy(xstart, ystart);
            if (con < 5)
                early = 1;
            if (con < 8)
                early = 1;
            gcon = 999;
            ccon = 999;
            with (piano)
            {
                con = -1;
                snd_volume(global.currentsong[1], memvolume, 60);
                global.flag[7] = 0;
            }
            con = 100;
            timer = 0;
            safe_delete(germark);
            safe_delete(sumark);
            safe_delete(ramark);
            susie.follow = false;
            ralsei.follow = false;
            gerson.follow = false;
            susie.visible = true;
            ralsei.visible = true;
            gerson.visible = true;
            susie.image_alpha = 1;
            ralsei.image_alpha = 1;
            gerson.image_alpha = 1;
            setxy(1430, 818, susie);
            setxy(1360, 822, ralsei);
            setxy(1440, 782, gerson);
            hidecater = false;
            susie.ignoredepth = false;
            ralsei.ignoredepth = false;
            gerson.ignoredepth = false;
            with (susie)
                scr_depth();
            with (ralsei)
                scr_depth();
            gueimark = scr_marker_ext(1552, 784, spr_guei_idle, -2, 2, 3.75, undefined, undefined, undefined, 1);
            safe_delete(upblock);
            layer_set_visible("FAKE_TILES", false);
            layer_set_visible("WALLS_ALT", true);
            upblock = 0;
            leavecon = 0;
            upblock = instance_create(1320, 520, obj_solidblocksized);
            with (upblock)
            {
                image_blend = c_black;
                depth = 999990;
                sprite_index = spr_pxwhite;
                scr_size(80, 280);
            }
        }
    }
}
if (con == 100)
{
    timer++;
    var doomtime = 30;
    var style = 2;
    var kind = "out";
    if (timer == 1)
    {
        snd_play(snd_sparkle_gem);
        with (obj_darkness_overlay)
            scr_lerpvar("image_alpha", 1, 0, round(doomtime * 1.5), style, kind);
        with (rightblock)
            scr_doom(undefined, doomtime);
        with (obj_floorswitch)
        {
            scr_lerpvar("image_alpha", 1, 0, doomtime, style, kind);
            scr_doom(undefined, doomtime);
        }
        with (obj_church_piano_hint)
        {
            scr_lerpvar("alpha", 1, 0, doomtime, style, kind);
            scr_doom(undefined, doomtime);
        }
        with (obj_border_controller)
            show_border();
    }
    if (timer == (1 + doomtime))
    {
        kris.fun = 0;
        con = 101;
        timer = 0;
        kris.freeze = false;
        kris.cutscene = true;
        piano.camcon = 0;
        global.interact = 1;
    }
}
if (con == 101)
{
    con = -1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ger = actor_count + 1;
    ger_actor = instance_create(gerson.x, gerson.y, obj_actor);
    scr_actor_setup(ger, ger_actor, "nicecream");
    ger_actor.sprite_index = gerson.sprite_index;
    ger_actor.usprite = gerson.usprite;
    ger_actor.dsprite = gerson.dsprite;
    ger_actor.rsprite = gerson.rsprite;
    ger_actor.lsprite = gerson.lsprite;
    ger_actor.name = "gerson";
    gerson.visible = false;
    c_sel(kr);
    c_facing("r");
    c_pannable(1);
    c_pan(1550, 580, 1);
    c_wait(1);
    c_pan(1550, 640, 30);
    c_sel(su);
    c_walkdirect(1790, 818, 40);
    c_sel(ra);
    c_walkdirect(1720, 822, 40);
    c_wait(30);
    c_sel(kr);
    c_facing("l");
    c_sel(ger);
    c_walkdirect(1566, 782, 50);
    c_wait(40);
    c_var_instance(id, "forceside", 1);
    if (early == 1)
    {
        c_sel(su);
        c_facing("l");
        c_sel(ra);
        c_facing("l");
        c_speaker("susie");
        c_msgsetloc(0, "\\E2* Hey^1, old frog dude. Looks like you were wrong./", "obj_dw_church_darkmaze_slash_Step_0_gml_1622_0");
        c_msgnextloc("\\EA* The way through's over here!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1623_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("susie");
        c_msgsetloc(0, "\\E0* Damn^1, took long enough./", "obj_dw_church_darkmaze_slash_Step_0_gml_1629_0");
        c_msgnextloc("\\EK* The hell didn't we go this way in the first place?/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1630_0");
        c_talk_wait();
    }
    c_wait(10);
    c_sel(ger);
    c_sndplay(snd_gerlaugh);
    c_sprite(spr_gerson_outfit_laugh_left);
    c_setxy(1562, 782);
    c_flip("x");
    c_animate(0, 8, 0.16666666666666666);
    c_sel(kr);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_wait(42);
    c_speaker("gerson");
    c_msgsetloc(0, "* Ah^1, what a relief you found the right way!/", "obj_dw_church_darkmaze_slash_Step_0_gml_1652_0");
    c_msgnextloc("* ..^1. this nice young fellow behind us was just raring to go through!/", "obj_dw_church_darkmaze_slash_Step_0_gml_1653_0");
    c_facenext("susie", "G");
    c_msgnextloc("\\EG* Nice young..^1. huh?/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1655_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_wait_talk();
    c_pan(1400, 640, 40);
    c_wait(40);
    c_sel(su);
    c_sprite(spr_susie_sheeh_flip);
    c_shakeobj();
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_left);
    c_shakeobj();
    c_snd_play(snd_wing);
    c_wait(10);
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* H-hey^1, wait a sec--!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1683_0");
    c_talk_wait();
    c_wait(4);
    c_actortokris();
    c_actortocaterpillar();
    c_var_instance(id, "con", 102);
    c_wait(1);
    c_terminatekillactors();
}
if (con == 102)
{
    germark = scr_marker_ext(1640, 782, spr_gerson_outfit_laugh_left, -2, 2, 0, 8, undefined, 91320, undefined, 30);
    global.facing = 1;
    kris.cutscene = true;
    gueimark.sprite_index = spr_guei_idle_nowisp;
    gueimark.image_xscale = 2;
    gueimark.x -= 142;
    gueimark.depth = 500;
    global.flag[54] = encounterflag;
    scr_battle(encounterno, 0, gueimark);
    con = 102.5;
}
if (con == 102.5)
{
    if (global.fighting == true)
    {
        gerson.fun = 1;
        gerson.sprite_index = spr_gerson_outfit_walk_cane;
        gerson.visible = true;
        setxy(1920, 800, gerson);
        con = 103;
    }
}
if (con == 103 && global.interact == 0)
{
    kris.cutscene = true;
    global.interact = 1;
    con = 104;
    forceside = 1;
}
if (con == 104)
{
    debug_print("global.flag[" + string(encounterflag) + "]=" + string(global.flag[encounterflag]));
    con = -1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ger = actor_count + 1;
    ger_actor = instance_create(gerson.x, gerson.y, obj_actor);
    scr_actor_setup(ger, ger_actor, "nicecream");
    ger_actor.sprite_index = gerson.sprite_index;
    ger_actor.usprite = gerson.usprite;
    ger_actor.dsprite = gerson.dsprite;
    ger_actor.rsprite = gerson.rsprite;
    ger_actor.lsprite = gerson.lsprite;
    ger_actor.name = "gerson";
    gerson.visible = false;
    c_sel(ger);
    c_facing("l");
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_wait(1);
    c_pannable(1);
    c_pan(1560, 640, 30);
    c_wait(30);
    c_sel(ger);
    c_sprite(spr_gerson_outfit_laugh_left);
    c_sndplay(snd_gerlaugh);
    c_animate(0, 6, 0.1);
    c_wait(48);
    if (global.flag[encounterflag] != 1)
    {
        c_speaker("gerson");
        c_msgsetloc(0, "* Phew^1! That was a hoot!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1775_0");
        c_talk_wait();
    }
    else
    {
        c_msgstay(10);
        c_speaker("gerson");
        c_msgsetloc(0, "* Whew^1! That sure was a trip!/", "obj_dw_church_darkmaze_slash_Step_0_gml_1782_0");
        c_msgnextloc("* Though..^1. wonder if you had to be so rough on those critters./", "obj_dw_church_darkmaze_slash_Step_0_gml_1783_0");
        c_facenext("susie", "K");
        c_msgnextloc("\\EK* It's a battle^1, the hell you think's gonna happen?/", "obj_dw_church_darkmaze_slash_Step_0_gml_1785_0");
        c_facenext("ralsei", "Q");
        c_msgnextloc("\\EQ* Kris doesn't seem to think it's a priority now^1, so.../%", "obj_dw_church_darkmaze_slash_Step_0_gml_1787_0");
        c_talk();
        c_wait_talk();
        c_msgstay(0);
        c_speaker("gerson");
        c_msgsetloc(0, "* Suppose that's right^1, suppose that's right.../%", "obj_dw_church_darkmaze_slash_Step_0_gml_1793_0");
        c_talk();
        c_wait_talk();
    }
    c_sel(ger);
    c_wait(1);
    c_facing("r");
    c_wait(1);
    c_walk("r", 4, 20);
    c_wait(20);
    c_speaker("gerson");
    c_msgsetloc(0, "* Well now^1, I think I can find the way back from here./%", "obj_dw_church_darkmaze_slash_Step_0_gml_1805_0");
    c_talk_wait();
    c_sprite(spr_gerson_bow);
    c_wait(10);
    c_speaker("gerson");
    c_msgsetloc(0, "* By the by^1, I'm running a little shop from my study^1, so.../", "obj_dw_church_darkmaze_slash_Step_0_gml_1813_0");
    c_msgnextloc("* If you ever find your way there^1, feel free to have me at your service!/", "obj_dw_church_darkmaze_slash_Step_0_gml_1815_0");
    c_facenext("susie", "H");
    c_msgnextloc("\\EH* Are you for real? After all THAT?/", "obj_dw_church_darkmaze_slash_Step_0_gml_1817_0");
    c_msgnextloc("\\E5* Going to YOUR study is the last thing we're EVER gonna do./", "obj_dw_church_darkmaze_slash_Step_0_gml_1818_0");
    c_msgnextloc("\\EH* Got it?/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1819_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_sel(ger);
    c_autowalk(0);
    c_animate(0, 2, 0.125);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_exasperated);
    c_sound_play(snd_wing);
    c_shakeobj();
    c_wait_box(5);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_talk();
    c_wait(5);
    c_speaker("gerson");
    c_sel(ger);
    c_sprite(spr_gerson_beard_thinking_neutral);
    c_animate(0, 6, 0.125);
    c_msgsetloc(0, "* Hmm^1, I see^1, I see. Well^1, thank you./%", "obj_dw_church_darkmaze_slash_Step_0_gml_1847_0");
    c_talk_wait();
    c_sel(ger);
    c_autowalk(1);
    c_walk("r", 4, 20);
    c_wait(20);
    c_wait(4);
    c_speaker("gerson");
    c_msgsetloc(0, "* Bye for now!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1859_0");
    c_talk_wait();
    c_walk("r", 8, 120);
    c_var_instance(id, "musicchange", 1);
    c_wait(20);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. boy^1, that was annoying./%", "obj_dw_church_darkmaze_slash_Step_0_gml_1867_0");
    c_talk_wait();
    c_panobj(kr_actor, 20);
    c_wait(20);
    c_var_instance(id, "con", 105);
    c_pannable(0);
    c_actortocaterpillar();
    c_actortokris();
    c_terminatekillactors();
}
if (con == 105 && !i_ex(cutscene_master))
{
    forceside = -1;
    global.currentsong[0] = snd_init("church_wip.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    global.plot = 160;
    global.interact = 0;
    global.facing = 0;
    scr_caterinterp("all");
    with (obj_caterpillarchara)
        follow = true;
    con = 106;
    with (obj_church_piano_playable)
    {
        con = 0;
        catafollow = true;
        cantuse = false;
    }
}
if (hidecater == 1)
{
    with (obj_caterpillarchara)
    {
        visible = false;
        follow = false;
    }
}
if (leavecon == 1)
{
    if (obj_mainchara.y > 1000)
    {
        obj_mainchara.y = 1000;
        scr_speaker("susie");
        msgsetloc(0, "\\EH* Get back here dumbass^1, I can hear you leaving!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_1915_0");
        d_make(1);
        global.interact = 1;
        leavecon = 2;
    }
}
if (leavecon == 2 && !d_ex())
{
    leavecon = 1;
    global.interact = 0;
    global.facing = 2;
}
if (musicchange == 1)
{
    musicchange = 0;
    oldsong = global.currentsong[1];
    mus_fade(oldsong, 60);
}
if (global.flag[1501] == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "candyflagtrig")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
        global.flag[1501] = 1;
}
with (cup)
{
    var camx = camerax();
    var vol = (1 - scr_progress(camx, 450, 748, 0, 1)) * 0.7;
    if (con == 0)
    {
        timer++;
        if (timer == 1)
        {
            gravity = 1;
            hspeed = 1;
            friction = -1;
        }
        if (timer == 30)
        {
            hspeed = -8;
            friction = -2;
        }
        if ((timer % 4) == 0)
        {
            var _vol = vol * 0.6;
            if (_vol > 0.1)
                snd_play(snd_menumove, _vol, 0.4 + (image_index / 10));
        }
        if (timer > 30 && x <= xstart)
        {
            image_speed = 0;
            x = xstart;
            if (vol > 0.1)
                snd_play(snd_menumove, vol, 0.2);
            vspeed = -6;
            hspeed = 7;
            friction = 0.7;
            con = 1;
            timer = 0;
        }
    }
    if (con == 1 && abs(hspeed) < 0.5)
    {
        timer++;
        if (timer == 1)
        {
            hspeed = 0;
            friction = 0;
        }
        if (timer >= 10)
        {
            image_speed = 0.25;
            timer = 0;
            con = 0;
        }
    }
}
with (gueitrig)
{
    if (myinteract == 3)
    {
        myinteract = 0;
        snd_stop(snd_motor_ghost);
        snd_play(snd_motor_ghost);
    }
}
with (cuptrig)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Back^1, you zombie!/", "obj_dw_church_darkmaze_slash_Step_0_gml_2028_0");
        msgnextloc("* Your beastly existence offends m'lady!/", "obj_dw_church_darkmaze_slash_Step_0_gml_2029_0");
        msgnextloc("* I don't have a m'lady yet^1, but if I did^1, she would be offended!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_2030_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I sure hope a m'lady sees me doing this!/%", "obj_dw_church_darkmaze_slash_Step_0_gml_2035_0");
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
