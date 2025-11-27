if (!instance_exists(obj_heart))
    instance_destroy();
type = 0;
myscore = [20, 50, 100, 250, 500, 1500, 5000, 20000, 100000];
chance = 1;
alarm[0] = 1;

collect = function()
{
    with (obj_mike_minigame_controller)
    {
        var fuelamount = 25;
        if (fuel >= 1)
            fuelamount = 20;
        if (fuel >= 20)
            fuelamount = 15;
        if (fuel >= 35)
            fuelamount = 10;
        if (other.myscore[other.type] == 50)
            fuelamount += 5;
        if (other.myscore[other.type] == 100)
            fuelamount += 15;
        if (other.myscore[other.type] == 250)
            fuelamount += 40;
        if (other.myscore[other.type] == 500)
            fuelamount += 80;
        if (other.myscore[other.type] == 100000)
            fuelamount = 0;
        fuel = scr_approach(fuel, 100, fuelamount);
        if (other.myscore[other.type] == 1500)
            fuel = 130;
        if (other.myscore[other.type] == 5000)
            fuel = 200;
        if (other.myscore[other.type] == 20000)
            fuel = 250;
        if (other.myscore[other.type] != 100000)
        {
            myscore += other.myscore[other.type];
        }
        else
        {
            myscore += round(random_range(-50000, 300000));
            if (fuel > 20)
                fuel = 20;
            else
                fuel = 1;
        }
    }
    if (myscore[type] != 100000)
    {
        scr_sparkle_colour(8, 65280);
        var _a = instance_create(x, y, obj_gravity_text);
        _a.image_blend = c_lime;
        _a.str = string(myscore[type]);
        if (myscore[type] == 20)
            snd_play(snd_magicsprinkle, 0.8, 1);
        if (myscore[type] == 50)
            snd_play(snd_magicsprinkle, 0.9, 0.95);
        if (myscore[type] == 100)
            snd_play(snd_magicsprinkle, 1, 0.9);
        if (myscore[type] == 250)
            snd_play(snd_magicsprinkle, 1, 0.8);
        if (myscore[type] == 500)
            snd_play(snd_cd_bagel_susie, 0.8, 1.3 + random(0.1));
        if (myscore[type] == 1500)
        {
            snd_play(snd_magicsprinkle, 1, 0.5);
            snd_play(snd_cd_bagel_ralsei, 1, 1);
        }
        if (myscore[type] == 5000)
        {
            snd_play(snd_magicsprinkle, 1, 0.25);
            snd_play(snd_cd_bagel_ralsei, 1, 0.8);
            snd_play(snd_cd_bagel_ralsei, 1, 0.81);
        }
        if (myscore[type] == 20000)
        {
            snd_play(snd_magicsprinkle, 1, 0.1);
            snd_play(snd_cd_bagel_ralsei, 1, 0.6);
            snd_play(snd_cd_bagel_ralsei, 1, 0.62);
        }
    }
    else
    {
        scr_sparkle_colour(ceil(random(24)), random(999999));
        snd_play(snd_hurt1, 1, 0.5);
        snd_play(snd_knight_laugh, 0.9, random_range(0.5, 3));
        snd_play(snd_knight_laugh, 0.9, random_range(0.5, 3));
    }
    with (obj_mike_controller)
    {
        if (hand_target == -1)
            hand_type = 0;
    }
    instance_destroy();
};

buffer = 0;
for (var i = 0; i < 5; i++)
{
    last_x[i] = 0;
    last_y[i] = 0;
}
last_x[0] = x;
last_y[0] = y - 4;
thrown = 1;
throw_timer = 0;
throwing = 0;
score_buffer = 3;
wall_destroy = 0;
grab_snd = -1;
wait = 0;
wait_max = 30;
xx = x;
yy = y;
action = 0;
xscale = 1;
can_score = 1;
image_xscale = 1;
image_yscale = image_xscale;
sprite_mask = sprite_index;
sprite_index = spr_mike_cat_dance;
image_blend = c_lime;
level = 0;
fever_timer = -1;
