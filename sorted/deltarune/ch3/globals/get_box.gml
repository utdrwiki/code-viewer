function scr_get_box(arg0)
{
    switch (arg0)
    {
        case 0:
            return obj_growtangle.x + (obj_growtangle.sprite_width * 0.5);
            break;
        case 1:
            return obj_growtangle.y - (obj_growtangle.sprite_height * 0.5);
            break;
        case 2:
            return obj_growtangle.x - (obj_growtangle.sprite_width * 0.5);
            break;
        case 3:
            return obj_growtangle.y + (obj_growtangle.sprite_height * 0.5);
            break;
        case 4:
            return obj_growtangle.x;
            break;
        case 5:
            return obj_growtangle.y;
            break;
            return false;
    }
}
