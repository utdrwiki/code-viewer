timer++;
if (wavy == true)
    y += (sin(timer / 2) * wavyrate);
if (eraseall == true)
{
    for (var i = 0; i < array_length(drawarray); i++)
    {
        with (drawarray[i])
            instance_destroy();
    }
    array_resize(drawarray, 0);
    eraseall = false;
}
x = round(x / 2) * 2;
y = round(y / 2) * 2;
