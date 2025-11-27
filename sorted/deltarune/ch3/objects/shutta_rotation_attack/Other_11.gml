if (difficulty >= 1)
{
    for (i = 0; i < listsize; i++)
    {
        with (bullets[i])
        {
            scr_pastebullet();
            if (v_ex("paused"))
                paused = false;
            direction += other.rotation;
            gravity_direction += other.rotation;
            image_blend = c_white;
            if (other.motion_blur && v_ex("afterimage"))
            {
                for (var _af = 0; _af < other.afterimage_count; _af++)
                    instance_destroy(afterimage[_af]);
            }
        }
    }
    hand_a_dist = point_distance(hand_a.x, hand_a.y, pivotx, pivoty);
    hand_b_dist = point_distance(hand_b.x, hand_b.y, pivotx, pivoty);
}
freeze = false;
