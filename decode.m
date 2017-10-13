function word = decode(x, alphabet)
  x_lengthened = [x(:)' zeros(1, mod(-numel(x), numel(alphabet)))];
  x_reshaped = reshape(x_lengthened, numel(alphabet), ceil(numel(x) / numel(alphabet)));
  [~, word_num] = max(x_reshaped);
  word = alphabet(word_num);
