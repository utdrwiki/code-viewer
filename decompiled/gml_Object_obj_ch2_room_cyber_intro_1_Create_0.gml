con = -1
if (global.plot < 50)
{
    con = 1
    scr_losechar()
    if instance_exists(obj_caterpillarchara)
        instance_destroy(obj_caterpillarchara)
    scr_getchar(2)
    scr_makecaterpillar((obj_mainchara.x - 40), obj_mainchara.y, 2, 0)
}
else
    instance_destroy()
