if (obj_chefs_game.gameover)
    exit;
if (firewait || stun)
    exit;
if (other.y >= y && !other.caught && !other.on_fire && !other.thrown)
{
    audio_stop_sound(snd_bump);
    snd_play(snd_bump);
    with (other)
    {
        if (x < other.x)
            hspeed = -14;
        else
            hspeed = 14;
    }
    exit;
}
if (!other.caught)
{
    add_to_stack(other);
    exit;
}
