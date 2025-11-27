if (global.turntimer < 14)
{
    timer = 0;
    con = 3;
    active = 0;
    image_alpha = 0.5;
    with (obj_bell_spin_attack_trail)
        visible = false;
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        gravity_direction = 90;
        gravity = 1;
    }
    if (timer < 10)
        x = lerp(x, (obj_growtangle.x + obj_growtangle.sprite_width) - 40, timer / 9);
    if (y < ((obj_growtangle.y - (obj_growtangle.sprite_height / 2) - vspeed) + 10))
    {
        gravity = 0;
        vspeed = 0;
    }
    if (timer == 9)
    {
        x = (obj_growtangle.x + obj_growtangle.sprite_width) - 40;
        timer = 0;
        con = 1;
        gravity = 0;
        vspeed = 0;
        alarm[0] = 15;
        targety = (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 30 + irandom(130);
        if (choose(1, 2, 3, 4) == 1)
            targety = obj_heart.y + 10;
    }
}
if (con == 1 && alarm[0] <= 0)
{
    timer++;
    if (timer < 16)
    {
        y = lerp(y, targety, 0.1);
    }
    else if (timer <= 30)
    {
        savepos--;
        y = saveypos[savepos];
    }
    if (timer >= 0 && timer <= 16)
    {
        saveypos[savepos] = y;
        savepos++;
    }
    x = lerp((obj_growtangle.x + obj_growtangle.sprite_width) - 40, (obj_growtangle.x - obj_growtangle.sprite_width) + 40, timer / 30);
    if (timer == 30)
    {
        timer = 0;
        con = 2;
        savepos = 0;
        alarm[0] = 15;
        targety = (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 30 + irandom(130);
        if (choose(1, 2, 3, 4) == 1)
            targety = obj_heart.y + 10;
    }
}
if (con == 2 && alarm[0] <= 0)
{
    timer++;
    if (timer < 16)
    {
        y = lerp(y, targety, 0.1);
    }
    else if (timer <= 30)
    {
        savepos--;
        y = saveypos[savepos];
    }
    if (timer >= 0 && timer <= 16)
    {
        saveypos[savepos] = y;
        savepos++;
    }
    x = lerp((obj_growtangle.x - obj_growtangle.sprite_width) + 40, (obj_growtangle.x + obj_growtangle.sprite_width) - 40, timer / 30);
    if (timer == 30)
    {
        timer = 0;
        con = 1;
        savepos = 0;
        alarm[0] = 15;
        targety = (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 30 + irandom(130);
        if (choose(1, 2, 3, 4) == 1)
            targety = obj_heart.y + 10;
    }
}
if (con == 3 && alarm[0] <= 0)
{
    x = lerp(x, xstart, 0.22);
    y = lerp(y, ystart, 0.22);
}
trailtimer++;
if (trailtimer >= 1 && x < ((obj_growtangle.x + (obj_growtangle.sprite_width / 2)) - 3) && x > ((obj_growtangle.x - (obj_growtangle.sprite_width / 2)) + 3) && y < (obj_growtangle.y + (obj_growtangle.sprite_height / 2)) && y > (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) && active == 1)
{
    trailtimer = 0;
    trail = instance_create(x, y - 18, obj_bell_spin_attack_trail);
    trail.x1 = savex;
    trail.y1 = savey - 10;
    trail.x2 = x;
    trail.y2 = y - 10;
    trail.depth = depth + 1;
    if (instance_number(obj_bell_spin_attack_trail) <= 1)
        trail.visible = false;
    savex = x;
    savey = y;
}
else
{
    savex = x;
    savey = y;
}
