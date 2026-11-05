using System.Linq;
using System.Text.Json;

Console.Error.WriteLine(JsonSerializer.Serialize(new Dictionary<string, object>
{
    { "Objects", Data.GameObjects.Select(o => o.Name.Content) },
    { "Sprites", Data.Sprites.Select(s => s.Name.Content) },
    { "Rooms", Data.Rooms.Select(r => r.Name.Content) },
    {
        "Scripts",
        Data.Scripts
            .Where(s => s.Code?.ParentEntry is null)
            .Select(s => s.Name.Content)
    },
    { "Sounds", Data.Sounds.Select(s => s.Name.Content) },
    { "Fonts", Data.Fonts.Select(f => f.Name.Content) },
}));
