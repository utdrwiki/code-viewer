if (squishbox == true && i_ex(obj_heart) && i_ex(obj_growtangle))
{
    if (obj_heart.x < (obj_growtangle.x - 210))
        obj_heart.x = obj_growtangle.x - 210;
    if (obj_heart.x > ((obj_growtangle.x + 215) - 20))
        obj_heart.x = (obj_growtangle.x + 215) - 20;
    if (obj_heart.y < (obj_growtangle.y - 37))
        obj_heart.y = obj_growtangle.y - 37;
    if (obj_heart.y > ((obj_growtangle.y + 37) - 20))
        obj_heart.y = (obj_growtangle.y + 37) - 20;
}
