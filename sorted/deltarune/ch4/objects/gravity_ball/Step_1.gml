for (var i = 4; i >= 1; i--)
{
    last_x[i] = last_x[i - 1];
    last_y[i] = last_y[i - 1];
}
last_x[0] = lerp(last_x[0], obj_mike_controller.mx, 0.25);
last_y[0] = lerp(last_y[0], obj_mike_controller.my + 24, 0.25);
