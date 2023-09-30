BeginPackage["TodoDataTests`", {"TodoData`"}];

(* Public functions *)
RunTodoDataTests::usage = "RunTodoDataTests[] runs all the data tests for the to-do app and returns a report.";

(* Private functions *)
Begin["`Private`"];

(* Test adding a todo *)
testAddTodo = VerificationTest[
  ClearTodos[]; AddTodo["Test todo"]; GetTodos[],
  {"Test todo"},
  TestID -> "add todo"
];

(* Test removing a todo *)
testRemoveTodo = VerificationTest[
  ClearTodos[]; AddTodo["Test todo"]; RemoveTodo[1]; GetTodos[],
  {},
  TestID -> "remove todo"
];

(* Test clearing todos *)
testClearTodos = VerificationTest[
  ClearTodos[]; AddTodo["Test todo 1"]; AddTodo["Test todo 2"]; ClearTodos[]; GetTodos[],
  {},
  TestID -> "clear todos"
];

RunTodoDataTests[] := Module[{report, successCount, failureCount, totalCount, failedTests},
  report = TestReport[
    {
      testAddTodo,
      testRemoveTodo,
      testClearTodos
    }
  ];

  resultsByOutcome = report["ResultsByOutcome"];
  successCount = Length[resultsByOutcome["Success"]];
  failureCount = Length[resultsByOutcome["Failure"]];
  totalCount = successCount + failureCount;
  
  Print["---------------------------------"];
  Print["| Outcome   | Count             |"];
  Print["---------------------------------"];
  Print["| Success   | ", StringPadRight[ToString[successCount], 18], "|"];
  Print["| Failure   | ", StringPadRight[ToString[failureCount], 18], "|"];
  Print["| Total     | ", StringPadRight[ToString[totalCount], 18], "|"];
  Print["---------------------------------"];


  If[failureCount > 0,
    Print["\nFailed tests:"];

    failures = resultsByOutcome["Failure"];

    Do[
      failure = failures[[i]];
      Print[
        "\t", failure["TestID"], "; Expected: ", failure["ExpectedOutput"], "; Actual: ", failure["ActualOutput"]
      ],
      {i, Length[failures]}
    ]
  ];

  report
];

End[];

EndPackage[];
