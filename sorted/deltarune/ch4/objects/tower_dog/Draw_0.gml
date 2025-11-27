var _angledifference = -angle_difference(obj_rotating_tower_controller_new.tower_angle, 315);
var xx = 0;
if (_angledifference >= 0 && _angledifference < 90)
    xx = lerp(0, 72, _angledifference / 90);
if (_angledifference >= 90 && _angledifference < 180)
    xx = lerp(72, 0, (_angledifference - 90) / 90);
if (_angledifference >= -90 && _angledifference < 0)
    xx = lerp(0, -72, abs(_angledifference) / 90);
if (_angledifference >= -180 && _angledifference < -90)
    xx = lerp(-72, 0, (abs(_angledifference) - 90) / 90);
var aaa = 50;
if (darkenalpha > 0.1)
    aaa = 40;
var _index = 4;
if (xx >= 56 && xx < 99)
    _index = 4;
else if (xx >= aaa && xx < 56)
    _index = 4;
else if (xx >= 26 && xx < aaa)
    _index = 3;
else if (xx >= 16 && xx < 26)
    _index = 2;
else if (xx >= -16 && xx < 16)
    _index = 2;
else if (xx >= -26 && xx < -16)
    _index = 2;
else if (xx >= (aaa * -1) && xx < 26)
    _index = 1;
else if (xx >= -56 && xx < (aaa * -1))
    _index = 0;
else if (xx >= -99 && xx < -56)
    _index = 0;
else
    _index = 6;
if (_angledifference >= 90 && _angledifference < 120)
    darkenalpha = lerp(0, 1, (_angledifference - 90) / 30);
if (_angledifference > -120 && _angledifference <= -90)
    darkenalpha = lerp(0, 1, (abs(_angledifference) - 90) / 30);
if (_angledifference >= 120 || _angledifference < -120)
    darkenalpha = 1;
if (_angledifference < 90 && _angledifference > -90)
    darkenalpha = 0;
introtimer++;
var draw_x = 560 + xx;
if (fallingoff == false)
{
    if (climbfaster == true)
    {
        draw_y -= 4;
        index += 0.5;
        if (obj_rotating_tower_controller_new.endclimbtimer >= 80)
            draw_y -= 4;
        draw_x = 320 + xx;
        if (obj_climb_kris.y >= (cameray() + cameraheight()))
        {
            obj_climb_kris.forceclimb = false;
            global.interact = 1;
        }
    }
    else if (cameray() < 5300)
    {
        if (alarm[0] > 30)
        {
            draw_y -= 6;
            index += 0.5;
        }
        if (draw_y > (cameray() + 480))
        {
            draw_y -= 8;
            index += 0.5;
        }
        else if (draw_y < (cameray() - 50))
        {
            draw_y -= 0.25;
            index += 0.16666666666666666;
        }
        else if (draw_y < (cameray() + 300) && introtimer > 150)
        {
            draw_y -= 2;
            index += 0.16666666666666666;
        }
        else
        {
            draw_y -= 2;
            index += (1/3);
            alarm[0] = 60;
        }
    }
    else if (draw_y >= (cameray() + 430))
    {
        draw_y -= 5;
        index += 0.5;
    }
    else if (draw_y <= (cameray() - 250))
    {
        draw_y -= 0;
        index += 0.16666666666666666;
    }
    else if (draw_y <= (cameray() - 50))
    {
        draw_y -= 0.25;
        index += 0.16666666666666666;
    }
    else if (draw_y <= (cameray() + 250) && introtimer > 150)
    {
        draw_y -= 2;
        index += 0.16666666666666666;
    }
    else
    {
        draw_y -= 5.5;
        index += (1/3);
    }
    if (index >= 6)
        index = 0;
}
var _sprite = spr_dog_climb1;
if (index < 1)
    _sprite = spr_dog_climb1;
else if (index < 2)
    _sprite = spr_dog_climb2;
else if (index < 3)
    _sprite = spr_dog_climb3;
else if (index < 4)
    _sprite = spr_dog_climb4;
else if (index < 5)
    _sprite = spr_dog_climb5;
else if (index < 6)
    _sprite = spr_dog_climb6;
if (fallingoff == true)
{
    draw_x += (-1 + irandom(2));
    timer++;
    if ((timer % 15) == 0)
    {
        anim = instance_create(draw_x + 20, draw_y + 10, obj_animation);
        anim.sprite_index = spr_sweat_anim;
        anim.image_xscale = -1;
        anim.image_yscale = 1;
        anim.image_speed = 1/3;
        anim.depth = depth;
        snd_play(snd_swallow);
    }
    if (i_ex(obj_animation))
    {
        obj_animation.x = draw_x + 20;
        obj_animation.y = draw_y + 10;
    }
    if (timer == 20)
    {
        instance_destroy();
        dogfall = instance_create_depth(draw_x, draw_y, depth, obj_tower_dog_falls);
        dogfall.vspeed = 2;
        dogfall.gravity = 0.5;
        dogfall.image_xscale = 2;
        dogfall.image_yscale = 2;
        dogfall.image_speed = 0;
        dogfall.sprite_index = _sprite;
        dogfall.image_index = _index;
        snd_play(snd_fall);
    }
}
draw_sprite_ext(_sprite, _index, draw_x, draw_y, 2, 2, 0, c_white, 1);
d3d_set_fog(true, c_black, 0, 1);
draw_sprite_ext(_sprite, _index, draw_x, draw_y, 2, 2, 0, c_white, darkenalpha);
d3d_set_fog(false, c_black, 0, 0);
if (obj_rotating_tower_controller_new.endclimb == false)
{
    if (_angledifference > 90 || _angledifference < -90)
        depth = obj_rotating_tower_controller_new.depth + 40;
    else
        depth = obj_mainchara.depth - 2;
}
