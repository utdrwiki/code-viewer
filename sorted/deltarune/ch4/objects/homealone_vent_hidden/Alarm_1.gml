var loader = instance_create(0, 0, obj_homealone_vent_loader);
loader.load_room = room_name;
loader.load_vent = vent_name;
if (fade_music)
    mus_volume(global.currentsong[1], 0, 14);
room_goto(room_name);
