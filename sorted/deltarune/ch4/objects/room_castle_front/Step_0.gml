if (shutta_pose)
{
    shutta_pose = false;
    shutta_posing = true;
    with (shutta_marker)
    {
        sprite_index = spr_shutta_pose;
        image_index = 0;
        image_speed = 0;
        scr_lerpvar("image_index", 0, 15, 20);
    }
}
if (shutta_pose_return)
{
    shutta_pose_return = false;
    with (shutta_marker)
    {
        sprite_index = spr_shutta_pose_return;
        image_index = 0;
        image_speed = 0;
        scr_lerpvar("image_index", 0, 4, 12);
        scr_delay_var("sprite_index", 2569, 13);
        scr_delay_var("image_speed", 0.2, 13);
    }
    scr_delay_var("shutta_posing", false, 13);
}
if (critter_photo)
{
    critter_timer++;
    if (critter_timer == 1)
    {
        shutta_pose = true;
        critter_reset();
    }
    if (critter_timer == 8)
        critter_pose();
    if (critter_timer == 38)
    {
        shutta_pose_return = true;
        critter_reset();
    }
    if (critter_timer >= 120)
    {
        if (con < 0)
            critter_timer = 0;
    }
}
if (con < 0)
    exit;
if (con == 0 && !shutta_posing && !d_ex())
{
    con = 1;
    critter_photo = false;
    critter_timer = 0;
    critter_reset();
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 11;
    alarm[0] = 30;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    global.facing = 0;
    var kr_x_pos = 504;
    var kr_y_pos = 400;
    var kr_walktime = round(point_distance(kr_actor.x, kr_actor.y, kr_x_pos, kr_y_pos) / 6);
    c_sel(kr);
    c_walkdirect(kr_x_pos, kr_y_pos, kr_walktime);
    c_delayfacing(kr_walktime + 1, "d");
    var su_x_pos = 450;
    var su_y_pos = 367;
    var su_walktime = round(point_distance(su_actor.x, su_actor.y, su_x_pos, su_y_pos) / 6);
    c_sel(su);
    c_walkdirect(su_x_pos, su_y_pos, su_walktime);
    c_delayfacing(su_walktime + 1, "d");
    var ra_x_pos = 547;
    var ra_y_pos = 371;
    var ra_walktime = round(point_distance(ra_actor.x, ra_actor.y, ra_x_pos, ra_y_pos) / 6);
    c_sel(ra);
    c_walkdirect(ra_x_pos, ra_y_pos, ra_walktime);
    c_delayfacing(ra_walktime + 1, "d");
    c_pannable(1);
    c_pan(201, 160, 30);
    c_wait(45);
    c_sel(kr);
    c_sprite(spr_kris_pose);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_sel(ra);
    c_sprite(spr_ralsei_pose);
    c_waitcustom();
}
if (con == 12 && customcon == 1)
{
    con = 13;
    alarm[0] = 15;
    shutta_pose = true;
    critter_pose();
}
if (con == 14 && customcon == 1)
{
    con = 15;
    alarm[0] = 30;
    var flash_background = scr_marker(0, 0, spr_pixel_white);
    with (flash_background)
    {
        image_xscale = 999;
        image_yscale = 999;
        image_alpha = 0;
        scr_lerpvar("image_alpha", 0, 1, 3);
        scr_script_delayed(scr_lerpvar, 6, "image_alpha", 1, 0, 6);
    }
    scr_doom(flash_background, 7);
    snd_play_volume(snd_camera_flash, 0.8);
}
if (con == 16 && customcon == 1)
{
    con = 17;
    customcon = 0;
    shutta_pose_return = true;
    critter_reset();
    c_waitcustom_end();
    c_sel(su);
    c_facing("d");
    c_sel(ra);
    c_facing("d");
    c_sel(kr);
    c_facing("d");
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 17 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    critter_timer = 38;
    con = -1;
}
