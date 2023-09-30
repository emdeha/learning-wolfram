BeginPackage["TestHarness`"];

RunTests::usage = "RunTests[] runs a list of tests specified as input";

Begin["`Private`"];

RunTests[tests_List] := Module[{report},
  report = TestReport[tests];

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
