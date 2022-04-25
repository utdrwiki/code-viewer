obj_menuwriter_ch1.testwho = who
with (obj_menuwriter_ch1)
{
    if (active == true && testwho == who)
        instance_destroy()
}
active = true
