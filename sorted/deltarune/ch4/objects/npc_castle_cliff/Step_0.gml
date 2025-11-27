if (remove_shine)
{
    remove_shine = false;
    if (shine != -4)
    {
        with (shine)
            instance_destroy();
    }
}
