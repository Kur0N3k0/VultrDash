import json

def capitalize(var):
    if "_" in var:
        while "_" in var:
            idx = var.index("_")
            var = var[:idx] + var[idx + 1:].capitalize()
    return var

data = json.load(open("./types.json"))
for name in data:
    with open(f"./api/model/{name}.dart", "w") as f:
        code = "import 'common.dart';\nimport 'dart:ffi';\n\n"
        for clsname in data[name]:
            code += f"class {clsname} {{" + "\n"
            items = list(data[name][clsname].items())
            for varitem in items:
                var, typ = varitem
                if var == "required":
                    continue
                var = capitalize(var)
                code += f"  {typ} {var};" + "\n"
            code += "\n"
            
            code += f"  {clsname}.fromJson(Map<String, dynamic> json)" + "\n"
            c = False
            if "String" == items[0][1] or "bool" == items[0][1] or "int" == items[0][1] or "Uint32" == items[0][1]:
                code += f"    : {capitalize(items[0][0])} = json['{items[0][0]}']," + "\n"
            elif "List<String>" == items[0][1]:
                code += f"    : {capitalize(items[0][0])} = new List<String>.from(json['{items[0][0]}'])," + "\n"
            else:
                tcls = items[0][1].split("<")
                typ = tcls[0]
                if typ == "List":
                    code += f"    : {capitalize(items[0][0])} = (json['{items[0][0]}'] as List).map((e) => {tcls[1][:-1]}.fromJson(e)).toList()," + "\n"
                elif typ == "Map":
                    code += f"    : {capitalize(items[0][0])} = Map<{tcls[1][:-1]}>.from(json['{items[0][0]}'])," + "\n"
                elif typ == "MetaModel":
                    code += f"    : {capitalize(items[0][0])} = {typ}.fromJson(json['{items[0][0]}'])," + "\n"
                else:
                    code += f"    : {capitalize(items[0][0])} = {typ}.fromJson(json['{items[0][0]}'])," + "\n"
            for varitem in items[1:]:
                if varitem[0] == "required":
                    continue
                tcls = varitem[1].split("<")
                typ = tcls[0]
                if "String" == varitem[1] or "bool" == varitem[1] or "int" == varitem[1] or "Uint32" == varitem[1]:
                    code += f"      {capitalize(varitem[0])} = json['{varitem[0]}']," + "\n"
                elif "List<String>" == varitem[1]:
                    code += f"      {capitalize(varitem[0])} = new List<String>.from(json['{varitem[0]}'])," + "\n"
                else:
                    if typ == "List":
                        code += f"      {capitalize(varitem[0])} = (json['{varitem[0]}'] as List).map((e) => {tcls[1][:-1]}.fromJson(e)).toList()," + "\n"
                    elif typ == "Map":
                        code += f"      {capitalize(varitem[0])} = Map<{tcls[1][:-1]}>.from(json['{varitem[0]}'])," + "\n"
                    elif typ == "MetaModel":
                        code += f"      {capitalize(varitem[0])} = {typ}.fromJson(json['{varitem[0]}'])," + "\n"
                    else:
                        code += f"      {capitalize(varitem[0])} = {typ}.fromJson(json['{varitem[0]}'])," + "\n"
            code = code[:-2] + ";\n\n"
            
            code += "  Map<String, dynamic> toJson() => {\n"
            for varitem in items:
                if varitem[0] == "required":
                    continue
                code += f"    \"{varitem[0]}\": {capitalize(varitem[0])},\n"
            code = code[:-2] + "\n"
            code += "  };\n"
            code += "}\n\n"
        f.write(code)