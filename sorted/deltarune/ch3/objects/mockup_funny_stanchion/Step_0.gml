if (obj_mainchara.x >= (x - 60) && obj_mainchara.x < (x - 40))
    image_index = 1;
else if (obj_mainchara.x >= (x - 40) && obj_mainchara.x < (x - 20))
    image_index = 2;
else if (obj_mainchara.x >= (x - 20) && obj_mainchara.x <= (x + 20))
    image_index = 3;
else if (obj_mainchara.x <= (x + 40) && obj_mainchara.x > (x + 20))
    image_index = 4;
else if (obj_mainchara.x <= (x + 60) && obj_mainchara.x > (x + 40))
    image_index = 5;
else
    image_index = 0;
