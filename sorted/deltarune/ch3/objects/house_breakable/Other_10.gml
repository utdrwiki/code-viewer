if (destroyed == 0)
{
    obj_susiezilla.smallbuildingsdestroyed++;
    if (obj_susiezilla.smallbuildingsdestroyed == 3)
    {
        collectible = instance_create(x + 16, y + 12, obj_susiezilla_collectible);
        collectible.depth = depth - 100;
        collectible.itemtype = 1;
        with (collectible)
            event_user(0);
    }
    if (obj_susiezilla.smallbuildingsdestroyed >= 6)
    {
        collectible = instance_create(x + 16, y + 12, obj_susiezilla_collectible);
        collectible.depth = depth - 100;
        collectible.itemtype = 9;
        with (collectible)
            event_user(0);
        obj_susiezilla.smallbuildingsdestroyed = 0;
    }
    destroyed = 1;
    repeat (11)
    {
        effect = instance_create(x + random(20), y + random(20), obj_house_placed_effect);
        effect.image_xscale = random_range(0.4, 0.5) * choose(-1, 1);
        effect.image_yscale = image_xscale * choose(-1, 1);
        effect = instance_create(x + random(20), y + random(20), obj_house_placed_effect);
        effect.image_xscale = random_range(0.4, 0.5) * choose(-1, 1);
        effect.image_yscale = image_xscale * choose(-1, 1);
    }
    image_index = 1;
    anim = instance_create(x + 16, y + 16, obj_animation);
    anim.sprite_index = spr_susiezilla_explosion1;
    anim.image_speed = 0.25;
    anim.image_xscale = 2;
    anim.image_yscale = 2;
    anim.depth = depth - 1000;
    snd_stop(snd_explosion_firework);
    snd_play(snd_explosion_firework);
}
