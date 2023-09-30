url = InputString["Give image url: "];
image = Import[url];
entity = ImageIdentify[image];
Print["This is a: ", entity["Name"]];
