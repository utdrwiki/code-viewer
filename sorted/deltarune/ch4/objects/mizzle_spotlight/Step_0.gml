timer++;
if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (i_ex(obj_heart))
    depth = obj_heart.depth + 1;
