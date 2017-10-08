alphabet = {"a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"; "k"; "l"; "m"; "n"; "o"; "p"; "q"; "r"; "s"; "t"; "u"; "v"; "w"; "x"; "y"; "z"};
examples = textread("examples.txt","%s");
exampleLengths = zeros(size(examples));
for i = 1:numel(examples)
  exampleLengths(i, 1) = length(examples{i, 1});
end
nonExamplesByLength = {};
for l = 1:max(exampleLengths, [], 1)
  examplesOfThisLength = examples(find(exampleLengths == l), :);
  nonExamplesOfThisLength = {};
  i = 1;
  while i <= numel(examplesOfThisLength)
    randomString = "";
    for j = 1:l
      randomString = [randomString alphabet{floor(rand() * 26) + 1, 1}];
    end
    if length(find(strcmp(examplesOfThisLength, randomString))) == 0 && length(find(strcmp(nonExamplesOfThisLength, randomString))) == 0
      nonExamplesOfThisLength{i} = randomString;
      i++;
    end
  end
  nonExamplesByLength{l, 1} = nonExamplesOfThisLength;
end
nonExamples = sort([nonExamplesByLength{:, 1}]);
fid = fopen("non_examples.txt", "w");
fprintf(fid, "%s\n", nonExamples{:});
fclose(fid);
