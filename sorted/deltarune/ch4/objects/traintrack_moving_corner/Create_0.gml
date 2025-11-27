event_inherited();
track_sprite = 1767;
switch (image_angle)
{
    case 0:
        center_x = x + 5;
        center_y = y + 5;
        break;
    case 90:
        center_x = x + 5;
        center_y = y - 5;
        break;
    case 180:
        center_x = x - 5;
        center_y = y - 5;
        break;
    case 270:
        center_x = x - 5;
        center_y = y + 5;
        break;
}
