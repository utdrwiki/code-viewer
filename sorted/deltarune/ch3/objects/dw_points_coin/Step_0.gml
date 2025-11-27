if (is_collected)
    exit;
if (place_meeting(x, y, obj_mainchara))
{
    is_collected = true;
    collect_points();
}
