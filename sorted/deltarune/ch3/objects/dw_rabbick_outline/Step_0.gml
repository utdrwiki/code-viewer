scr_depth();
if (movecon == 0)
{
    image_speed = 0.1;
    direction = choose(90, 180, 270, 0);
    speed = 1;
    move_timer = 30 + random(30);
    movecon = 1;
}
if (movecon == 1)
{
    move_timer--;
    if (move_timer <= 0)
    {
        movecon = 2;
        move_timer = 30 + random(180);
        hspeed = 0;
        vspeed = 0;
        image_speed = 0;
        image_index = round(image_index);
    }
}
if (movecon == 2)
{
    move_timer--;
    if (move_timer <= 0)
        movecon = 0;
}
