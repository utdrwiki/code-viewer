if (!init)
{
    init = true;
    with (obj_mainchara)
    {
        x = 480;
        y = 680;
        cutscene = 1;
        freeze = 1;
        visible = 0;
    }
    if (!i_ex(obj_homealone_heart))
        instance_create(560, 530, obj_homealone_heart);
}
if (!i_ex(obj_homealone_heart))
    exit;
if (!init_heart)
{
    global.interact = 1;
    with (obj_homealone_heart)
    {
        cutscene = 1;
        visible = 0;
        angel_mode = true;
        x = 476;
        y = 585;
    }
    con = 0;
    scr_losechar();
    init_heart = true;
    exit;
}
if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    su = actor_count + 1;
    su_actor = instance_create(581, 535, obj_actor);
    scr_actor_setup(su, su_actor, "susie");
    su_actor.sprite_index = spr_susie_walk_left_lw;
    no = actor_count + 2;
    no_actor = instance_create(550, 532, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = spr_noelle_angel_hold_walk_left;
}
if (con == 1)
{
    con = 10;
    with (obj_mainchara)
        instance_destroy();
    c_pannable(1);
    c_pan(320, 560, 1);
    c_wait(1);
    c_pan(320, 460, 60);
    c_var_lerp_to_instance(blackall, "image_alpha", 0, 60);
    c_mus2("initloop", "noelle_distant.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 60);
    c_sel(su);
    c_walkdirect(533, su_actor.ystart, 86);
    c_sel(no);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(508, no_actor.ystart, 80);
    c_halt();
    c_speaker("susie");
    c_msgsetloc(0, "\\EF* Dude^1, wait. Wait a sec./", "obj_ch4_PDC13D_slash_Step_0_gml_100_0");
    c_facenext("noelle", 11);
    c_msgnextloc("\\EB* H..^1. huh?/%", "obj_ch4_PDC13D_slash_Step_0_gml_102_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EE* Something ELSE followed us from the basement.../", "obj_ch4_PDC13D_slash_Step_0_gml_117_0");
    c_facenext("noelle", "C");
    c_msgnextloc("\\EC* H-huh...? What?/%", "obj_ch4_PDC13D_slash_Step_0_gml_119_0");
    c_talk_wait();
    c_var_instance(shock_sprite, "x", 508);
    c_var_instance(shock_sprite, "y", no_actor.y);
    c_var_instance(shock_sprite, "visible", true);
    c_var_instance(id, "noelle_shock", true);
    c_sel(no);
    c_visible(0);
    c_sel(su);
    c_visible(0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E5* THE SEVERED HAND!!!/%", "obj_ch4_PDC13D_slash_Step_0_gml_134_0");
    c_talk();
    c_wait_if(id, "noelle_shock", "=", false);
    c_wait_talk();
    c_speaker("noelle");
    c_msgsetloc(0, "\\ER* ..^1. Susie^1! Fahaha^1! You meanie!/", "obj_ch4_PDC13D_slash_Step_0_gml_143_0");
    c_facenext("susie", 9);
    c_msgnextloc("\\E9* Heheh^1, got ya./%", "obj_ch4_PDC13D_slash_Step_0_gml_145_0");
    c_talk_wait();
    c_var_instance(shock_sprite, "visible", false);
    c_sel(no);
    c_visible(1);
    c_sel(su);
    c_visible(1);
    c_sel(su);
    c_autowalk(1);
    c_walkdirect(495, su_actor.ystart, 30);
    c_delaywalkdirect(41, 487, su_actor.ystart + 20, 15);
    c_sel(no);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(468, no_actor.ystart, 30);
    c_sprite(spr_noelle_walk_down_pan);
    c_walkdirect_wait(468, 551, 15);
    c_sprite(spr_noelle_angel_table_put);
    c_snd_play(snd_wing);
    c_imagespeed(0.2);
    c_lerp_var_instance(snacktray_marker, "y", snacktray_marker.y, snacktray_marker.y + 8, 6);
    c_wait_if(no_actor, "image_index", ">=", 3);
    c_imagespeed(0);
    c_var_instance(angel_marker, "x", 480);
    c_var_instance(angel_marker, "y", 587);
    c_var_instance(table_marker, "x", 468);
    c_var_instance(table_marker, "y", 551);
    c_var_instance(table_marker, "visible", true);
    c_sprite(spr_noelle_walk_down_lw);
    c_walkdirect_wait(452, no_actor.ystart + 20, 8);
    c_halt();
    c_wait(1);
    c_sel(no);
    c_sprite(spr_noelle_susie_angel_table_hold_start);
    c_setxy(468, 551);
    c_sel(su);
    c_visible(0);
    c_wait(6);
    c_var_instance(angel_marker, "visible", 0);
    c_var_instance(table_marker, "visible", 0);
    c_sel(no);
    c_imageindex(1);
    c_wait(6);
    c_sprite(spr_noelle_susie_angel_table_hold_loop);
    c_imagespeed(0);
    c_wait(4);
    c_var_instance(id, "angel_shake", true);
    c_speaker("susie");
    c_msgsetloc(0, "\\EC* Okay^1, what do we do? Throw it out?/", "obj_ch4_PDC13D_slash_Step_0_gml_227_0");
    c_facenext("noelle", "2");
    c_msgnextloc("\\E2* Umm..^1. let's think about it^1, first./", "obj_ch4_PDC13D_slash_Step_0_gml_229_0");
    c_msgnextloc("\\E3* If it's a mouse^1, it could be cute as a pet.../", "obj_ch4_PDC13D_slash_Step_0_gml_230_0");
    c_facenext("susie", 2);
    c_msgnextloc("\\E2* Heheh^1, alright. And if it's a severed hand.../", "obj_ch4_PDC13D_slash_Step_0_gml_232_0");
    c_msgnextloc("\\EQ* I'll keep it as MY pet./", "obj_ch4_PDC13D_slash_Step_0_gml_233_0");
    c_facenext("noelle", "S");
    c_msgnextloc("\\ES* Fahaha^1! Wait^1, let me raise it^1, too!/", "obj_ch4_PDC13D_slash_Step_0_gml_235_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* Heh^1, sure. We'll raise it together./%", "obj_ch4_PDC13D_slash_Step_0_gml_237_0");
    c_talk();
    c_wait_box(3);
    c_sprite(spr_noelle_susie_angel_table_hold_look);
    c_imagespeed(0);
    c_imageindex(3);
    c_wait_box(6);
    c_imageindex(5);
    c_wait_box(8);
    c_imageindex(3);
    c_wait_talk();
    c_var_instance(id, "angel_shake", false);
    c_snd_play(snd_suslaugh);
    c_var_instance(angel_shake_marker, "visible", 0);
    c_sel(no);
    c_sprite(spr_noelle_susie_angel_table_hold_laugh);
    c_imagespeed(0.2);
    c_wait(60);
    c_halt();
    c_wait(30);
    c_var_instance(angel_shake_marker, "visible", 1);
    c_var_instance(id, "angel_shake", true);
    c_sprite(spr_noelle_susie_angel_table_hold_look);
    c_halt();
    c_speaker("noelle");
    c_msgsetloc(0, "\\E4* It's..^1. funny. I was..^1. so nervous earlier./", "obj_ch4_PDC13D_slash_Step_0_gml_274_0");
    c_msgnextloc("\\E9* I've..^1. never actually hung out with you^1, y'know?/", "obj_ch4_PDC13D_slash_Step_0_gml_275_0");
    c_msgnextloc("\\E4* But so far^1, it just kind of feels like.../", "obj_ch4_PDC13D_slash_Step_0_gml_276_0");
    c_msgnextloc("\\E3* I don't even know why I was..^1. nervous?/", "obj_ch4_PDC13D_slash_Step_0_gml_277_0");
    c_msgnextloc("\\E6* It just feels like..^1. I already know you./", "obj_ch4_PDC13D_slash_Step_0_gml_278_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* Yeah^1, I.../", "obj_ch4_PDC13D_slash_Step_0_gml_280_0");
    c_msgnextloc("\\EN* I^1, uh^1, feel the same. It's..^1. pretty cool./", "obj_ch4_PDC13D_slash_Step_0_gml_281_0");
    c_msgnextloc("\\EL* I guess./", "obj_ch4_PDC13D_slash_Step_0_gml_282_0");
    c_facenext("noelle", 9);
    c_msgnextloc("\\E9* It's just strange. It feels like.../", "obj_ch4_PDC13D_slash_Step_0_gml_284_0");
    c_msgnextloc("\\E4* It feels like you're the same as in my dream./%", "obj_ch4_PDC13D_slash_Step_0_gml_285_0");
    c_talk();
    c_wait_box(1);
    c_sel(no);
    c_sprite(spr_noelle_susie_angel_table_hold_look);
    c_halt();
    c_wait_box(2);
    c_sel(no);
    c_imageindex(1);
    c_wait_box(3);
    c_sel(no);
    c_imageindex(2);
    c_wait_box(4);
    c_sel(no);
    c_imageindex(0);
    c_wait_box(8);
    c_sel(no);
    c_imageindex(4);
    c_wait_talk();
    c_wait(60);
    c_sel(no);
    c_imageindex(6);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Uhh^1, what was^1, your dream about me^1, like?/", "obj_ch4_PDC13D_slash_Step_0_gml_318_0");
    c_facenext("noelle", 23);
    c_msgnextloc("\\EN* H-huh? Oh^1, I^1, uh..^1. um.../%", "obj_ch4_PDC13D_slash_Step_0_gml_320_0");
    c_talk();
    c_wait_box(2);
    c_wait_talk();
    c_var_instance(angel_shake_marker, "visible", 0);
    c_var_instance(id, "angel_shake", false);
    c_snd_play(snd_noise);
    c_sel(no);
    c_sprite(spr_susie_angel_table_hold_noelle_leave);
    c_halt();
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_angel_table_hold);
    c_imageindex(0);
    c_setxy(468, 551);
    c_visible(1);
    c_wait(1);
    c_sel(no);
    c_autodepth(0);
    c_autowalk(0);
    c_depth(94000);
    c_sprite(spr_noelle_walk_down_blush);
    c_setxy(450, no_actor.ystart + 20);
    c_wait(4);
    c_imagespeed(0.2);
    c_walkdirect(446, no_actor.ystart, 12);
    c_delaycmd(13, "imagespeed", 0);
    c_delaycmd(13, "imageindex", 0);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EL* I mean^1, uh^1, I think I have to.../%", "obj_ch4_PDC13D_slash_Step_0_gml_360_0");
    c_talk();
    c_wait(12);
    c_wait_talk();
    c_sel(no);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sprite(spr_noelle_walk_left_blush);
    c_walkdirect(365, no_actor.ystart, 15);
    c_delaycmd(16, "sprite", spr_noelle_walk_up_lw);
    c_delaywalkdirect(16, 365, no_actor.ystart - 40, 10);
    c_delaycmd(27, "sprite", spr_noelle_walk_left_blush);
    c_delaywalkdirect(27, 270, no_actor.ystart - 40, 10);
    c_speaker("noelle");
    c_msgsetloc(0, "\\EM* I have to go find^1, um^1, my old hamster cage.../%", "obj_ch4_PDC13D_slash_Step_0_gml_379_0");
    c_talk();
    c_wait(38);
    c_wait_talk();
    c_snd_play(snd_noise);
    c_sel(su);
    c_autowalk(0);
    c_imageindex(2);
    c_wait(4);
    c_autodepth(0);
    c_depth(94000);
    c_var_instance(angel_marker, "visible", 1);
    c_var_instance(table_marker, "visible", 1);
    c_sprite(spr_susie_walk_down_lw);
    c_setxy(487, su_actor.ystart + 20);
    c_wait(4);
    c_imagespeed(0.2);
    c_walkdirect(485, su_actor.ystart, 12);
    c_delayfacing(13, "l");
    c_delaycmd(13, "imagespeed", 0);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Hey^1, WAIT^1, I wanna hear about your dream!/%", "obj_ch4_PDC13D_slash_Step_0_gml_406_0");
    c_talk();
    c_wait(12);
    c_wait_talk();
    c_sel(su);
    c_autowalk(1);
    c_walkdirect_wait(439, su_actor.ystart, 16);
    c_wait(30);
    c_sprite(spr_susie_point_side);
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Don't move a goddamn INCH./%", "obj_ch4_PDC13D_slash_Step_0_gml_421_0");
    c_talk_wait();
    c_sel(su);
    c_walkdirect_wait(360, su_actor.ystart, 20);
    c_walkdirect_wait(360, su_actor.ystart - 40, 15);
    c_walkdirect_wait(270, su_actor.ystart - 40, 20);
    c_var_instance(568, "visible", 1);
    c_var_instance(angel_marker, "visible", 0);
    c_mus2("volume", 0, 30);
    c_pannable(1);
    c_pan(327, 479, 20);
    c_wait(30);
    c_pannable(0);
    c_waitcustom();
}
if (con == 10 && customcon == 1 && !d_ex())
{
    con = 99;
    with (obj_cutscene_master)
        instance_destroy();
    with (obj_actor)
        instance_destroy();
    with (shock_sprite)
        instance_destroy();
    global.interact = 0;
    global.plot = 66;
    angel_fall = true;
    snd_free_all();
    with (overlay)
    {
        set_heart_target(568);
        set_angel_mode();
        radius_offset = 0;
    }
    with (obj_mainchara)
    {
        x = -100;
        y = -100;
        cutscene = 1;
        freeze = 1;
        visible = 0;
    }
    with (obj_homealone_heart)
    {
        cutscene = 0;
        visible = 1;
    }
}
if (noelle_shock)
{
    shock_anim_timer--;
    if (shock_anim_timer <= 0)
    {
        shock_anim_index++;
        if (shock_anim_index < array_length(shock_sprite_timestamps))
        {
            shock_anim_timer = shock_sprite_timestamps[shock_anim_index] / shock_anim_modifier;
            shock_sprite.image_index = shock_anim_index;
            if (shock_anim_index == 2)
                snd_play(snd_bump);
            if (shock_anim_index == 3)
                snd_play(snd_noelle_scared);
        }
        else
        {
            noelle_shock = false;
        }
    }
}
if (angel_fall)
{
    if (angel_fall_timer == 0 && obj_homealone_heart.x >= 440 && obj_homealone_heart.x < 514)
        exit;
    angel_fall_timer++;
    if (angel_fall_timer == 1)
    {
        global.interact = 1;
        obj_homealone_heart.cutscene = 1;
        obj_homealone_heart.visible = 0;
        angel_fall_direction = (obj_homealone_heart.x < 440) ? "left" : "right";
        global.tempflag[92] = angel_fall_direction == "right";
        angel_marker.x = obj_homealone_heart.x + 2;
        angel_marker.y = obj_homealone_heart.y + 1;
        angel_marker.visible = 1;
        snd_play(snd_wing);
        var fall_angle = (angel_fall_direction == "left") ? 180 : -180;
        var x_speed = (angel_fall_direction == "left") ? -1.6 : 2.2;
        with (angel_marker)
        {
            hspeed = x_speed;
            gravity = 0.6;
            scr_lerpvar("image_angle", 0, fall_angle, 8, 3, "out");
        }
    }
    if (angel_fall_timer == 9)
    {
        snd_play(snd_bump);
        with (angel_marker)
        {
            friction = 1;
            vspeed = 0;
            gravity = 0;
        }
    }
    if (angel_fall_timer == 60)
    {
        heart_marker.x = angel_marker.x - 4;
        heart_marker.y = angel_marker.y - 1;
        with (heart_marker)
            scr_lerpvar("y", y, y - 20, 30, 3, "out");
        var pan_x = (angel_fall_direction == "left") ? 274 : 380;
        scr_pan_lerp(pan_x, 480, 30);
    }
    if (angel_fall_timer >= 2)
    {
        if (angel_fall_timer < 60)
        {
            obj_homealone_heart.x = angel_marker.x - 4;
            obj_homealone_heart.y = angel_marker.y - 1;
        }
        else
        {
            obj_homealone_heart.x = heart_marker.x;
            obj_homealone_heart.y = heart_marker.y;
        }
    }
    if (angel_fall_timer == 91)
    {
        angel_fall = false;
        angel_fall_timer = 0;
        obj_homealone_heart.angel_mode = false;
        obj_homealone_heart.x = heart_marker.x;
        obj_homealone_heart.y = heart_marker.y;
        obj_homealone_heart.image_angle = 0;
        obj_homealone_heart.visible = 1;
        heart_marker.visible = 0;
        obj_homealone_heart.cutscene = 0;
        global.interact = 0;
        with (overlay)
            radius_offset = 0.5;
    }
}
if (angel_shake)
{
    angel_shake_timer--;
    if (angel_shake_timer > 0)
        exit;
    if (down_p() || up_p() || left_p() || right_p())
    {
        snd_play_x(snd_bump, 0.6, 1.1);
        angel_shake_timer = 4;
        angel_shake_marker.x = no_actor.x;
        angel_shake_marker.y = no_actor.y;
        angel_shake_marker.depth = no_actor.depth - 1;
        with (angel_shake_marker)
        {
            image_index = 1;
            scr_delay_var("image_index", 0, 2);
        }
    }
}
