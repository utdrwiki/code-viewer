if (playing)
{
    subtimer++;
    totaltimer++;
}
if (keyboard_check_pressed(vk_numpad7) || keyboard_check_pressed(vk_numpad8))
{
    snd_play(snd_punchmed, 1, ((count % 2) == 0) ? 1.2 : 0.8);
    if (!playing)
        playing = true;
    timestamps[count] = subtimer;
    count++;
    event_user(0);
    subtimer = 0;
    var _anim = instance_create_depth(camerax() + 320, cameray() + 240, depth - 10, obj_animation);
    _anim.depth = depth + 10;
    _anim.sprite_index = choose(spr_gerson_hit_fx1, spr_gerson_hit_fx2, spr_gerson_hit_fx3, spr_gerson_hit_fx4);
    _anim.image_speed = 0.5;
}
if (keyboard_check_pressed(vk_numpad9))
    playing = !playing;
if (keyboard_check_pressed(vk_delete))
{
    scr_debug_clear_persistent();
    playing = false;
    subtimer = 0;
    totaltimer = 0;
    timestamps = [];
    count = 0;
    event_user(0);
}
