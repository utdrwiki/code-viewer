if (target == -4)
    exit;
if (!init)
{
    init = true;
    if (flip)
        center_angle = -15;
    target_sprite = target.sprite_index;
    if (auto_offset)
    {
        offset.x = (target.sprite_width / 2) - target.sprite_xoffset;
        offset.y = (target.sprite_height / 2) - target.sprite_yoffset;
    }
    if (auto_x)
        x = target.x + offset.x;
}
direction = point_direction(x, y, target.x + offset.x, target.y + offset.y);
direction = round(direction);
image_angle = direction - 270;
