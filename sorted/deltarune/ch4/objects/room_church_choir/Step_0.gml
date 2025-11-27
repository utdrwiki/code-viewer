if (lightning_active)
{
    lightning_timer++;
    if (lightning_timer == 1)
    {
        snd_play(snd_thunder_instant);
        var lightning_marker = scr_marker(0, 0, spr_lw_church_choir_lightning);
        with (lightning_marker)
        {
            depth = 990;
            scr_script_delayed(scr_lerpvar, 11, "image_alpha", 1, 0, 80, 3, "out");
            scr_doom(id, 90);
        }
        sk_marker.visible = 1;
        with (sk_marker)
            scr_script_delayed(scr_lerpvar, 11, "image_alpha", 1, 0, 80, 3, "out");
    }
    sk_marker.y = kr_actor.y;
}
if (con < 0)
    exit;
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 85;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_walkdirect(183, 56, 12);
    c_delayfacing(13, "u");
    c_sel(su);
    c_walkdirect(205, 49, 12);
    c_delayfacing(13, "u");
    c_wait(30);
    c_sel(kr);
    c_autowalk(0);
    c_walkdirect(183, 75, 6);
    c_var_instance(sk_marker, "x", 183);
    c_var_instance(sk_marker, "y", kr_actor.y);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_shocked_behind_left_lw);
    c_walkdirect(207, 69, 6);
    c_snd_play(snd_dooropen);
    c_var_instance(closet_door, "image_index", 1);
    c_var_instance(id, "lightning_timer", 0);
    c_var_instance(id, "lightning_active", true);
    c_wait(90);
    c_var_instance(id, "lightning_active", false);
    c_sel(su);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* What the hell is that?!/%", "obj_room_church_choir_slash_Step_0_gml_95_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_facing("u");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EJ* .../", "obj_room_church_choir_slash_Step_0_gml_106_0");
    c_msgnextloc("\\E6* Oh^1, I bet that's just Jack..^1. whoops./", "obj_room_church_choir_slash_Step_0_gml_107_0");
    c_msgnextloc("\\E1* Maybe he's a Halloween decoration? There's other creepy stuff too./", "obj_room_church_choir_slash_Step_0_gml_108_0");
    c_msgnextloc("\\E0* He's big. Guess we might not be able to take him back tonight./%", "obj_room_church_choir_slash_Step_0_gml_109_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(1);
    c_walk("u", 1, 4);
    c_wait_box(2);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(207, 48, 14);
    c_delaycmd(15, "imagespeed", 0);
    c_delaycmd(15, "imageindex", 0);
    c_wait_talk();
    c_snd_play(snd_doorclose);
    c_var_instance(closet_door, "image_index", 0);
    c_waitcustom();
}
if (con == 20 && !d_ex() && global.interact == 0)
{
    con = 21;
    alarm[0] = 60;
    global.interact = 1;
    scr_script_delayed(snd_play, 4, 117, 0.7, 0.8);
    scr_script_delayed(snd_play, 8, 117, 0.7, 1);
    scr_script_delayed(snd_play, 12, 117, 0.7, 1.2);
}
if (con == 22 && !d_ex())
    con = 100;
if (con == 35 && !d_ex() && global.interact == 0)
{
    con = 36;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(su);
    c_walkdirect(86, 120, 12);
    c_delayfacing(13, "l");
    c_sel(kr);
    c_walkdirect_wait(83, 96, 12);
    c_facing("l");
    c_msgside("top");
    c_speaker("no_name");
    c_msgsetloc(0, "* (It's a keyboard. It has settings to sound like either a piano or an organ.)/%", "obj_room_church_choir_slash_Step_0_gml_173_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. Y'know^1, when you played piano earlier..^1. it was.../", "obj_room_church_choir_slash_Step_0_gml_183_0");
    c_msgnextloc("\\ED* Okay^1, it was actually kinda cool. I mean that./", "obj_room_church_choir_slash_Step_0_gml_184_0");
    c_msgnextloc("\\EK* I'm not saying you should join the choir or whatever but.../", "obj_room_church_choir_slash_Step_0_gml_185_0");
    c_msgnextloc("\\ED* If you were playing every week./", "obj_room_church_choir_slash_Step_0_gml_186_0");
    c_msgnextloc("\\EN* ..^1. I might actually wanna go to church./", "obj_room_church_choir_slash_Step_0_gml_187_0");
    c_msgnextloc("\\ED* .../", "obj_room_church_choir_slash_Step_0_gml_188_0");
    c_msgnextloc("\\ED* ..^1. That..^1. Kinda reminds me of something./%", "obj_room_church_choir_slash_Step_0_gml_189_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_wait_box(2);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_susie_head_scratch);
    c_addxy(-2, -1);
    c_wait_box(3);
    c_halt();
    c_autowalk(1);
    c_facing("u");
    c_addxy(2, 1);
    c_wait_box(4);
    c_sel(su);
    c_facing("l");
    c_wait_box(5);
    c_sel(su);
    c_sprite(spr_susie_head_down_left);
    c_wait_box(6);
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_wait(5);
    c_msc(1403);
    c_talk_wait();
    c_waitcustom();
}
if (con == 40 && !d_ex() && customcon == 1)
{
    con = 41;
    customcon = 0;
    global.interact = 1;
    c_waitcustom_end();
    c_var_lerp_to_instance(blackall, "image_alpha", 1, 60);
    c_wait(90);
    c_speaker("susie");
    c_fefc(0, 0);
    c_msgsetloc(0, "* So..^1. In one of the places I used to live^1, there was like.../", "obj_room_church_choir_slash_Step_0_gml_248_0");
    c_msgnextloc("* There was this plaza..^1. and they put this public piano in it./", "obj_room_church_choir_slash_Step_0_gml_249_0");
    c_msgnextloc("* So I started playing it. Thinking^1, y'know^1, it might be fun./", "obj_room_church_choir_slash_Step_0_gml_250_0");
    c_msgnextloc("* But..^1. I guess.../", "obj_room_church_choir_slash_Step_0_gml_251_0");
    c_msgnextloc("* Maybe because I was..^1. so bad.../", "obj_room_church_choir_slash_Step_0_gml_252_0");
    c_msgnextloc("* Or because I just looked like I shouldn't be playing.../", "obj_room_church_choir_slash_Step_0_gml_253_0");
    c_msgnextloc("* They told me I wasn't..^1. allowed to play it./", "obj_room_church_choir_slash_Step_0_gml_254_0");
    c_msgnextloc("* So I backed off./", "obj_room_church_choir_slash_Step_0_gml_255_0");
    c_msgnextloc("* And then..^1. They let somebody else play./", "obj_room_church_choir_slash_Step_0_gml_256_0");
    c_msgnextloc("* ..^1. someone better./", "obj_room_church_choir_slash_Step_0_gml_257_0");
    c_msgnextloc("* .../", "obj_room_church_choir_slash_Step_0_gml_258_0");
    c_msgnextloc("* I don't know..^1. I don't know why I expected I'd be able to play it./", "obj_room_church_choir_slash_Step_0_gml_259_0");
    c_msgnextloc("* ..^1. Is what I thought..^1. then./", "obj_room_church_choir_slash_Step_0_gml_260_0");
    c_msgnextloc("* .../", "obj_room_church_choir_slash_Step_0_gml_261_0");
    c_msgnextloc("* That night^1, when no one else was around.../", "obj_room_church_choir_slash_Step_0_gml_262_0");
    c_msgnextloc("* ..^1. I came back./", "obj_room_church_choir_slash_Step_0_gml_263_0");
    c_msgnextloc("* And you know what I did?/", "obj_room_church_choir_slash_Step_0_gml_264_0");
    c_msgnextloc("* ..^1. I smashed it./", "obj_room_church_choir_slash_Step_0_gml_265_0");
    c_msgnextloc("* Yeah..^1. I smashed the piano./", "obj_room_church_choir_slash_Step_0_gml_266_0");
    c_msgnextloc("* ..^1. I..^1. don't even really know if I broke it^1, but.../", "obj_room_church_choir_slash_Step_0_gml_267_0");
    c_msgnextloc("* I hit it as hard as I could. Hard enough to do some damage./", "obj_room_church_choir_slash_Step_0_gml_268_0");
    c_msgnextloc("* ..^1. and I ran./", "obj_room_church_choir_slash_Step_0_gml_269_0");
    c_msgnextloc("* ..^1. A week ago^1, if I knew you did piano.../", "obj_room_church_choir_slash_Step_0_gml_270_0");
    c_msgnextloc("* ..^1. I probably would've just hated that about you./", "obj_room_church_choir_slash_Step_0_gml_271_0");
    c_msgnextloc("* But now.../", "obj_room_church_choir_slash_Step_0_gml_272_0");
    c_msgnextloc("* I kinda..^1. just wanna hear you play./%", "obj_room_church_choir_slash_Step_0_gml_273_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 60);
    c_wait(90);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. Damn..^1. I got weird there for a second./", "obj_room_church_choir_slash_Step_0_gml_286_0");
    c_msgnextloc("\\ET* Probably made you want to stop playing even more^1, huh./%", "obj_room_church_choir_slash_Step_0_gml_287_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_head_down_left);
    c_wait_talk();
    c_wait(15);
    c_msc(1405);
    c_talk_wait();
    c_waitcustom();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 85;
    customcon = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_wait(60);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. yeah. Not now./%", "obj_room_church_choir_slash_Step_0_gml_321_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 60 && !d_ex() && customcon == 1)
{
    con = 85;
    customcon = 0;
    global.interact = 1;
    c_waitcustom_end();
    if (!scr_sideb_active())
    {
        c_sel(su);
        c_facing("l");
        c_speaker("susie");
        c_msgsetloc(0, "\\E8* ..^1. heh^1, really?/", "obj_room_church_choir_slash_Step_0_gml_343_0");
        c_msgnextloc("\\EA* You actually..^1. sounded pretty confident./", "obj_room_church_choir_slash_Step_0_gml_344_0");
        c_msgnextloc("\\E9* Guess you like surprising people you can play^1, huh?/", "obj_room_church_choir_slash_Step_0_gml_345_0");
        c_msgnextloc("\\EN* ..^1. that's nice./%", "obj_room_church_choir_slash_Step_0_gml_346_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_sprite(spr_susie_head_turn_left);
        c_wait_box(2);
        c_sel(su);
        c_facing("u");
        c_wait_box(3);
        c_sel(su);
        c_facing("l");
        c_wait_talk();
    }
    else
    {
        c_sel(su);
        c_sprite(spr_susie_head_turn_left);
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* ..^1. why do you sound so..^1. mad?/", "obj_room_church_choir_slash_Step_0_gml_368_0");
        c_msgnextloc("\\E0* If anyone's stopping you from playing or something.../", "obj_room_church_choir_slash_Step_0_gml_369_0");
        c_msgnextloc("\\EY* ..^1. I'll clock 'em for ya./%", "obj_room_church_choir_slash_Step_0_gml_370_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_facing("u");
        c_wait_box(2);
        c_sel(su);
        c_facing("l");
        c_wait_talk();
    }
    c_waitcustom();
}
if (con == 70 && !d_ex() && customcon == 1)
{
    con = 85;
    customcon = 0;
    global.interact = 1;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_surprised_left_lw);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* ..^1. huh?/", "obj_room_church_choir_slash_Step_0_gml_401_0");
    c_msgnextloc("\\E7* ..^1. heh^1, yeah..^1. yeah^1, sure./", "obj_room_church_choir_slash_Step_0_gml_402_0");
    c_msgnextloc("\\ED* ..^1. If you teach me or something.../", "obj_room_church_choir_slash_Step_0_gml_403_0");
    c_msgnextloc("\\EN* Let's do it. Someday./%", "obj_room_church_choir_slash_Step_0_gml_404_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_head_turn_left);
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(3);
    c_sel(su);
    c_facing("l");
    c_wait_talk();
    c_waitcustom();
}
if (con == 80 && !d_ex() && customcon == 1)
{
    con = 85;
    customcon = 0;
    global.interact = 1;
    c_waitcustom_end();
    if (!scr_sideb_active())
    {
        c_sel(su);
        c_sprite(spr_susie_head_turn_left);
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* ..^1. huh? What did you say? You were coughing.../", "obj_room_church_choir_slash_Step_0_gml_440_0");
        c_msgnextloc("\\ED* .../", "obj_room_church_choir_slash_Step_0_gml_441_0");
        c_msgnextloc("\\EN* You shouldn't be afraid to play./", "obj_room_church_choir_slash_Step_0_gml_442_0");
        c_msgnextloc("\\ET* You can..^1. actually do it. heh./%", "obj_room_church_choir_slash_Step_0_gml_443_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_facing("l");
        c_wait_box(2);
        c_sel(su);
        c_sprite(spr_susie_head_down_left);
        c_wait_box(3);
        c_sel(su);
        c_facing("l");
        c_wait_talk();
    }
    else
    {
        c_var_instance(blackall, "image_alpha", 1);
        c_wait(2);
        c_snd_play(snd_bite);
        c_snd_play(snd_hurt1);
        c_wait(60);
        c_speaker("susie");
        c_fefc(0, 0);
        c_msgsetloc(0, "* Hey^1, Kris^1! Kris!/%", "obj_room_church_choir_slash_Step_0_gml_473_0");
        c_talk_wait();
        c_sel(kr);
        c_sprite(spr_kris_head_down_side);
        c_var_lerp_to_instance(blackall, "image_alpha", 0, 60);
        c_sel(su);
        c_sprite(spr_susie_shocked_behind_left_lw);
        c_wait(90);
        c_sel(kr);
        c_facing("l");
        c_speaker("susie");
        c_msgsetloc(0, "\\Ee* ..^1. what happened? You started saying something.../", "obj_room_church_choir_slash_Step_0_gml_491_0");
        c_msgnextloc("\\Ec* ..^1. then you like^1, bit the hell out of your hand./", "obj_room_church_choir_slash_Step_0_gml_492_0");
        c_msgnextloc("\\Eb* Damn^1, that's gonna bruise.../", "obj_room_church_choir_slash_Step_0_gml_493_0");
        c_msgnextloc("\\EV* .../", "obj_room_church_choir_slash_Step_0_gml_494_0");
        c_msgnextloc("\\EV* ..^1. Damn^1, I..^1. shouldn't of told that story./", "obj_room_church_choir_slash_Step_0_gml_495_0");
        c_msgnextloc("\\EW* Forget it. Heh./%", "obj_room_church_choir_slash_Step_0_gml_496_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_facing("u");
        c_wait_box(2);
        c_sel(su);
        c_autowalk(0);
        c_imagespeed(0.2);
        c_sprite(spr_susie_head_scratch);
        c_addxy(-2, -1);
        c_wait_box(3);
        c_sel(su);
        c_halt();
        c_wait_box(4);
        c_sel(su);
        c_facing("u");
        c_addxy(2, 1);
        c_wait_box(5);
        c_sel(su);
        c_facing("l");
        c_wait_talk();
    }
    c_waitcustom();
}
if (con == 85 && !d_ex() && customcon == 1)
{
    con = 100;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 100 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
}
