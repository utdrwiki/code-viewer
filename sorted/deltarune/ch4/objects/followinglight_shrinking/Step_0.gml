if (light_con == 0)
{
    if (obj_mainchara.y >= 550)
        light_con = 1;
}
if (light_con == 1)
{
    radius = scr_movetowards(radius, 200, 2);
    edge_right = 21;
    edge_left = 54;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            target = 11;
        else if (name == "ralsei")
            target = 22;
    }
    if (obj_mainchara.y >= 1150)
        light_con = 2;
}
if (light_con == 2)
{
    radius = scr_movetowards(radius, 180, 2);
    edge_right = 20;
    edge_left = 55;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            target = 10;
        else if (name == "ralsei")
            target = 20;
    }
    if (obj_mainchara.y >= 1580)
        light_con = 3;
}
if (light_con == 3)
    radius = scr_movetowards(radius, 160, 2);
if (light_con == 4)
    radius = scr_movetowards(radius, 200, 2);
siner++;
smallerLight = (sin(siner / 30) * 10) + radius;
biggerLight = (sin((siner - 10) / 30) * 10) + radius + 40;
