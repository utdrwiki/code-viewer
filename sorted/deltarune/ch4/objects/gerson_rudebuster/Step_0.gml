if (image_alpha < 1)
    image_alpha += 0.25;
else
    image_alpha = 1;
if ((button1_p() || button2_p() || button3_p()) && hurtflashalpha == 0 && explode == 0 && obj_herosusie.hurt == 0)
    buffer_z = 2;
if (buffer_z > 0 && hurtflashalpha == 0 && explode == 0 && obj_herosusie.hurt == 0)
{
    if (susieattackcon == 0)
    {
        snd_play(snd_ultraswing);
        snd_play(snd_ultraswing);
        susieattackcon = 1;
        with (obj_herosusie)
        {
            x = xstart;
            sprite_set_offset(spr_susie_hitback_miss, 18, 9);
            scr_battle_sprite_set("susie", spr_susie_hitback_miss, 0.5, 0);
        }
    }
}
if (susieattackcon == 1)
{
    susieattacktimer++;
    if (susieattacktimer == 4)
    {
        with (obj_gerson_slowdown)
        {
            con = 1;
            timer = 0;
        }
        if (x < (camerax() + 330))
        {
            hitback = true;
            scr_battle_sprite_set("susie", spr_susie_hitback, 0.5, 0);
            with (obj_herosusie)
                image_index = 2;
            scr_shakeobj();
            instance_create(x, y, obj_shake);
            snd_play(snd_criticalswing);
            with (obj_afterimage)
                instance_destroy();
            susieattackcon = 2;
            susieattacktimer = 0;
            hurtflashalpha = 1;
            direction = 0;
            x += 10;
            inst = instance_create_depth((obj_heroparent.x + 54 + 20) - 36, obj_heroparent.y - 64 - 18, obj_herosusie.depth - 9, obj_animation);
            inst.sprite_index = spr_gerson_hit_fx4;
            inst.image_speed = 0.5;
            inst.image_angle = 0;
            inst.image_xscale = 2;
            inst.image_yscale = 2;
            with (instance_create(camerax(), cameray(), obj_afterimage_screen))
                faderate = 0.05;
        }
    }
    if (susieattacktimer == 9)
    {
        susieattackcon = 0;
        susieattacktimer = 0;
    }
}
if (susieattackcon == 2)
{
    susieattacktimer++;
    obj_heroparent.x += 1;
    if (susieattacktimer == 2)
    {
        inst = instance_create_depth((obj_heroparent.x + 190) - 36, (obj_heroparent.y + 40) - 10, obj_herosusie.depth - 10, obj_animation);
        inst.sprite_index = spr_susie_gerson_hitbback_fx_1;
        inst.image_speed = 1;
        inst.image_angle = 0;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
    }
    if (susieattacktimer == 10)
    {
        susieattackcon = 0;
        susieattacktimer = 0;
        with (obj_herosusie)
            image_index = 12;
        inst = instance_create_depth((obj_heroparent.x + 200) - 36, (obj_heroparent.y + 40) - 10, obj_herosusie.depth - 10, obj_animation);
        inst.sprite_index = spr_susie_gerson_hitbback_fx_2;
        inst.image_speed = 1;
        inst.image_angle = 0;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
        scr_shakeobj();
        instance_create(x, y, obj_shake);
        snd_play(snd_rudebuster_hit);
        snd_play(snd_rudebuster_swing);
        blast = instance_create((obj_heroparent.x + 180) - 36, (obj_heroparent.y + 60) - 18, obj_rudebuster_bolt);
        blast.caster = 0;
        blast.target = 1435;
        blast.damage = ceil(((global.battlemag[1] * 5) + (global.battleat[1] * 11)) - (global.monsterdf[0] * 3));
        blast.star = 0;
        blast.speedmax = 10;
        blast.image_alpha = 1;
        blast.direction = 0;
        blast.gersonswingtimer = 4;
        blast.gersonoffset = -20;
        with (obj_particle_generic)
            instance_destroy();
        instance_destroy();
    }
    exit;
}
buffer_z--;
if (t == 0)
{
    if (instance_exists(target))
    {
        targetx = target.x + (target.sprite_width / 2);
        targety = target.y + (target.sprite_height / 2);
    }
    cx = targetx;
    cy = targety;
    direction = point_direction(x, y, cx, cy) - 20;
    speed = 9;
    friction = -1.5;
    image_angle = direction;
}
if (t >= 1 && explode == 0)
{
    dir = point_direction(x, y, cx, cy);
    direction += (angle_difference(dir, direction) / 4);
    image_angle = direction;
    if (point_distance(x, y, cx, cy) <= 40)
    {
        speed = speed == 0.96;
        hitsusietimer++;
        if (hitsusietimer == 2 && hitback == false)
        {
            visible = 0;
            explode = 1;
            t = 1;
        }
    }
}
if (explode == 1)
{
    with (obj_herosusie)
    {
        scr_battle_sprite_reset("susie");
        hurt = 1;
        hurttimer = 0;
    }
    with (obj_gerson_slowdown)
    {
        con = 1;
        timer = 0;
    }
    susieattackcon = 0;
    susieattacktimer = 0;
    buffer_z = 0;
    if (t == 1)
    {
        var b = (global.hp[2] - 30) / 250;
        if (b < 0)
            b = 0;
        damage = lerp(12, 90, b);
        global.inv = -1;
        obj_hammer_of_justice_enemy.rudebusterhitcount = 0;
        obj_hammer_of_justice_enemy.progress += 6;
        obj_hammer_of_justice_enemy.mercylaughcon = 1;
        obj_hammer_of_justice_enemy.mercylaughcount = 6;
        scr_damage_all();
        bonus_anim = 0;
        with (obj_hammer_of_justice_enemy)
        {
            if (susiehitbyrudebustercount == 0 && rudebusterhitcountmax == 1)
                susiehitbyrudebustercon = 1;
            susiehitbyrudebustercount++;
            rudebusterdelay = 20;
        }
        with (target)
        {
            _oflash = instance_create(x, y, obj_oflash_gerson_buster);
            _oflash.image_xscale = image_xscale;
            _oflash.image_speed = 0;
            _oflash.image_index = image_index;
            _oflash.image_yscale = image_yscale;
            _oflash.sprite_index = spr_susieb_hurt;
            _oflash.depth = depth - 1;
            _oflash.target = id;
        }
        snd_play(snd_rudebuster_hit);
        for (i = 0; i < 4; i += 1)
        {
            burst[i] = scr_afterimage();
            burst[i].image_speed = 0.5;
            burst[i].x = cx;
            burst[i].y = cy;
            burst[i].image_angle = 45 + (i * 90);
            burst[i].direction = burst[i].image_angle;
            burst[i].speed = 25;
            burst[i].depth = depth - 10;
        }
        for (i = 4; i < 8; i += 1)
        {
            burst[i] = scr_afterimage();
            burst[i].image_speed = 0.5;
            burst[i].x = cx;
            burst[i].y = cy;
            burst[i].image_angle = 45 + (i * 90);
            burst[i].direction = burst[i].image_angle;
            burst[i].speed = 25;
            burst[i].depth = depth - 10;
        }
    }
    if (t >= 2)
    {
        for (i = 0; i < 4; i += 1)
        {
            with (burst[i])
            {
                speed *= 0.75;
                image_xscale *= 0.8;
            }
        }
        for (i = 4; i < 8; i += 1)
        {
            with (burst[i])
            {
                speed *= 0.8;
                image_xscale *= 0.8;
            }
        }
    }
    if (t >= 18)
        instance_destroy();
}
if (explode == 0 && speed != 0)
{
    aft[maxaft] = scr_afterimage();
    aft[maxaft].image_yscale = 1.8;
    aft[maxaft].image_angle = image_angle;
    aft[maxaft].image_index = 4;
    aft[maxaft].image_speed = 0.5;
    aft[maxaft].image_alpha = image_alpha - 0.2;
    maxaft += 1;
}
for (i = 0; i < maxaft; i += 1)
{
    with (aft[i])
    {
        image_yscale -= 0.1;
        if (image_yscale <= 0.1)
            instance_destroy();
    }
    if (explode == 1)
    {
        with (aft[i])
        {
            image_alpha -= 0.07;
            image_yscale *= 0.9;
            if (image_yscale <= 0.1)
                instance_destroy();
        }
    }
}
a += 1;
t += 1;
