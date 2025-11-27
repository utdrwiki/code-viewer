if (player == 0)
{
    with (obj_mainchara_board)
    {
        if (controlled == 1)
            other.player = id;
    }
}
if (premakeinit == 0)
{
    if (premake == "right")
    {
        debug_message("RIGHT SIDE");
        boulder = instance_create(-120 + irandom_range(-20, 20), 0 + irandom(60) + 20, obj_board_boulder);
        boulder.sprite_index = bouldersprite;
        boulder = instance_create(-40 + irandom_range(-20, 20), 0 + irandom(60), obj_board_boulder);
        boulder.sprite_index = bouldersprite;
    }
    if (premake == "left")
    {
        debug_message("LEFT SIDE");
        boulder = instance_create(760 + irandom_range(-20, 20), 0 + irandom(60) + 20, obj_board_boulder);
        boulder.sprite_index = bouldersprite;
        boulder = instance_create(680 + irandom_range(-20, 20), 0 + irandom(60), obj_board_boulder);
        boulder.sprite_index = bouldersprite;
    }
    if (premake == "vert")
    {
        debug_message("VERTICAL");
        boulder = instance_create(random_range(board_tilex(0), board_tilex(4)), -80 + random_range(-20, 40), obj_board_boulder);
        boulder.sprite_index = bouldersprite;
        boulder = instance_create(random_range(board_tilex(7), board_tilex(11)), -80 + random_range(-20, 40), obj_board_boulder);
        boulder.sprite_index = bouldersprite;
    }
    premakeinit = 1;
}
if (active == 1 && global.interact == 0)
{
    if (startedup == 0)
        startedup = 1;
    var dontmake = false;
    if (i_ex(obj_board_camera))
    {
        if (obj_board_camera.con != 0)
        {
            dontmake = true;
            with (obj_board_boulder)
                instance_destroy();
        }
    }
    if (init == 0 && dontmake == false)
    {
        timer = droprate - 1;
        boulder = instance_create(320 + irandom_range(-30, 30), 0 - irandom(60), obj_board_boulder);
        boulder.sprite_index = bouldersprite;
        if (irandom(100) == 72)
            boulder.sprite_index = rarebouldersprite;
        init = 1;
    }
    timer++;
    if (timer >= droprate && !dontmake)
    {
        boulder = instance_create(180 + irandom(320), 0 - irandom(40), obj_board_boulder);
        boulder.sprite_index = bouldersprite;
        if (irandom(100) == 72)
            boulder.sprite_index = rarebouldersprite;
        timer = 0 + irandom(dropratefluctuation);
    }
}
else
{
    startedup = 0;
    characterfinder = 0;
    if (daddy == 0)
        timer = 0;
}
if (premake == "vert")
{
    with (obj_board_boulder)
    {
        if (x >= board_tilex(4.5) && x <= board_tilex(7.5))
            x = choose(random_range(board_tilex(8.5), board_tilex(11)), random_range(board_tilex(0), board_tilex(3.5)));
    }
}
