if (con == 0)
{
    con = 1;
    snd_play_pitch(snd_paper_rise, 1.3);
    if (hspeed > 0)
    {
        splash = instance_create(x, obj_heart.y + 8, obj_holywater_splash);
        splash.image_angle = 270;
        splash.parentid = id;
        splash.image_blend = merge_color(c_aqua, c_aqua, 0.5);
        if (type == 0)
            splash.image_blend = merge_color(c_orange, c_orange, 0.5);
    }
    else
    {
        splash = instance_create(x, obj_heart.y + 8, obj_holywater_splash);
        splash.image_angle = 90;
        splash.parentid = id;
        splash.image_blend = merge_color(c_aqua, c_aqua, 0.5);
        if (type == 0)
            splash.image_blend = merge_color(c_orange, c_orange, 0.5);
    }
    if ((type == 0 && obj_heart.x == obj_heart.xprevious && obj_heart.y == obj_heart.yprevious) || (type == 1 && (obj_heart.x != obj_heart.xprevious || obj_heart.y != obj_heart.yprevious)))
    {
        if (target != 3)
            scr_damage();
        if (target == 3)
            scr_damage_all();
    }
    else
    {
        with (parentid)
        {
            scr_mercyadd(myself, 20);
            if (global.monsterstatus[myself] != 1)
                scr_monster_make_tired(myself);
        }
        with (obj_halo_enemy)
            scr_mercyadd(myself, 20);
    }
    if (hspeed > 0)
    {
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.hspeed = -1;
        bubble.friction = 0.2 + (random(10) / 100);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.hspeed = -4;
        bubble.friction = 0.2 + (random(10) / 100);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.hspeed = -2.5;
        bubble.friction = 0.2 + (random(10) / 100);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
        bubble = instance_create(x, y, obj_holywater_bubbles_controller);
        bubble.hspeed = -1 - random(3);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
    }
    else
    {
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.hspeed = 1;
        bubble.friction = 0.2 + (random(10) / 100);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.hspeed = 2.5;
        bubble.friction = 0.2 + (random(10) / 100);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.hspeed = 4;
        bubble.friction = 0.2 + (random(10) / 100);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
        bubble = instance_create(x, y, obj_holywater_bubbles_controller);
        bubble.hspeed = 1 + random(3);
        bubble.image_blend = c_aqua;
        if (type == 0)
            bubble.image_blend = c_orange;
    }
}
