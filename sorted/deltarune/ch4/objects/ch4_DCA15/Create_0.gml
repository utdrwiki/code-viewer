con = -1;
customcon = 0;
if (scr_debug())
    audio_stop_sound(snd_deep_noise);
if (global.plot >= 220 && global.plot < 225)
{
    var door_readable = instance_create(0, 0, obj_readable_room1);
    with (door_readable)
        extflag = "church_door_listen";
    anim_sprite[0][0] = 4430;
    anim_sprite[0][1] = [500, 330, 330, 330, 330, 200, 100, 50, 100, 50, 50, 100, 500];
    anim_sprite[1][0] = 4070;
    anim_sprite[1][1] = [100, 100, 200, 1000];
    anim_sprite[2][0] = 2868;
    anim_sprite[2][1] = [100, 100, 100, 100, 50, 200, 100];
    anim_sprite[3][0] = 3379;
    anim_sprite[3][1] = [200, 200, 200, 1000];
    anim_sprite_index = 0;
    anim_modifier = 30;
    anim_index = 0;
    anim_timer = 0;
    anim_init = false;
    anim_marker = scr_marker(-100, -100, anim_sprite[0][0]);
    with (anim_marker)
        scr_depth();
    animate_start = false;
    animate_pause = false;
    fountain_make = instance_create(305, 95, obj_make_fountain);
    fountain_make_start = false;
    fountain_make_timer = 0;
    target_flash_active = false;
    blazetimer = 0;
    anim = -4;
    white_bg = scr_marker(0, 0, spr_church_lobby_white);
    white_bg.depth = anim_marker.depth + 10;
    with (white_bg)
        image_alpha = 0;
    kris_glow_overlay = scr_marker(368, 100, spr_kris_diagonal_glow_overlay);
    kris_glow_overlay.depth = 98500;
    with (kris_glow_overlay)
        image_alpha = 0;
    sparkle_marker = scr_marker(317, 90, spr_shine);
    with (sparkle_marker)
    {
        scr_depth();
        image_speed = 0.1;
    }
    sparkle_readable = instance_create(sparkle_marker.x - 8, sparkle_marker.y - 10, obj_readable_room1);
    with (sparkle_readable)
        extflag = "church_door_listen";
}
else
{
    instance_destroy();
}

answer_choice = function(arg0)
{
    if (arg0 == 0)
        con = 0;
};
