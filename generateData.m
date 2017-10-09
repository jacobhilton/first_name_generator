alphabet = {"a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"; "k"; "l"; "m"; "n"; "o"; "p"; "q"; "r"; "s"; "t"; "u"; "v"; "w"; "x"; "y"; "z"};
examples = textread("examples.txt","%s");
N = numel(examples);
exampleLengths = zeros(size(examples));
for i = 1:N
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
      randomString = [randomString alphabet{floor(rand(1, 1) * 26) + 1, 1}];
    end
    if length(find(strcmp(examplesOfThisLength, randomString))) == 0 && length(find(strcmp(nonExamplesOfThisLength, randomString))) == 0
      nonExamplesOfThisLength{1, i} = randomString;
      i++;
    end
  end
  nonExamplesByLength{l, 1} = nonExamplesOfThisLength;
end
nonExamples = sort([nonExamplesByLength{:, 1}]');
NCVAndTest = floor(N * 0.2);
NTrain = N - 2 * NCVAndTest;
[~, exampleShuffling] = sort(rand(N, 1));
[~, nonExampleShuffling] = sort(rand(N, 1));
shuffledExamples = examples(exampleShuffling);
shuffledNonExamples = nonExamples(nonExampleShuffling);
[~, trainShuffling] = sort(rand(NTrain * 2, 1));
[~, CVShuffling] = sort(rand(NCVAndTest * 2, 1));
[~, testShuffling] = sort(rand(NCVAndTest * 2, 1));
trainSet = [shuffledExamples(1:NTrain), mat2cell(ones(NTrain, 1), ones(NTrain,1)); shuffledNonExamples(1:NTrain), mat2cell(zeros(NTrain, 1), ones(NTrain,1))](trainShuffling, :);
CVSet = [shuffledExamples((NTrain + 1):(NTrain + NCVAndTest)), mat2cell(ones(NCVAndTest, 1), ones(NCVAndTest,1)); shuffledNonExamples((NTrain + 1):(NTrain + NCVAndTest)), mat2cell(zeros(NCVAndTest, 1), ones(NCVAndTest,1))](CVShuffling, :);
testSet = [shuffledExamples((NTrain + NCVAndTest + 1):N), mat2cell(ones(NCVAndTest, 1), ones(NCVAndTest,1)); shuffledNonExamples((NTrain + NCVAndTest + 1):N), mat2cell(zeros(NCVAndTest, 1), ones(NCVAndTest,1))](testShuffling, :);
fid = fopen("data_train.txt", "w");
fprintf(fid, "%s,%d\n", trainSet'{:});
fclose(fid);
fid = fopen("data_cv.txt", "w");
fprintf(fid, "%s,%d\n", CVSet'{:});
fclose(fid);
fid = fopen("data_test.txt", "w");
fprintf(fid, "%s,%d\n", testSet'{:});
fclose(fid);
