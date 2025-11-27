scr_depth();
timer = 0;
var cloud = instance_create(x + 148, y + 78, obj_castle_cafe_cloud);
with (cloud)
{
    basew = 20;
    baseh = 15;
    bmodtw = 25;
    bmodth = 40;
    extw = 8;
    exth = 4;
}
var cloud2 = instance_create((x + 148) - 10, (((y + 78) - 20) + 10) - 6, obj_castle_cafe_cloud);
with (cloud2)
{
    basew = 12;
    baseh = 6;
    bmodtw = 32;
    bmodth = 48;
    exth = 6;
    extw = 2;
}
var cloud3 = instance_create((((x + 148) - 10) + 36) - 8, (((((y + 78) - 20) + 10) - 6) + 30) - 8, obj_castle_cafe_cloud);
with (cloud3)
{
    basew = 12;
    baseh = 6;
    bmodtw = 28;
    bmodth = 44;
    exth = 6;
    extw = 2;
}
