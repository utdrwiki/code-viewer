depth = 6000;
var spawn_points = [new Vector2(62, 48), new Vector2(60, 186)];
var max_particles = 24;
if (room == room_lw_noellehouse_vents_south)
{
    spawn_points = [new Vector2(100, 68), new Vector2(100, 168)];
    max_particles = 90;
}
var heart_depth = depth;
if (i_ex(obj_homealone_heart))
    heart_depth = obj_homealone_heart.depth;
for (var i = 0; i < array_length_1d(spawn_points); i++)
{
    var spawn_point = spawn_points[i];
    for (var j = 0; j < max_particles; j++)
    {
        var new_particle = instance_create(spawn_point.x + (j * 8) + random_range(0, 10), spawn_point.y + choose(-1, 0, 1), obj_homealone_vent_airflow_particle);
        var size_big = random(100) > 60;
        new_particle.sprite_index = size_big ? spr_homealone_vent_air_particle_big : spr_homealone_vent_air_particle_small;
        new_particle.speed_multipler = size_big ? random_range(0.6, 0.8) : random_range(0.9, 1);
        new_particle.image_speed = 0;
        new_particle.depth = (random(100) > 30) ? depth : (heart_depth + 10);
    }
}
