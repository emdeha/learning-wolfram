BeginPackage["Deployment`"];

DeployTodoApp[app_] := CloudDeploy[app, "TodoApp", Permissions -> "Public"];

EndPackage[];
