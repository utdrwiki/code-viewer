if (!i_ex(obj_growtangle))
{
    instance_destroy();
    exit;
}
if (global.turntimer <= 2)
{
    mascot[0].image_alpha = 0;
    mascot[1].image_alpha = 0;
    exit;
}
if (i_ex(obj_growtangle))
{
    var xx = obj_growtangle.x;
    var yy = obj_growtangle.y;
    siner++;
    if (attacktype >= 0)
    {
        if (con == 0)
        {
            if (dummy == true)
            {
                mascot[0] = scr_dark_marker(xx + 51 + 130, yy, ms[1][0]);
                mascot[1] = scr_dark_marker((xx - 51) + 130, yy, ms[0][0]);
                mascot[0].image_xscale = mascot[0].image_xscale * -1;
                mascot[1].image_xscale = mascot[1].image_xscale * -1;
            }
            else
            {
                mascot[0] = scr_dark_marker(xx + 72, yy - 116, ms[0][0]);
                mascot[1] = scr_dark_marker(xx - 72, yy - 116, ms[1][0]);
            }
            if (attacktype == 1)
            {
                mascot[favored].image_xscale = 2.25;
                mascot[favored].image_yscale = 2.25;
            }
            if (attacktype == 2)
            {
                for (var i = 0; i < 2; i++)
                {
                    if (favored == i)
                    {
                        mascot[i].image_xscale = 1.7;
                        mascot[i].image_yscale = 1.7;
                        mascot[i].sprite_index = ms[i][2];
                        mascot[i].y -= 10;
                    }
                    else
                    {
                        mascot[i].image_xscale = 1.5;
                        mascot[i].image_yscale = 1.5;
                        mascot[i].sprite_index = ms[i][4];
                        mascot[i].y += 10;
                        mascot[i].x -= 30 * facing[i];
                    }
                }
            }
            if (attacktype == 3)
            {
                chasecon = 0;
                for (var i = 0; i < 2; i++)
                {
                    if (favored == i)
                    {
                        mascot[i].image_xscale = 2;
                        mascot[i].image_yscale = 2;
                        mascot[i].sprite_index = ms[i][2];
                        mascot[i].y -= 16;
                        mascot[i].direction = 90 + (90 * facing[favored]);
                        mascot[i].speed = 6;
                    }
                    else
                    {
                        mascot[i].image_xscale = 1;
                        mascot[i].image_yscale = 1;
                        mascot[i].sprite_index = ms[i][4];
                        mascot[i].y += 20;
                        mascot[i].image_xscale *= -1;
                        mascot[i].direction = 90 + (90 * facing[favored]);
                        mascot[i].speed = 4.4;
                        mascot[i].image_speed = 0.5;
                    }
                }
            }
            if (attacktype == 4)
            {
                for (var i = 0; i < 2; i++)
                {
                    if (favored == i)
                    {
                        mascot[i].image_xscale = 2;
                        mascot[i].image_yscale = 2;
                        mascot[i].sprite_index = ms[i][3];
                        mascot[i].y -= 16;
                        mascot[i].direction = 90 + (90 * facing[favored]);
                        mascot[i].x = xx;
                    }
                    else
                    {
                        mascot[i].image_xscale = 1;
                        mascot[i].image_yscale = 1;
                        mascot[i].sprite_index = ms[i][6];
                        mascot[i].y -= 20;
                        mascot[i].image_xscale *= -1;
                        mascot[i].direction = 90 + (90 * facing[favored]);
                        mascot[i].speed = 0;
                        mascot[i].image_speed = 0.5;
                        mascot[i].x = xx - 120;
                    }
                }
            }
            con = 1;
        }
        if (con == 1)
        {
            for (var i = 0; i < 2; i++)
            {
                if (i_ex(mascot[i]))
                {
                    if (attacktype == 0 || attacktype == 1)
                    {
                        if (!(attacktype == 1 && favored == i))
                        {
                            mascot[i].x -= sin(siner / 8) * facing[i];
                            mascot[i].x -= facing[i] / 10;
                            if (siner == 162 && attacktype == 0 && dummy == false)
                                mascot[i].sprite_index = ms[i][1];
                        }
                    }
                    else if (attacktype == 2)
                    {
                        if (favored != i)
                            mascot[i].x += (0.2 * facing[i]) + random_range(-1, 1);
                        else
                            mascot[i].x += (sin(siner / 6) * 3) - (0.3 * facing[i]);
                    }
                    else if (attacktype == 3)
                    {
                        var turning = 0;
                        var threshold = 140;
                        if (i != favored)
                            threshold = 110;
                        if (mascot[i].x < (xx - threshold))
                            turning = 1;
                        if (mascot[i].x > (xx + threshold))
                            turning = 1;
                        if (mascot[i].y < (yy - threshold))
                            turning = 1;
                        if (mascot[i].y > (yy + threshold))
                            turning = 1;
                        if (turning)
                        {
                            mascot[i].x += -mascot[i].hspeed;
                            mascot[i].y += -mascot[i].vspeed;
                            mascot[i].image_angle += 90 * facing[favored];
                            mascot[i].direction += 90 * facing[favored];
                        }
                    }
                    else if (attacktype == 4)
                    {
                        if (global.turntimer > 250)
                        {
                            if (i == favored)
                                mascot[i].x = xx + (sin(siner / 3) * 3) + (cos(siner / 7) * 2);
                        }
                    }
                }
            }
            if (siner == 168 && attacktype == 0 && dummy == false)
            {
                var heartmarker = scr_dark_marker(xx, yy - 120, spr_ch3_bullet_heart);
                heartmarker.vspeed = -6;
                heartmarker.friction = 0.334;
                scr_doom(heartmarker, 32);
                scr_lerpvar_instance(heartmarker, "image_alpha", 3, 0, 32);
            }
            shotrate[0] = 11;
            shotrate[1] = 11;
            if (encounterno == 113)
            {
                shotrate[0] = 11;
                shotrate[1] = 11;
            }
            if (i_ex(obj_elnina_rematch_enemy) && !i_ex(obj_bullet_blocker) && !i_ex(obj_elnina_umbrella))
            {
                shotrate[0] = 8;
                shotrate[1] = 8;
            }
            var randomhspeed = 2 + random(3);
            var randomvspeed = 1 + random(3.2);
            if (attacktype == 1)
                shotrate[favored] = 11;
            if (attacktype == 2)
            {
                shotrate[0] = 14 + extrabulletrate;
                shotrate[1] = 14 + extrabulletrate;
                shotrate[favored] = 8;
                randomhspeed += (0.2 + random(0.5));
                randomvspeed += (0.2 + random(0.5));
            }
            if (attacktype == 3)
            {
                shotrate[0] = 13 + extrabulletrate;
                shotrate[1] = 13 + extrabulletrate;
                shotrate[favored] = 6 + extrabulletrate;
            }
            if (attacktype == 4)
            {
                shotrate[0] = 21 + extrabulletrate;
                shotrate[1] = 21 + extrabulletrate;
                shotrate[favored] = 7 + extrabulletrate;
                if (global.hp[1] >= (global.maxhp[1] / 2))
                    shotrate[favored] = 6 + extrabulletrate;
                if (global.turntimer < 500)
                {
                    shotrate[favored] = (65 + extrabulletrate) - (global.turntimer / 10);
                    if (global.turntimer <= 250)
                        shotrate[favored] = 9999;
                    mus_volume(global.batmusic[0], (global.turntimer / 500) - 0.2, 0);
                    with (mascot[favored])
                    {
                        image_speed = 0;
                        image_index = 0;
                        sprite_index = other.ms[other.favored][7];
                        if (global.turntimer < 350)
                            image_index = 1;
                        if (global.turntimer < 200)
                            image_index = 2;
                    }
                }
            }
            shottimer[0]++;
            shottimer[1]++;
            for (var i = 0; i < 2; i++)
            {
                if (i_ex(mascot[i]) && dummy == false)
                {
                    if (shottimer[i] >= shotrate[i])
                    {
                        var mybullet = instance_create(mascot[i].x, mascot[i].y, obj_regularbullet_elnina);
                        mybullet.hspeed = randomhspeed * facing[i];
                        mybullet.vspeed = randomvspeed;
                        mybullet.gravity_direction = 90 + (90 * facing[i]);
                        mybullet.gravity = 0.2;
                        mybullet.sprite_index = bs[3 - (i * 2)];
                        mybullet.element = 5;
                        if (attacktype == 2)
                            mybullet.grazepoints = 3;
                        if (attacktype == 3)
                            mybullet.grazepoints = 3;
                        if (i_ex(obj_dbulletcontroller))
                            mybullet.target = obj_dbulletcontroller.target;
                        if (type == 1)
                            mybullet.sprite_index = bs[5];
                        if (type == 2)
                            mybullet.sprite_index = bs[1];
                        if (type == 3)
                            mybullet.sprite_index = bs[4];
                        if (type == 4)
                            mybullet.sprite_index = bs[3];
                        if (i == 0)
                        {
                            if (laninobulletsprite == 1474)
                                mybullet.sprite_index = bs[4];
                            if (laninobulletsprite == 783)
                                mybullet.sprite_index = bs[3];
                        }
                        if (i == 1)
                        {
                            if (elninabullesprite == 4255)
                                mybullet.sprite_index = bs[5];
                            if (elninabullesprite == 1650)
                                mybullet.sprite_index = bs[1];
                        }
                        var a = 0;
                        if (i_ex(obj_elnina_umbrella))
                            a = obj_elnina_umbrella.mercy * 2;
                        if (i_ex(obj_lanino_rematch_enemy))
                        {
                            if ((global.mercymod[obj_lanino_rematch_enemy.myself] + global.mercymod[obj_elnina_rematch_enemy.myself] + a) > 100)
                                firebulletcount = 20;
                            if ((global.mercymod[obj_lanino_rematch_enemy.myself] + global.mercymod[obj_elnina_rematch_enemy.myself] + a) > 198)
                                firebulletcount = 12;
                        }
                        bulletcount++;
                        if (bulletcount >= firebulletcount)
                        {
                            mybullet.sprite_index = spr_lanino_fire;
                            mybullet.image_blend = c_red;
                            mybullet.image_xscale = 2;
                            mybullet.image_yscale = 2;
                        }
                        if (bulletcount >= (firebulletcount + 3))
                            bulletcount = 0;
                        if (attacktype == 1 && favored == i)
                        {
                            mybullet.image_xscale = 1.25;
                            mybullet.image_yscale = 1.25;
                        }
                        if (attacktype == 2)
                        {
                            if (favored == i)
                            {
                                mybullet.image_xscale = 1.5;
                                mybullet.image_yscale = 1.5;
                            }
                            else
                            {
                                mybullet.image_xscale = 0.8;
                                mybullet.image_yscale = 0.8;
                            }
                        }
                        if (attacktype == 3)
                        {
                            mybullet.direction = (mascot[i].image_angle - (80 * facing[i])) + random_range(-10, 10);
                            if (favored != i)
                                mybullet.direction = mascot[i].image_angle + (50 * facing[i]) + random_range(-10, 10);
                            if (favored == 1)
                                mybullet.direction += 180;
                            mybullet.speed = 2.5;
                            mybullet.gravity = 0.2;
                            mybullet.gravity = 0;
                            mybullet.friction = -0.1;
                            if (favored == i)
                            {
                                mybullet.image_xscale = 2;
                                mybullet.image_yscale = 2;
                                mybullet.speed = 1;
                                mybullet.direction = point_direction(mybullet.x, mybullet.y, xx, yy) + (15 * facing[i]);
                            }
                            else
                            {
                                mybullet.image_xscale = 1;
                                mybullet.image_yscale = 1;
                                mybullet.direction = point_direction(mybullet.x, mybullet.y, xx, yy) + random_range(-35, 35);
                            }
                        }
                        if (attacktype == 4)
                        {
                            if (favored != i)
                            {
                                with (mybullet)
                                    visible = 0;
                                with (mybullet)
                                    instance_destroy();
                                with (mascot[i])
                                {
                                    image_alpha -= 0.05;
                                    image_xscale -= 0.05;
                                    image_yscale -= 0.05;
                                    x += random_range(-2, 2);
                                    y += random_range(-2, 2);
                                }
                            }
                            if (favored == i)
                            {
                                var maxscale = 3;
                                if (shotrate[i] > 5)
                                    maxscale = clamp(3 - (shotrate[i] / 10), 0.5, 3);
                                scr_lerpvar_instance(mybullet, "image_xscale", 1, maxscale, 60, 2, "out");
                                scr_lerpvar_instance(mybullet, "image_yscale", 1, maxscale, 60, 2, "out");
                                mybullet.gravity_direction = choose(0, 180);
                                mybullet.gravity = 0.2;
                                mybullet.direction = mybullet.gravity_direction + 180;
                                mybullet.speed = 8;
                                mybullet.vspeed = 0.5 + random(3);
                                mybullet.y += 10;
                                with (mybullet)
                                {
                                    scr_doom(mybullet, 100);
                                    scr_lerpvar_instance(mybullet, "image_alpha", 8, 0, 100, 0, "in");
                                }
                            }
                        }
                        if (attacktype < 4)
                        {
                            scr_doom(mybullet, 80);
                            scr_lerpvar_instance(mybullet, "image_alpha", 8, 0, 70, 0, "in");
                        }
                        shottimer[i] = 0;
                    }
                }
            }
        }
    }
}
