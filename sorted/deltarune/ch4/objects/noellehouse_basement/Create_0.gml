blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = -100;
blackall.image_blend = c_black;
blackall.image_alpha = 0;
vent_cover = scr_marker(497, 54, spr_noellehouse_vent_open_cover_basement);
vent_cover.depth = 4999;
vent_loader = instance_find(obj_homealone_vent_hidden, 0);
vent_block_top = instance_create(vent_loader.x, vent_loader.y - 100, obj_homealone_solid);
vent_block_left = instance_create(472, 50, obj_homealone_solid);
with (vent_block_left)
{
    image_yscale = 0.85;
    image_xscale = 0.25;
}
vent_block_right = instance_create(495, 50, obj_homealone_solid);
with (vent_block_right)
{
    image_yscale = 0.85;
    image_xscale = 0.25;
}
vent_block = instance_create(470, 20, obj_homealone_solid);
with (vent_block)
    image_yscale = 1.5;
breaker_marker = scr_marker(142, 54, spr_noellehouse_basement_breaker);
with (breaker_marker)
    scr_depth();
present_block = instance_create(107, 87, obj_solidblockLight);
with (present_block)
{
    image_yscale = 0.85;
    image_xscale = 0.25;
}
present_block = instance_create(194, 87, obj_solidblockLight);
with (present_block)
{
    image_yscale = 0.85;
    image_xscale = 0.25;
}
present_pushable = instance_create(140, 55, obj_homealone_present);
present_pushable.sprite_index = spr_noellehouse_present_tall_yellow;
present_pushable.depth = breaker_marker.depth - 10;
breaker_wait = false;
breaker_wait_timer = 0;
breaker_open = false;
breaker_open_timer = 0;
convo_controller = instance_create(0, 0, obj_homealone_basement_convo);
convo_timer = 0;
convo_active = false;
drop_vent = false;
drop_vent_blocked = false;
init = false;
init_heart = false;
camera_pan = true;
camera_pan_timer = 0;
camera_pan_active = false;
camera_pan_buffer = 0;
camera_x_pos = 320;
camera_x_pos_left = 0;
camera_x_pos_right = 320;
camera_x_target = camera_x_pos;
tree_fall = false;
tree_marker = scr_marker(211, 62, spr_noellehouse_basement_tree);
with (tree_marker)
    depth = 7000;
tree_sprite_timestamps = [330, 330, 200, 150, 150, 150, 150, 150, 1000];
tree_sprite_modifier = 60;
tree_sprite_index = 0;
tree_sprite_timer = 0;
tree_heart_stop = false;
angel_marker = scr_marker(311, 59, spr_noellehouse_basement_angel);
angel_marker.depth = tree_marker.depth - 1;
angel_fall = false;
angel_fall_timer = 0;
heart_fall = false;
heart_fall_marker = scr_marker(290, 90, spr_heartsmall);
heart_fall_marker.depth = tree_marker.depth + 10;
heart_fall_timer = 0;
var foreground = scr_marker(0, 0, fg_noellehouse_basement);
foreground.depth = 6000;
var couch_marker = scr_marker(84, -40, spr_noellehouse_main_couch_big);
with (couch_marker)
    scr_depth();
susie_marker = scr_marker(couch_marker.x + 44, couch_marker.y + 10, spr_susie_sit_normal);
susie_marker.depth = couch_marker.depth - 10;
susie_interactable = -4;
susie_surprise = false;
susie_surprise_timer = 0;
susie_surprise_timestamps = [200, 60, 60, 100, 660, 100, 100, 50, 60, 660];
susie_surprise_index = 0;
susie_face_right = false;
noelle_marker = scr_marker(couch_marker.x + 76, couch_marker.y + 6, spr_noelle_sit_awkward);
noelle_marker.depth = couch_marker.depth - 10;
noelle_interactable = -4;
noelle_surprise = false;
noelle_surprise_trigger = false;
noelle_surprise_timer = 0;
noelle_surprise_timestamps = [500, 100, 50, 50, 50, 50, 50, 50, 50, 50, 100, 100, 500];
noelle_surprise_index = 0;
noelle_face_left = false;
progress_scene = false;
progress_scene_timer = 0;
noelle_flashlight_torch = scr_marker(0, 0, spr_flashlight);
noelle_flashlight_torch.visible = 0;
noelle_flashlight = scr_marker(0, 0, spr_flashlight_beam_wall_1);
noelle_flashlight.image_alpha = 0;
susie_flashlight_torch = scr_marker(0, 0, spr_flashlight);
susie_flashlight_torch.visible = 0;
susie_flashlight = scr_marker(0, 0, spr_flashlight_beam_wall_1);
susie_flashlight.image_alpha = 0;
heart_catch_scene = false;
heart_catch_con = 0;
customcon = 0;
overlay = instance_create(0, 0, obj_noellehouse_basement_overlay);
overlay.depth = 7100;
overlay.tree_target = tree_marker;
overlay.angel_target = angel_marker;
with (overlay)
    set_alpha(0);
flicker_lights = false;
flicker_lights_count = 0;
flicker_lights_timer = 0;
flicker_lights_time = 10;
boombox = instance_find(obj_homealone_basement_boombox, 0);
santa = instance_create(530, 130, obj_homealone_dancing_santa_mini);
made_noise = false;
lost_power = false;
leave_couch = false;
leave_couch_timer = 0;
basement_scene = false;
basement_timer = 0;
move_wait = false;
move_count = 0;
leave_basement = false;
susie_alone = false;
susie_alone_timer = 0;
susie_alone_anim = false;
susie_alone_anim_timer = 0;
susie_alone_marker = -4;
heart_vent_check = false;
heart_vent_cover = -4;

start_bgm = function()
{
    mus_volume(global.currentsong[1], 0, 30);
    snd_stop(snd_smile);
    basement_bgm = snd_loop(snd_smile);
    snd_volume(basement_bgm, 0.4, 0);
    snd_pitch(basement_bgm, 0.15);
};

stop_bgm = function()
{
    snd_stop(snd_smile);
};

lose_control = function()
{
    global.interact = 1;
};

regain_control = function()
{
    global.interact = 0;
};

watch_movie = function()
{
    with (susie_marker)
        scr_lerpvar("x", x, xstart + 6, 8, 2, "out");
    with (noelle_marker)
        scr_lerpvar("x", x, xstart - 6, 8, 2, "out");
};

make_noise = function()
{
    if (made_noise)
        exit;
    made_noise = true;
    mus_volume(global.currentsong[1], 0, 14);
    with (convo_controller)
        make_noise();
};

open_breaker = function()
{
    breaker_open = true;
};

lose_power = function()
{
    if (lost_power)
        exit;
    lost_power = true;
    snd_play(snd_noise);
    snd_play_x(snd_swing, 1, 1.2);
    snd_stop(snd_smile);
    mus_volume(global.currentsong[1], 0, 1);
    lose_control();
    with (boombox)
        disable();
    with (santa)
    {
        alarm[10] = 1;
        is_active = false;
    }
    flicker_lights = true;
    leave_couch = true;
    with (convo_controller)
        lose_power();
};

enable_tree_fall = function()
{
    regain_control();
    with (overlay)
        heart_glow_show();
    camera_pan = false;
    tree_fall = true;
};

start_basement_scene = function()
{
    lose_control();
    with (convo_controller)
        change_convo_index(4);
    scr_delay_var("basement_scene", true, 60);
};

freak_out = function(arg0)
{
    lose_control();
    with (convo_controller)
        interrupt_convo();
    if (arg0 == "noelle")
    {
        noelle_surprise = true;
        noelle_surprise_timer = 0;
    }
    else
    {
        susie_surprise = true;
        susie_surprise_timer = 0;
        susie_marker.sprite_index = spr_susie_flashlight_surprise;
        susie_marker.image_index = 0;
        susie_marker.image_speed = 0;
    }
    susie_marker.visible = 1;
    with (susie_interactable)
        instance_destroy();
    noelle_marker.visible = 1;
    with (noelle_interactable)
        instance_destroy();
};
