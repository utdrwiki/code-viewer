with (creator)
    visible = 1;
with (creatorid)
{
    image_alpha = 1;
    image_angle = 0;
    transitioncon = 4;
    transitiontimer = 0;
    string_top_y = ystart + 40;
    stringcon = 0;
    stringcount = 1;
    stringindex = 0;
    state = 10;
    x = xstart;
    y = ystart;
    depth = other.creatordepthsave;
}
scr_lerpvar_instance(obj_growtangle.id, "image_yscale", obj_growtangle.image_yscale, 2, 20);
scr_lerpvar_instance(obj_growtangle.id, "y", obj_growtangle.y, obj_growtangle.y - 18.75, 20);
