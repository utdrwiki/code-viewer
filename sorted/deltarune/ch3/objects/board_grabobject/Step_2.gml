if (con == 0 && init == 1)
{
    if (instance_exists(grabdaddy))
    {
        x = grabdaddy.x;
        y = grabdaddy.y;
    }
    with (marker)
    {
        x = other.x;
        y = other.y - 26;
    }
}
if (instance_exists(shadowmarker))
{
    if (fakey < -25)
        image_index = 1;
    else
        image_index = 0;
    shadowmarker.x = round(x / 2) * 2;
    shadowmarker.y = round(y / 2) * 2;
}
