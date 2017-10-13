# first_name_generator

Octave implementation of a first name generator using principal component analysis of a database of first names (some of which seem to be misspelled) derived from US census data:

139 names of length 2
898 names of length 3
4828 names of length 4
14621 names of length 5
24247 names of length 6
22515 names of length 7
12565 names of length 8
4770 names of length 9
1514 names of length 10
515 names of length 11
190 names of length 12
104 names of length 13
50 names of length 14
31 names of length 15 

The generator takes a "creativity" parameter. When set close to zero, it will with high probability give a word corresponding to the principal component of the names of a certain length:

Ra
May
Jaan
Jaran
Jarlen
Lanesia
Lareisha
Marhalinn
Martarious
Christopher
Christiopher
Joseinmichael
Macaaelizabeth
Christopherjaan

At the other end of the spectrum, with very high creativity, the generated names of a given length are distributed close to uniformly at random:

Yb
Whm
Esav
Cpqai
Rytkho
Yzlmcxv
Pimrwrcf
Dbobxeuas
Xzbhxaycnr
Qmqvyqphwwr
Wrmowmqxbtqw
Fcdxmpirnaokr
Mrpywytzyhlyyp
Aplsiavmlqowgxo

Here are some examples generated using a creativity of 2:

Titiso
Lisreqrt
Asbe
Dersi
Mrrhnehano
Zerli
Ekae
Dtrse
Mirse
Mersi
Jefrdrla
Totuyo
Rytiho
Etbi
Dojbydias
Dikbyeuah
Filhant
Lesrnret
Erai
Jisierct

The data is taken from [this](https://www.drupal.org/project/namedb) Drupal project, which is licensed under the GNU General Public License, Version 2.