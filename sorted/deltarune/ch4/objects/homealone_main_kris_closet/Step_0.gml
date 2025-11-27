if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
}
if (con == 2)
{
    con = 3;
    global.facing = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    kris_overlay.set_target(kr_actor);
    c_sel(kr);
    c_setxy(547, 465);
    c_visible(0);
    c_var_instance(kris_overlay, "overlay_active", true);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 14);
    c_wait(30);
    c_sel(kr);
    c_autowalk(0);
    c_sprite(spr_krisd_soul);
    c_visible(1);
    c_soundplay(snd_dooropen);
    c_var_instance(door_marker, "image_index", 1);
    c_wait(5);
    c_soundplay(snd_doorclose);
    c_var_instance(door_marker, "image_index", 0);
    c_wait(60);
    c_imageindex(1);
    c_walkdirect_wait(547, 468, 15);
    c_soundplay(snd_wing);
    c_var_instance(kris_overlay, "overlay_active", false);
    c_var_instance(catcher_marker, "image_index", 1);
    c_imageindex(0);
    c_shakeobj();
    c_wait(2);
    c_var_instance(catcher_marker, "image_index", 2);
    c_wait(60);
    c_sprite(spr_noellehouse_main_kris_grab_net);
    c_animate(0, 4, 0.1);
    c_wait(40);
    c_soundplay(snd_noise);
    c_var_instance(net_marker, "visible", 1);
    c_var_instance(net_marker, "y", net_marker.y - 1);
    c_var_instance(catcher_marker, "sprite_index", spr_noellehouse_treat_catcher_broken);
    c_var_instance(catcher_marker, "image_index", 0);
    c_var_instance(catcher_marker, "x", 491);
    c_var_instance(catcher_marker, "y", 455);
    c_var_instance(net_marker, "depth", kr_actor.depth - 10);
    c_var_instance(id, "net_shake", true);
    c_wait(4);
    c_sel(kr);
    c_imageindex(6);
    c_var_instance(net_marker, "y", net_marker.y - 2);
    c_wait(60);
    c_sel(kr);
    c_imageindex(7);
    c_var_instance(net_marker, "y", net_marker.y);
    c_wait(10);
    c_imageindex(8);
    c_var_instance(net_marker, "y", net_marker.y + 1);
    c_wait(10);
    c_imageindex(9);
    c_var_instance(net_marker, "y", net_marker.y + 3);
    c_wait(10);
    c_imageindex(10);
    c_var_instance(net_marker, "y", net_marker.y + 10);
    c_wait(10);
    c_imageindex(11);
    c_var_instance(net_marker, "y", net_marker.y + 14);
    c_wait(60);
    c_imageindex(12);
    c_soundplay(snd_noise);
    c_var_instance(net_marker, "gravity", 1);
    c_var_instance(net_marker, "friction", 0.1);
    c_wait(6);
    c_soundplay(snd_bump);
    c_var_instance(net_marker, "gravity", 0);
    c_var_instance(net_marker, "vspeed", 0);
    c_var_instance(net_marker, "friction", 0);
    c_wait(60);
    c_sprite(spr_dkris_dl_soul_walk);
    c_addxy(-4, 4);
    c_imageindex(0);
    c_wait(30);
    c_sprite(spr_dkris_dl_soul_walk);
    c_imagespeed(0.2);
    c_walkdirect_wait(530, 470, 10);
    c_var_instance(catcher_marker, "depth", kr_actor.depth + 10);
    c_sel(kr);
    c_autodepth(0);
    c_depth(6000);
    c_sprite(spr_dkris_dl_soul_walk);
    c_imagespeed(0.2);
    c_walkdirect_wait(530, 477, 20);
    c_sprite(spr_dkris_dl_soul_walk);
    c_pannable(1);
    c_panspeed(-2, 0, 60);
    c_walkdirect_wait(365, 477, 60);
    c_sprite(spr_dkris_ur_soul_walk);
    c_halt();
    c_sel(kr);
    c_imagespeed(0.2);
    c_walk_wait("u", 1, 8);
    c_halt();
    c_wait(5);
    c_soundplay(snd_dooropen);
    c_var_instance(closet_marker, "image_index", 1);
    c_wait(15);
    c_imagespeed(0.25);
    c_walk("u", 1, 10);
    c_wait(4);
    c_var_instance(id, "kris_hide", true);
    c_wait(15);
    c_sel(kr);
    c_visible(0);
    c_soundplay(snd_doorclose);
    c_var_instance(closet_marker, "image_index", 0);
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 14);
    c_wait(14);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 3 && !i_ex(obj_cutscene_master))
{
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_lw_noellehouse_closet);
    con = 99;
}
if (kris_hide)
{
    kris_shadow = clamp(kris_shadow + 0.2, 0, 1);
    var shadow = kris_shadow;
    with (kr_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (kris_shadow >= 1)
        kris_hide = false;
}
if (net_shake)
{
    net_shake = false;
    with (net_marker)
        scr_minishakeobj();
    with (catcher_marker)
        scr_minishakeobj();
}
