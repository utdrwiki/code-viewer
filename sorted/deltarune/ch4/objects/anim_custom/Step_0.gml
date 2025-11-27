if (target_obj == -4)
    exit;
if (!anim_active)
    exit;
anim_timer--;
if (anim_timer <= 0)
{
    anim_index++;
    if (anim_index < array_length(anim_timestamps))
    {
        anim_timer = anim_timestamps[anim_index] / anim_modifier;
        target_obj.image_index = anim_index;
        trigger_event("frame_change", anim_index);
    }
    else
    {
        stop();
    }
}
