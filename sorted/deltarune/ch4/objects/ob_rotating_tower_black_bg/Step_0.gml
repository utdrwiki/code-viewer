depth = 1000001;
if (room == room_dw_church_dogclimb)
{
    if (obj_tower_dog_controller.con == 2)
    {
        if (obj_tower_dog_controller.timer < 10 && image_alpha > 0)
            image_alpha -= 0.1;
        if (obj_tower_dog_controller.timer > 25 && image_alpha < 1)
            image_alpha += 0.1;
    }
    else if ((i_ex(obj_rotating_tower_controller) && obj_rotating_tower_controller.endclimb == true) || i_ex(obj_tower_dog_stilts2))
    {
        if (image_alpha < 0)
            image_alpha = 0;
        image_alpha += 0.05;
    }
    else if (obj_mainchara.y >= 600)
    {
        image_alpha = 1;
    }
    else if (obj_mainchara.y < 600 && obj_tower_dog_controller.con == 6)
    {
        image_alpha = (obj_mainchara.y - 500) / 100;
    }
    else if (obj_mainchara.y <= 500 && obj_tower_dog_controller.con == 6)
    {
        image_alpha = 0;
    }
}
else
{
    if (obj_mainchara.y >= 1000)
        image_alpha = 1;
    if (obj_mainchara.y < 1000)
        image_alpha = (obj_mainchara.y - 900) / 100;
    if (obj_mainchara.y <= 900)
        image_alpha = 0;
}
