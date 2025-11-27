with (obj_dw_church_bookshelfpuzzle)
{
}
if (engaged)
    obj_mainchara.depth = depth - 1;
if (camcont)
{
    camerax_set(clamp(desiredx, 0, room_width - 320));
    cameray_set(clamp(desiredy, 0, room_height - 240));
}
