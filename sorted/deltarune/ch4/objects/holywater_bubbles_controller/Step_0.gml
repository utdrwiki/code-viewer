if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (!i_ex(obj_heart))
{
    instance_destroy();
    exit;
}
timer++;
if (timer == 20)
    instance_destroy();
if (timer == 9 || timer == 12)
{
    if (obj_heart.press_u || obj_heart.press_d || obj_heart.press_l || obj_heart.press_r)
    {
        bubble = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_holywater_bubbles);
        bubble.direction = random(360);
        bubble.speed = 1;
        bubble.friction = 0.1;
        bubble.image_blend = image_blend;
    }
}
