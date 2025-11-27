if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            other.kris = id;
    }
}
if (type == 0)
{
    if (obj_board_camera.con == 0)
    {
        timer++;
        if (bunny && timer < startWait)
        {
            if (i_ex(obj_board_playercamera))
                timer--;
        }
        if (timer == startWait)
        {
            image_alpha = 1;
            snd_stop(snd_board_splash);
            snd_play_pitch(snd_board_splash, 1.2);
            var leaves = instance_create(x, y, obj_board_afterimage);
            leaves.depth = depth - 1;
            with (leaves)
            {
                image_speed = 0.25;
                sprite_index = spr_board_shadowgunner_leaves;
                length = 8;
                gravity = 0.5;
                scr_darksize();
                image_xscale = other.image_xscale;
            }
        }
        if (bunny)
        {
            if (timer == (startWait + buntimer))
                instance_destroy();
        }
        if ((timer == (startWait + ((shootWait + shootRate) * 1)) || timer == (startWait + ((shootWait + shootRate) * 2)) || timer == (startWait + ((shootWait + shootRate) * 3))) && !bunny)
        {
            var bulx = x + 32;
            if (facing == 1)
                bulx -= 32;
            var buly = y + 22;
            var controlledplayer = 0;
            with (obj_mainchara_board)
            {
                if (controlled == 1)
                    controlledplayer = id;
            }
            var bul = instance_create(bulx, buly, obj_board_enemy_bullet);
            var dir = point_direction(bulx, buly, controlledplayer.x + 16, controlledplayer.y + 16);
            bul.direction = dir;
            bul.speed = 6;
            snd_stop(snd_noise);
            snd_play_pitch(snd_noise, 0.8);
        }
        if (timer == (startWait + ((shootWait + shootRate) * 3) + (shootWait * 2)))
            instance_destroy();
    }
    else if (image_alpha == 1 || i_ex(hat))
    {
        instance_destroy();
    }
    if (points == 1)
    {
        points = 0;
        var pointsval = 10;
        if (bunny)
            pointsval = 25;
        var pointsDisplay = instance_create(x + 16, y, obj_board_pointsGetDisplay);
        pointsDisplay.amount = pointsval;
        pointsDisplay.depth = depth - 1;
    }
    if (x < kris.x)
        facing = 0;
    else
        facing = 1;
}
if (type == 2)
{
    timer++;
    if (timer == 1)
        image_alpha = 1;
    if (timer == 10)
    {
        var bulx = x + 32;
        if (facing == 1)
            bulx -= 32;
        var buly = y + 22;
        var controlledplayer = 0;
        with (obj_mainchara_board)
        {
            if (controlled == 1)
                controlledplayer = id;
        }
        var randrage = irandom_range(-5, 5);
        for (var i = 0; i < 4; i++)
        {
            var bul = instance_create(bulx, buly, obj_board_enemy_bullet);
            bul.direction = ((-32 + (i * 16)) - 90) + 45 + (270 * facing) + randrage;
            bul.speed = 6;
        }
        snd_stop(snd_noise);
        snd_play_pitch(snd_noise, 0.8);
    }
    if (timer == 30)
        instance_destroy();
}
if (i_ex(obj_board_deathevent))
    instance_destroy();
if (obj_board_camera.shift != "none")
{
    safe_delete(hat);
    instance_destroy();
}
