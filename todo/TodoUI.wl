BeginPackage["TodoWeb`", {"TodoData`"}];

CreateTodoWebApp::usage = "CreateTodoWebApp[] starts the to-do web app.";

Begin["`Private`"];

(* View Todos *)
viewTodosWeb[] := Module[{},
  "Todos:" -> If[Length[GetTodos[]] == 0,
    "No todos available.",
    StringJoin[Riffle[GetTodos[], "<br>"]]
  ]
];

(* Add Todo *)
addTodoWeb[todo_] := Module[{},
  AddTodo[todo];
  "Status" -> "Todo added!"
];

(* Remove Todo *)
removeTodoWeb[index_] := Module[{},
  If[1 <= index <= Length[GetTodos[]],
    RemoveTodo[index];
    "Status" -> "Todo removed!",
    "Status" -> "Invalid index!"
  ]
];

CreateTodoWebApp[] := FormPage[
  {
    "Action" -> {"View", "Add", "Remove"}
  },
  Switch[#Action,
    "View", FormFunction[{}, viewTodosWeb[]],
    "Add", FormFunction[{"New Todo" -> "String"}, addTodoWeb[#NewTodo] &],
    "Remove", FormFunction[{"Todo to Remove (index)" -> Length[GetTodos[]]}, removeTodoWeb[#TodoToRemove] &],
    _, "Invalid choice!"
  ] &
];

End[];

EndPackage[];

(* Deploy the web app *)
CloudDeploy[CreateTodoWebApp[], "TodoWebApp", Permissions -> "Public"]
