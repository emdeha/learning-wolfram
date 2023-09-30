BeginPackage["TodoCLI`", {"TodoData`"}];

(* Public functions *)
StartTodoCLI::usage = "StartTodoCLI[] starts the to-do CLI app.";

(* Private functions *)
Begin["`Private`"];

(* Display the main menu and handle user input *)
mainMenu[] := Module[{choice = 0},
  While[choice != 4,
    Print["Todo CLI App"];
    Print["1. View Todos"];
    Print["2. Add Todo"];
    Print["3. Remove Todo"];
    Print["4. Exit"];
    choice = Input["Enter your choice: "];
    Switch[choice,
      1, viewTodos[],
      2, addTodoCLI[],
      3, removeTodoCLI[],
      4, Print["Exiting..."],
      _, Print["Invalid choice!"]
    ];
  ];
];

(* Display the list of to-do items *)
viewTodos[] := Module[{},
  Print["Todos:"];
  If[Length[GetTodos[]] == 0,
    Print["No todos available."],
    Do[Print[StringJoin[ToString[i], ". ", GetTodos[][[i]]]], {i, Length[GetTodos[]]}]
  ];
];

(* Add a new to-do item through CLI *)
addTodoCLI[] := Module[{item},
  item = InputString["Enter the new todo: "];
  AddTodo[item];
  Print["Todo added!"];
];

(* Remove a to-do item through CLI *)
removeTodoCLI[] := Module[{index},
  viewTodos[];
  index = Input["Enter the index of the todo to remove: "];
  If[1 <= index <= Length[GetTodos[]],
    RemoveTodo[index];
    Print["Todo removed!"],
    Print["Invalid index!"]
  ];
];

(* Start the CLI app *)
StartTodoCLI[] := mainMenu[];

End[];

EndPackage[];
