# first_name_generator

Octave implementation of a first name generator.

The training data is a dataset of first names derived from US census data (though some of them seem to be misspelled).

The training script performs principal component analysis on the names of length *n*, viewing each name as a 26*n*-dimensional vector.

The generating script chooses a linear combination of the principal components to be added to the mean. The coefficients of this linear combination are choosen randomly, with a bias towards principal components where the variance in the training set is higher. It takes in a "creativity" parameter, which specifies the size of this bias.

Here are some names generated using a creativity of 1.5:

Juanaajhris  
Anilrane  
Eurs  
Camsila  
Chrettntaone  
Denaaa  
Aerei  
Hyril  
Galnaandrn  
Cari  
Joara  
Cisiie  
Talar  
Crrloe  
Mayoe  
Kaealina  
Taniotnn  
Alaralia  
Arrree  

When the creativity parameter is close to zero, the generated name corresponds to a point close to the line passing through the mean and the first principal component of the names of that length. It will therefore typically be one of the following, depending on which side of the mean is chosen:

Si or Oc  
Dan or Ara  
Mana or Aran  
Jaren or Ahana  
Jarlen or Alanna  
Lanenia or Shaneen  
Mamarian or Shaneene  
Marharius or Shantenla  
Mantarious or Alessandea  
Christopher or Quantarious  
Christiopher or Jisheelmarie  
Josephmichael or Marialiamarie  
Macaaelizabeth or Chtwstimijaael  
Christopherjaan or Joanchrlstapher  

At the other extreme, when the creativity parameter is very large, the generated names of a given length are distributed much more uniformly, as in these examples:

Rx  
Crq  
Dhjy  
Keloa  
Saeiee  
Kayarin  
Chieetlq  
Jxaiaixxj  
Jqanaxaiux  
Yxqiszxiobf  
Cwwjxqidwxzc  
Hbffqzxslxzfp  
Cfzivxgzvaqzqc  
Vbiqivtepnblurf  

The dataset contains 86987 first names and is taken from [this](https://www.drupal.org/project/namedb) Drupal project, which is licensed under the GNU General Public License, Version 2.