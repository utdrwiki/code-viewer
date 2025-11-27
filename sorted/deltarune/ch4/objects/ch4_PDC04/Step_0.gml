if (post_nap)
{
    post_nap = false;
    shyren_move = true;
    alphys_npc = instance_create(675, 520, obj_ch4_PDC03A_alphys_juice);
    catty_npc = instance_create(392, 147, obj_npc_room);
    catty_npc.sprite_index = spr_npc_catty;
    catty_mom_npc = instance_create(292, 127, obj_npc_room_animated);
    catty_mom_npc.sprite_index = spr_npc_catti_mom_no1_full;
    catty_dad_npc = instance_create(350, 144, obj_npc_room);
    catty_dad_npc.sprite_index = spr_catty_dad_church;
    jockington_npc = instance_create(328, 199, obj_npc_facing);
    with (jockington_npc)
    {
        extflag = "jockington";
        facing = 2;
        dfacing = 2;
        ltsprite = spr_jockington_lt;
        utsprite = spr_jockington_ut;
        rtsprite = spr_jockington_rt;
        dtsprite = spr_jockington_rt;
    }
    bratty_npc = instance_create(315, 320, obj_npc_facing);
    with (bratty_npc)
    {
        extflag = "bratty";
        facing = 2;
        dfacing = 2;
        dtsprite = spr_npc_bratty_right;
        ltsprite = spr_npc_bratty;
        utsprite = spr_bratty_back;
        rtsprite = spr_npc_bratty_right;
    }
    rg_bun_npc = instance_create(551, 504, obj_npc_room);
    rg_bun_npc.sprite_index = spr_npc_rgbun_juice;
    with (rg_bun_npc)
        extflag = "rgbun";
    rg_dragon_npc = instance_create(576, 504, obj_npc_room);
    rg_dragon_npc.sprite_index = spr_npc_rgdragon_juice;
    with (rg_dragon_npc)
        extflag = "rgdragon";
    grandma_npc = instance_create(453, 235, obj_npc_facing);
    with (grandma_npc)
    {
        extflag = "grandma";
        facing = 2;
        dfacing = 2;
        ltsprite = spr_npc_grandma_boom_left;
        utsprite = spr_npc_grandma_boom_up;
        rtsprite = spr_npc_grandma_boom_right;
    }
    snowy_npc = instance_create(626, 410, obj_npc_room);
    snowy_npc.sprite_index = spr_snowy_dt;
    snowy_npc.extflag = "snowy";
    mkid_npc = instance_create(595, 413, obj_npc_room);
    mkid_npc.sprite_index = spr_mkid_dt;
    mkid_npc.extflag = "mkid";
    snowydad_npc = instance_create(665, 408, obj_npc_room);
    snowydad_npc.sprite_index = spr_snowy_dad_juice;
    with (snowydad_npc)
        extflag = "snowydad";
    shyren_npc = instance_create(360, 280, obj_npc_room);
    with (shyren_npc)
    {
        extflag = "shyren";
        normalanim = 4;
        sprite_index = spr_shyren_behind;
        depth = 96900;
    }
    snowy_mkid_juice_marker = scr_marker(mkid_npc.x, mkid_npc.y, spr_mkid_snowy_juice);
    with (snowy_mkid_juice_marker)
        scr_depth();
    alvin_npc = instance_create(525, 140, obj_npc_room);
    alvin_npc.sprite_index = spr_npc_alvin;
    rudy_toriel = instance_create(176, 400, obj_ch4_PDC03A_rudy_toriel);
    with (rudy_toriel)
        scr_depth();
    noelle_npc = rudy_toriel.noelle_npc;
    rudy_npc = rudy_toriel.rudy_npc;
    toriel_npc = rudy_toriel.toriel_npc;
}
if (shyren_move)
{
    shyren_siner += 0.3;
    shyren_npc.y = shyren_npc.ystart + (sin(shyren_siner / 3) * 2);
}
if (npc_setup)
{
    npc_setup = false;
    with (obj_caterpillarchara)
    {
        fun = 1;
        visible = 0;
    }
    if (susie_npc == -4)
        create_susie_npc();
}
if (susie_drink_sfx)
{
    susie_drink_timer++;
    if (susie_drink_timer == 1)
        susie_npc.image_index = 0;
    if (susie_drink_timer == 4)
        susie_npc.image_index = 1;
    if (susie_drink_timer == 8)
        susie_npc.image_index = 2;
    if (susie_drink_timer == 36)
        susie_drink_timer = 0;
}
if (snowy_dont_laugh == 1 && !d_ex())
{
    snowy_dont_laugh = 2;
    scr_speaker("no_name");
    msgsetloc(0, "* (Yo^1, Snowy^1, u-um...)/%", "obj_ch4_PDC04_slash_Step_0_gml_175_0");
    d_make();
    with (obj_npc_room)
    {
        if (sprite_index == spr_mkid_dt)
            sprite_index = spr_mkid_side;
    }
    global.interact = 1;
}
if (snowy_dont_laugh == 2 && !d_ex())
{
    snowy_dont_laugh = 99;
    with (obj_npc_room)
    {
        if (sprite_index == spr_mkid_side)
            sprite_index = spr_mkid_dt;
    }
    global.interact = 0;
    with (obj_mainchara)
        onebuffer = 5;
}
if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    if (!scr_havechar(2))
    {
        scr_getchar(2);
        scr_makecaterpillar(386, 458, 2, 0);
    }
    with (obj_caterpillarchara)
    {
        fun = 0;
        x = 386;
        y = 458;
        visible = 1;
        sprite_index = spr_susie_walk_down_church;
    }
    susie_drink_sfx = false;
    susie_npc.image_speed = 0;
    susie_npc.sprite_index = spr_susie_walk_down_church;
    susie_npc.x = 386;
    susie_npc.y = 458;
    susie_npc.visible = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    blackall.image_alpha = 0;
}
if (con == 2)
{
    con = scr_sideb_active() ? 5 : 10;
    with (susie_notice)
        visible = false;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    no = actor_count + 1;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_index = noelle_npc.image_index;
    ru = actor_count + 2;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    to = actor_count + 3;
    to_actor = instance_create(toriel_npc.x, toriel_npc.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_npc.sprite_index;
    c_sel(no);
    c_autowalk(0);
    c_imageindex(noelle_npc.image_index);
    c_imagespeed(noelle_npc.image_speed);
    c_sel(ru);
    c_autowalk(0);
    c_imageindex(rudy_npc.image_index);
    c_imagespeed(rudy_npc.image_speed);
    c_sel(to);
    c_autowalk(0);
    c_imageindex(toriel_npc.image_index);
    c_imagespeed(toriel_npc.image_speed);
    c_var_instance(noelle_npc, "visible", 0);
    c_var_instance(rudy_npc, "visible", 0);
    c_var_instance(toriel_npc, "visible", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Cool^1, let's hear what you got./%", "obj_ch4_PDC04_slash_Step_0_gml_292_0");
    c_talk_wait();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_mus2("volume", 0, 60);
    c_wait(75);
    c_speaker("no_name");
    c_msgsetloc(0, "* (You explained the situation to Susie.)/%", "obj_ch4_PDC04_slash_Step_0_gml_302_0");
    c_talk_wait();
    c_mus2("initloop", "flashback_excerpt.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 0.6, 30);
    c_mus2("pitch", 0.8, 30);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* So the only two leads we got are.../", "obj_ch4_PDC04_slash_Step_0_gml_314_0");
    c_msgnextloc("\\E1* Undyne..^1. and the mayor^1, huh./", "obj_ch4_PDC04_slash_Step_0_gml_315_0");
    c_msgnextloc("\\ED* ..^1. I guess if we think about the 3 symbols on the shelter.../", "obj_ch4_PDC04_slash_Step_0_gml_316_0");
    c_msgnextloc("\\E0* ..^1. That pretty much tracks./", "obj_ch4_PDC04_slash_Step_0_gml_317_0");
    c_msgnextloc("\\E0* One looked like the church symbol./", "obj_ch4_PDC04_slash_Step_0_gml_318_0");
    c_msgnextloc("\\E1* Don't got that code yet^1, but it could be here./", "obj_ch4_PDC04_slash_Step_0_gml_319_0");
    c_msgnextloc("\\EB* One looked like the badge the cops wear./", "obj_ch4_PDC04_slash_Step_0_gml_320_0");
    c_msgnextloc("\\ED* ..^1. So Undyne probably knew something^1, too./", "obj_ch4_PDC04_slash_Step_0_gml_321_0");
    c_msgnextloc("\\E0* One looked like a pine tree^1, and the mayor.../", "obj_ch4_PDC04_slash_Step_0_gml_322_0");
    c_msgnextloc("\\EK* Likes trees^1, right? I mean^1, there's one in City Hall./", "obj_ch4_PDC04_slash_Step_0_gml_323_0");
    c_msgnextloc("\\E0* .../", "obj_ch4_PDC04_slash_Step_0_gml_324_0");
    c_msgnextloc("\\E1* Maybe..^1. Maybe that's why the Knight captured Undyne?/", "obj_ch4_PDC04_slash_Step_0_gml_325_0");
    c_msgnextloc("\\E0* They wanted to take their code so they could get in.../", "obj_ch4_PDC04_slash_Step_0_gml_326_0");
    c_msgnextloc("\\EB* ..^1. But in that case.../", "obj_ch4_PDC04_slash_Step_0_gml_327_0");
    c_msgnextloc("\\EC* They'd have to know the other two codes^1, too./", "obj_ch4_PDC04_slash_Step_0_gml_328_0");
    c_msgnextloc("\\E0* Someone who goes to church..^1. who knows the mayor.../", "obj_ch4_PDC04_slash_Step_0_gml_329_0");
    c_msgnextloc("\\EK* Who also has something to do with the cops?/", "obj_ch4_PDC04_slash_Step_0_gml_330_0");
    c_msgnextloc("\\EC* ..^1. Who the hell could that be?/", "obj_ch4_PDC04_slash_Step_0_gml_331_0");
    c_msgnextloc("\\E0* .../", "obj_ch4_PDC04_slash_Step_0_gml_332_0");
    c_msgnextloc("\\ED* ..^1. Guess..^1. City Hall's our best bet for now./", "obj_ch4_PDC04_slash_Step_0_gml_333_0");
    c_msgnextloc("\\E6* ..^1. what? Noelle said..^1. her mom keeps everything important at home?/", "obj_ch4_PDC04_slash_Step_0_gml_334_0");
    c_msgnextloc("\\E0* ..^1. Yeah..^1. wait^1, now that I think about it.../%", "obj_ch4_PDC04_slash_Step_0_gml_335_0");
    c_talk_wait();
    c_wait(15);
    c_waitcustom();
}
if (con == 5 && customcon == 1)
{
    customcon = 0;
    con = 20;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_surprised_church_right);
    c_setxy(398, noelle_npc.y + 3);
    c_sel(kr);
    c_sprite(spr_kris_walk_left_church);
    c_setxy(424, noelle_npc.y + 9);
    c_sel(no);
    c_sprite(spr_noelle_walk_side_church);
    c_setxy(370, noelle_npc.y);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* The mayor's Noelle's mom^1, right?/", "obj_ch4_PDC04_slash_Step_0_gml_367_0");
    c_msgnextloc("\\EC* Maybe if we tried.../", "obj_ch4_PDC04_slash_Step_0_gml_368_0");
    c_facenext("noelle", 2);
    c_msgnextloc("\\E2* Kris...? Umm^1, and..^1. Susie...?/", "obj_ch4_PDC04_slash_Step_0_gml_370_0");
    c_msgnextloc("\\E3* Would..^1. would you want to come by my house.../", "obj_ch4_PDC04_slash_Step_0_gml_371_0");
    c_msgnextloc("\\E6* ..^1. and..^1. work on our projects after church?/", "obj_ch4_PDC04_slash_Step_0_gml_372_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* H..^1. huh? Uhh^1, yeah^1! Of course!/", "obj_ch4_PDC04_slash_Step_0_gml_374_0");
    c_facenext("noelle", 4);
    c_msgnextloc("\\E4* Great!/%", "obj_ch4_PDC04_slash_Step_0_gml_376_0");
    c_talk();
    c_wait_box(3);
    c_mus("free_all");
    c_var_instance(blackall, "image_alpha", 0);
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_wait_box(7);
    c_sel(su);
    c_sprite(spr_susie_walk_back_arm_church_left);
    c_wait_box(9);
    c_sel(no);
    c_sprite(spr_noelle_church_side_smile);
    c_wait_talk();
    c_wait(60);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_sel(no);
    c_autowalk(0);
    c_sprite(spr_noelle_walk_side_church);
    c_walk("l", 1, 8);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E0* I'll^1, um^1, go bring my dad back to the hospital./", "obj_ch4_PDC04_slash_Step_0_gml_419_0");
    c_facenext("susie", 9);
    c_msgnextloc("\\E9* Cool. That's^1, uh^1, awesome^1! See ya later./%", "obj_ch4_PDC04_slash_Step_0_gml_421_0");
    c_talk_wait();
    c_sel(no);
    c_autowalk(0);
    c_sprite(spr_noelle_walk_side_church);
    c_flip("x");
    c_wait(1);
    c_imagespeed(0.2);
    c_walkdirect(210, noelle_npc.y, 60);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Too easy^1, right? Boom^1! Gimme five!/%", "obj_ch4_PDC04_slash_Step_0_gml_440_0");
    c_talk_wait();
    c_soundplay(snd_jump);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_kris_high_five_alt);
    c_animate(0, 7, 0.2);
    c_wait(40);
    c_sprite(spr_susie_walk_right_church_neutral);
    c_halt();
    c_wait(30);
    c_walk("l", 1, 8);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(0);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* ..^1. uhh^1, what's up?/", "obj_ch4_PDC04_slash_Step_0_gml_469_0");
    c_msgnextloc("\\EC* ..^1. you^1, uh^1, got somethin' against Noelle^1, Kris?/%", "obj_ch4_PDC04_slash_Step_0_gml_470_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church_neutral);
    c_wait_talk();
    c_sel(su);
    c_sprite(spr_susie_walk_right_church_neutral);
    c_wait(30);
    c_sprite(spr_susie_head_down_right_church);
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* .../%", "obj_ch4_PDC04_slash_Step_0_gml_487_0");
    c_talk_wait();
    c_wait(15);
    c_sprite(spr_susie_head_scratch_church);
    c_imagespeed(0.2);
    c_addxy(-2, 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Like^1, uh^1, hey^1, maybe things took a weird route right now.../", "obj_ch4_PDC04_slash_Step_0_gml_498_0");
    c_msgnextloc("\\ED* I mean^1, who'd expect she'd ask us like that?/", "obj_ch4_PDC04_slash_Step_0_gml_499_0");
    c_msgnextloc("\\E2* But we should be glad it's going so fast^1, right?/%", "obj_ch4_PDC04_slash_Step_0_gml_500_0");
    c_talk_wait();
    c_halt();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. right?/", "obj_ch4_PDC04_slash_Step_0_gml_509_0");
    c_msgnextloc("\\E0* .../%", "obj_ch4_PDC04_slash_Step_0_gml_510_0");
    c_talk_wait();
    c_sprite(spr_susie_walk_up_church);
    c_addxy(2, 0);
    c_wait(30);
    c_sel(kr);
    c_delaycmd(15, "sprite", spr_kris_walk_down_church);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church_neutral);
    c_wait(6);
    c_sprite(spr_susie_walk_down_church_neutral);
    c_wait(15);
    c_imagespeed(0.2);
    c_walkdirect_wait(387, 442, 20);
    c_halt();
    c_wait(15);
    c_sprite(spr_susie_walk_up_church);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Hey^1, how 'bout some of the red stuff? ..^1. no?/", "obj_ch4_PDC04_slash_Step_0_gml_535_0");
    c_msgnextloc("\\EA* Heh^1, your loss. Know you're gonna want it later./%", "obj_ch4_PDC04_slash_Step_0_gml_536_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_susie_walk_down_church);
    c_wait_talk();
    c_wait(30);
    c_sprite(spr_susie_walk_down_church_neutral);
    c_wait(30);
    c_sprite(spr_susie_walk_right_church_neutral);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. let's just go already./%", "obj_ch4_PDC04_slash_Step_0_gml_553_0");
    c_talk_wait();
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_sel(su);
    c_imagespeed(0.2);
    c_walkdirect(498, 442, 60);
    c_wait(15);
    c_sel(kr);
    c_walkdirect(498, noelle_npc.y + 9, 60);
    c_waitcustom();
}
if (con == 10 && customcon == 1)
{
    customcon = 0;
    con = 20;
    c_waitcustom_end();
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Her mom's the mayor^1, right?/", "obj_ch4_PDC04_slash_Step_0_gml_579_0");
    c_msgnextloc("\\E1* And the front of their house..^1. it's got pine trees all over./", "obj_ch4_PDC04_slash_Step_0_gml_580_0");
    c_msgnextloc("\\EK* Kinda like the holidays just got frozen in place./%", "obj_ch4_PDC04_slash_Step_0_gml_581_0");
    c_talk_wait();
    c_mus2("volume", 0, 30);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Maybe if we can sneak in there ourselves.../", "obj_ch4_PDC04_slash_Step_0_gml_590_0");
    c_msgnextloc("\\E2* We might be able to find a clue in there?/", "obj_ch4_PDC04_slash_Step_0_gml_591_0");
    c_msgnextloc("\\E9* ..^1. I got an idea./%", "obj_ch4_PDC04_slash_Step_0_gml_592_0");
    c_talk_wait();
    c_wait(15);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church);
    c_setxy(398, noelle_npc.y + 3);
    c_sel(kr);
    c_sprite(spr_kris_walk_left_church);
    c_setxy(424, noelle_npc.y + 9);
    c_sel(no);
    c_sprite(spr_noelle_juice_drink);
    c_wait(75);
    c_sel(kr);
    c_autowalk(0);
    c_delaycmd(15, "imagespeed", 0.2);
    c_delaywalkdirect(15, 310, noelle_npc.y + 9, 30);
    c_delaycmd(46, "imagespeed", 0);
    c_delaycmd(46, "imageindex", 0);
    c_pannable(1);
    c_pan(110, cameray(), 50);
    c_sel(su);
    c_autowalk(0);
    c_autodepth(0);
    c_depth(80000);
    c_sprite(spr_susie_walk_left_church);
    c_imagespeed(0.2);
    c_walkdirect_wait(noelle_npc.x + 20, noelle_npc.y + 3, 40);
    c_imageindex(0);
    c_imagespeed(0);
    c_wait(15);
    c_sel(su);
    c_visible(0);
    c_sel(no);
    c_autowalk(0);
    c_imagespeed(0);
    c_sprite(spr_noelle_susie_shoulder);
    c_imageindex(0);
    c_var_lerp_to_instance(no_actor, "image_index", 4, 16);
    c_wait(5);
    c_soundplay(snd_bump);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* Hey^1, nice singing./%", "obj_ch4_PDC04_slash_Step_0_gml_654_0");
    c_talk_wait();
    c_soundplay(snd_noise);
    c_soundplay(snd_sink_short);
    c_sprite(spr_noelle_susie_shoulder_loop);
    c_imagespeed(0.4);
    c_wait(30);
    c_imagespeed(0);
    c_sprite(spr_noelle_susie_shoulder_end);
    c_imageindex(0);
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(30);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EE* Susie!? How d-did you..^1. wh-why are you.../%", "obj_ch4_PDC04_slash_Step_0_gml_691_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_juice_turn);
    c_halt();
    c_setxy(noelle_npc.x, noelle_npc.y);
    c_sel(su);
    c_visible(1);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_walk("r", 2, 5);
    c_wait(6);
    c_imagespeed(0);
    c_wait(30);
    c_mus("free_all");
    c_mus2("initloop", "noelle_school.ogg", 0);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EM* Umm^1, what brings you to^1, um^1, church^1, Susie?/", "obj_ch4_PDC04_slash_Step_0_gml_730_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* Uhh^1, y'know./", "obj_ch4_PDC04_slash_Step_0_gml_732_0");
    c_msgnextloc("\\E7* Juice./", "obj_ch4_PDC04_slash_Step_0_gml_733_0");
    c_facenext("noelle", "4");
    c_msgnextloc("\\E4* Oh^1, r-right^1! Sure^1, that's why I come^1, too???????/", "obj_ch4_PDC04_slash_Step_0_gml_735_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* Right?/", "obj_ch4_PDC04_slash_Step_0_gml_737_0");
    c_facenext("noelle", 8);
    c_msgnextloc("\\E8* Y-yeah!/%", "obj_ch4_PDC04_slash_Step_0_gml_739_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_sprite(spr_susie_walk_up_church);
    c_halt();
    c_sel(no);
    c_sprite(spr_noelle_church_side);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_halt();
    c_wait_box(5);
    c_wait_box(9);
    c_sel(no);
    c_sprite(spr_noelle_church_side_smile);
    c_waittalk();
    c_sel(no);
    c_sprite(spr_noelle_church_side);
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\EA* It looks like blood./", "obj_ch4_PDC04_slash_Step_0_gml_774_0");
    c_facenext("noelle", "M");
    c_msgnextloc("\\EM* Definitely^1! Haha^1! That's why I'm^1! Always drinking it??????????/", "obj_ch4_PDC04_slash_Step_0_gml_776_0");
    c_facenext("susie", "Q");
    c_msgnextloc("\\EQ* Yeah. Too bad they just ran out./%", "obj_ch4_PDC04_slash_Step_0_gml_778_0");
    c_talk();
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_church_side_smile);
    c_wait_box(4);
    c_sel(no);
    c_sprite(spr_noelle_church_side);
    c_waittalk();
    c_sel(su);
    c_sprite(spr_susie_walk_left_church_neutral);
    c_shakestep(-8, 0);
    c_sel(no);
    c_sprite(spr_noelle_walk_side_church);
    c_imagespeed(0.25);
    c_walk("l", 2, 3);
    c_wait(5);
    c_imagespeed(0);
    c_sprite(spr_noelle_church_side_gasp);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EX* Of blood./", "obj_ch4_PDC04_slash_Step_0_gml_807_0");
    c_facenext("noelle", 18);
    c_msgnextloc("\\EI* Where^1, um^1, are you going with this?/%", "obj_ch4_PDC04_slash_Step_0_gml_809_0");
    c_talk();
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_church_side);
    c_waittalk();
    c_sel(su);
    c_shakestep(-12, 0);
    c_sel(no);
    c_sprite(spr_noelle_church_side_gasp);
    c_walk("l", 2, 3);
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\EY* Lemme get straight to the point./", "obj_ch4_PDC04_slash_Step_0_gml_829_0");
    c_facenext("noelle", "P");
    c_msgnextloc("\\EP* YES?/%", "obj_ch4_PDC04_slash_Step_0_gml_831_0");
    c_talk();
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_church_shocked);
    c_shakeobj();
    c_wait_talk();
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* Look^1, Noelle.../%", "obj_ch4_PDC04_slash_Step_0_gml_845_0");
    c_talk_wait();
    c_sel(su);
    c_imagespeed(0.25);
    c_walk("r", 2, 5);
    c_wait(6);
    c_imagespeed(0);
    c_wait(5);
    c_sprite(spr_susie_head_scratch_church);
    c_imagespeed(0.2);
    c_sel(no);
    c_sprite(spr_noelle_church_side_gasp);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* You wanna..^1. work on our..^1. uh^1, projects together?/", "obj_ch4_PDC04_slash_Step_0_gml_864_0");
    c_msgnextloc("\\E2* Y'know. At your place./", "obj_ch4_PDC04_slash_Step_0_gml_865_0");
    c_facenext("noelle", "2");
    c_msgnextloc("\\E2* HUH???/%", "obj_ch4_PDC04_slash_Step_0_gml_867_0");
    c_talk();
    c_wait_box(3);
    c_sel(no);
    c_sprite(spr_noelle_church_shocked);
    c_shakeobj();
    c_wait_talk();
    c_wait(1);
    c_sel(no);
    c_sprite(spr_noelle_church_side_neutral);
    c_flip("x");
    c_wait(15);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E3* Uh..^1. Umm^1, I..^1. I mean^1, I'd have to..^1. ask^1, and.../", "obj_ch4_PDC04_slash_Step_0_gml_887_0");
    c_msgnextloc("\\EA* My mom^1, I'm not sure if she'd.../%", "obj_ch4_PDC04_slash_Step_0_gml_888_0");
    c_talk();
    c_wait_box(1);
    c_sprite(spr_noelle_church_side_unhappy);
    c_waittalk();
    c_wait(15);
    c_sprite(spr_noelle_church_side_neutral);
    c_wait(30);
    c_flip("x");
    c_sprite(spr_noelle_church_ganbatte);
    c_shakeobj();
    c_soundplay(snd_grab);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* Yes^1! I mean^1, yes. Yes^1, we can do it^1! Yes!/%", "obj_ch4_PDC04_slash_Step_0_gml_911_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Really? Damn^1, that was easy./%", "obj_ch4_PDC04_slash_Step_0_gml_920_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_right_church);
    c_imagespeed(0.25);
    c_walkdirect_wait(282, noelle_npc.y + 3, 10);
    c_halt();
    c_wait(5);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Boom!/%", "obj_ch4_PDC04_slash_Step_0_gml_933_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_church_ganbatte_sweat);
    c_soundplay(snd_jump);
    c_sel(su);
    c_sprite(spr_susie_kris_high_five_flipped);
    c_imagespeed(0.3);
    c_sel(kr);
    c_visible(0);
    c_wait(20);
    c_soundplay(snd_whip_crack_only);
    c_wait(20);
    c_sel(su);
    c_imagespeed(0);
    c_sprite(spr_susie_walk_right_church);
    c_sel(kr);
    c_visible(1);
    c_wait(5);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EG* ???????/%", "obj_ch4_PDC04_slash_Step_0_gml_964_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* Cool^1, we'll see you later?/%", "obj_ch4_PDC04_slash_Step_0_gml_973_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_church_side_neutral);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E2* Oh. Kris is..^1. coming too?/%", "obj_ch4_PDC04_slash_Step_0_gml_981_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_church_side);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E8* I mean^1, of course^1! Right^1, it's for the school project./%", "obj_ch4_PDC04_slash_Step_0_gml_989_0");
    c_talk_wait();
    c_sprite(spr_noelle_church_side);
    c_wait(30);
    c_sel(no);
    c_sprite(spr_noelle_church_side_neutral);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E2* ..^1. so^1, um^1, should I invite Berdly then?/", "obj_ch4_PDC04_slash_Step_0_gml_1001_0");
    c_facenext("susie", "1");
    c_msgnextloc("\\E1* Oh hell no./", "obj_ch4_PDC04_slash_Step_0_gml_1003_0");
    c_facenext("noelle", "4");
    c_msgnextloc("\\E4* Umm^1, okay^1! Hahaha!/%", "obj_ch4_PDC04_slash_Step_0_gml_1005_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_autodepth(1);
    c_sprite(spr_susie_walk_left_church_neutral);
    c_wait_box(4);
    c_sel(no);
    c_sprite(spr_noelle_church_side_smile);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_waittalk();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_sel(no);
    c_sprite(spr_noelle_church_side);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E2* W-well^1, feel free to^1, um..^1. come over anytime!/", "obj_ch4_PDC04_slash_Step_0_gml_1032_0");
    c_facenext("susie", 10);
    c_msgnextloc("\\EA* Sure^1, we gotta go to school first anyway./", "obj_ch4_PDC04_slash_Step_0_gml_1034_0");
    c_facenext("noelle", "2");
    c_msgnextloc("\\E2* On..^1. on a weekend?/", "obj_ch4_PDC04_slash_Step_0_gml_1036_0");
    c_msgnextloc("\\E4* I-I mean, cool, sounds normal! S..^1. See you later!/", "obj_ch4_PDC04_slash_Step_0_gml_1037_0");
    c_facenext("susie", "2");
    c_msgnextloc("\\E2* Yeah, see ya./%", "obj_ch4_PDC04_slash_Step_0_gml_1039_0");
    c_talk();
    c_wait_box(4);
    c_sel(no);
    c_sprite(spr_noelle_church_side_neutral);
    c_wait_box(5);
    c_sel(no);
    c_sprite(spr_noelle_church_side_smile);
    c_wait_box(7);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_waittalk();
    c_wait(30);
    c_sel(no);
    c_flip("x");
    c_wait(15);
    c_sel(no);
    c_autowalk(0);
    c_sprite(spr_noelle_walk_side_church);
    c_imagespeed(0.2);
    c_walkdirect(220, no_actor.y, 30);
    c_wait(15);
    c_mus2("volume", 0, 30);
    c_sel(su);
    c_sprite(spr_susie_walk_right_church);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* Hell yeah. That went perfectly!/", "obj_ch4_PDC04_slash_Step_0_gml_1084_0");
    c_msgnextloc("\\E4* Let's ball.../%", "obj_ch4_PDC04_slash_Step_0_gml_1085_0");
    c_talk();
    c_wait(15);
    c_sel(no);
    c_halt();
    c_wait(5);
    c_sel(ru);
    c_sprite(spr_rudy_juice_walk_right);
    c_wait(5);
    c_sel(no);
    c_autodepth(0);
    c_depth(80000);
    c_flip("x");
    c_sprite(spr_noelle_juice_walk_down);
    c_wait(1);
    c_imagespeed(0.2);
    c_walkdirect(198, 428, 15);
    c_delaywalkdirect(16, 310, 428, 60);
    c_delaycmd(16, "sprite", spr_noelle_juice_walk_right);
    c_delaywalkdirect(76, 310, 500, 30);
    c_delaycmd(76, "sprite", spr_noelle_juice_walk_down);
    c_delaywalkdirect(106, 395, 500, 30);
    c_delaycmd(106, "sprite", spr_noelle_juice_walk_right);
    c_delaywalkdirect(136, 395, 580, 30);
    c_delaycmd(136, "sprite", spr_noelle_juice_walk_down);
    c_sel(ru);
    c_autodepth(0);
    c_depth(80000);
    c_delaycmd(10, "sprite", spr_rudy_juice_walk_down);
    c_delaycmd(10, "imagespeed", 0.2);
    c_delaywalkdirect(10, ru_actor.x, 422, 30);
    c_delaycmd(41, "sprite", spr_rudy_juice_walk_right);
    c_delaywalkdirect(41, 308, 422, 60);
    c_delaycmd(101, "sprite", spr_rudy_juice_walk_down);
    c_delaywalkdirect(101, 308, 493, 30);
    c_delaycmd(131, "sprite", spr_rudy_juice_walk_right);
    c_delaywalkdirect(131, 390, 493, 30);
    c_delaycmd(161, "sprite", spr_rudy_juice_walk_down);
    c_delaywalkdirect(161, 390, 580, 30);
    c_sel(to);
    c_autodepth(0);
    c_depth(80000);
    c_delaycmd(10, "sprite", spr_toriel_juice_walk_down);
    c_delaycmd(30, "imagespeed", 0.2);
    c_delaywalkdirect(25, to_actor.x, 422, 20);
    c_delaycmd(51, "sprite", spr_toriel_juice_walk_side);
    c_delaywalkdirect(51, 308, 422, 60);
    c_delaycmd(111, "sprite", spr_toriel_juice_walk_down);
    c_delaywalkdirect(111, 308, 493, 30);
    c_delaycmd(141, "sprite", spr_toriel_juice_walk_side);
    c_delaywalkdirect(141, 390, 493, 30);
    c_delaycmd(171, "sprite", spr_toriel_juice_walk_down);
    c_delaywalkdirect(171, 390, 580, 30);
    c_wait_talk();
    c_sel(su);
    c_imagespeed(0.25);
    c_walk("r", 3, 60);
    c_wait(2);
    c_sel(kr);
    c_sprite(spr_kris_walk_down_church);
    c_walk("r", 3, 60);
    c_wait(30);
    c_waitcustom();
}
if (con == 20 && customcon == 1)
{
    con = 29;
    alarm[0] = 30;
    c_waitcustom_end();
    var fadeout = instance_create(0, 0, obj_fadeout);
    fadeout.fadespeed = 0.06;
    c_wait(30);
    c_pannable(0);
    c_terminatekillactors();
}
if (con == 30 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.plot = 30;
    global.interact = 3;
    global.entrance = (ord(string_upper("A")) - 65) + 1;
    snd_free_all();
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_town_church);
}
if (global.plot < 25)
    exit;
if (leave_con == 0 && obj_mainchara.y >= 560)
    leave_con = 1;
if (leave_con == 1)
{
    leave_con++;
    global.interact = 1;
    obj_mainchara.y = 558;
    scr_speaker("susie");
    msgsetloc(0, "\\EH* (Kris^1! Don't try to skip out without me!)/%", "obj_ch4_PDC04_slash_Step_0_gml_1216_0");
    d_make();
}
if (leave_con == 2 && !d_ex())
{
    leave_con = 0;
    global.interact = 0;
    global.facing = 2;
}
