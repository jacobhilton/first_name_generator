function word = generate(creativity, l)
  persistent alphabet ms Us Ss;
  if (isempty(alphabet))
    load("data.mat", "alphabet", "ms", "Us", "Ss");
  end
  if nargin < 2
    ms_renorm = ms .^ (1 / creativity);
    l = find(rand() < cumsum(ms_renorm, 1)/sum(ms_renorm, 1), 1);
  end
  U = Us{l, 1};
  S = Ss{l, 1};
  x = sum(U * (rand(size(S)) .* (S .^ (1 / (creativity * 2)))), 2);
  word = decode(x, alphabet);
