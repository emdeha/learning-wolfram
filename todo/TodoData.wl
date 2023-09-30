BeginPackage["TodoData`"];

AddTodo::usage = "AddTodo[item] adds a new to-do item.";
GetTodos::usage = "GetTodos[] returns the list of to-do items.";
RemoveTodo::usage = "RemoveTodo[index] removes the to-do item at the given index.";
ClearTodos::usage = "ClearTodos[] clears all to-do items.";

Begin["`Private`"];

todos = {};

AddTodo[item_String] := AppendTo[todos, item];

GetTodos[] := todos;

RemoveTodo[index_Integer] /; 1 <= index <= Length[todos] := todos = Delete[todos, index];

ClearTodos[] := (todos = {});

End[];

EndPackage[];
