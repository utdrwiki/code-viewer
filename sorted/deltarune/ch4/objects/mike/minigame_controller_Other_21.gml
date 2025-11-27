plueyhealth--;
with (obj_mike_raindrop)
    instance_destroy();
shelter_current_time = shelter_time_limit;
shelter_current_time_eased = 99999;
if (plueyhealth > 0)
    exit;
mus_volume(global.batmusic[1], 0.5, 10);
with (obj_mike_minigame_tv)
{
    latestscore[minigame] = other.myscore;
    if (other.myscore > hiscore[minigame])
    {
        hiscore[minigame] = other.myscore;
        global.flag[1700] = other.myscore;
        snd_play(snd_won);
        other.new_hiscore = 120;
    }
    else
    {
        snd_play(snd_coin);
    }
}
cats_deposited = 0;
wave = 0;
timer = 0;
cats_bonus_timer = 0;
myscore = 0;
timer = 0;
phase = 3;
shelter_has_time_limit = false;
with (obj_mike_catbasket)
    instance_destroy();
with (obj_mike_raindrop)
    instance_destroy();
with (obj_marker)
{
    if (sprite_index == spr_mike_shelter)
        instance_destroy();
}
with (obj_mike_grabcat_pluey)
    instance_destroy();
