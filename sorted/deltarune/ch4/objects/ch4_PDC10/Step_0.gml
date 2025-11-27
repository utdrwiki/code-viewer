if (phone_throw)
{
    phone_throw = false;
    with (phone_marker)
    {
        visible = 1;
        gravity = 0.5;
        vspeed = -5;
        hspeed = -3.65;
        scr_depth();
    }
    alarm[1] = 25;
}
if (con == 0 && !d_ex())
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
    if (i_ex(obj_npc_room_animated))
    {
        with (obj_npc_room_animated)
            instance_destroy();
    }
    phone_marker = scr_marker(491, 505, spr_phone_prop);
    with (phone_marker)
    {
        visible = 0;
        depth = 94310;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
    c_mus2("volume", 0, 30);
    c_sel(no);
    c_facing("d");
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* OK^1, should we^1, umm..^1. get started?/", "obj_ch4_PDC10_slash_Step_0_gml_62_0");
    c_facenext("susie", 0);
    c_msgnextloc("\\E0* Oh..^1. uh^1, yeah. Sure./%", "obj_ch4_PDC10_slash_Step_0_gml_64_0");
    c_talk_wait();
    c_pannable(1);
    c_pan(320, 434, 20);
    c_sel(kr);
    c_autodepth(0);
    c_walkdirect(430, 534, 30);
    c_delaycmd(31, "autowalk", 0);
    c_delaycmd(31, "imagespeed", 0);
    c_delayfacing(31, "d");
    c_delaywalk(31, "u", 3, 5);
    c_delaycmd(36, "sprite", spr_kris_sit);
    c_sel(su);
    c_autodepth(0);
    c_walkdirect(470, 529, 30);
    c_delaycmd(31, "autowalk", 0);
    c_delaycmd(31, "imagespeed", 0);
    c_delayfacing(31, "d");
    c_delaywalk(31, "u", 3, 5);
    c_delaycmd(36, "sprite", spr_susie_sit_normal);
    c_delaycmd4(36, "setxy", 473, 515, 0, 0);
    c_delaycmd(36, "soundplay", snd_wing);
    c_sel(no);
    c_autodepth(0);
    var walk_delay = 0;
    if (no_actor.y < 524)
    {
        walk_delay = 32;
        c_walkdirect(no_actor.x, 526, 30);
        c_delaywalkdirect(31, 502, 526, 30);
    }
    else
    {
        c_walkdirect(502, 526, 30);
    }
    c_delaycmd(31 + walk_delay, "autowalk", 0);
    c_delaycmd(31 + walk_delay, "imagespeed", 0);
    c_delayfacing(31 + walk_delay, "d");
    c_delaywalk(31 + walk_delay, "u", 4, 5);
    c_delaycmd(36 + walk_delay, "sprite", spr_noelle_sit);
    c_delaycmd4(36 + walk_delay, "setxy", 497, 512, 0, 0);
    if (no_actor.y < 524)
        c_delaycmd(36 + walk_delay, "soundplay", snd_wing);
    c_wait(60 + walk_delay);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E2* Umm^1, so..^1. what are your projects about?/", "obj_ch4_PDC10_slash_Step_0_gml_121_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* Oh^1, well^1, uhh --/%", "obj_ch4_PDC10_slash_Step_0_gml_123_0");
    c_talk_wait();
    c_soundplay(snd_phone);
    c_sel(no);
    c_sprite(spr_noelle_sit_surprised);
    c_emote("!", 30);
    c_shakeobj();
    c_wait(30);
    c_sprite(spr_noelle_sit);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* Sorry^1, um^1, phone call^1! I'll be just a sec!/%", "obj_ch4_PDC10_slash_Step_0_gml_137_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_sit_phone_take_out);
    c_animate(0, 3, 0.25);
    c_wait(50);
    if (scr_sideb_get_phase() >= 2 && scr_flag_get(916) == 0)
    {
        c_sel(no);
        c_sprite(spr_noelle_sit_phone_neutral);
        c_speaker("noelle");
        c_msgsetloc(0, "\\E3* Umm..^1. hi^1, mom^1, what's up?/", "obj_ch4_PDC10_slash_Step_0_gml_154_0");
        c_msgnextloc("\\E9* ..^1. Yeah^1, I took dad home^1, so it's just^1, um^1, me^1, here.../", "obj_ch4_PDC10_slash_Step_0_gml_155_0");
        c_msgnextloc("\\E4* ..^1. Huh? No problem^1, I can probably just cook something./", "obj_ch4_PDC10_slash_Step_0_gml_156_0");
        c_msgnextloc("\\E8* Gosh^1, mom^1, I'm not going to burn myself!/", "obj_ch4_PDC10_slash_Step_0_gml_157_0");
        c_msgnextloc("\\E3* Okay^1, see you later tonight!/%", "obj_ch4_PDC10_slash_Step_0_gml_158_0");
        c_talk_wait();
        c_sprite(spr_noelle_sit);
        c_wait(30);
        c_speaker("noelle");
        c_msgsetloc(0, "\\E4* Sorry^1! Should we go ahead and start our projects?/%", "obj_ch4_PDC10_slash_Step_0_gml_167_0");
        c_talk_wait();
        c_sel(su);
        c_sprite(spr_susie_sit_shocked);
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Uhhhh^1, wait!/%", "obj_ch4_PDC10_slash_Step_0_gml_175_0");
        c_talk_wait();
        c_sel(no);
        c_sprite(spr_noelle_sit_neutral);
        c_speaker("noelle");
        c_msgsetloc(0, "\\E2* Huh?/%", "obj_ch4_PDC10_slash_Step_0_gml_183_0");
        c_talk_wait();
        c_sel(su);
        c_sprite(spr_susie_sit_scratch);
        c_imagespeed(0.15);
        c_speaker("susie");
        c_msgsetloc(0, "\\EC* Don't we need more like^1, uh^1, stuff?/", "obj_ch4_PDC10_slash_Step_0_gml_192_0");
        c_msgnextloc("\\EK* Like^1, y'know. Paper^1, pencils..^1. project stuff?/", "obj_ch4_PDC10_slash_Step_0_gml_193_0");
        c_msgnextloc("\\E7* Kris^1, you should^1, uh^1, go look for it./%", "obj_ch4_PDC10_slash_Step_0_gml_194_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_halt();
        c_sel(no);
        c_sprite(spr_noelle_sit_expressions);
        c_imageindex(1);
        c_addxy(5, 0);
        c_wait_box(2);
        c_sel(su);
        c_sprite(spr_susie_sit_normal_left);
        c_sel(no);
        c_sprite(spr_noelle_sit_neutral);
        c_addxy(-5, 0);
        c_wait_talk();
        c_sel(su);
        c_sprite(spr_susie_sit_normal_left_look_back);
        c_sel(no);
        c_sprite(spr_noelle_sit_expressions);
        c_imageindex(7);
        c_addxy(5, 0);
        c_wait(30);
        c_sel(no);
        c_sprite(spr_noelle_sit_expressions);
        c_imageindex(8);
        c_speaker("noelle");
        c_msgsetloc(0, "\\E2* .../", "obj_ch4_PDC10_slash_Step_0_gml_232_0");
        c_msgnextloc("\\E3* Gosh^1, you're right^1, Susie./", "obj_ch4_PDC10_slash_Step_0_gml_233_0");
        c_msgnextloc("\\E2* Kris^1, I think there was some stuff in my room^1, y'know.../", "obj_ch4_PDC10_slash_Step_0_gml_234_0");
        c_msgnextloc("\\E4* ..^1. If you wanted to go look!/%", "obj_ch4_PDC10_slash_Step_0_gml_235_0");
        c_talk();
        c_wait_box(1);
        c_sel(no);
        c_imageindex(0);
        c_sel(su);
        c_sprite(spr_susie_sit_normal);
        c_wait_box(2);
        c_sel(no);
        c_sprite(spr_noelle_sit);
        c_addxy(-5, 0);
        c_sel(su);
        c_sprite(spr_susie_sit_normal_left);
        c_wait_talk();
        c_sel(su);
        c_sprite(spr_susie_sit_normal);
        c_sel(kr);
        c_sprite(spr_krisd);
        c_walk_wait("d", 3, 5);
        c_var_instance(id, "make_npcs", true);
        c_mus2("volume", 1, 30);
        c_panobj(kr_actor, 30);
        c_wait(31);
        c_pannable(0);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
    else
    {
        c_sel(no);
        c_sprite(spr_noelle_sit_phone);
        c_speaker("noelle");
        c_msgsetloc(0, "\\E3* Hi^1, Berdly^1! What's up? Umm..^1. huh? Sure^1, of..^1. of course I'm alone!/", "obj_ch4_PDC10_slash_Step_0_gml_322_0");
        c_msgnextloc("\\E1* Um^1, sure^1, I bet I do look \"quite cervine this fine evening\"...?/", "obj_ch4_PDC10_slash_Step_0_gml_323_0");
        c_msgnextloc("\\E3* If it's about the notes^1, I already highlighted them for you^1, so.../%", "obj_ch4_PDC10_slash_Step_0_gml_324_0");
        c_talk_wait();
        c_wait(30);
        c_sel(no);
        c_sprite(spr_noelle_sit_phone_surprised);
        c_sel(su);
        c_sprite(spr_susie_sit_neutral);
        c_speaker("noelle");
        c_msgsetloc(0, "\\EF* Wh..^1. what?/", "obj_ch4_PDC10_slash_Step_0_gml_337_0");
        c_msgnextloc("\\EB* You want me to..^1. go on a date to the festival..^1. with you?/", "obj_ch4_PDC10_slash_Step_0_gml_338_0");
        c_facenext("susie", 0);
        c_msgnextloc("\\E0* .../", "obj_ch4_PDC10_slash_Step_0_gml_340_0");
        c_facenext("noelle", "A");
        c_msgnextloc("\\EA* Umm..^1. I mean..^1. sure^1, I..^1. I..^1. I'd be glad to.../%", "obj_ch4_PDC10_slash_Step_0_gml_344_0");
        c_talk();
        c_wait_box(5);
        c_sel(no);
        c_sprite(spr_noelle_sit_phone_sad);
        c_wait_talk();
        c_waitcustom();
    }
}
if (con == 3 && customcon == 1)
{
    con = 4;
    global.typer = 23;
    msgsetloc(0, "\\EI* \"be your^1, Player 2...\"/%", "obj_ch4_PDC10_slash_Step_0_gml_360_0");
    d_make();
}
if (con == 4 && !d_ex())
{
    con = 5;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_sit_phone_grab);
    c_halt();
    c_imageindex(1);
    c_wait(10);
    c_imageindex(2);
    c_soundplay(snd_grab);
    c_sel(no);
    c_sprite(spr_noelle_sit_phone_snatch_surprised);
    c_shakeobj();
    c_wait(1);
    c_sel(su);
    c_imageindex(3);
    c_wait(1);
    c_imageindex(4);
    c_wait(60);
    c_imageindex(5);
    c_sound_play(snd_sussurprise);
    c_shakeobj();
    c_sel(no);
    c_sprite(spr_noelle_sit_gasp);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* SHE'S NOT GOING TO THE FESTIVAL WITH YOU^1, DUMBASS!!/%", "obj_ch4_PDC10_slash_Step_0_gml_398_0");
    c_talk_wait();
    c_wait(5);
    c_sel(su);
    c_sprite(spr_susie_sit_toss);
    c_var_instance(id, "phone_throw", true);
    c_soundplay(snd_noise);
    c_wait(25);
    c_soundplay(snd_wing);
    c_wait(5);
    c_sprite(spr_susie_sit_normal);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EE* S..^1. Susie!?/", "obj_ch4_PDC10_slash_Step_0_gml_417_0");
    c_facenext("susie", "K");
    c_msgnextloc("\\EK* Look^1, you don't really wanna go with him^1, right?/", "obj_ch4_PDC10_slash_Step_0_gml_419_0");
    c_msgnextloc("\\E5* Some people aren't gonna get it 'til you scream \"NO\"./", "obj_ch4_PDC10_slash_Step_0_gml_420_0");
    c_msgnextloc("\\EL* ..^1. did you forget that or something?/%", "obj_ch4_PDC10_slash_Step_0_gml_421_0");
    c_talk_wait();
    c_wait(30);
    c_sel(no);
    c_sprite(spr_noelle_sit_gasp_look);
    c_wait(30);
    c_sprite(spr_noelle_sit_gasp_look_down);
    c_speaker("noelle");
    c_msgsetloc(0, "\\E3* ..^1. yeah. Yeah..^1. you're right!/", "obj_ch4_PDC10_slash_Step_0_gml_432_0");
    c_msgnextloc("\\E9* I shouldn't be afraid to..^1. tell Berdly how I really feel./", "obj_ch4_PDC10_slash_Step_0_gml_433_0");
    c_msgnextloc("\\E8* Next time I..^1. I should be honest^1! Next time^1, I should.../%", "obj_ch4_PDC10_slash_Step_0_gml_434_0");
    c_talk();
    c_wait_box(2);
    c_sel(no);
    c_sprite(spr_noelle_sit_gasp_eyes_closed);
    c_wait_talk();
    c_sel(su);
    c_sprite(spr_susie_sit_blinking);
    c_sel(no);
    c_autowalk(0);
    c_soundplay(snd_grab);
    c_sprite(spr_noelle_sit_strangle);
    c_imagespeed(0.25);
    c_shakeobj();
    c_speaker("noelle");
    c_msgsetloc(0, "\\EK* I..^1. I should shake his neck and scream at him!/%", "obj_ch4_PDC10_slash_Step_0_gml_456_0");
    c_talk_wait();
    c_wait(30);
    c_sel(no);
    c_sprite(spr_noelle_sit_strangle_look_down);
    c_halt();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* So^1, uhh...%%", "obj_ch4_PDC10_slash_Step_0_gml_470_0");
    c_talk_wait();
    c_sel(no);
    c_sprite(spr_noelle_walk_down_lw);
    c_walk_wait("u", 2, 3);
    c_soundplay(snd_wing);
    c_walk_wait("d", 3, 7);
    c_facing("u");
    c_speaker("noelle");
    c_msgsetloc(0, "\\EK* HAHA^1, where did you throw my phone^1, anyway?/%", "obj_ch4_PDC10_slash_Step_0_gml_482_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_sit_normal_left);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* (Kris^1, I'll keep her busy^1! You go look for clues!)/%", "obj_ch4_PDC10_slash_Step_0_gml_490_0");
    c_talk_wait();
    c_sel(kr);
    c_sprite(spr_krisd);
    c_walk("d", 3, 5);
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw);
    c_walk_wait("d", 3, 5);
    c_facing("u");
    c_var_instance(id, "make_npcs", true);
    c_mus2("volume", 1, 30);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (make_npcs)
{
    make_npcs = false;
    var noelle_npc = instance_create(no_actor.x, no_actor.y, obj_npc_room);
    noelle_npc.normalanim = 4;
    noelle_npc.sprite_index = no_actor.sprite_index;
    noelle_npc.image_index = no_actor.image_index;
    noelle_npc.depth = 94140;
    noelle_npc.extflag = "phone_look_noelle";
    var susie_npc = instance_create(su_actor.x, su_actor.y, obj_npc_room);
    susie_npc.normalanim = 4;
    susie_npc.sprite_index = su_actor.sprite_index;
    susie_npc.image_index = su_actor.image_index;
    susie_npc.depth = 94150;
    susie_npc.extflag = "phone_look_susie";
    if (scr_sideb_get_phase() >= 2 && scr_flag_get(916) == 0)
    {
        noelle_npc.depth = 94300;
        noelle_npc.extflag = "phone_look_noelle_weird";
        susie_npc.depth = 94300;
        susie_npc.extflag = "phone_look_susie_weird";
    }
    if (scr_sideb_get_phase() < 2 || scr_flag_get(916) > 0)
    {
        phone_npc = instance_create(phone_marker.x, phone_marker.y, obj_ch4_PDC10_phone);
        phone_npc.sprite_index = phone_marker.sprite_index;
        phone_npc.depth = phone_marker.depth;
    }
    with (phone_marker)
        instance_destroy();
}
if ((con == 3 || con == 5) && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 60;
    con = 99;
}
