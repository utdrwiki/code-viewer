if (i_ex(obj_heart))
{
    heart_active = true;
    if (obj_heart.sprite_index == spr_dodgeheart_small)
    {
        x = obj_heart.x + 4;
        y = obj_heart.y + 4;
    }
    else if (obj_heart.sprite_index == spr_dodgeheart_long)
    {
        x = obj_heart.x + 14;
        y = obj_heart.y + 4;
    }
    else
    {
        x = obj_heart.x + 10;
        y = obj_heart.y + 10;
    }
}
else
{
    heart_active = false;
}
if (heart_active)
    current_radius = scr_movetowards(current_radius, radius, radius / 15);
else
    current_radius = scr_movetowards(current_radius, -40, radius / 15);
