if (hittable == 0)
{
    image_angle -= 4;
    exit;
}
if (type == 0 || type == 1)
{
    x = parentid.x;
    y = parentid.y;
    image_index = parentid.image_index + 0.25;
}
if (type == 2)
{
    sinerx += sinerrate;
    sinery += sinerrate;
    hspeed = sin(sinerx / 12) * 2;
    vspeed = cos(sinerx / 12) * 2;
    y += (parentid.y - parentid.yprevious);
}
if (type == 3)
{
    sinerx++;
    if (sinerx == 1)
    {
        x = obj_tenna_board4_enemy.tenna_actor.x + 20;
        y = obj_tenna_board4_enemy.tenna_actor.y - 186;
    }
}
if (type == 4)
{
    if (i_ex(obj_actor_tenna))
    {
        var lightemuptimer = obj_actor_tenna.lightemuptimer;
        var lightemupcon = obj_actor_tenna.lightemupcon;
        if (lightemupcon == 0 || lightemupcon == 1 || lightemupcon == 2)
        {
            mask_index = spr_tenna_battle_face;
            x = obj_actor_tenna.x;
            y = obj_actor_tenna.y;
        }
        if (lightemupcon == 3 && lightemuptimer < 20)
        {
            mask_index = spr_tenna_attack_hitbox;
            x = obj_actor_tenna.x - 4;
            y = obj_actor_tenna.y + 30;
        }
        if (lightemupcon == 3 && lightemuptimer >= 20)
        {
            mask_index = spr_tenna_attack_hitbox2;
            x = obj_actor_tenna.x - 4;
            y = obj_actor_tenna.y + 30;
        }
        if (lightemupcon == 4)
        {
            mask_index = spr_tenna_grasp_hitbox;
            x = obj_actor_tenna.x;
            y = obj_actor_tenna.y;
        }
        sprite_index = mask_index;
    }
}
if (type == 5)
{
    bullet_timer++;
    var hardmode = 0;
    if (obj_tenna_enemy.alreadydidsharpshoot)
        hardmode = 1;
    x = camerax() + 700;
    mask_index = spr_nothing;
    if (init == 0 && i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    {
        init = 1;
        if (obj_tenna_zoom.minigameinsanitytimermax <= 40)
        {
            var _ra = choose(-80, 80);
            if (i_ex(obj_lightemup_controller))
            {
                if (_ra == -80)
                    obj_lightemup_controller.extravar = -1;
                if (_ra == 80)
                    obj_lightemup_controller.extravar = 7;
            }
            bul = instance_create(x - 100, cameray() + 180 + _ra, obj_tenna_lightemup_bullet);
            bul.mysprite = 1561;
            bul.hspeed = -15;
            bul.friction = -0.1;
            bul.image_xscale = 1;
            bul.image_yscale = 1;
            bul.auto = 1;
            bul.hp = 2;
        }
        else
        {
            repeat (2)
            {
                bul = instance_create((x - 140) + irandom(50) + 70, cameray() + 180 + random_range(-80, 80), obj_tenna_lightemup_bullet);
                bul.mysprite = 1561;
                bul.hspeed = -8;
                bul.friction = -0.1;
                bul.vspeed = choose(-4, -6, -8);
                bul.auto = 1;
                bul.bounce = 1;
                bul.image_xscale = 1.5;
                bul.image_yscale = 1.5;
                bul.hp = 3;
            }
        }
    }
    if (bullet_timer == 20)
    {
        y = cameray() + 180 + random_range(-100, 60);
        vspeed = random_range(-3, 3);
        if (hardmode)
            myspeed = random_range(-10, -4);
        else
            myspeed = random_range(-8, -2);
        rem1 = choose(3, 4, 6, 8);
        if (hardmode == 0)
            reml = choose(4, 6, 8);
    }
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    {
    }
    else if (bullet_timer >= 20)
    {
        if ((bullet_timer % rem1) == 0)
        {
            bul = instance_create(x, y, obj_tenna_lightemup_bullet);
            bul.mysprite = 1561;
            bul.hspeed = myspeed;
            bul.friction = -0.1;
            bul.image_xscale = 1;
            bul.image_yscale = 1;
            bul.auto = 1;
            bul.hp = 2;
            if (rem1 == 8)
            {
                bul.vspeed = choose(-4, -6, -8);
                bul.hspeed += 1;
                bul.bounce = 1;
                bul.image_xscale = 1.5;
                bul.image_yscale = 1.5;
                bul.hp = 4;
            }
            if (firstbullet == 0 && obj_tenna_enemy.alreadydidsharpshoot == false)
            {
                bul.firstbullet = 1;
                bul.friction = 0.1;
                bul.hspeed = -8;
                bul.x = camerax() + camerawidth() + 40;
                bul.y = cameray() + 160;
                firstbullet++;
            }
            if (bullet_timer >= 28)
                bullet_timer = floor(random(8)) + 4;
        }
    }
}
if (type == 6)
{
    x = parentid.x;
    y = parentid.y;
    image_index += 0.25;
    image_speed = 0;
    depth = parentid.depth;
    mask_index = spr_zapper_sharpshoot2;
    if (sprite_index == spr_zapper_spare_sharpshoot)
        mask_index = spr_zapper_spare_sharpshoot;
    if ((global.mercymod[parentid.myself] + parentid.sharpshootmercy) >= 100 && spare == false)
        mask_index = spr_nothing;
    if (changecolorcon == 1)
    {
        colortarget2 = make_color_hsv(irandom(255), 250, 255);
        if (changecolorcount == 5)
            colortarget2 = 16777215;
        changecolorcon = 2;
    }
    if (changecolorcon == 2)
    {
        changecolortimer++;
        buttonblend = merge_color(colortarget, colortarget2, changecolortimer / 3);
        if (changecolortimer == 3)
        {
            colortarget = colortarget2;
            changecolorcount++;
            changecolorcon = 1;
            changecolortimer = 0;
        }
    }
    if (changecolorcount == 5)
    {
        buttonblend = 16777215;
        changecolorcon = 0;
        changecolorcount = 0;
        changecolortimer = 0;
    }
}
if (type == 7)
{
    x = parentid.x;
    y = parentid.y;
    image_speed = 0;
    depth = parentid.depth;
    mask_index = spr_pippins_sharpshoot;
    if ((global.mercymod[parentid.myself] + parentid.sharpshootmercy) >= 100 && spare == false)
        mask_index = spr_nothing;
    if (sprite_index == spr_pippins_sharpshoot2)
    {
        image_index += 0.5;
        if (image_index >= 5)
        {
            image_index = 0;
            sprite_index = spr_pippins_sharpshoot;
        }
    }
}
if (type == 8)
{
    x = parentid.x;
    y = parentid.y;
    image_speed = 0;
    depth = parentid.depth;
    mask_index = spr_shutta_sharpshoot2;
    image_index += 0.16666666666666666;
    if (image_index >= 5)
        image_index = 0;
    if ((global.mercymod[parentid.myself] + parentid.sharpshootmercy) >= 100 && spare == false)
        mask_index = spr_nothing;
}
