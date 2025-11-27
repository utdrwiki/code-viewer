depth = 100000;
if (i_ex(obj_tenna_enemy))
    depth = 1000;
obj_mainchara.cutscene = 1;
mode = 0;
loss_counter = 0;
timer = 0;
balltimer = 0;
time_timer = 99;
time_counter = 0;
enemy_limit = 8;
show_spawned = 0;
fadeout = 0;
fadeout2 = 0;
started = 0;
rush_modifier = -1;
xorig = 0;
yorig = 0;
width = 1280;
bgxoffset = 0;
perfect_timer = 0;
perfect_counter = -1;
perfect_popularity = false;
shake = 0;
global.interact = 1;
gameover = false;
finished = false;
resolution_counter = 0;
wave = 0;
wave_offset = 0;
wave_do = false;
enemy_count = 0;
gunman_spawned = false;
dozer_count = 0;
spamton_hit = false;
resolve_this = false;
ending_type = 0;
timer = 0;
global.susie_cleartime_sec = 0;
wave_count[0] = 0;
wave_count[1] = 0;
wave_count[2] = 0;
wave_count[3] = 0;
wave_count[4] = 0;
wave_count[5] = 0;
wave_count[6] = 0;
wave_count[7] = 0;
wave_count[8] = 0;
wave_count[9] = 0;
wave_count[10] = 0;
melee = 185;
red = 1552;
blue = 573;
gun = 911;
rocket = 716;
dozer = 726;
laser = 1009;
tenna = obj_susiezilla_singlescreen_karatenna;
ralsei_attacker[0] = melee;
ralsei_attacker[1] = melee;
ralsei_attacker[2] = melee;
ralsei_attacker[3] = melee;
ralsei_attacker[4] = melee;
ralsei_attacker[5] = melee;
ralsei_attacker[6] = melee;
ralsei_attacker[7] = melee;
ralsei_attacker[8] = melee;
ralsei_attacker[9] = melee;
ralsei_attacker[10] = melee;
ralsei_attacker[11] = melee;
ralsei_attacker[12] = melee;
ralsei_attacker[13] = melee;
ralsei_attacker[14] = melee;
ralsei_attacker[15] = melee;
ralsei_attacker[16] = melee;
ralsei_attacker[17] = melee;
ral_count = 0;
ral_difficulty = 1;
if (i_ex(obj_tenna_enemy))
{
    if ((global.flag[1198] <= 3 && global.flag[1197] > 0) || obj_tenna_enemy.ralsei1withouttakingdamage == 1)
        ral_difficulty = 2;
    if ((global.flag[1198] == 0 && global.flag[1197] > 0) || obj_tenna_enemy.ralsei2withouttakingdamage == 1)
        ral_difficulty = 3;
}
replayversion = true;

spawn = function(arg0, arg1, arg2, arg3)
{
    scr_script_delayed(instance_create, arg3, (width * 0.5) + arg0, 280 + arg1, arg2);
    enemy_count++;
};

check_enemies = function()
{
    enemy_count--;
    if (mode == 1)
        spawn((120 + irandom(120)) * choose(-1, 1), irandom_range(-60, 60), tenna, 16);
    var ultimatevictory = false;
    with (obj_susiezilla_singlescreen_hud_score)
    {
        if (my_score >= 800)
            ultimatevictory = true;
    }
    if (ultimatevictory)
    {
        ending_type = 2;
        with (obj_susiezilla_singlescreen_shadowguy_parent)
        {
            if (object_index != obj_susiezilla_singlescreen_shadowguy_in_dozer)
                instant_defeat();
            else
                instant_defeat_dozer();
        }
        with (obj_script_delayed)
        {
            if (target == other.id)
                instance_destroy();
        }
        mus_fade(global.currentsong[1], 60);
        var tetalk21 = stringsetloc("* WOW! YOU GUYS BEAT THEM ALL!!! I CAN'T BELIEVE IT!", "obj_susiezilla_gamecontroller_slash_Create_0_gml_185_0");
        scr_script_delayed(scr_tennashouter, 80, tetalk21, 82);
        var tetalk22 = stringsetloc("* I'M GOING TO GIVE YOU GUYS A MASSIVE BONUS AFTER THIS!", "obj_susiezilla_gamecontroller_slash_Create_0_gml_188_0");
        scr_script_delayed(scr_tennashouter, 160, tetalk22, 82);
        var tetalk23 = stringsetloc("* GET OUT YOUR WALLETS! THIS TIME, I'M GONNA GIVE YOU", "obj_susiezilla_gamecontroller_slash_Create_0_gml_191_0");
        scr_script_delayed(scr_tennashouter, 240, tetalk23, 54, 0, -1, false);
        scr_script_delayed(snd_play, 294, snd_pombark);
        var tetalk24 = stringsetloc("* WHAT THE HECK!?!?!?", "obj_susiezilla_gamecontroller_slash_Create_0_gml_200_0");
        scr_script_delayed(scr_tennashouter, 350, tetalk24, 60);
        scr_script_delayed(instance_create, 410, 0, 0, 540);
        alarm[3] = 410;
    }
    if (wave <= (array_length(wave_count) - 1))
    {
        if (enemy_count <= wave_count[wave])
            scr_script_delayed(scr_var, 4, "wave_do", true);
    }
};

living_enemies = function()
{
    var enm_count = 0;
    with (obj_susiezilla_singlescreen_shadowguy_parent)
    {
        if (state != states.dead)
            enm_count++;
    }
    return enm_count;
};

check_imminent_enemy = function()
{
    with (obj_script_delayed)
    {
        if (target == other.id && (alarm[0] == 0 || alarm[0] == 1) && script == instance_create)
            return true;
    }
    return false;
};

setup = function(arg0)
{
    mode = arg0;
    var temp_width = 1280;
    if (mode > 0)
        temp_width = 640;
    game_bounds(x, y, temp_width);
    susie = instance_create((xorig + (width * 0.5)) - 40, 180, obj_susiezilla_player);
    if (mode == 0)
        susie.visible = false;
    if (mode >= 1)
        bgxoffset = 320;
    if (mode == 3 || mode == 4)
        susie.x -= 160;
    if (mode < 3)
        susie.y += 50;
    if (mode == 1 || mode == 2)
        time_timer = 16;
    if (mode >= 3)
        time_timer = 18;
    if (mode >= 5)
        time_timer = 10;
    if (!i_ex(obj_tenna_enemy))
    {
        curtain1 = scr_dark_marker(xorig - 8, -8, spr_dw_gameshow_curtain);
        curtain2 = scr_dark_marker(xorig + width + 8, -8, spr_dw_gameshow_curtain);
    }
    else
    {
        curtain1 = scr_dark_marker(xorig - 8, -6, spr_dw_gameshow_curtain_short);
        curtain2 = scr_dark_marker(xorig + width + 8, -6, spr_dw_gameshow_curtain_short);
    }
    curtain2.image_xscale = -2;
    curtain1.image_yscale = 2.5;
    curtain2.image_yscale = 2.5;
    curtain1.depth = 500;
    curtain2.depth = 500;
    if (!i_ex(obj_tenna_enemy))
    {
        lights1 = scr_dark_marker(xorig + 38, -8, spr_dw_tvland_lights);
        lights2 = scr_dark_marker((xorig + width) - 38, -8, spr_dw_tvland_lights);
        lights1.image_xscale = 1;
        lights2.image_xscale = -1;
        lights1.image_yscale = 1;
        lights2.image_yscale = 1;
        lights1.depth = 501;
        lights2.depth = 501;
    }
    if (mode == 0)
    {
        statue = instance_create(xorig + (width * 0.5), 270, obj_susiezilla_statue);
        statue.visible = false;
    }
    if (mode == 1)
        statue = instance_create(xorig + (width * 0.5), 270, obj_susiezilla_statue_enemy);
    if (mode == 2)
    {
        statue = instance_create(xorig + (width * 0.5), 270, obj_susiezilla_statue);
        statue.maxhp = 40;
        statue.hp = statue.maxhp;
        statue.sprite_index = spr_susiezilla_ralsei_tower;
        var _side = choose(-1, 1);
        if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity)
        {
            repeat (4)
                spawn((180 + irandom(60)) * _side, irandom_range(-60, 60), ralsei_attacker[ral_count % 18], 1);
        }
    }
    if (mode == 3 || mode == 4)
    {
        statue = instance_create(xorig + (width * 0.5), 270, obj_susiezilla_singlescreen_kickboxin_tenna);
        statue.maxhp = 3;
        statue.hp = statue.maxhp;
    }
    if (mode == 5)
        alarm[10] = 30;
    if (mode == 6)
        alarm[11] = 30;
    if (mode == 7)
    {
    }
    krisandsusie = instance_create_depth(xorig + (width * 0.5), 80, depth + 50, obj_susiezilla_krisandralsei);
    if (mode == 0)
        krisandsusie.visible = false;
    if (mode == 2)
        krisandsusie.sprite_index = spr_susiezilla_kris_tug;
    camerax_set(clamp(susie.myxcenter - 320, xorig, (xorig + width) - 640));
    cameray_set(0);
    if (mode != 0)
    {
        with (instance_create(camerax() - 80, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_score))
        {
            xoff = 40;
            movespeed = 0.7;
        }
        with (instance_create(camerax() - 40, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_hp))
        {
            xoff = 305;
            movespeed = 0.3;
            if (other.mode == 5 || other.mode == 6)
                tracker = instance_create(x, y, obj_susiezilla_house_timer);
            else
                tracker = other.statue;
        }
        with (instance_create(camerax() + camerawidth() + 40, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_time))
        {
            xoff = 380;
            movespeed = 0.35;
        }
        with (instance_create(camerax() + camerawidth() + 80, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_time_counter))
        {
            xoff = 520;
            movespeed = 0.45;
        }
        with (instance_create(camerax() + camerawidth() + 100, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_time_counter))
        {
            xoff = 580;
            movespeed = 0.6;
            digit = 2;
        }
    }
    if (mode == 1)
    {
        for (a = 0; a < 4; a++)
            spawn((120 + irandom(120)) * choose(-1, 1), irandom_range(-60, 60), tenna, 45 + (15 * a));
    }
    if (mode != 0)
        scr_script_delayed(scr_var, 64, "wave_do", true);
};

game_bounds = function(arg0, arg1, arg2)
{
    xorig = arg0;
    yorig = arg1;
    width = arg2;
};

susiezilla_destroy = function()
{
    with (obj_susiezilla_singlescreen_kickboxin_tenna)
        instance_destroy();
    with (obj_susiezilla_singlescreen_hittable)
        instance_destroy();
    with (obj_susiezilla_krisandralsei)
        instance_destroy();
    with (obj_susiezilla_singlescreen_hazard)
        instance_destroy();
    with (obj_susiezilla_perfect_chain_letter)
        instance_destroy();
    with (obj_susiezilla_singlescreen_shadowguy)
        instance_destroy();
    with (obj_susiezilla_singlescreen_shadowguy_blue)
        instance_destroy();
    with (obj_susiezilla_singlescreen_shadowguy_red)
        instance_destroy();
    with (obj_susiezilla_singlescreen_shadowguy_with_gun)
        instance_destroy();
    with (obj_susiezilla_singlescreen_shadowguy_in_dozer)
        instance_destroy();
    with (obj_susiezilla_singlescreen_shadowguy_laser_machine)
        instance_destroy();
    with (obj_dozer_parts)
        instance_destroy();
    with (obj_susiezilla_house_single)
        instance_destroy();
    with (obj_susiezilla_repair_spark)
        instance_destroy();
    with (obj_susiezilla_pan_object)
        instance_destroy();
    with (obj_susiezilla_singlescreen_karatenna)
        instance_destroy();
    with (obj_susiezilla_singlescreen_hud_element)
        instance_destroy();
    with (obj_susiezilla_perfect_chain)
        instance_destroy();
    with (obj_susiezilla_perfect_chain_letter)
        instance_destroy();
    with (obj_marker)
    {
        if (sprite_index == spr_realisticexplosion)
            instance_destroy();
    }
    instance_destroy(curtain1);
    instance_destroy(curtain2);
    if (!i_ex(obj_tenna_enemy))
    {
        instance_destroy(lights1);
        instance_destroy(lights2);
    }
    camerax_set(xorig);
    cameray_set(yorig);
    if (mode == 0)
    {
        if (!resolve_this && !keyboard_check_pressed(vk_f5))
        {
            loss_counter = clamp(loss_counter + 1, 0, 8);
            scr_flag_set(1080, loss_counter);
            with (obj_minigame_quit_ui)
                instance_destroy();
            inst = instance_create_depth(0, 0, 0, obj_gameover_minigame);
            inst.replayversion = 1;
        }
        else
        {
            scr_flag_set(1081, ending_type + 1);
            instance_create(0, 0, obj_victory_minigame);
            with (obj_minigame_quit_ui)
                instance_destroy();
        }
    }
    instance_destroy();
};

start = function()
{
    started = true;
    with (instance_create(camerax() - 80, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_score))
    {
        xoff = 40;
        movespeed = 0.7;
        depth = -98;
    }
    with (instance_create(camerax() + camerawidth() + 300, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_tenna))
    {
        xoff = 285;
        movespeed = 0.5;
        depth = -98;
    }
    with (instance_create(camerax() - 40, cameray() + cameraheight(), obj_susiezilla_singlescreen_hud_hp))
    {
        xoff = 305;
        movespeed = 0.3;
        if (other.mode == 0)
        {
            xoff = 620;
            movespeed = 0.6;
            x = camerax() + camerawidth() + 150;
            xprevious = x;
        }
        tracker = other.statue;
        depth = -98;
    }
    with (obj_susiezilla_player)
        alarm[1] = -1;
    scr_script_delayed(scr_var, 64, "wave_do", true);
};
