function scr_textsound()
{
    playtextsound = 1;
    if (button2_h() == 1)
    {
        var dontplaysound = true;
        if (variable_instance_exists(id, "runcheck"))
        {
            if (runcheck)
                dontplaysound = false;
        }
        if (dontplaysound)
            playtextsound = 0;
    }
    if (skippable == 0)
        playtextsound = 1;
    if (playtextsound == 1)
    {
        if (rate <= 2)
            getchar = string_char_at(mystring, pos);
        else
            getchar = string_char_at(mystring, pos - 1);
        play = 1;
        playcheck = 0;
        if (getchar == "&" || getchar == "\n")
        {
            if (rate < 3)
            {
                playcheck = 1;
                getchar = string_char_at(mystring, pos + 1);
            }
            else
            {
                play = 0;
            }
        }
        if (getchar == " ")
            play = 0;
        if (getchar == "^")
            play = 0;
        if (getchar == "!")
            play = 0;
        if (getchar == ".")
            play = 0;
        if (getchar == "?")
            play = 0;
        if (getchar == ",")
            play = 0;
        if (getchar == ":")
            play = 0;
        if (getchar == "/")
            play = 0;
        if (getchar == "\\")
            play = 0;
        if (getchar == "|")
            play = 0;
        if (getchar == "*")
            play = 0;
        if (play == 1)
        {
            if (textsound == snd_txtq)
            {
                audio_stop_sound(snd_txtq_2);
                qv = snd_play(snd_txtq_2);
                qp = 0.9 + random(0.15);
                snd_pitch(qv, qp);
                sound_timer = 2;
            }
            else if (textsound == snd_txtspam)
            {
                audio_stop_sound(snd_txtspam2);
                snd_play_x(snd_txtspam2, 0.8, 1.2);
                sound_timer = 2;
            }
            else if (textsound == snd_txtsans)
            {
                audio_stop_sound(snd_txtsans);
                qv = snd_play(snd_txtsans);
                sound_timer = 2;
            }
            else if (textsound == snd_txtjack_high_cute || textsound == snd_txtjack_low2)
            {
                if (textsound == snd_txtjack_high_cute)
                {
                    audio_stop_sound(snd_txtjack_high_cute);
                    qv = snd_play(snd_txtjack_high_cute);
                    qp = 0.75 + random(0.5);
                    snd_pitch(qv, qp);
                    sound_timer = 3;
                }
                if (textsound == snd_txtjack_low2)
                {
                    audio_stop_sound(snd_txtjack_low2);
                    qv = snd_play(snd_txtjack_low2);
                    qp = 0.75 + random(0.5);
                    snd_pitch(qv, qp);
                    sound_timer = 3;
                }
            }
            else if (textsound == snd_txger)
            {
                audio_stop_sound(snd_txger);
                var sndpitch = choose(1, 1, 1 - random(0.2));
                var snd = choose(82);
                qv = snd_play(snd, 1, sndpitch);
                sound_timer = 3;
            }
            else if (textsound == snd_tv_voice_short)
            {
                var rand = irandom(8) + 1;
                if (global.flag[1054] <= 0)
                    global.flag[1054] = 1;
                var pitchrandom = (0.86 + random(0.35)) * global.flag[1054];
                var soundindex = "snd_tv_voice_short";
                if (rand >= 2)
                    soundindex += ("_" + string(rand));
                soundindex = asset_get_index(soundindex);
                audio_stop_sound(snd_tv_voice_short);
                audio_stop_sound(snd_tv_voice_short_2);
                audio_stop_sound(snd_tv_voice_short_3);
                audio_stop_sound(snd_tv_voice_short_4);
                audio_stop_sound(snd_tv_voice_short_5);
                audio_stop_sound(snd_tv_voice_short_6);
                audio_stop_sound(snd_tv_voice_short_7);
                audio_stop_sound(snd_tv_voice_short_8);
                audio_stop_sound(snd_tv_voice_short_9);
                snd_play_x(soundindex, 0.7, pitchrandom);
                sound_timer = 3;
            }
            else if (textsound == snd_txtral)
            {
                if (global.chapter == 4)
                {
                    if (room == room_dw_churchb_nongerson_post)
                    {
                        if (i_ex(obj_ch4_DCB02))
                        {
                            var max_pitch = obj_ch4_DCB02.voice_pitch;
                            if (max_pitch > 0)
                            {
                                var pitchrandom = random(max_pitch);
                                snd_play_x(textsound, 1, 1 + pitchrandom);
                            }
                            else
                            {
                                snd_play(textsound);
                            }
                        }
                    }
                    else
                    {
                        snd_play(textsound);
                    }
                }
                else
                {
                    snd_play(textsound);
                }
            }
            else
            {
                snd_play(textsound);
            }
            with (obj_face_parent)
                mouthmove = 1;
            miniface_pos++;
        }
    }
}
