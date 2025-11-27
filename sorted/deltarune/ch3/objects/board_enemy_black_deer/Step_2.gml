if (active == false)
    exit;
bkx = 0;
bky = 0;
bkxy = 0;
xmeet = 0;
ymeet = 0;
xymeet = 0;
var lenient_x = px;
var lenient_y = py;
var _index = false;
if (place_meeting(x + px, y + py, obj_board_solid))
    xymeet = 1;
if (place_meeting(x + px, y, obj_board_solid))
{
    if (place_meeting(x + px, y, obj_board_solid))
    {
        for (g = wspeed; g > 0; g -= 1)
        {
            mvd = 0;
            if (press_d == 0 && !place_meeting(x + px, y - g, obj_board_solid))
            {
                y -= g;
                _index = true;
                py = 0;
                break;
                mvd = 1;
            }
            if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, obj_board_solid))
            {
                y += g;
                _index = true;
                py = 0;
                break;
            }
        }
    }
    xmeet = 1;
    bkx = 0;
    if (px > 0)
    {
        for (i = px; i >= 0; i -= 1)
        {
            if (!place_meeting(x + i, y, obj_board_solid))
            {
                px = i;
                bkx = 1;
                break;
            }
        }
    }
    if (px < 0)
    {
        for (i = px; i <= 0; i += 1)
        {
            if (!place_meeting(x + i, y, obj_board_solid))
            {
                px = i;
                bkx = 1;
                break;
            }
        }
    }
    if (bkx == 0)
        px = 0;
}
if (place_meeting(x, y + py, obj_board_solid))
{
    ymeet = 1;
    bky = 0;
    if (place_meeting(x, y + py, obj_board_solid))
    {
        for (g = wspeed; g > 0; g -= 1)
        {
            mvd = 0;
            if (press_r == 0 && !place_meeting(x - g, y + py, obj_board_solid))
            {
                x -= g;
                _index = true;
                px = 0;
                break;
                mvd = 1;
            }
            if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, obj_board_solid))
            {
                x += g;
                _index = true;
                px = 0;
                break;
            }
        }
    }
    if (py > 0)
    {
        for (i = py; i >= 0; i -= 1)
        {
            if (!place_meeting(x, y + i, obj_board_solid))
            {
                py = i;
                bky = 1;
                break;
            }
        }
    }
    if (py < 0)
    {
        for (i = py; i <= 0; i += 1)
        {
            if (!place_meeting(x, y + i, obj_board_solid))
            {
                py = i;
                bky = 1;
                break;
            }
        }
    }
    if (bky == 0)
        py = 0;
}
if (place_meeting(x + px, y + py, obj_board_solid))
{
    var block = instance_place(x + px, y + py, obj_board_solid);
    if (block.object_index == obj_pushableblock_board && block.jello == true)
    {
    }
    else
    {
        xymeet = 1;
        bkxy = 0;
        i = px;
        j = py;
        while (j != 0 || i != 0)
        {
            if (!place_meeting(x + i, y + j, obj_board_solid))
            {
                px = i;
                py = j;
                bkxy = 1;
                break;
            }
            if (abs(j) >= 1)
            {
                if (j > 0)
                    j -= 1;
                if (j < 0)
                    j += 1;
            }
            else
            {
                j = 0;
            }
            if (abs(i) >= 1)
            {
                if (i > 0)
                    i -= 1;
                if (i < 0)
                    i += 1;
            }
            else
            {
                i = 0;
            }
        }
        if (bkxy == 0)
        {
            px = 0;
            py = 0;
        }
    }
}
var lenient_amount = 8;
if (px == 0 && lenient_y == 0 && lenient_x > 0)
{
    var colllide_count = 0;
    for (i = 0; i <= 16; i += 1)
    {
        if (position_meeting(x + 32, (y + 32) - i, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        y -= wspeed;
        _index = true;
    }
    colllide_count = 0;
    for (i = 0; i <= 16; i += 1)
    {
        if (position_meeting(x + 32, y + 16 + i, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        y += wspeed;
        _index = true;
    }
}
if (px == 0 && lenient_y == 0 && lenient_x < 0)
{
    var colllide_count = 0;
    for (i = 0; i <= 16; i += 1)
    {
        if (position_meeting(x - 1, (y + 32) - i, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        y -= wspeed;
        _index = true;
    }
    colllide_count = 0;
    for (i = 0; i <= 16; i += 1)
    {
        if (position_meeting(x - 1, y + 16 + i, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        y += wspeed;
        _index = true;
    }
}
if (py == 0 && lenient_x == 0 && lenient_y > 0)
{
    lenient_amount = 12;
    var colllide_count = 0;
    for (i = 0; i <= 32; i += 1)
    {
        if (position_meeting((x + 32) - i, y + 32, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        x -= wspeed;
        _index = true;
    }
    colllide_count = 0;
    for (i = 0; i <= 32; i += 1)
    {
        if (position_meeting(x + i, y + 32, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        x += wspeed;
        _index = true;
    }
    lenient_amount = 8;
}
if (py == 0 && lenient_x == 0 && lenient_y < 0)
{
    var colllide_count = 0;
    for (i = 0; i <= 32; i += 1)
    {
        if (position_meeting((x + 32) - i, y, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        x -= wspeed;
        _index = true;
    }
    colllide_count = 0;
    for (i = 0; i <= 32; i += 1)
    {
        if (position_meeting(x + i, y, obj_board_solid))
            colllide_count = i;
    }
    if (colllide_count <= lenient_amount)
    {
        x += wspeed;
        _index = true;
    }
}
x += px;
y += py;
if (px != 0 || py != 0)
    image_index += 0.25;
px = 0;
py = 0;
press_r = 0;
press_l = 0;
press_d = 0;
press_u = 0;
if (obj_board_controller.kris_object.facing == 1)
    sprite_index = spr_board_deer_l_black;
if (obj_board_controller.kris_object.facing == 3)
    sprite_index = spr_board_deer_r_black;
if (sprite_index == spr_board_deer_r)
    hurt_sprite = spr_board_deer_r_hurt;
if (sprite_index == spr_board_deer_l)
    hurt_sprite = spr_board_deer_l_hurt;
if (toriel == true)
{
    sprite_index = spr_board_monster_black;
    hurt_sprite = spr_board_monster_angery;
}
