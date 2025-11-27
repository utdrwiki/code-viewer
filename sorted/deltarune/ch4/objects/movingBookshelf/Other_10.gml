if (engaged == 0 && y == ystart)
{
    if (obj_mainchara.x > (x + (sprite_width / 2)))
        going = "left";
    else
        going = "right";
    panactive = 1;
    engaged = 1;
}
