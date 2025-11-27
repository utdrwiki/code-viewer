grazepoints = 5;
if (fade == 0 && x > (obj_growtangle.x - (obj_growtangle.sprite_width / 2)) && x < (obj_growtangle.x + (obj_growtangle.sprite_width / 2)) && y > (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) && y < (obj_growtangle.y + (obj_growtangle.sprite_height / 2)))
    fade = 1;
if ((fade == 1 && (x < (obj_growtangle.x - (obj_growtangle.sprite_width / 2)) || x > (obj_growtangle.x + (obj_growtangle.sprite_width / 2)) || y < (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) || y > (obj_growtangle.y + (obj_growtangle.sprite_height / 2)))) || fade == 2)
{
    fade = 2;
    image_alpha -= 0.1;
}
event_inherited();
timer++;
if (con == 0)
{
    slowing--;
    if (timer <= 12)
    {
        image_xscale = lerp(0.2, 1, timer / 12);
        image_yscale = lerp(0.2, 1, timer / 12);
        x = lerp(xstart, owner.xstart - (20 * count), timer / 12);
    }
    if ((type == 0 && (y + vspeed) < (obj_growtangle.y - 90) && vspeed < 0) || (type == 1 && (y + vspeed) < (obj_growtangle.y + 90) && vspeed < 0))
    {
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
        if (type == 0)
            y = obj_growtangle.y - 90;
        if (type == 1)
            y = obj_growtangle.y + 90;
    }
    if (timer >= 12 && vspeed == 0)
    {
        con = 1;
        timer = 0;
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
    }
}
if (con == 1)
{
    if (count == 4)
    {
        with (obj_bullet_note)
        {
            if (type == other.type && con == 1)
            {
                timer = 0;
                con = 2;
            }
        }
    }
}
if (con == 2)
{
    if (timer <= 9)
        x = lerp(x, (obj_growtangle.x - 82) + (29 * (5 - count)), timer / 9);
    if (timer == 9)
        image_blend = c_white;
    if (timer == 12)
    {
        direction = scr_at_player((x - 45) + random(90), (y - 45) + random(90));
        speed = 7 - (count * 1);
    }
}
