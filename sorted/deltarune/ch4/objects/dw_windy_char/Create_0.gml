is_init = false;
is_active = false;
sprite_top = -4;
sprite_top_offset = 0;
sprite_top_offset_timer = 0;
base_anim_index = 0;
base_anim_speed = 0;
top_anim_index = 0;
top_anim_speed = 0;
top_anim_speed_max = 0;
windspeedchangetimer = 0;
redalpha = 0;
battle_alpha = 0;
battle_mode = false;
battle_mode_stop = false;
auto = true;
char_name = "";
krisstartwindycon = 0;
krisstartwindytimer = 0;
krisspriteprev = 0;

init = function(arg0)
{
    char_name = arg0;
    if (char_name == "kris")
    {
        base_anim_speed = 0.2;
        top_anim_speed = 0;
        top_anim_speed_max = 0.6;
        redalpha = 0;
        sprite_index = spr_kris_block_up_wind_inbetween;
        sprite_top = spr_kris_walk_up_windy_hair;
    }
    else if (char_name == "susie")
    {
        base_anim_speed = 0.2;
        top_anim_speed = 0;
        top_anim_speed_max = 0.6;
        redalpha = 0;
        sprite_index = spr_susie_walk_up_windy;
        sprite_top = spr_susie_walk_up_windy_hair;
    }
    else if (char_name == "ralsei")
    {
        base_anim_speed = 0.2;
        top_anim_speed = 0;
        top_anim_speed_max = 0.6;
        redalpha = 0;
        sprite_index = spr_ralsei_walk_up_windy;
        sprite_top = spr_ralsei_walk_up_windy_scarf;
    }
    is_init = true;
};
