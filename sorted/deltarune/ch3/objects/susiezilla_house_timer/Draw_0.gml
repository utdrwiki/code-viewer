var housecount = 0;
for (var i = 0; i < instance_number(obj_susiezilla_house_single); i++)
{
    house[i] = instance_find(obj_susiezilla_house_single, i);
    if (house[i].myhealth > 0)
        housecount++;
}
if (!i_ex(obj_susiezilla_gamecontroller))
{
    instance_destroy();
    exit;
}
if (con == 1)
{
    image_alpha -= 0.1;
    if (housecount > 0 && image_alpha == -0.3)
        obj_tenna_enemy.minigamefailcount++;
    if (failcount > 1 && image_alpha == -0.6)
        obj_tenna_enemy.minigamefailcount++;
    if (failcount > 2 && image_alpha == -0.9)
        obj_tenna_enemy.minigamefailcount++;
    if (image_alpha == -0.3)
    {
        with (obj_susiezilla_house_single)
        {
            dontsayperfect = true;
            if (myhealth > 0)
            {
                anim = instance_create(x + 20, y, obj_animation);
                anim.sprite_index = spr_tenna_x;
                anim.image_speed = 0;
                anim.image_index = 1;
                anim.speed = 8;
                anim.direction = 90;
                anim.friction = 1;
                with (anim)
                {
                    scr_afterimage_grow();
                    afterimage.speed = speed;
                    afterimage.direction = direction;
                    afterimage.friction = friction;
                }
                other.failcount++;
                scr_shakeobj();
            }
            myhealth = 0;
        }
    }
}
var houseexists = false;
for (var i = 0; i < instance_number(obj_susiezilla_house_single); i++)
{
    house[i] = instance_find(obj_susiezilla_house_single, i);
    if (house[i].myhealth > 0)
        houseexists = true;
}
if (timer < 60)
{
    timer += (1/3);
    clocktimer++;
}
else
{
    obj_susiezilla_gamecontroller.time_counter = 30;
}
