if (linked_char == obj_mainchara.id)
{
    var _xoff = 0;
    if (global.facing == 1)
        image_xscale = -2;
    if (global.facing == 3)
        image_xscale = 2;
    _xoff = -6 * image_xscale;
    if (sprite_index == spr_treasurebox)
        _xoff = -10 * image_xscale;
    x = linked_char.x + _xoff + (linked_char.sprite_width / 2);
    y = (linked_char.y - 28) + sin(linked_char.image_index * 2);
    depth = linked_char.depth - 1;
}
if (type == 1)
    scale = scr_approach(scale, 2, 0.25);
