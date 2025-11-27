image_index = 0;
var automiss = false;
if (con != 1)
{
    if (image_alpha < 1)
        image_alpha += 0.1;
    if (bar_x > 324)
    {
        image_alpha3 -= 0.1;
        if (image_alpha3 <= 0)
            automiss = true;
        bar_x += 7;
    }
    else if (image_alpha2 >= 1)
    {
        if (image_alpha3 < 1)
            image_alpha3 += 0.1;
        bar_x += 7;
    }
}
if ((button1_p() || button2_p() || button3_p() || automiss == true) && bar_x >= 70 && con == 0 && image_alpha >= 0.6)
{
    image_index = 1;
    var maxmercy = 70;
    if (loudringing == 1)
        maxmercy = 60;
    if (bar_x < 86)
        maxmercy = 0;
    if (bar_x > 334)
        maxmercy = 0;
    var maximperfectmercy = max(maxmercy - 1, 0);
    if (bar_x >= 86 && bar_x < 196)
    {
        var ind = scr_progress(bar_x, 86, 196, 0, 1);
        mercy = ceil(ease_out_cubic(ind, 0, maximperfectmercy, 1));
    }
    if (bar_x > 224)
    {
        var ind = scr_progress(bar_x, 334, 224, 0, 1);
        mercy = ceil(ease_out_cubic(ind, 0, maximperfectmercy, 1));
    }
    if (bar_x >= 196 && bar_x <= 224)
    {
        mercy = maxmercy;
        printval("mercy");
        perfecthits++;
        parentid.tuningactsuccess = 1;
        with (obj_organ_enemy)
            wicabell_tuning = true;
        with (obj_bell_enemy_tuning_fork)
        {
            snd_play(snd_tuning_fork);
            scr_shakeobj();
            snd_play(snd_laz_c);
            image_speed = 1;
        }
        with (parentid)
        {
            attack = instance_create(obj_bell_enemy_tuning_fork.x + 20, obj_bell_enemy_tuning_fork.y + 30, obj_basicattack);
            if (other.loudringing == 1)
            {
                attack.sprite_index = spr_attack_mash2;
                attack.image_speed = 0.5;
                attack.maxindex = 4;
                snd_play(snd_impact);
                instance_create(0, 0, obj_shake);
            }
            shakex = 9;
            state = 3;
            hurttimer = 30;
            scr_mercyadd(myself, other.mercy);
            for (var i = 0; i < instance_number(obj_monsterparent); i += 1)
            {
                enemy[i] = instance_find(obj_monsterparent, i);
                if (global.mercymod[enemy[i].myself] < global.mercymax[enemy[i].myself] && enemy[i].myself != myself)
                {
                    if (enemy[i].myself == myself)
                    {
                    }
                    else
                    {
                        with (enemy[i])
                            scr_mercyadd(myself, 20);
                    }
                }
            }
        }
    }
    else if (mercy < 10)
    {
        parentid.tuningactsuccess = 0;
        attack = instance_create(obj_bell_enemy_tuning_fork.x + 90, obj_bell_enemy_tuning_fork.y + 30, obj_basicattack);
        with (obj_battlecontroller)
            damagenoise = 0;
        dmgwriter = instance_create(obj_bell_enemy_tuning_fork.x + 90, obj_bell_enemy_tuning_fork.y + 30, obj_dmgwriter);
        dmgwriter.damage = 0;
        dmgwriter.depth = depth - 999;
    }
    else
    {
        parentid.tuningactsuccess = 2;
        with (obj_organ_enemy)
            wicabell_tuning = true;
        with (obj_bell_enemy_tuning_fork)
        {
            snd_play(snd_tuning_fork);
            scr_shakeobj();
            snd_play(snd_laz_c);
            image_speed = 1;
        }
        with (parentid)
        {
            attack = instance_create(obj_bell_enemy_tuning_fork.x + 20, obj_bell_enemy_tuning_fork.y + 30, obj_basicattack);
            if (other.loudringing == 1)
            {
                attack.sprite_index = spr_attack_mash2;
                attack.image_speed = 0.5;
                attack.maxindex = 4;
                snd_play(snd_impact);
                instance_create(0, 0, obj_shake);
            }
            shakex = 9;
            state = 3;
            hurttimer = 30;
            show_debug_message_concat("other.mercy=", other.mercy);
            scr_mercyadd(myself, other.mercy);
        }
    }
    with (obj_bell_enemy_tuning_fork)
    {
        if (other.loudringing == 0)
            scr_battle_sprite_set("kris", spr_krisb_attack, 0.5, false);
        if (other.loudringing == 1)
            scr_battle_sprite_set("susie", spr_susie_attack, 0.5, false);
        snd_play(snd_laz_c);
    }
    con = 1;
}
if (con == 0)
    siner++;
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
    }
    if (timer > 12)
    {
        if (loudringing == 1)
        {
            bar_x = 0;
            image_alpha3 = 0;
            con = 0;
            loudringing = 0;
            exit;
        }
        image_alpha -= 0.1;
        image_alpha2 -= 0.1;
        with (obj_bell_enemy_tuning_fork)
            image_alpha -= 0.1;
        if (image_alpha < 0)
        {
            with (obj_writer)
                instance_destroy();
            instance_destroy();
            with (obj_bell_enemy_tuning_fork)
                instance_destroy();
        }
    }
}
