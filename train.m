function train()
  alphabet = "abcdefghijklmnopqrstuvwxyz";
  examples = textread("examples.txt","%s");
  numberOfExamples = numel(examples);
  exampleLengths = zeros(numberOfExamples, 1);
  for i = 1:numberOfExamples
    exampleLengths(i, 1) = length(examples{i, 1});
  end
  ms = [];
  mus = {};
  sigmas = {};
  Us = {};
  Ss = {};
  for l = 1:max(exampleLengths, [], 1)
    examplesOfThisLength = examples(find(exampleLengths == l), :);
    m = numel(examplesOfThisLength);
    if m > 0
      X = zeros(m, 26 * l);
      for i = 1:m
	for j = 1:l
	  X(i, 26 * (j - 1) + find(alphabet == examplesOfThisLength{i, 1}(j))) = 1;
	end
      end
      mu = mean(X, 1);
      sigma = std(X, 1);
      sigma = sigma + (sigma == 0);
      X_norm = (X - repmat(mu, m, 1)) ./ repmat(sigma, m, 1);
      [U, S, ~] = svd((X_norm' * X_norm) / m);
      ms(l, 1) = m;
      mus{l, 1} = mu;
      sigmas{l, 1} = sigma;
      Us{l, 1} = U;
      Ss{l, 1} = S;
    end
  end
  save("data.mat", "alphabet", "ms", "mus", "sigmas", "Us", "Ss");
