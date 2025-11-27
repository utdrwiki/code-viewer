if (con < 0)
    exit;
if (con == 25)
{
    con = 26;
    alarm[0] = 1;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    snd_free_all();
    if (i_ex(obj_monsterparent))
    {
        with (obj_monsterparent)
            instance_destroy();
    }
    if (i_ex(obj_bulletparent))
    {
        with (obj_bulletparent)
            instance_destroy();
    }
    if (i_ex(obj_heroparent))
    {
        with (obj_heroparent)
            instance_destroy();
    }
    if (i_ex(obj_battlecontroller))
        instance_destroy(obj_battlecontroller);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 5000;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    statue_fx = instance_create(0, 0, obj_ch4_DCB02_vfx);
    statue_fx.depth = blackall.depth + 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_wait(30);
    c_pannable(1);
    c_pan(camerax() + room_offset, 0, 1);
    c_mus2("initloop", "raining_in_church2.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 30);
    var x_offset = room_offset;
    with (su_actor)
    {
        x = 370;
        y = 220;
        color_blend = c_white;
        sprite_index = spr_susie_surprised_step_back;
    }
    with (ra_actor)
    {
        x = 526;
        y = 224;
        sprite_index = spr_ralsei_walk_left_unhappy;
    }
    with (kr_actor)
    {
        x = 60 + x_offset;
        y = 236;
        sprite_index = spr_krisr_dark;
    }
    with (obj_actor)
        visible = 1;
    with (debris)
    {
        image_blend = c_white;
        sprite_index = spr_old_man_statue_shards;
        image_index = 1;
        visible = 1;
        x = 332 + x_offset;
        y = 296;
    }
    statue_fx.statue_target = debris;
    statue_fx.susie_target = su_actor;
    statue_fx.ralsei_target = ra_actor;
    statue_fx.kris_target = kr_actor;
    with (statue_fx)
    {
        mode = 2;
        con = 0;
    }
}
if (con == 27)
{
    con = 28;
    var x_offset = room_offset;
    c_waitcustom_end();
    c_wait(18);
    c_wait(2);
    c_customfunc(function()
    {
        scr_lerp_imageblend(blackall, c_black, c_white, 3);
    });
    c_var_instance(id, "lightning_loop", true);
    c_wait(2);
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 90);
    c_wait(90);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E8* Susie.../", "obj_ch4_DCB02_slash_Step_0_gml_127_0");
    c_msgnextloc("\\Eb* That wasn't the old man./", "obj_ch4_DCB02_slash_Step_0_gml_128_0");
    c_facenext("susie", "e");
    c_msgnextloc("\\Ee* H..^1. huh?/%", "obj_ch4_DCB02_slash_Step_0_gml_130_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_wait_talk();
    c_wait(5);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_wait(15);
    c_sprite(spr_ralsei_walk_right_sad_subtle);
    c_wait(15);
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E8* One of the statues in his shape from his study.../", "obj_ch4_DCB02_slash_Step_0_gml_154_0");
    c_msgnextloc("\\Ec* It must have begun moving when you made this Dark World./", "obj_ch4_DCB02_slash_Step_0_gml_155_0");
    c_facenext("susie", "U");
    c_msgnextloc("\\EU* A..^1. a statue...? Then..^1. the old man...?/%", "obj_ch4_DCB02_slash_Step_0_gml_157_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_sad);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_talk();
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_var_instance(id, "lightning_loop", false);
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("l");
    c_walkdirect_wait(ra_actor.x - 10, ra_actor.y, 16);
    c_wait(15);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ea* He's..^1. not in this world^1, sadly./", "obj_ch4_DCB02_slash_Step_0_gml_188_0");
    c_msgnextloc("\\EQ* Darkners patterned after the memory of a loved one.../", "obj_ch4_DCB02_slash_Step_0_gml_189_0");
    c_msgnextloc("\\EB* Tend to only appear in very specific darknesses./", "obj_ch4_DCB02_slash_Step_0_gml_190_0");
    c_msgnextloc("\\EQ* ..^1. even if we tried to bring him to Castle Town^1, he.../", "obj_ch4_DCB02_slash_Step_0_gml_191_0");
    c_facenext("susie", "b");
    c_msgnextloc("\\Eb* THEN WHY DIDN'T YOU SAY SOMETHING EARLIER!?/%", "obj_ch4_DCB02_slash_Step_0_gml_193_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_left);
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_sel(su);
    c_sprite(spr_susie_look_down_arm_shake);
    c_halt();
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_look_down_arm_shake);
    c_imagespeed(0.2);
    c_wait_box(5);
    c_mus2("initloop", "tense.ogg", 0);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left);
    c_sel(su);
    c_sprite(spr_susie_walk_right_angry);
    c_imagespeed(0.2);
    c_walkdirect(466, su_actor.y, 12);
    c_delaycmd(13, "imagespeed", 0);
    c_delaycmd(13, "imageindex", 0);
    c_wait(8);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walk_wait("r", 2, 2);
    c_halt();
    c_wait_talk();
    c_wait(4);
    c_var_instance(id, "lightning_active", true);
    c_wait(70);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* H..^1. huh?/", "obj_ch4_DCB02_slash_Step_0_gml_247_0");
    c_facenext("susie", "c");
    c_msgnextloc("\\Ec* First the roaring thing^1, then you not being real.../", "obj_ch4_DCB02_slash_Step_0_gml_249_0");
    c_msgnextloc("\\Eb* And now THIS!? What's wrong with you!?/%", "obj_ch4_DCB02_slash_Step_0_gml_250_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_shakestep(12, 0);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_autowalk(0);
    c_imagespeed(0.3);
    c_walk_wait("r", 2, 6);
    c_halt();
    c_wait_box(3);
    c_sel(su);
    c_shakestep(12, 0);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_autowalk(0);
    c_imagespeed(0.3);
    c_walk_wait("r", 2, 6);
    c_halt();
    c_wait_talk();
    c_sel(su);
    c_shakestep(10, 0);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left_walk);
    c_autowalk(0);
    c_imagespeed(0.3);
    c_walkdirect_wait(563, ra_actor.y, 6);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back);
    c_setxy(563, ra_actor.y);
    c_var_lerp("image_index", 1, 4, 12);
    c_wait(6);
    c_snd_play(snd_bump);
    c_wait(6);
    c_shakeobj();
    c_halt();
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_anger_yell);
    c_speaker("susie");
    c_msgsetloc(0, "\\Ec* If you KNOW something^1, why don't you just--/%", "obj_ch4_DCB02_slash_Step_0_gml_301_0");
    c_talk_wait();
    c_wait_talk();
    c_sel(su);
    c_customfunc(function()
    {
        susie_yell();
    });
    c_wait_if(su_actor, "image_index", "=", 8);
    c_sel(su);
    c_shakeobj();
    c_speaker("susie");
    c_msgsetloc(0, "\\Eb* TELL us!/%", "obj_ch4_DCB02_slash_Step_0_gml_318_0");
    c_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_wince);
    c_setxy(563, ra_actor.y);
    c_shakeobj();
    c_var_instance(id, "lightning_active", true);
    c_mus2("volume", 0, 60);
    c_wait_talk();
    c_wait(60);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_expressions);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EZ* I/", "obj_ch4_DCB02_slash_Step_0_gml_338_0");
    c_msgnextloc("\\EY* I'm/", "obj_ch4_DCB02_slash_Step_0_gml_339_0");
    c_msgnextloc("\\EZ* I'm sorry^1, I/", "obj_ch4_DCB02_slash_Step_0_gml_340_0");
    c_msgnextloc("\\E7* I know so many things^1, I/", "obj_ch4_DCB02_slash_Step_0_gml_341_0");
    c_msgnextloc("\\Ec* I know so many things I^1, don't know. When to say them./%", "obj_ch4_DCB02_slash_Step_0_gml_342_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_imageindex(1);
    c_wait_box(2);
    c_mus2("initloop", "tin_night.ogg", 0);
    c_sel(ra);
    c_imageindex(0);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_anger_yell_stop);
    c_sel(ra);
    c_imageindex(3);
    c_wait_box(4);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_wince);
    c_wait_talk();
    c_sel(su);
    c_facing("r");
    c_wait(4);
    c_autowalk(0);
    c_walk("l", 2, 6);
    c_imageindex(1);
    c_delaycmd(3, "imageindex", 2);
    c_delaycmd(6, "sprite", spr_susie_look_down_sad);
    c_delaycmd(6, "imageindex", 0);
    c_delaycmd(6, "imagespeed", 0);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_cry);
    c_imagespeed(0.1);
    c_shakeobj();
    c_wait(60);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\E5* I don't want..^1. to say them. To..^1. worry..^1. you two./", "obj_ch4_DCB02_slash_Step_0_gml_390_0");
    c_msgnextloc("\\E6* So I end up..^1. I end up not saying..^1. anything./%", "obj_ch4_DCB02_slash_Step_0_gml_391_0");
    c_talk();
    c_wait_box(0);
    c_customfunc(function()
    {
        voice_pitch = 0.05;
        scr_writer_setshake(0.5);
        scr_writer_setspeed(2);
    });
    c_wait_box(1);
    c_customfunc(function()
    {
        voice_pitch = 0.05;
        scr_writer_setshake(0.5);
        scr_writer_setspeed(2);
    });
    c_wait_talk();
    c_wait(30);
    c_sel(ra);
    c_halt();
    c_sel(su);
    c_imageindex(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\ER* What do you mean..^1. You know so many things?/%", "obj_ch4_DCB02_slash_Step_0_gml_423_0");
    c_talk_wait();
    c_wait(15);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\E8* About the \"rules\" of this world. About the prophecy./", "obj_ch4_DCB02_slash_Step_0_gml_430_0");
    c_msgnextloc("\\E4* About..^1. what the prophecy..^1. says will happen./", "obj_ch4_DCB02_slash_Step_0_gml_431_0");
    c_msgnextloc("\\E5* I didn't ask to know^1, but I do./%", "obj_ch4_DCB02_slash_Step_0_gml_432_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(id, "voice_pitch", -1);
    c_customfunc(function()
    {
        scr_writer_setspeed(2);
    });
    c_wait_box(1);
    c_customfunc(function()
    {
        scr_writer_setspeed(2);
    });
    c_wait_box(2);
    c_customfunc(function()
    {
        scr_writer_setspeed(2);
    });
    c_wait_talk();
    c_var_instance(id, "lightning_active", true);
    c_wait(60);
    c_sel(su);
    c_imageindex(0);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\EB* I..^1. I'm sorry if it creeps you out!/", "obj_ch4_DCB02_slash_Step_0_gml_467_0");
    c_msgnextloc("\\E4* I'm sorry if I..^1. don't tell you everything./", "obj_ch4_DCB02_slash_Step_0_gml_468_0");
    c_msgnextloc("\\E5* It's just..^1. sometimes^1, knowing things.../%", "obj_ch4_DCB02_slash_Step_0_gml_469_0");
    c_talk();
    c_wait_box(0);
    c_customfunc(function()
    {
        scr_writer_setshake(0.5);
    });
    c_wait_box(1);
    c_customfunc(function()
    {
        scr_writer_setshake(0.5);
    });
    c_wait_box(2);
    c_customfunc(function()
    {
        scr_writer_setshake(0.5);
    });
    c_wait_talk();
    c_wait(30);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\E8* It hurts./", "obj_ch4_DCB02_slash_Step_0_gml_496_0");
    c_msgnextloc("\\E5* And if anyone's going to hurt.../%", "obj_ch4_DCB02_slash_Step_0_gml_497_0");
    c_talk();
    c_wait_box(0);
    c_customfunc(function()
    {
        scr_writer_setspeed(2);
    });
    c_wait_talk();
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Let it..^1. just be me^1, okay?/%", "obj_ch4_DCB02_slash_Step_0_gml_510_0");
    c_talk();
    c_wait_box(0);
    c_customfunc(function()
    {
        scr_writer_setspeed(2);
    });
    c_var_instance(id, "lightning_active", true);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_expressions);
    c_imageindex(4);
    c_imagespeed(0);
    c_sel(su);
    c_sprite(spr_susie_surprised_step_back);
    c_wait_talk();
    c_wait(60);
    c_speaker("susie");
    c_msgsetloc(0, "\\ER* .../%", "obj_ch4_DCB02_slash_Step_0_gml_534_0");
    c_talk_wait();
    c_wait(15);
    c_sel(su);
    c_sprite(spr_susie_look_react_right);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_cry);
    c_imagespeed(0.1);
    c_speaker("ralsei");
    c_fefc(0, 0);
    c_msgsetloc(0, "\\E5* Oops^1, I..^1. I'm sorry^1, haha^1, I..^1. I.../%", "obj_ch4_DCB02_slash_Step_0_gml_548_0");
    c_talk();
    c_wait_box(0);
    c_customfunc(function()
    {
        voice_pitch = 0.05;
        scr_writer_setshake(0.5);
        scr_writer_setspeed(2);
    });
    c_wait_talk();
    c_var_instance(id, "voice_pitch", -1);
    c_wait(30);
    c_sel(ra);
    c_halt();
    c_sel(su);
    c_autowalk(1);
    c_facing("r");
    c_wait(4);
    c_walkdirect_wait(507, su_actor.y, 8);
    c_autowalk(0);
    c_halt();
    c_sprite(spr_susie_kneel_reach);
    c_imageindex(1);
    c_wait(30);
    c_imageindex(2);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* Ralsei.../", "obj_ch4_DCB02_slash_Step_0_gml_584_0");
    c_msgnextloc("\\ER* Is that..^1. why you've been acting..^1. so weird today?/", "obj_ch4_DCB02_slash_Step_0_gml_585_0");
    c_msgnextloc("\\ED* Why you keep.../", "obj_ch4_DCB02_slash_Step_0_gml_586_0");
    c_facenext("ralsei", "8");
    c_msgnextloc("\\E8* ..^1. I..^1. I've just been trying to stay ahead of you two./", "obj_ch4_DCB02_slash_Step_0_gml_588_0");
    c_msgnextloc("\\E8* So you don't have to see it. So you won't.../", "obj_ch4_DCB02_slash_Step_0_gml_589_0");
    c_msgnextloc("\\Ec* Because it would.../", "obj_ch4_DCB02_slash_Step_0_gml_590_0");
    c_facenext("susie", "R");
    c_msgnextloc("\\ER* See..^1. see what?/", "obj_ch4_DCB02_slash_Step_0_gml_592_0");
    c_facenext("ralsei", "c");
    c_msgnextloc("\\Ec* The ending..^1. of the prophecy./", "obj_ch4_DCB02_slash_Step_0_gml_594_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* What^1, that..^1. Last Prophecy thing...?/%", "obj_ch4_DCB02_slash_Step_0_gml_596_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_expressions);
    c_imageindex(1);
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_expressions);
    c_imageindex(2);
    c_wait_talk();
    c_sel(ra);
    c_sprite(spr_ralsei_fall_back_expressions);
    c_imageindex(0);
    c_emote("!", 30, 24, 20);
    c_wait(30);
    c_snd_play(snd_noise);
    c_sel(su);
    c_sprite(spr_susie_ralsei_grab);
    c_halt();
    c_var_lerp("image_index", 0, 2, 12);
    c_shakeobj();
    c_sel(ra);
    c_visible(0);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EZ* Susie^1, you..^1. y-you didn't.../", "obj_ch4_DCB02_slash_Step_0_gml_630_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* No^1, I mean^1, we almost did^1, but--%%", "obj_ch4_DCB02_slash_Step_0_gml_632_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_ralsei_grab_smile);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ee* Please. Please let me go ahead from now on. Please./", "obj_ch4_DCB02_slash_Step_0_gml_641_0");
    c_msgnextloc("\\Ej* I'll do every area. I'll do all the work./", "obj_ch4_DCB02_slash_Step_0_gml_642_0");
    c_msgnextloc("\\Ej* The next time^1, too./", "obj_ch4_DCB02_slash_Step_0_gml_643_0");
    c_msgnextloc("\\Ee* You two can just hang out and..^1. have fun!/", "obj_ch4_DCB02_slash_Step_0_gml_644_0");
    c_msgnextloc("\\Ej* I could do all the puzzles^1, I could.../%", "obj_ch4_DCB02_slash_Step_0_gml_645_0");
    c_talk();
    c_wait_talk();
    c_sel(su);
    c_sprite(spr_susie_ralsei_help_up);
    c_halt();
    c_snd_play(snd_bump);
    c_wait(30);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_ralsei_help_up);
    c_halt();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\ES* Hey..^1. look. It's okay^1, man./", "obj_ch4_DCB02_slash_Step_0_gml_666_0");
    c_msgnextloc("\\ET* That Last Prophecy thing..^1. I don't need to see it./", "obj_ch4_DCB02_slash_Step_0_gml_667_0");
    c_msgnextloc("\\ES* So..^1. if it helps^1, whenever you gotta.../", "obj_ch4_DCB02_slash_Step_0_gml_668_0");
    c_msgnextloc("\\ET* You can go ahead alone./", "obj_ch4_DCB02_slash_Step_0_gml_669_0");
    c_msgnextloc("\\EQ* But everything else?/", "obj_ch4_DCB02_slash_Step_0_gml_670_0");
    c_msgnextloc("\\E2* We're doing it together. As a team./%", "obj_ch4_DCB02_slash_Step_0_gml_671_0");
    c_talk_wait();
    c_sel(su);
    c_var_lerp_to("image_index", 7, 20);
    c_wait(60);
    c_sel(su);
    c_facing("susiedarkeyes");
    c_facing("r");
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left);
    c_visible(1);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* And NOTHING'S gonna change that./%", "obj_ch4_DCB02_slash_Step_0_gml_688_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_imageindex(1);
    c_walk_wait("r", 4, 2);
    c_sprite(spr_susie_ralsei_noogie);
    c_halt();
    c_shakeobj();
    c_sel(ra);
    c_visible(0);
    c_wait(12);
    c_sel(su);
    c_imagespeed(0.2);
    c_speaker("susie");
    c_msgsetloc(0, "\\E9* NOTHING!/", "obj_ch4_DCB02_slash_Step_0_gml_710_0");
    c_msgnextloc("\\E9* Whether you like it or not^1, toothpaste boy!/", "obj_ch4_DCB02_slash_Step_0_gml_711_0");
    c_facenext("ralsei", 26);
    c_msgnextloc("\\EQ* Susie...!/", "obj_ch4_DCB02_slash_Step_0_gml_713_0");
    c_facenext("susie", 6);
    c_msgnextloc("\\E6* Uhh^1, first noogie to make someone cry?/%", "obj_ch4_DCB02_slash_Step_0_gml_715_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_ralsei_noogie_cover);
    c_wait_talk();
    c_sel(su);
    c_halt();
    c_sel(ra);
    c_halt();
    c_wait(4);
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_sprite(spr_ralsei_sob_arm_wipe);
    c_halt();
    c_visible(1);
    c_wait(12);
    c_sel(su);
    c_sprite(spr_susie_surprised_right);
    c_sel(ra);
    c_sprite(spr_ralsei_sob_arm_wipe);
    c_imagespeed(0.1);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* H-hahaha^1! Sorry!/", "obj_ch4_DCB02_slash_Step_0_gml_750_0");
    c_msgnextloc("\\EB* I'm just..^1. glad you're friends with me./", "obj_ch4_DCB02_slash_Step_0_gml_751_0");
    c_msgnextloc("\\EQ* .../%", "obj_ch4_DCB02_slash_Step_0_gml_752_0");
    c_talk();
    c_wait_box(3);
    c_sel(ra);
    c_imagespeed(0);
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_wait(30);
    c_mus2("volume", 0, 60);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_walk_right_dw);
    c_imageindex(0);
    c_delaycmd(4, "imageindex", 1);
    c_delaycmd(8, "imageindex", 0);
    c_walk_wait("l", 4, 8);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_smile);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* I'll be more honest^1, Susie. I promise./", "obj_ch4_DCB02_slash_Step_0_gml_781_0");
    c_msgnextloc("\\E4* Even if it means..^1. sounding..^1. weird./", "obj_ch4_DCB02_slash_Step_0_gml_782_0");
    c_facenext("susie", 1);
    c_msgnextloc("\\E1* ..^1. Ralsei?/", "obj_ch4_DCB02_slash_Step_0_gml_784_0");
    c_msgnextloc("\\E9* You couldn't get any weirder if you tried./%", "obj_ch4_DCB02_slash_Step_0_gml_785_0");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_sad_subtle);
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_look_down);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_left);
    c_wait_box(4);
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_smile);
    c_wait_talk();
    c_snd_play(snd_suslaugh);
    c_sel(su);
    c_sprite(spr_susier_dark_laugh);
    c_imagespeed(0.2);
    c_sel(ra);
    c_sprite(spr_ralsei_laugh);
    c_imagespeed(0.2);
    c_addxy(0, 6);
    c_wait(60);
    c_sel(su);
    c_facing("r");
    c_halt();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_left_smile);
    c_addxy(0, -6);
    c_halt();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* You too^1, Susie!/", "obj_ch4_DCB02_slash_Step_0_gml_832_0");
    c_facenext("susie", 20);
    c_msgnextloc("\\EK* ..^1. uh^1, thanks./%", "obj_ch4_DCB02_slash_Step_0_gml_834_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(355, su_actor.y, 40);
    c_wait(10);
    c_sel(ra);
    c_autowalk(1);
    c_walkdirect_wait(418, su_actor.y, 40);
    c_var_instance(id, "swap_characters", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\EL* ..^1. well^1, let's get out of here^1, Kris./%", "obj_ch4_DCB02_slash_Step_0_gml_848_0");
    c_talk_wait();
    c_pannable(1);
    c_panobj(kr_actor, 30);
    c_wait(31);
    c_sel(kr);
    c_facing("d");
    c_customfunc(function()
    {
        with (obj_mainchara)
        {
            sprite_index = dsprite;
            visible = 1;
        }
    });
    c_pannable(0);
    c_waitcustom();
}
if (swap_characters)
{
    swap_characters = false;
    var susie_instance = -4;
    var ralsei_instance = -4;
    var su_x = su_actor.x;
    var su_y = su_actor.y;
    var ra_x = ra_actor.x;
    var ra_y = ra_actor.y;
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    with (obj_mainchara)
    {
        x = kr_x;
        y = kr_y;
        sprite_index = rsprite;
        cutscene = 1;
        fun = 1;
        visible = 1;
    }
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                cutscene = 0;
                fun = 0;
                x = su_x;
                y = su_y;
                susie_instance = id;
                sprite_index = lsprite;
                visible = 1;
            }
            if (name == "ralsei")
            {
                cutscene = 0;
                fun = 0;
                x = ra_x;
                y = ra_y;
                ralsei_instance = id;
                sprite_index = lsprite;
                visible = 1;
            }
            scr_caterpillar_interpolate_old();
        }
    }
    statue_fx.susie_target = susie_instance;
    statue_fx.ralsei_target = ralsei_instance;
    statue_fx.kris_target = 1049;
    with (statue_fx)
        target_characters = [statue_target, ralsei_target, susie_target, kris_target];
    with (statue_fx)
        follow_mode = true;
}
if (con == 28 && customcon == 1)
{
    con = 99;
    customcon = 0;
    global.interact = 0;
    global.facing = 0;
    su_actor.visible = 0;
    ra_actor.visible = 0;
    kr_actor.visible = 0;
    with (obj_mainchara)
    {
        cutscene = 0;
        fun = 0;
        visible = 1;
    }
    with (obj_caterpillarchara)
    {
        cutscene = 0;
        fun = 0;
        visible = 1;
    }
    with (obj_cutscene_master)
        instance_destroy();
    global.plot = 240;
}
if (lightning_loop)
{
    lightning_timer++;
    if ((lightning_timer % 320) == 1)
    {
        lightning_active = true;
        lightning_timer -= choose(320, 280, 240, 200);
    }
}
if (lightning_active)
{
    lightning_active = false;
    with (statue_fx)
        con = 10;
}
