function scr_funnytext_init()
{
    global.writerobj[argument0] = obj_funnytext;
    global.writerobjx[argument0] = argument1;
    global.writerobjy[argument0] = argument2;
    global.writerimg[argument0] = argument3;
    global.writerobjsettinga[argument0] = argument4;
    global.writerobjsettingb[argument0] = argument5;
}

function scr_funnytext_init_sounds()
{
    global.funnytext_sounds = [scr_funnytext_new_sound(snd_crowd_cheer_single, [spr_funnytext_fun_loop]), scr_funnytext_new_sound(snd_ftext_bounce, [spr_funnytext_big, spr_funnytext_physical_challenge, spr_funnytext_physical_challenges]), scr_funnytext_new_sound(snd_ftext_woodblock, [spr_funnytext_board, spr_funnytext_challenge]), scr_funnytext_new_sound(snd_ftext_prize, [spr_funnytext_bonus_round, spr_funnytext_word, spr_funnytext_hall_of_fame, spr_funnytext_amazing_01]), scr_funnytext_new_sound(snd_whip_crack_only, [spr_funnytext_breaking_news]), scr_funnytext_new_sound(snd_badexplosion, [spr_funnytext_flames]), scr_funnytext_new_sound(snd_ftext_enter, [spr_funnytext_fun_o_meter, spr_funnytext_special]), scr_funnytext_new_sound(snd_ftext_susiezilla, [spr_funnytext_susiezilla]), scr_funnytext_new_sound(snd_ftext_dark_fountain, [spr_funnytext_dark_fountain]), scr_funnytext_new_sound(snd_ftext_brother, [spr_funnytext_brother]), scr_funnytext_new_sound(snd_ftext_gunshot, [spr_funnytext_grand_prize, spr_funnytext_prizes, spr_funnytext_round, spr_funnytext_round_1, spr_funnytext_rounds, spr_funnytext_game_over, spr_funnytext_game, spr_funnytext_over]), scr_funnytext_new_sound(snd_ftext_names, [spr_funnytext_names]), scr_funnytext_new_sound(snd_ftext_toriel, [spr_funnytext_toriel]), scr_funnytext_new_sound(snd_ftext_vibraphones, [spr_funnytext_green_room, spr_funnytext_quizzes]), scr_funnytext_new_sound(snd_audience_aww, [spr_funnytext_love, spr_funnytext_lovely, spr_funnytext_lovers]), scr_funnytext_new_sound(snd_sparkle_glock, [spr_funnytext_star, spr_funnytext_stars]), scr_funnytext_new_sound(snd_locker, [spr_funnytext_stop]), scr_funnytext_new_sound(snd_splat, [spr_funnytext_tears]), scr_funnytext_new_sound(snd_carhonk, [spr_funnytext_win_big])];
}

function scr_funnytext_get_sound(arg0)
{
    if (!variable_global_exists("funnytext_sounds"))
        scr_funnytext_init_sounds();
    var sound_file = -4;
    for (var i = 0; i < array_length(global.funnytext_sounds); i++)
    {
        var sprite_list = global.funnytext_sounds[i][1];
        for (var j = 0; j < array_length(sprite_list); j++)
        {
            var sprite = scr_84_get_sprite(sprite_list[j]);
            if (arg0 != sprite)
                continue;
            sound_file = global.funnytext_sounds[i][0];
            break;
        }
        if (sound_file != -4)
            break;
    }
    return sound_file;
}

function scr_funnytext_new_sound(arg0, arg1)
{
    var sound_file = arg0;
    var sprite_list = [];
    for (var i = 0; i < array_length(arg1); i++)
        sprite_list[array_length(sprite_list)] = sprite_get_name(arg1[i]);
    var funnytext_sound = [];
    funnytext_sound[0] = sound_file;
    funnytext_sound[1] = sprite_list;
    return funnytext_sound;
}
