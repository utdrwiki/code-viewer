if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 1;
}
if (con == 2)
{
    con = 10;
    cutscene_master = scr_cutscene_make();
    te = 1;
    te_actor = instance_create(camerax() + view_wport[0] + 200, cameray() + 420, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.sprite_index = spr_tenna_jumpscare;
    te_actor.preset = 0;
    te_actor.golden_mode = true;
    c_var_instance(te_actor, "image_xscale", 0);
    c_var_instance(te_actor, "image_yscale", 0);
    c_sel(te);
    c_setxy(camerax() + 320, cameray() + 190);
    c_wait(60);
    c_var_instance(id, "bgm_start", true);
    c_wait(120);
    c_sel(te);
    c_imagespeed(0.8);
    c_var_lerp_to_instance(te_actor, "image_xscale", 0.04, 15);
    c_var_lerp_to_instance(te_actor, "image_yscale", 0.04, 15);
    c_wait(60);
    c_var_lerp_to_instance(te_actor, "image_xscale", 0.08, 15);
    c_var_lerp_to_instance(te_actor, "image_yscale", 0.08, 15);
    c_wait(30);
    c_var_lerp_to_instance(te_actor, "image_xscale", 0.24, 180);
    c_var_lerp_to_instance(te_actor, "image_yscale", 0.24, 180);
    c_wait(180);
    c_var_lerp_to_instance(te_actor, "image_speed", 0.1, 45, 1, "out");
    c_var_lerp_to_instance(te_actor, "image_xscale", 40, 120, 1, "out");
    c_var_lerp_to_instance(te_actor, "image_yscale", 40, 120, 1, "out");
    c_var_lerp_to_instance(te_actor, "y", 3680, 120, 1, "out");
    c_wait(45);
    c_waitcustom();
}
if (bgm_start)
{
    bgm_start = false;
    bgm[1] = mus_loop_ext(bgm[0], 1, 1);
}
if (con == 10 && !d_ex() && customcon == 1)
{
    con = -1;
    snd_stop(bgm[1]);
    global.interact = 1;
    var blackscreen = scr_marker(0, 0, spr_blank_tile_black);
    blackscreen.depth = -999;
    blackscreen.image_xscale = 999;
    blackscreen.image_yscale = 999;
    var screen_wipe = instance_create(0, 0, obj_ch3_screen_wipe);
    screen_wipe.target_room = room_ch3_gameshowroom;
    screen_wipe.start = true;
}
