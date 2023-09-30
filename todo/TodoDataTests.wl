BeginPackage["TodoDataTests`", {"TodoData`"}];

Get["TestHarness`"];

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

RunTodoDataTests[] := TestHarness`RunTests[{
  testAddTodo,
  testRemoveTodo,
  testClearTodos
}];

End[];

EndPackage[];
