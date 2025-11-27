with (instance_create_depth(x + 72, y + 20, depth - 1, obj_regularbullet))
{
    active = false;
    sprite_index = spr_lens_flash;
    image_speed = 0.5;
    damage = other.damage;
    scr_script_delayed(instance_destroy, 16);
    var flash = snd_play(snd_spell_cure_slight_smaller);
    audio_sound_pitch(flash, 1.25);
}
