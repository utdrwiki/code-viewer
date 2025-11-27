obj_chefs_game.scorepoints += 1;
with (instance_create(x, y, obj_chefs_vfx))
{
    depth = other.depth - 1;
    speed = choose(2, 3, 4);
    direction = irandom(360);
    sprite_index = spr_vfx_twinkle;
    image_index = 0;
    image_xscale = choose(-2, 2);
    die_animend = true;
    audio_stop_sound(sfx_coin_chefs);
    snd_play(sfx_coin_chefs);
}
