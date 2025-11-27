if (type == 1)
{
    if (y > (room_height + 240))
        instance_destroy();
}
particletimer++;
if (particletimer > 8 && (drawlamp || drawparts))
{
    var vanparticlepresentsjohnnybravogoestobollywood = instance_create(random_range(x - sprite_width - 10, x + sprite_width + 10), y - random(200), obj_dw_transition_particle);
    vanparticlepresentsjohnnybravogoestobollywood.image_blend = c_maroon;
    vanparticlepresentsjohnnybravogoestobollywood.image_alpha = 1;
    vanparticlepresentsjohnnybravogoestobollywood.depth = 5000;
    if (type == 1)
        vanparticlepresentsjohnnybravogoestobollywood.depth = depth;
    particletimer = 0;
}
if (type != 0)
{
    if (givepoints)
    {
        if (pointsbuffer < 0)
        {
            if (i_ex(obj_mainchara))
            {
                if (x > camerax() && x < (camerax() + 640))
                {
                    if (y > cameray() && y < (cameray() + 480))
                    {
                        if (abs(y - obj_mainchara.y) < 180)
                        {
                            if (abs(obj_mainchara.x - (x + 60)) < 10)
                            {
                                if (obj_mainchara.wspeed > 12)
                                {
                                    snd_play_x(snd_barrel_jump, 0.8, 2);
                                    var pointsmarker = instance_create(x + 60, obj_mainchara.y - 40, obj_chefs_100pts);
                                    pointsmarker.image_alpha = 0.8;
                                    pointsmarker.sprite_index = spr_chefs_plus1;
                                    global.flag[1044] += 1;
                                    with (object_index)
                                        pointsbuffer = 4;
                                    givepoints = 0;
                                }
                            }
                        }
                    }
                }
            }
        }
        else
        {
            pointsbuffer--;
        }
    }
}
