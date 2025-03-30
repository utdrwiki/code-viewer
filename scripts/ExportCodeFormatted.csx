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
DecompileSettings decompilerSettings = new();
decompilerSettings.RemoveSingleLineBlockBraces = true;
decompilerSettings.OpenBlockBraceOnSameLine = false;
decompilerSettings.EmptyLineAroundBranchStatements = false;

List<UndertaleCode> toDump = Data.Code.Where(c => c.ParentEntry is null).ToList();

await DumpCode();

ScriptMessage($"Export Complete.\n\nDumped {toDump.Count}/{Data.Code.Count} entries.\nLocation: {codeFolder}");

async Task DumpCode()
{
    await Task.Run(() => Parallel.ForEach(toDump, DumpCode));
}

void DumpCode(UndertaleCode code)
{
    if (code is not null)
    {
        string path = Path.Combine(codeFolder, code.Name.Content + ".txt");
        try
        {
            File.WriteAllText(path, (code != null 
                ? new DecompileContext(globalDecompileContext, code, decompilerSettings).DecompileToString() 
                : ""));
        }
        catch (Exception e)
        {
            File.WriteAllText(path, "/*\nDECOMPILER FAILED!\n\n" + e.ToString() + "\n*/");
        }
    }
}
