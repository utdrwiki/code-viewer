event_inherited();
can_interact = true;
boombox_active = false;
music_track[0] = -4;
music_track[1] = -4;
basement_parent = instance_find(obj_noellehouse_basement, 0);

play_music = function()
{
    if (snd_is_playing(music_track[1]))
        exit;
    music_track[0] = snd_init("noelle_normal.ogg");
    music_track[1] = mus_loop_ext(music_track[0], 0.7, 1);
};

stop_music = function()
{
    if (!snd_is_playing(music_track[1]))
        exit;
    snd_free(music_track[0]);
};

show_note = function()
{
    if (!boombox_active)
        exit;
    var start_x = (x - 8) + irandom(10);
    var start_y = y - 16;
    var note_marker = scr_marker(start_x, start_y, spr_musical_notes_small);
    note_marker.depth = depth - 10;
    note_marker.image_alpha = 0;
    var note_speed = 1;
    scr_lerp_var_instance(note_marker, "image_alpha", 0, 1, 10 * note_speed);
    scr_lerp_var_instance(note_marker, "x", start_x, start_x + 20 + irandom(10), 30 * note_speed);
    scr_lerp_var_instance(note_marker, "y", start_y, start_y - (30 + irandom(10)), 30 * note_speed);
    with (note_marker)
        scr_script_delayed(scr_lerp_var_instance, 11 * note_speed, id, "image_alpha", 1, 0, 10 * note_speed);
    scr_doom(note_marker, 61 * note_speed);
    alarm[1] = 45;
};

disable = function()
{
    can_interact = false;
    boombox_active = false;
    stop_music();
};

trigger = function()
{
    if (boombox_active)
        exit;
    boombox_active = true;
    with (basement_parent)
        make_noise();
    snd_play(snd_noise);
    scr_lerpvar("image_yscale", 0.5, 1, 12, -2, "out");
    play_music();
    alarm[1] = 12;
    alarm[10] = 1;
};
