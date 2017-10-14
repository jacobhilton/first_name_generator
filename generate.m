function word = generate(creativity, l)
  persistent alphabet ms mus sigmas Us Ss;
  if (isempty(alphabet))
    load("data.mat");
  end
  if nargin < 2
    ms_rescaled = ms .^ (1 / creativity);
    l = find(rand() < cumsum(ms_rescaled, 1)/sum(ms_rescaled, 1), 1);
  end
  m = ms(l, 1);
  mu = mus{l, 1};
  sigma = sigmas{l, 1};
  U = Us{l, 1};
  S = Ss{l, 1};
  diag_S = diag(S);
  diag_S_rescaled = diag_S .^ (1 / creativity);
  diag_S_renorm = diag_S_rescaled * (sum(diag_S) / sum(diag_S_rescaled));
  x_norm = sum(U * diag(normrnd(0, 1, size(diag_S)) .* (diag_S_renorm .^ 0.5)), 2)';
  x = mu + (x_norm .* sigma);
  word = decode(x, alphabet);
