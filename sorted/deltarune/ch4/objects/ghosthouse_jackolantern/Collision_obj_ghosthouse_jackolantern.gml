if (polite == 1 && point_distance(x, y, other.x, other.y) < 35)
{
    explosion = instance_create(x, y, obj_animation);
    explosion.image_xscale = 2;
    explosion.image_yscale = 2;
    snd_play(snd_badexplosion);
    explosion.sprite_index = spr_realisticexplosion;
    instance_destroy();
    other.polite = -3.75;
}
