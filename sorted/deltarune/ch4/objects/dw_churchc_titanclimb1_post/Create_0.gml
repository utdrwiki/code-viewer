con = 0;
customcon = 0;
timer = 0;
init = 0;
siner = 0;
if (scr_debug())
{
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("titan_tower.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    if (keyboard_check(ord("P")))
    {
    }
}
scr_setparty(1, 1, 0);
overlay_controller = instance_create(0, 0, obj_titan_climb_overlay);
darkness_controller = instance_create(0, 0, obj_titan_climb_darkness_controller);
spawn_controller = instance_create(40, 480, obj_titan_climb_spawn_controller);
titan_hand = instance_create(0, 0, obj_titan_climb_hand);
tower_vfx = instance_create(0, 0, obj_titan_climb_tower);
with (tower_vfx)
    depth = 1000200;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 110;
blackall.image_blend = c_black;
blackall.visible = 1;
sparkle_marker = -4;
sparkle_readable = -4;
wall_cover = scr_dark_marker(0, 0, spr_blank_tile_black);
wall_cover.depth = 999990;
wall_cover.image_xscale = 0;
wall_cover.image_yscale = 200;
floor_cover = scr_dark_marker(1280, 240, spr_blank_tile_black);
floor_cover.depth = 999990;
floor_cover.image_xscale = 0;
floor_cover.image_yscale = 2;
if (global.tempflag[97] == 1)
{
    con = 15;
    blackall.image_blend = c_white;
    overlay_controller.overlay_alpha = 1;
}

create_sparkle = function()
{
    if (sparkle_marker != -4)
        exit;
    sparkle_marker = scr_dark_marker(3156, 270, spr_shine);
    with (sparkle_marker)
    {
        scr_depth();
        image_speed = 0.1;
    }
    sparkle_readable = instance_create(sparkle_marker.x - 4, sparkle_marker.y - 12, obj_readable_room1);
    with (sparkle_readable)
        extflag = "sparkle";
};

create_spawn = function()
{
    with (spawn_controller)
        create_spawn();
};

hide_spawn = function()
{
    with (spawn_controller)
        hide_spawn();
    with (darkness_controller)
        fade_out();
};

remove_sparkle = function()
{
    with (sparkle_marker)
        instance_destroy();
    with (sparkle_readable)
        instance_destroy();
    sparkle_marker = -4;
};

regain_control = function()
{
    global.interact = 0;
    global.facing = 0;
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    obj_mainchara.x = kr_x;
    obj_mainchara.y = kr_y;
    obj_mainchara.visible = 1;
    obj_mainchara.cutscene = 0;
    var su_x = su_actor.x;
    var su_y = su_actor.y;
    var ra_x = ra_actor.x;
    var ra_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = su_x;
            y = su_y;
        }
        else if (name == "ralsei")
        {
            x = ra_x;
            y = ra_y;
        }
        scr_caterpillar_interpolate();
        visible = 1;
    }
    with (obj_actor)
        visible = 0;
    overlay_controller.target = 1049;
};

lose_control = function()
{
    global.interact = 1;
    kr_actor.x = obj_mainchara.x;
    kr_actor.y = obj_mainchara.y;
    kr_actor.sprite_index = obj_mainchara.sprite_index;
    var su_x = 0;
    var su_y = 0;
    var su_sprite = -4;
    var ra_x = 0;
    var ra_y = 0;
    var ra_sprite = -4;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            su_x = x;
            su_y = y;
            su_sprite = sprite_index;
        }
        else if (name == "ralsei")
        {
            ra_x = x;
            ra_y = y;
            ra_sprite = sprite_index;
        }
    }
    su_actor.x = su_x;
    su_actor.y = su_y;
    su_actor.sprite_index = su_sprite;
    ra_actor.x = ra_x;
    ra_actor.y = ra_y;
    ra_actor.sprite_index = ra_sprite;
    with (obj_actor)
        visible = 1;
    with (obj_caterpillarchara)
        visible = 0;
    with (obj_mainchara)
        visible = 0;
    overlay_controller.target = kr_actor;
};
