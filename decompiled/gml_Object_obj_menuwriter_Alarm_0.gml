obj_menuwriter.testwho = who
with (obj_menuwriter)
{
    if (active == true && testwho == who)
        instance_destroy()
}
active = true
