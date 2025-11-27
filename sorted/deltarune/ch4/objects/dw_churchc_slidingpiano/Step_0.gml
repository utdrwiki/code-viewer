scr_populatechars();
if (!init)
{
    obj_cloud_controller_new.harmless = 1;
    obj_cloud_controller_new.miny = 5240;
    obj_cloud_controller_new.minspeed = 0;
    obj_cloud_controller_new.maxspeed = 0;
    obj_cloud_controller_new.cloud_angle = 1;
    obj_cloud_controller_new.rotatespeed = 0;
    init = 1;
    if (global.tempflag[90] == 1)
    {
        global.tempflag[90] = 0;
        con = 2;
        blackout = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, -5);
        with (blackout)
        {
            var fadetime = 30;
            scr_lerpvar("image_alpha", 1.5, 0, fadetime);
            scr_doom(id, fadetime);
        }
    }
    if (obj_mainchara.y > 6000)
    {
        obj_cloud_controller_new.y += -780;
        with (obj_cloud_render_new)
        {
            xoffset = 800;
            distance_from_kris -= 880;
        }
    }
    else
    {
        obj_cloud_controller_new.y = 5240;
        obj_cloud_controller_new.active = 1;
        obj_mainchara.cutscene = 1;
        camerax_set(0);
        cameray_set(4840);
        with (obj_cloud_render_new)
        {
            followcamera = true;
            xoffset = 0;
            distance_from_kris = 200;
        }
    }
}
if (!obj_cloud_controller_new.active)
{
    with (obj_cloud_render_new)
    {
        if (obj_mainchara.y < 8440)
            xoffset = 800;
        else
            xoffset = -9999;
    }
}
if (obj_mainchara.x >= 900 && obj_cloud_controller_new.minspeed == 0)
{
    obj_cloud_controller_new.minspeed = -0.2;
    obj_cloud_controller_new.maxspeed = -1.5;
    obj_cloud_controller_new.active = 1;
    with (obj_cloud_render_new)
    {
        followcamera = true;
        if (!front)
        {
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        obj_mainchara.cutscene = 1;
        scr_fadeout(15);
    }
    if (timer == 20)
    {
        global.tempflag[90] = 1;
        room_restart();
    }
}
if (con == 2)
{
    susie.x = obj_mainchara.x - 20;
    susie.y = obj_mainchara.y - 60;
    ralsei.x = obj_mainchara.x + 10;
    ralsei.y = obj_mainchara.y - 100;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_fadeout(0);
    c_sel(kr);
    c_facing("d");
    c_sprite(spr_kris_injured);
    c_sel(ra);
    c_facing("d");
    c_sprite(spr_ralsei_kneel_serious);
    c_sel(su);
    c_facing("d");
    c_sprite(spr_susie_dw_landed);
    c_wait(25);
    c_fadein(30);
    c_wait(30);
    c_wait(5);
    c_sel(kr);
    c_snd_play(snd_noise);
    c_sprite(spr_krisd_dark);
    c_shakeobj();
    c_wait(25);
    c_sel(ra);
    c_sprite(spr_ralseid);
    c_sel(su);
    c_sprite(spr_susied);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
    con = 3;
}
if (con == 3)
{
    if (!instance_exists(obj_cutscene_master))
    {
        global.facing = 0;
        global.interact = 0;
        obj_mainchara.cutscene = 0;
        obj_mainchara.freeze = false;
        scr_caterpillar_interpolate("all");
        con = 0;
    }
}
