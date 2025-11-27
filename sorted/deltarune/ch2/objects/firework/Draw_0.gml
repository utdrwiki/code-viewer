switch (colorProfile)
{
    case UnknownEnum.Value_2:
        hue += 3;
        hue %= 255;
        image_blend = make_colour_hsv(hue, 255, 255);
        break;
    default:
        break;
}
draw_self();

enum UnknownEnum
{
    Value_2 = 2
}
