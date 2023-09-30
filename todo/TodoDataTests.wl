BeginPackage["TodoDataTests`", {"TodoData`"}];

Get["TestHarness`"];

RunTodoDataTests::usage = "RunTodoDataTests[] runs all the data tests for the to-do app and returns a report.";

Begin["`Private`"];

testAddTodo = VerificationTest[
  ClearTodos[]; AddTodo["Test todo"]; GetTodos[],
  {"Test todo"},
  TestID -> "add todo"
];

testRemoveTodo = VerificationTest[
  ClearTodos[]; AddTodo["Test todo"]; RemoveTodo[1]; GetTodos[],
  {},
  TestID -> "remove todo"
];

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
