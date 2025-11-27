if (state == 0 && endcon < 5)
    movesiner += (1/3);
if (state != 13)
    x = xstart + (sin(movesiner / 5) * 10);
if (rudebusterflashcon == 1)
{
    rudebusterflashtimer++;
    if (rudebusterflashtimer > 4 && sin(rudebusterflashtimer / 3) < 0)
    {
        rudebusterflashtimer = 0;
        rudebusterflashcon = 0;
    }
}
if (state == 0 || state == 3)
{
    var hair_x = 0;
    var hair_y = 0;
    var _index = siner % 14;
    if (_index < 1)
    {
        hair_x = 18;
        hair_y = 5;
    }
    else if (_index < 2)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 3)
    {
        hair_x = 18;
        hair_y = 3;
    }
    else if (_index < 4)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 5)
    {
        hair_x = 18;
        hair_y = 5;
    }
    else if (_index < 6)
    {
        hair_x = 18;
        hair_y = 6;
    }
    else if (_index < 7)
    {
        hair_x = 18;
        hair_y = 7;
    }
    else if (_index < 8)
    {
        hair_x = 18;
        hair_y = 5;
    }
    else if (_index < 9)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 10)
    {
        hair_x = 18;
        hair_y = 3;
    }
    else if (_index < 11)
    {
        hair_x = 18;
        hair_y = 3;
    }
    else if (_index < 12)
    {
        hair_x = 18;
        hair_y = 4;
    }
    else if (_index < 13)
    {
        hair_x = 18;
        hair_y = 6;
    }
    else if (_index < 14)
    {
        hair_x = 18;
        hair_y = 7;
    }
    else if (_index < 15)
    {
        hair_x = 18;
        hair_y = 5;
    }
    draw_sprite_ext(spr_gerson_hair, hairindex, x + ((0 + hair_x) * 2), y + ((0 + hair_y) * 2), 2, 2, image_angle, image_blend, image_alpha);
    if (flash == 1)
        draw_sprite_ext_flash(spr_gerson_hair, hairindex, x + ((0 + hair_x) * 2), y + ((0 + hair_y) * 2), 2, 2, image_angle, image_blend, (-cos(fsiner / 5) * 0.4) + 0.6);
    if (state == 0)
        hairindex += 0.2;
    else
        hairindex += 0.1;
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_gerson_hair, hairindex, x + ((0 + hair_x) * 2), y + ((0 + hair_y) * 2), 2, 2, image_angle, image_blend, sin(rudebusterflashtimer / 3));
    d3d_set_fog(false, c_black, 0, 0);
}
scr_enemy_drawhurt_generic();
if (endcon > 4)
{
    siner += (1/3);
    if (siner > 3)
        siner = 3;
    if (endcon == 5 && endtimer >= 25)
    {
        if (nohairsprite == true)
        {
            endshaketimer++;
            if (endshaketimer == 1)
                x += 7;
            if (endshaketimer == 2)
                x -= 6;
            if (endshaketimer == 3)
                x += 5;
            if (endshaketimer == 4)
                x -= 4;
            if (endshaketimer == 5)
                x += 3;
            if (endshaketimer == 6)
                x -= 2;
            if (endshaketimer == 7)
                x += 1;
            draw_monster_body_part(spr_gerson_headtilt_nohair, siner, x, y);
        }
        else
        {
            draw_monster_body_part(spr_gerson_headtilt, siner, x, y);
        }
    }
    else
    {
        draw_monster_body_part(thissprite, siner, x, y);
    }
}
else if (state == 0)
{
    fsiner += 1;
    siner += (1/3);
    if (siner > 14)
        siner -= 14;
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself])
        thissprite = sparedsprite;
    draw_monster_body_part(thissprite, siner, x, y);
}
if (state == 0 || state == 3)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(hurtsprite, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, sin(rudebusterflashtimer / 3));
    d3d_set_fog(false, c_black, 0, 0);
}
if (goldcon == 1 && global.turntimer >= 1)
{
    d3d_set_fog(true, c_yellow, 0, 1);
    if (goldalpha < 0.3)
        goldalpha += 0.01;
    image_alpha = goldalpha;
    scr_enemy_drawidle_generic(0.16666666666666666);
    image_alpha = 1;
    d3d_set_fog(false, c_black, 0, 0);
}
if (goldcon == 1 && global.turntimer < 1)
{
    d3d_set_fog(true, c_yellow, 0, 1);
    if (goldalpha > 0)
        goldalpha -= 0.01;
    image_alpha = goldalpha;
    scr_enemy_drawidle_generic(0.16666666666666666);
    image_alpha = 1;
    d3d_set_fog(false, c_black, 0, 0);
}
if (state == 10)
{
    image_speed = 0;
    image_index += 0.5;
    draw_self();
    if (image_index >= 3)
    {
        state = 11;
        swingtimer = 0;
        scr_shakeobj();
        instance_create(x, y, obj_shake);
        with (obj_rudebuster_bolt)
            instance_destroy();
        snd_play(snd_criticalswing);
        with (obj_afterimage)
            instance_destroy();
        inst = instance_create((x - 70) + 10, (y - 15) + 20, obj_animation);
        inst.sprite_index = spr_susie_gerson_hitbback_fx_2;
        inst.image_speed = 1;
        inst.image_angle = 40;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
        inst = instance_create((x - 46) + 10, (y - 12) + 20, obj_animation);
        inst.sprite_index = spr_gerson_hit_fx3;
        inst.image_index = 1;
        inst.image_speed = 0.5;
        inst.image_angle = 14;
        inst.image_xscale = 2;
        inst.image_yscale = 2;
    }
}
if (state == 11)
{
    swingtimer++;
    if (swingtimer < 12)
    {
        var scale = sin((swingtimer + 1) / 0.68) * 0.2;
        draw_sprite_ext(spr_gerson_rude_orb1, 0, (x - 48) + 10, (y - 15) + 20, 0.6 + scale, 1 - (scale * 0.5), 22, c_white, image_alpha);
    }
    if (swingtimer == 3)
        x -= 2;
    if (swingtimer == 4)
        x += 2;
    if (swingtimer == 5)
        x -= 2;
    if (swingtimer == 6)
        x += 2;
    if (swingtimer == 7)
        x -= 2;
    if (swingtimer == 8)
        x += 2;
    if (swingtimer == 9)
        x -= 2;
    if (swingtimer == 10)
        x += 2;
    draw_self();
    if (swingtimer == 11)
        image_index = 10;
    if (swingtimer == 12)
    {
        blast = instance_create(x - 40, y + 20, obj_gerson_rudebuster);
        blast.battlemode = 0;
        blast.target = 1280;
        blast.image_alpha = 1;
        snd_play(snd_rudebuster_swing);
        obj_hammer_of_justice_enemy.rudebusterhitcount++;
        instance_create(x, y, obj_shake);
        inst = instance_create(x - 40, y + 20, obj_animation);
        inst.sprite_index = spr_susie_gerson_hitbback_fx_2;
        inst.image_speed = 1;
        inst.image_angle = 0;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
        inst = instance_create(x - 40, y + 20, obj_animation);
        inst.sprite_index = spr_susie_gerson_hitbback_fx_2;
        inst.image_speed = 1;
        inst.image_angle = 30;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
    }
    if (swingtimer >= 0)
    {
        if (image_index < 13)
        {
            image_index += 0.5;
            if (image_index >= 11 && swingtimer < 11)
                image_index = 4;
        }
        if (swingtimer == 25)
        {
            state = 0;
            swingtimer = 0;
            image_speed = 0.16666666666666666;
            sprite_index = spr_gerson_idle;
        }
    }
}
if (state == 12)
{
    if (i_ex(obj_growtangle))
        depth = obj_growtangle.depth;
    image_index += 0.23333333333333334;
    draw_self();
    laughtimer++;
    if (laughtimer == 1)
        snd_play(snd_gerlaugh);
    if (laughtimer == 62)
    {
        laughtimer = 0;
        state = 0;
        if (attackpattern == 19)
            global.turntimer = 2;
    }
}
if (state == 13)
{
    draw_self();
    dodgetimer++;
    if (dodgetimer == 2)
    {
        attack = instance_create((global.monsterx[global.chartarget[myself]] + random(6)) - 20, global.monstery[global.chartarget[myself]] + random(6), obj_basicattack);
        attack.sprite_index = spr_attack_mash2;
        attack.image_speed = 0.5;
        attack.maxindex = 4;
        progress += 4;
        scr_tensionheal(60);
        snd_stop(motor_swing_down);
        image_alpha = 0;
        if (global.justice_attacked_twice < 2)
            global.justice_attacked_twice++;
        snd_play(snd_mercyadd);
        var xx = x + 88;
        var yy = y - 88;
        star = instance_create(xx - 20, yy - 10, obj_gerson_progress_star);
        star = instance_create(xx, yy, obj_gerson_progress_star);
        star.delay = 2;
        star = instance_create(xx + 18, yy + 18, obj_gerson_progress_star);
        star.delay = 4;
        star = instance_create(xx + 36, yy + 36, obj_gerson_progress_star);
        star.delay = 6;
    }
    if (dodgetimer == 3)
    {
        image_speed = 0.16666666666666666;
        image_alpha = 1;
        sprite_index = spr_gerson_dodge;
        image_xscale = 2;
        image_yscale = 2;
        x -= 40;
        y -= 30;
        speed = 16;
        friction = 4;
    }
    if (dodgetimer == 38)
    {
        dodgetimer = 0;
        state = 0;
        sprite_index = spr_gerson_idle;
        x -= 80;
    }
}
if (state == 14)
{
    spintimer++;
    if (spintimer < 10)
    {
        spinindex += (2/3);
        draw_sprite_ext(spr_gerson_spin_smear, spinindex, x + 55, y + 68, 2, image_yscale, image_angle, image_blend, image_alpha);
    }
    if (spintimer == 10)
    {
        spinindex = 0;
        snd_play(snd_mercyadd);
    }
    if (spintimer >= 10)
    {
        if (spinindex < 11)
            spinindex += 0.5;
        if (spinindex >= 11)
            spinindex += 0.25;
        if (spinindex > 13)
            spinindex = 13;
        draw_sprite_ext(spr_gerson_spin, spinindex, x + 48, y + 72, 2, image_yscale, image_angle, image_blend, image_alpha);
        if (saverudebusterstarcount > 0 && spintimer > 20 && (spintimer % 2) == 0)
        {
            saverudebusterstarcount--;
            progress++;
            instance_create(x + 10 + irandom(80), (y - 60) + irandom(40), obj_gerson_progress_star);
        }
    }
    if (spintimer == 50)
    {
        spintimer = 0;
        state = 0;
    }
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_halign(fa_left);
