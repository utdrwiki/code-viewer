if (init == 0)
{
    if (tenna == -1)
        tenna = instance_find(obj_actor_tenna, 0);
    truetext = string_hash_to_newline(text);
    if (clear)
    {
        with (object_index)
        {
            if (id != other.id)
                instance_destroy();
        }
    }
    if (lifetime == -1)
        lifetime = string_length(text) * 4;
    if (i_ex(tenna))
        tennaDist = distance_to_point(tenna.x, tenna.y - (sprite_get_height(tenna.sprite_index) * tenna.image_yscale * 0.55));
    if (speaker != -1)
    {
        if (speaker == "none" || speaker == "")
            talksnd = 14;
        if (speaker == "ralsei" || speaker == "Ralsei" || speaker == "ra" || speaker == "r")
        {
            dropColor = hexcolor(#6FD213);
            talksnd = 131;
        }
        if (speaker == "susie" || speaker == "Susie" || speaker == "su" || speaker == "s")
        {
            dropColor = hexcolor(#740C83);
            talksnd = 128;
        }
        if (speaker == "tenna" || speaker == "Tenna" || speaker == "te" || speaker == "t")
        {
            specialtalk = "tenna";
            dropColor = 65535;
            talksnd = 128;
        }
        if (speaker == "lancer" || speaker == "Lancer" || speaker == "la" || speaker == "l")
        {
            dropColor = 12420437;
            talksnd = 134;
        }
    }
    else
    {
        speaker = "tenna";
        specialtalk = "tenna";
        dropColor = 65535;
        talksnd = 128;
        talkrate = 3;
        talkcount = 5;
    }
    if (talk == true)
    {
        if (specialtalk == "none")
        {
            for (var i = 0; i < talkcount; i++)
                snd_play_delay(talksnd, talkdelay + (i * talkrate), 1, 1 + (i * pitchmod));
        }
        if (specialtalk == "tenna")
        {
            for (var i = 0; i < talkcount; i++)
            {
                audio_stop_sound(snd_tv_voice_short);
                audio_stop_sound(snd_tv_voice_short_2);
                audio_stop_sound(snd_tv_voice_short_3);
                audio_stop_sound(snd_tv_voice_short_4);
                audio_stop_sound(snd_tv_voice_short_5);
                audio_stop_sound(snd_tv_voice_short_6);
                audio_stop_sound(snd_tv_voice_short_7);
                audio_stop_sound(snd_tv_voice_short_8);
                audio_stop_sound(snd_tv_voice_short_9);
                var pitchrandom = 0.86 + random(0.35);
                var soundindex = "snd_tv_voice_short";
                var rand = irandom(8) + 1;
                if (rand >= 2)
                    soundindex += ("_" + string(rand));
                soundindex = asset_get_index(soundindex);
                snd_play_delay(soundindex, talkdelay + (i * talkrate), 0.7, pitchrandom);
            }
        }
    }
    init = 1;
}
if (init)
{
    if (bubbletype == 0)
    {
        tx = tenna.x;
        ty = tenna.y - (sprite_get_height(tenna.sprite_index) * tenna.image_yscale * 0.55);
    }
    timer++;
    if (timer >= lifetime)
        instance_destroy();
}
