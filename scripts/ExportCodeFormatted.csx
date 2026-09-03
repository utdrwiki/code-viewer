using System.Text;
using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using Underanalyzer.Decompiler;

EnsureDataLoaded();

string codeFolder = Path.Combine(Path.GetDirectoryName(FilePath), "Export_Code");
Directory.CreateDirectory(codeFolder);

GlobalDecompileContext globalDecompileContext = new(Data);
// Cast for setters
DecompileSettings settings = new();
settings.RemoveSingleLineBlockBraces = true;
settings.OpenBlockBraceOnSameLine = false;
settings.EmptyLineAroundBranchStatements = false;

await Task.Run(() => Parallel.ForEach(
    Data.Code.Where(c => c.ParentEntry is null).ToList(),
    DumpCode
));

void DumpCode(UndertaleCode code)
{
    string path = Path.Combine(codeFolder, $"{code.Name.Content}.gml");
    string decompiled;
    try
    {
        decompiled = new DecompileContext(globalDecompileContext, code, settings)
            .DecompileToString();
    }
    catch (Exception e)
    {
        decompiled = $"/*\nDECOMPILER FAILED!\n\n{e.ToString()}\n*/";
    }
    File.WriteAllText(path, decompiled);
}
