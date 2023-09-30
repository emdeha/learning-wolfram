BeginPackage["TodoData`"];

AddTodo::usage = "AddTodo[item] adds a new to-do item.";
GetTodos::usage = "GetTodos[] returns the list of to-do items.";
RemoveTodo::usage = "RemoveTodo[index] removes the to-do item at the given index.";
ClearTodos::usage = "ClearTodos[] clears all to-do items.";

Begin["`Private`"];

cloudObject = CloudObject["todos"];

If[Quiet[CloudObjectInformation[cloudObject], CloudObject::cloudnf] =!= $Failed,
    (* If exists, retrieve todos from cloud storage *)
    todos = Quiet[CloudGet[cloudObject], CloudObject::nffil];
    If[!ListQ[todos], todos = {}],
    (* If not exists, initialize todos as an empty list *)
    todos = {}
];

(* Save todos to cloud storage *)
saveToCloud[] := CloudSave[todos, cloudObject];

AddTodo[item_String] := (AppendTo[todos, item]; saveToCloud[]);

GetTodos[] := todos;

RemoveTodo[index_Integer] /; 1 <= index <= Length[todos] := (todos = Delete[todos, index]; saveToCloud[]);

ClearTodos[] := (todos = {}; saveToCloud[]);

End[];

EndPackage[];
