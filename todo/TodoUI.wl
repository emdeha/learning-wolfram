BeginPackage["TodoCLI`", {"TodoData`"}];

StartTodoCLI::usage = "StartTodoCLI[] starts the to-do CLI app.";

Begin["`Private`"];

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

viewTodos[] := Module[{},
  Print["Todos:"];
  If[Length[GetTodos[]] == 0,
    Print["No todos available."],
    Do[Print[StringJoin[ToString[i], ". ", GetTodos[][[i]]]], {i, Length[GetTodos[]]}]
  ];
];

addTodoCLI[] := Module[{item},
  item = InputString["Enter the new todo: "];
  AddTodo[item];
  Print["Todo added!"];
];

removeTodoCLI[] := Module[{index},
  viewTodos[];
  index = Input["Enter the index of the todo to remove: "];
  If[1 <= index <= Length[GetTodos[]],
    RemoveTodo[index];
    Print["Todo removed!"],
    Print["Invalid index!"]
  ];
];

StartTodoCLI[] := mainMenu[];

End[];

EndPackage[];
