# first_name_generator

Octave implementation of a first name generator using principal component analysis of a dataset of first names (some of which seem to be misspelled) derived from US census data.

The dataset contains 86987 first names:

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

The generator takes a "creativity" parameter. When set close to zero, the generated name corresponds to a point close to the line passing through the mean and the first principal component of the names of that length. It will therefore typically be one of the following, depending on which side of the mean is chosen:

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

The dataset is taken from [this](https://www.drupal.org/project/namedb) Drupal project, which is licensed under the GNU General Public License, Version 2.