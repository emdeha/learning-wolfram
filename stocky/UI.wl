BeginPackage["UI`"];

CreateStockApp[] := FormFunction[
  {
    "Tickers" -> "String"
  },
  Module[{data, tickers},
    tickers = StringSplit[#Tickers, ","];
    data = AssociationThread[tickers -> FinancialData[tickers]];

    Grid[
      Prepend[
        KeyValueMap[{#1, #2} &, data],
        {"Ticker", "Latest Price"}
      ],
      Frame -> All
    ]
  ] &
];
  
EndPackage[];
