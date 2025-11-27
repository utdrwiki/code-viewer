if (global.plot >= 20 && global.plot < 30)
{
    if (leave_con == 0 && obj_mainchara.y >= 170)
        leave_con = 1;
}
if (leave_con == 1)
{
    leave_con++;
    global.interact = 1;
    obj_mainchara.y = 168;
    scr_speaker("susie");
    msgsetloc(0, "\\E2* (Alright^1, let's skip out!)/", "obj_ch4_PDC02_slash_Step_0_gml_20_0");
    msgnextloc("\\EK* (..^1. is what I would say if your mom didn't ask us...)/%", "obj_ch4_PDC02_slash_Step_0_gml_21_0");
    d_make();
}
if (leave_con == 2 && !d_ex())
{
    leave_con = 0;
    global.interact = 0;
    global.facing = 2;
}
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    to = actor_count + 1;
    to_actor = instance_create(308, 250, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = spr_toriel_walk_up_church;
    c_var_instance(actor_talker, "talking_actor", to_actor);
    c_wait(30);
    c_snd_play(snd_escaped);
    c_wait(90);
    scr_speaker("toriel");
    c_fefc(0, 0);
    msgsetloc(0, "* Alright^1, we're here!/%", "obj_ch4_PDC02_slash_Step_0_gml_67_0");
    c_talk_wait();
    c_mus2("initloop", "church_lw.ogg", 0);
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_krisu);
    c_setxy(310, 250);
    c_sel(su);
    c_sprite(spr_susie_walk_up_church);
    c_setxy(307, 280);
    c_sel(to);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(308, 89, 60);
    c_delaycmd(61, "sprite", spr_toriel_walk_left_church);
    c_delaywalkdirect(61, 273, 89, 30);
    c_delaycmd(92, "imagespeed", 0);
    c_delaycmd(92, "imageindex", 0);
    c_delaycmd(92, "sprite", spr_toriel_walk_right_church);
    c_wait(20);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect(310, 105, 60);
    c_delaycmd(61, "imagespeed", 0);
    c_delaycmd(61, "imageindex", 0);
    c_delaycmd(61, "sprite", spr_kris_walk_left_church);
    c_wait(10);
    c_sel(su);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_walkdirect_wait(307, 113, 60);
    c_sprite(spr_susie_walk_right_church);
    c_walkdirect_wait(335, 113, 20);
    c_sprite(spr_susie_walk_up_church);
    c_walkdirect_wait(335, 99, 10);
    c_sprite(spr_susie_walk_left_church);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(to);
    c_sprite(spr_toriel_talk_right_church);
    c_msgside("bottom");
    c_speaker("toriel");
    c_msgsetloc(0, "\\E1* Now^1, Kris^1, Susie. I have to prepare for choir now./", "obj_ch4_PDC02_slash_Step_0_gml_130_0");
    c_msgnextloc("\\E9* You two behave yourselves^1, all right?/", "obj_ch4_PDC02_slash_Step_0_gml_131_0");
    c_facenext("susie", "7");
    c_msgnextloc("\\E7* Yeah^1, of course. Don't have to tell me twice!/", "obj_ch4_PDC02_slash_Step_0_gml_133_0");
    c_facenext("toriel", 0);
    c_msgnextloc("\\E0* (Kris^1, show Susie where to sit down^1, alright?)/%", "obj_ch4_PDC02_slash_Step_0_gml_135_0");
    c_talk();
    c_wait_box(3);
    c_sel(su);
    c_sprite(spr_susie_walk_back_arm_church_left);
    c_wait_box(5);
    c_waittalk();
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_sel(to);
    c_sprite(spr_toriel_walk_left_church);
    c_imagespeed(0.2);
    c_walkdirect_wait(188, 89, 30);
    c_sprite(spr_toriel_walk_up_church);
    c_walkdirect(188, -10, 60);
    c_wait(8);
    c_soundplay(snd_dooropen);
    c_var_instance(door_cover, "visible", 1);
    c_wait(2);
    c_var_instance(id, "toriel_hide", 1);
    c_wait(5);
    c_sel(to);
    c_visible(0);
    c_wait(10);
    c_soundplay(snd_doorclose);
    c_var_instance(door_cover, "visible", 0);
    c_wait(20);
    c_sel(su);
    c_sprite(spr_susie_walk_up_church);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. Guess we gotta go through that big door./", "obj_ch4_PDC02_slash_Step_0_gml_195_0");
    c_msgnextloc("\\EL* ..^1. 'less you wanna look around first./%", "obj_ch4_PDC02_slash_Step_0_gml_196_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_walk_left_church);
    c_wait_talk();
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.plot = 20;
    with (obj_mainchara)
        cutscene = 0;
    with (door_cover)
        instance_destroy();
    with (actor_talker)
        instance_destroy();
    con = 99;
}
if (toriel_hide)
{
    toriel_shadow = clamp(toriel_shadow + 0.2, 0, 1);
    var shadow = toriel_shadow;
    with (to_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (toriel_shadow >= 1)
        toriel_hide = false;
}
