var cx = camerax();
var cy = cameray();
if (layer1 != -1)
{
    x = ((cx + autoxinc1) * ss1) + xstart;
    y = ((cy + autoyinc1) * ssy1) + ystart;
    var newx = round(x);
    var newy = round(y);
    layer_x(layer1, newx);
    layer_y(layer1, newy);
}
if (layer2 != -1)
{
    x = ((cx + autoxinc2) * ss2) + xstart;
    y = ((cy + autoyinc2) * ssy2) + ystart;
    var newx = round(x);
    var newy = round(y);
    layer_x(layer2, newx);
    layer_y(layer2, newy);
}
if (layer3 != -1)
{
    x = ((cx + autoxinc3) * ss3) + xstart;
    y = ((cy + autoyinc3) * ssy3) + ystart;
    var newx = round(x);
    var newy = round(y);
    layer_x(layer3, newx);
    layer_y(layer3, newy);
}
if (layer4 != -1)
{
    x = ((cx + autoxinc4) * ss4) + xstart;
    y = ((cy + autoyinc4) * ssy4) + ystart;
    var newx = round(x);
    var newy = round(y);
    layer_x(layer4, newx);
    layer_y(layer4, newy);
}
