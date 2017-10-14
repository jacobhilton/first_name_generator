function word = generate(creativity, l)
  persistent alphabet ms mus sigmas Us Ss;
  if (isempty(alphabet))
    load("data.mat");
  end
  if nargin < 2
    ms_renorm = ms .^ (1 / creativity);
    l = find(rand() < cumsum(ms_renorm, 1)/sum(ms_renorm, 1), 1);
  end
  m = ms(l, 1);
  mu = mus{l, 1};
  sigma = sigmas{l, 1};
  U = Us{l, 1};
  S = Ss{l, 1};
  x_norm = sum(U * (rand(size(S)) .* (S .^ (1 / (creativity * 2)))), 2)';
  x = mu + (x_norm .* sigma);
  word = decode(x, alphabet);
