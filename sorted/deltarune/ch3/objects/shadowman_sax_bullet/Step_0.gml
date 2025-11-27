if (init == 0)
{
    init = 1;
    timer = 2;
    path_start(bulletPath, 21, path_action_stop, false);
}
if (spawnrate >= 0)
{
    if (spawntimer == spawnrate)
    {
        d = scr_childbullet(x, y, obj_shadowman_sax_bullet_trail);
        d.grazepoints = childgraze;
        d.image_angle = direction - 180;
        spawntimer = 0;
    }
    else
    {
        spawntimer++;
    }
}
image_angle = direction - 180;
if (x < (obj_growtangle.x - 140))
    image_alpha -= 0.1;
