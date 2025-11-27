init = 0;
shadow_play = false;
shadow_play_con = 0;
rouxls_talked = false;
starwalker_npc = -4;
starwalker_active = scr_flag_get(254) > 0;
starwalker_create = false;
weather_talk = false;
weather_talk_con = 0;
weather_pose = false;
weather_pose_con = 0;
shutta_talk = false;
shutta_talk_con = 0;
shadowguy_block = -4;

reset_shadowguy = function()
{
    with (shadowguy)
        sprite_index = spr_shadowman_idle_a;
};

depressed_shadowguy = function()
{
    global.interact = 0;
    with (shadowguy)
    {
        sprite_index = spr_shadowman_sad;
        scr_shakeobj();
        y = ystart;
        x = xstart;
    }
    snd_play(snd_wing);
};
