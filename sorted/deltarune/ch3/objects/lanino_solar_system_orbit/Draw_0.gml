orbit_distance += orbit_expansion;
orbit_expansion = scr_approach(orbit_expansion, 1, (orbit_expansion - 1) * 0.075);
width *= 0.98;
if (orbit_distance > orbit_distancemax)
{
    opacity *= 0.85;
    if (i_ex(moon))
        moon.image_alpha *= 0.85;
    if (i_ex(moon2))
        moon2.image_alpha *= 0.85;
    if (opacity < 0.05)
    {
        if (i_ex(moon))
            instance_destroy(moon);
        if (i_ex(moon2))
            instance_destroy(moon2);
        instance_destroy();
        exit;
    }
}
orbit_angle += orbit_direction;
x2 = (x + (dcos(orbit_angle) * orbit_distance * hratio * cos(orbit_face))) - (-dsin(orbit_angle) * orbit_distance * vratio * sin(orbit_face));
y2 = y + (-dsin(orbit_angle) * orbit_distance * vratio * cos(orbit_face)) + (dcos(orbit_angle) * orbit_distance * hratio * sin(orbit_face));
draw_set_alpha(opacity);
if (i_ex(moon))
{
    if (moon.image_xscale < maxscale)
    {
        moon.image_xscale += scaler;
        moon.image_yscale += scaler;
    }
    moon.x = x1;
    moon.y = y1;
}
var x3 = (x + (dcos(orbit_angle + 180) * orbit_distance * hratio * cos(orbit_face))) - (-dsin(orbit_angle + 180) * orbit_distance * vratio * sin(orbit_face));
var y3 = y + (-dsin(orbit_angle + 180) * orbit_distance * vratio * cos(orbit_face)) + (dcos(orbit_angle + 180) * orbit_distance * hratio * sin(orbit_face));
if (i_ex(moon2))
{
    if (moon.image_xscale < maxscale)
    {
        moon2.image_xscale += scaler;
        moon2.image_yscale += scaler;
    }
    moon2.x = x3;
    moon2.y = y3;
}
for (a = 0; a < 91; a++)
{
    var angle = (4 * a) + orbit_angle;
    x1 = x2;
    y1 = y2;
    x2 = (x + (dcos(angle) * orbit_distance * hratio * cos(orbit_face))) - (-dsin(angle) * orbit_distance * vratio * sin(orbit_face));
    y2 = y + (-dsin(angle) * orbit_distance * vratio * cos(orbit_face)) + (dcos(angle) * orbit_distance * hratio * sin(orbit_face));
    if ((a % 2) < 1)
        draw_line_width_color(x1, y1, x2, y2, 1 + (width * abs(sin(degtorad(angle * 0.5)))), c_gray, c_gray);
}
draw_set_alpha(1);
