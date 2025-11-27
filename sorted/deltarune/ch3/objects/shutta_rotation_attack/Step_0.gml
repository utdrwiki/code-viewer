if (!init || con == -1)
{
    if (!init)
    {
        with (obj_dbulletcontroller)
            ratio = 1;
    }
    if (difficulty >= 2)
    {
        freeze = false;
        motion_blur = true;
        var _xrel = irandom_range(-1, 1);
        var _yrel = irandom_range(-1, 1);
        var _fixed_target = false;
        if (attacktype == 77)
        {
            pivotx = obj_growtangle.x + -50;
            pivoty = obj_growtangle.y;
            _fixed_target = true;
            targetx = obj_growtangle.x;
            targety = obj_growtangle.y + (50 * rotSign);
            edit_time = 30;
            lerp_time = 30;
            if (difficulty != 4)
                other_controller.swing = 12;
            if (difficulty >= 2)
                other_controller.special = 4;
            if (difficulty >= 3)
                controller.rate = 90;
        }
        else if (attacktype == 147)
        {
            pivotx = obj_growtangle.x + (_xrel * 75);
            pivoty = obj_growtangle.y + (_yrel * 75);
            with (obj_dbulletcontroller)
                btimer = 0;
        }
        else if (attacktype == 145)
        {
            pivotx = obj_growtangle.x;
            pivoty = obj_growtangle.y;
        }
        else
        {
            pivotx = obj_growtangle.x + (_xrel * 50);
            pivoty = obj_growtangle.y + (_yrel * 50);
        }
        x = pivotx;
        y = pivoty;
        if (!_fixed_target)
        {
            if (_xrel == 0 && _yrel == 0)
            {
                targetx = obj_growtangle.x + choose(-50, 50);
                targety = obj_growtangle.y + choose(-50, 50);
            }
            else
            {
                targetx = obj_growtangle.x - choose(0, _xrel * 50);
                targety = obj_growtangle.y - choose(0, _yrel * 50);
            }
        }
    }
    if (difficulty == 1)
    {
        shotsize += 40;
        padding += 20;
    }
    if (difficulty >= 3)
        multiple = true;
    if (multiple && !special_timing)
    {
        edit_time = 20;
        wait_time = 5;
    }
    if (motion_blur)
        alarm[0] -= afterimage_count * afterimage_interval;
    init = true;
}
if (handlerp < 1 && con < 3)
{
    handlerp += (1/15);
    var _handease = scr_ease_out(handlerp, 2);
    hand_a.x = (x - (75 * rotSign)) + (lerp(-80, -padding - 5, _handease) * rotSign);
    hand_a.y = (y - 75) + lerp(-80, -padding - 5, _handease);
    hand_a.image_alpha = handlerp / 2;
    hand_b.x = x + (75 * rotSign) + (lerp(80, padding + 5, _handease) * rotSign);
    hand_b.y = y + 75 + lerp(80, padding + 5, _handease);
    hand_b.image_alpha = handlerp / 2;
}
if (con == 2 || con == 3)
    event_user(2);
if (con == 4)
{
    with (border)
    {
        if (image_alpha > 0)
            image_alpha = scr_movetowards(image_alpha, 0, 0.1);
    }
    if (handlerp < 2)
    {
        handlerp += (1/15);
        var _handease = scr_ease_out(handlerp - 1, 3);
        var _baserot_a = rotation + 90;
        var _baserot_b = rotation - 90;
        hand_a.x = pivotx + lengthdir_x(lerp(hand_a_dist, hand_a_dist + 20, _handease), _baserot_a + (45 * rotSign));
        hand_a.y = pivoty + lengthdir_y(lerp(hand_a_dist, hand_a_dist + 20, _handease), _baserot_a + (45 * rotSign));
        if (multiple)
            hand_a.image_alpha = 1 - (handlerp - 1);
        hand_b.x = pivotx + lengthdir_x(lerp(hand_b_dist, hand_b_dist + 20, _handease), _baserot_b + (45 * rotSign));
        hand_b.y = pivoty + lengthdir_y(lerp(hand_b_dist, hand_b_dist + 20, _handease), _baserot_b + (45 * rotSign));
        hand_b.image_alpha = 1 - (handlerp - 1);
        if (handlerp >= 2)
            instance_destroy();
    }
}
