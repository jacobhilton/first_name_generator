alphabet = {"a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"; "k"; "l"; "m"; "n"; "o"; "p"; "q"; "r"; "s"; "t"; "u"; "v"; "w"; "x"; "y"; "z"};
examples = textread("examples.txt","%s");
N = numel(examples);
exampleLengths = zeros(size(examples));
for i = 1:N
  exampleLengths(i, 1) = length(examples{i, 1});
end
examplesByLength = {};
numberOfExamplesByLength = [];
for l = 1:max(exampleLengths, [], 1)
  examplesByLength{l, 1} = examples(find(exampleLengths == l), :);
  numberOfExamplesByLength(l, 1) = numel(examplesByLength{l, 1});
end
