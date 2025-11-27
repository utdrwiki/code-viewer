timer++;
if (wave == 0 && timer == 30)
{
    obj_mike_controller.type = 15;
    with (obj_mike_battle)
        move = true;
}
plueywater.x = camerax();
plueywater.y = cameray();
global.inv--;
has_shelter_on_left = wave == 1;
has_shelter_on_right = wave < 4;
if (wave == 0 && timer == 40)
{
    wave++;
    var xx = camerax() + (0.5 * camerawidth());
    var yy = cameray() + 300;
    var cat = instance_create(xx - 400, yy, obj_mike_grabcat_pluey);
    with (cat)
        walks = false;
    var shelter1 = instance_create(xx - 380, yy + 25, obj_marker);
    with (shelter1)
    {
        sprite_index = spr_mike_shelter;
        depth += 100;
        scr_darksize();
        scr_lerpvar("x", x, x + 60, 60);
    }
    var shelter2 = instance_create(xx + 380, yy + 25, obj_marker);
    with (shelter2)
    {
        sprite_index = spr_mike_shelter;
        depth += 100;
        scr_darksize();
        image_xscale *= -1;
        scr_lerpvar("x", x, x - 60, 60);
    }
    var basket = instance_create(xx + 380, yy, obj_mike_catbasket);
    with (basket)
    {
        scr_lerpvar("x", x, x - 120, 60);
        keepalive = true;
    }
}
if (wave == 1)
{
    if (myscore >= 50)
    {
        wave = 2;
    }
    else if (instance_number(obj_mike_grabcat_pluey) == 0)
    {
        var xx = camerax() + (0.5 * camerawidth());
        var yy = cameray() + 300;
        var cat = instance_create(xx - 400, yy, obj_mike_grabcat_pluey);
        with (cat)
        {
            walks = false;
            max_vspeed = lerp(6, 12, clamp01((other.myscore - 150) / 500));
        }
    }
}
else if (wave == 2)
{
    with (obj_marker)
    {
        if (sprite_index == spr_mike_shelter && x < (camerax() + 320))
        {
            scr_lerpvar("x", x, x - 300, 60);
            scr_doom(self, 60);
        }
    }
    wave = 3;
}
else if (wave == 3)
{
    if (myscore >= 500)
        wave = 4;
}
else if (wave == 4)
{
    with (obj_marker)
    {
        if (sprite_index == spr_mike_shelter && x > (camerax() + 320))
        {
            scr_lerpvar("x", x, x + 300, 60);
            scr_doom(self, 60);
        }
    }
    wave = 5;
}
var minvalue = max(8 - floor(myscore / 150), 4);
var spawn_rain = (timer % max(31 - (2 * floor(myscore / 10)), minvalue)) == 0;
if (shelter_has_time_limit)
{
    if (myscore < 200)
        shelter_current_time -= lerp(1, 3, myscore / 200);
    else if (myscore / 500)
        shelter_current_time -= lerp(3, 5.5, (myscore - 200) / 300);
    else
        shelter_current_time -= lerp(5.5, 7.5, (myscore - 500) / 1000);
    if (shelter_current_time_eased <= -20)
    {
        minvalue = 2;
        spawn_rain = (timer % max(16 - (2 * floor(myscore / 10)), minvalue)) == 0;
    }
}
if (shelter_has_time_limit)
    shelter_current_time_eased = lerp(shelter_current_time_eased, shelter_current_time, 0.02);
if (wave >= 1 && myscore > 0)
{
    if (spawn_rain)
    {
        if (wave >= 3)
        {
            var maxcats = 2;
            if (wave == 5)
                maxcats = 3;
            var xx = camerax() + (0.5 * camerawidth());
            var xxx = random_range(xx - 320, xx + 280);
            var cats = 0;
            with (obj_mike_grabcat_pluey)
            {
                if (action != 1)
                    cats++;
            }
            if (cats < maxcats && random_range(0, 1) > (0.5 - (0.1 * tracker)) && xxx < xx)
            {
                var rain = instance_create(xxx, cameray() - 40, obj_mike_grabcat_pluey);
                rain.israin = true;
                rain.vspeed = 3;
                tracker = 0;
            }
            else
            {
                tracker++;
                var rain = instance_create(xxx, cameray() - 40, obj_mike_raindrop);
                rain.vspeed = 3;
                with (rain)
                    scr_darksize();
                if (shelter_current_time_eased < -20 && random_range(0, 1) < 0.2)
                {
                    with (rain)
                    {
                        scr_lerpvar("y", y, 40, 10);
                        event_user(1);
                    }
                }
            }
        }
        else
        {
            var xx = camerax() + (0.5 * camerawidth());
            var rain = instance_create(random_range(xx - 280, xx + 280), cameray() - 40, obj_mike_raindrop);
            rain.vspeed = 3;
            with (rain)
                scr_darksize();
            if (shelter_current_time_eased < -20 && random_range(0, 1) < 0.2)
            {
                with (rain)
                {
                    scr_lerpvar("y", y, 40, 10);
                    event_user(1);
                }
            }
        }
    }
}
if (cats_bonus_timer > 0)
    cats_bonus_timer--;
if (instance_exists(obj_mike_catbasket))
{
    with (obj_mike_catbasket)
        image_blend = merge_color(c_white, c_yellow, min(1, other.cats_bonus_timer / 20));
    if (cats_deposited < obj_mike_catbasket.cats)
    {
        shelter_current_time = shelter_time_limit;
        shelter_has_time_limit = true;
        var diff = obj_mike_catbasket.cats - cats_deposited;
        for (var i = 0; i < diff; i++)
        {
            var add = 10;
            if (cats_bonus_timer > 0)
            {
                pluey_combo_chain = min(pluey_combo_chain + 1, 5);
                add = 15 + (pluey_combo_chain * 5);
                with (obj_mike_catbasket)
                    scoreflash = 1.3;
                snd_play(snd_sparkle_glock, 1, 1 - ((pluey_combo_chain - 1) * 0.05));
                instance_create_depth(obj_mike_catbasket.x - 36, obj_mike_catbasket.y - 40, depth, obj_minigame_score);
            }
            else
            {
                pluey_combo_chain = 0;
            }
            myscore += add;
            if (obj_mike_catbasket.last_cat_was_thrown)
                cats_bonus_timer = 70;
            else
                cats_bonus_timer = 100;
            if (myscore < 50)
                cats_bonus_timer += 30;
        }
        cats_deposited = obj_mike_catbasket.cats;
    }
}
