if (using_rotating_caterpillars == false)
{
    if (obj_mainchara.y < 221)
    {
        using_rotating_caterpillars = true;
        with (obj_caterpillarchara)
        {
            var _a = 0;
            if (name == "susie")
            {
                susie_caterpillar = instance_create_depth(x, y, obj_mainchara.depth - 1, obj_rotating_tower_caterpillar);
                var _susie_yoffset = -1;
                for (var i = 0; i < instance_number(obj_caterpillarchara); i += 1)
                {
                    hero[i] = instance_find(obj_caterpillarchara, i);
                    if (hero[i].name == "susie")
                        _susie_yoffset = 480 - (hero[i].y - 220);
                }
                repeat (36)
                {
                    obj_rotating_tower_controller.yoffset_record[36 - _a] = lerp(_susie_yoffset, 480, _a / 36);
                    _a++;
                }
            }
            else
            {
                ralsei_caterpillar = instance_create_depth(x, y, obj_mainchara.depth - 2, obj_rotating_tower_caterpillar);
                ralsei_caterpillar.hero = "ralsei";
                var _ralsei_offset = -1;
                for (var i = 0; i < instance_number(obj_caterpillarchara); i += 1)
                {
                    hero[i] = instance_find(obj_caterpillarchara, i);
                    if (hero[i].name == "ralsei")
                        _ralsei_offset = 480 - (hero[i].y - 220);
                }
                repeat (36)
                {
                    obj_rotating_tower_controller.yoffset_record[72 - _a] = lerp(_ralsei_offset, obj_rotating_tower_controller.yoffset_record[36], _a / 36);
                    _a++;
                }
            }
            instance_destroy();
        }
    }
}
if (using_rotating_caterpillars == true)
{
    if (obj_mainchara.y > 220)
    {
        using_rotating_caterpillars = false;
        with (obj_rotating_tower_caterpillar)
        {
            if (hero == "susie")
                inst = scr_makecaterpillar(x, y, 2, 0);
            else
                scr_makecaterpillar(x, y, 3, 1);
            instance_destroy();
        }
    }
}
rising_shadow_x = 0;
var moveright = false;
var moveleft = false;
var moveup = false;
var movedown = false;
var falling = 0;
var canmove = true;
var yoffsettruestart = 740;
if (instance_exists(obj_tower_falling_kris_falls) && obj_tower_falling_kris_falls.con == 0)
    falling = 1;
if (room == room_dw_church_dogclimb)
    yoffsettruestart = 650;
if (room == room_dw_church_dogclimb && global.inv > 15)
    canmove = false;
if (endclimb == true)
{
    endclimbtimer++;
    if (endclimbtimer == 1)
        scr_pan_lerp(camerax(), cameray(), 80);
    if (endclimbtimer < 80)
    {
        yoffset += 4;
        obj_rotating_bg_controller.tunnel_offset_y += 2;
    }
    if (endclimbtimer == 80)
    {
        endclimbcon = 2;
        scr_pan_lerp(camerax(), -372, 40);
    }
}
if (endclimbcon < 2)
{
    if (obj_mainchara.y <= 220 || endclimb == true)
    {
        if (left_h() && falling == 0 && canmove == true)
        {
            if (obj_mainchara.run == 0)
            {
                tower_angle += 3;
                rising_shadow_x += 2;
            }
            if (obj_mainchara.run == 1)
            {
                tower_angle += 6;
                rising_shadow_x += 4;
            }
            moveleft = true;
        }
        if (right_h() && falling == 0 && canmove == true)
        {
            if (obj_mainchara.run == 0)
            {
                tower_angle -= 3;
                rising_shadow_x -= 2;
            }
            if (obj_mainchara.run == 1)
            {
                tower_angle -= 6;
                rising_shadow_x -= 4;
            }
            moveright = true;
            if (obj_mainchara.y >= 220 && obj_mainchara.y < 1500 && obj_rotating_tower_controller.yoffset <= (yoffsettruestart + 80))
            {
                if (tower_angle > 340 || tower_angle < 0)
                {
                    moveright = false;
                    tower_image_index = 0;
                }
            }
        }
    }
    if (obj_mainchara.y <= 220 || endclimb == true)
    {
        if (down_h() && falling == 0 && canmove == true)
        {
            if (obj_mainchara.run == 0)
                yoffset -= 2;
            if (obj_mainchara.run == 1)
                yoffset -= 5;
            movedown = true;
        }
        if (up_h() && falling == 0 && canmove == true)
        {
            if (obj_mainchara.run == 0)
                yoffset += 2;
            if (obj_mainchara.run == 1)
                yoffset += 5;
            moveup = true;
            if (endclimbtimer > 0 && endclimbtimer < 80)
            {
                if (obj_mainchara.run == 0)
                    obj_tower_dog.draw_y -= 2;
                if (obj_mainchara.run == 1)
                    obj_tower_dog.draw_y -= 5;
            }
        }
    }
    else
    {
        if (obj_mainchara.run == 0 && canmove == true)
            obj_rotating_bg_controller.tunnel_offset_y += ((up_h() - down_h()) * 1);
        if (obj_mainchara.run == 1 && canmove == true)
            obj_rotating_bg_controller.tunnel_offset_y += ((up_h() - down_h()) * 2);
    }
}
if (obj_mainchara.y != maincharayprevious || (endclimb == true && obj_tower_dog_controller.con == 6 && obj_mainchara.walk == 0))
{
    obj_mainchara.walkbuffer = 6;
    obj_mainchara.walktimer += 1.5;
    if (obj_mainchara.run == 1)
        obj_mainchara.walktimer += 1.5;
    maincharayprevious = obj_mainchara.y;
}
var kris_xpos, kris_xpos_prev;
if (wide_tower == false)
{
    kris_xpos = -1;
    if (tower_angle >= 20 && tower_angle < 70)
        kris_xpos = 7;
    if (tower_angle >= 335 || tower_angle < 25)
        kris_xpos = 6;
    if (tower_angle >= 65 && tower_angle < 115)
        kris_xpos = 0;
    if (tower_angle >= 110 && tower_angle < 160)
        kris_xpos = 1;
    if (tower_angle >= 155 && tower_angle < 205)
        kris_xpos = 2;
    if (tower_angle >= 200 && tower_angle < 250)
        kris_xpos = 3;
    if (tower_angle >= 245 && tower_angle < 295)
        kris_xpos = 4;
    if (tower_angle >= 290 && tower_angle < 340)
        kris_xpos = 5;
    kris_xpos_prev = -1;
    if (tower_angle_prev >= 20 && tower_angle_prev < 70)
        kris_xpos_prev = 7;
    if (tower_angle_prev >= 335 || tower_angle_prev < 25)
        kris_xpos_prev = 6;
    if (tower_angle_prev >= 65 && tower_angle_prev < 115)
        kris_xpos_prev = 0;
    if (tower_angle_prev >= 110 && tower_angle_prev < 160)
        kris_xpos_prev = 1;
    if (tower_angle_prev >= 155 && tower_angle_prev < 205)
        kris_xpos_prev = 2;
    if (tower_angle_prev >= 200 && tower_angle_prev < 250)
        kris_xpos_prev = 3;
    if (tower_angle_prev >= 245 && tower_angle_prev < 295)
        kris_xpos_prev = 4;
    if (tower_angle_prev >= 290 && tower_angle_prev < 340)
        kris_xpos_prev = 5;
}
else
{
    kris_xpos = -1;
    if (tower_angle >= 355 || tower_angle < 30)
        kris_xpos = 8;
    if (tower_angle >= 30 && tower_angle < 67)
        kris_xpos = 9;
    if (tower_angle >= 67 && tower_angle < 107)
        kris_xpos = 0;
    if (tower_angle >= 107 && tower_angle < 139)
        kris_xpos = 1;
    if (tower_angle >= 139 && tower_angle < 185)
        kris_xpos = 2;
    if (tower_angle >= 185 && tower_angle < 211)
        kris_xpos = 3;
    if (tower_angle >= 211 && tower_angle < 247)
        kris_xpos = 4;
    if (tower_angle >= 247 && tower_angle < 283)
        kris_xpos = 5;
    if (tower_angle >= 283 && tower_angle < 319)
        kris_xpos = 6;
    if (tower_angle >= 319 && tower_angle < 355)
        kris_xpos = 7;
    kris_xpos_prev = -1;
    if (tower_angle_prev >= 355 || tower_angle_prev < 30)
        kris_xpos_prev = 8;
    if (tower_angle_prev >= 30 && tower_angle_prev < 67)
        kris_xpos_prev = 9;
    if (tower_angle_prev >= 67 && tower_angle_prev < 107)
        kris_xpos_prev = 0;
    if (tower_angle_prev >= 107 && tower_angle_prev < 139)
        kris_xpos_prev = 1;
    if (tower_angle_prev >= 139 && tower_angle_prev < 180)
        kris_xpos_prev = 2;
    if (tower_angle_prev >= 180 && tower_angle_prev < 211)
        kris_xpos_prev = 3;
    if (tower_angle_prev >= 211 && tower_angle_prev < 247)
        kris_xpos_prev = 4;
    if (tower_angle_prev >= 247 && tower_angle_prev < 283)
        kris_xpos_prev = 5;
    if (tower_angle_prev >= 283 && tower_angle_prev < 319)
        kris_xpos_prev = 6;
    if (tower_angle_prev >= 319 && tower_angle_prev < 355)
        kris_xpos_prev = 7;
}
var kris_ypos = (494 - (round(yoffset / 40) - 12)) + round((obj_mainchara.y - 220) / 40);
if (kris_ypos > 500)
    exit;
var kris_ypos_prev = (494 - (round(yoffset_prev / 40) - 12)) + round((obj_mainchara.yprevious - 220) / 40);
if (kris_ypos_prev > 500)
    exit;
if (tower_object[kris_ypos_prev][kris_xpos] <= 0)
{
    obj_mainchara.x = obj_mainchara.xprevious;
    tower_angle = tower_angle_prev;
}
else
{
    if (moveleft == true)
    {
        obj_mainchara.walkbuffer = 6;
        if (obj_mainchara.run == 0)
            tower_image_index -= 0.3;
        if (obj_mainchara.run == 1)
            tower_image_index -= 0.6;
        for (var i = 0; i < towerpiececount; i++)
            tower_piece_image_index[i] += 1;
    }
    if (moveright == true)
    {
        if (obj_mainchara.run == 0)
            tower_image_index += 0.3;
        if (obj_mainchara.run == 1)
            tower_image_index += 0.6;
        for (var i = 0; i < towerpiececount; i++)
            tower_piece_image_index[i] -= 1;
    }
    if (tower_angle != tower_angle_prev && yoffset > 740)
    {
        obj_mainchara.walktimer += 1.5;
        if (obj_mainchara.run == 1)
            obj_mainchara.walktimer += 1.5;
    }
    if (obj_mainchara.run == 0 && canmove == true)
    {
        if (moveleft == true || moveright == true)
            obj_rotating_bg_controller.tunnel_offset_x += ((right_h() - left_h()) * 8);
    }
    if (obj_mainchara.run == 1 && canmove == true)
    {
        if (moveleft == true || moveright == true)
            obj_rotating_bg_controller.tunnel_offset_x += ((right_h() - left_h()) * 16);
    }
}
if (tower_object[kris_ypos][kris_xpos_prev] <= 0)
{
    obj_mainchara.y = obj_mainchara.yprevious;
    if (renderalt == false)
        yoffset = yoffset_prev;
}
else
{
    if (obj_mainchara.run == 0 && canmove == true && endclimbcon < 2)
    {
        if (moveup == true || movedown == true)
            obj_rotating_bg_controller.tunnel_offset_y += ((up_h() - down_h()) * 1);
    }
    if (obj_mainchara.run == 1 && canmove == true && endclimbcon < 2)
    {
        if (moveup == true || movedown == true)
            obj_rotating_bg_controller.tunnel_offset_y += ((up_h() - down_h()) * 2);
    }
    if (yoffset != yoffset_prev)
    {
        obj_mainchara.walktimer += 1.5;
        if (obj_mainchara.run == 1)
            obj_mainchara.walktimer += 1.5;
    }
    maincharayprevious = obj_mainchara.y;
    if (instance_exists(obj_cloud_controller))
    {
        if (movedown == true)
        {
            if (obj_mainchara.run == 0)
            {
                with (obj_cloud_controller)
                    y -= 2;
            }
            if (obj_mainchara.run == 1)
            {
                with (obj_cloud_controller)
                    y -= 5;
            }
        }
        if (moveup == true)
        {
            if (obj_mainchara.run == 0)
            {
                with (obj_cloud_controller)
                    y += 2;
            }
            if (obj_mainchara.run == 1)
            {
                with (obj_cloud_controller)
                    y += 5;
            }
        }
    }
}
if (wide_tower == false && tower_image_index < 0)
    tower_image_index = 3;
if (wide_tower == true && tower_image_index < 0)
    tower_image_index = 6;
if (obj_mainchara.y >= 220 && obj_mainchara.y < 1500 && yoffset < yoffsettruestart)
{
    repeat (10)
    {
    }
    if (tower_image_index > 0)
        tower_image_index = -1;
    if (tower_image_index < 0)
        tower_image_index += 1;
}
tower_angle_prev = tower_angle;
yoffset_prev = yoffset;
if (tower_angle > 360)
    tower_angle -= 360;
if (tower_angle < 0)
    tower_angle += 360;
