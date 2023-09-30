BeginPackage["Deployment`"];

DeployStockApp[app_] := CloudDeploy[app, "StockTracker", Permissions -> "Public"];

EndPackage[];
