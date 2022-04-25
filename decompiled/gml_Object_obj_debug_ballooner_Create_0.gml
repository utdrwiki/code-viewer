depth = -5000
timer = 0
global.interact = 1
scr_losechar()
safe_delete(obj_caterpillarchara)
scr_getchar(2)
scr_getchar(3)
scr_makecaterpillar(80, 130, 2, 0)
scr_makecaterpillar(80, 210, 3, 1)
with (obj_caterpillarchara)
    scr_caterpillar_interpolate()
muted = 0
xmod = 0
ymod = 0
marker1 = scr_dark_marker(294, 64, spr_dogcar)
marker2 = scr_dark_marker(230, 130, spr_dogcar)
marker3 = scr_dark_marker(295, 204, spr_dogcar)
text = "Here's my#test dialogue!"
if (!file_exists("ballooner.txt"))
{
    ini_open("ballooner.txt")
    ini_write_string("ballooner", "text", text)
    ini_close()
}
else
{
    ini_open("ballooner.txt")
    text = ini_read_string("ballooner", "text", text)
    ini_close()
}
