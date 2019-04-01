# vezni-bayes
Bayes hierarchical model for analysis of number of inprisoned citizens

Following description is in Czech-only since the analysis concerns czech data, sorry for all others.

Tato analýza navazuje na [článek](https://www.irozhlas.cz/zpravy-domov/mapa-veznu_1903280600_pek?latlng=49.82127350693801|15.480000000000018|6.2427788541597335) z irozhlas.cz. Namísto percentuálního vyjádření
počtu občanů každé z obcí percentuálně tato analýza používá [hierarchický bayesovský
model](https://en.wikipedia.org/wiki/Bayesian_hierarchical_modeling) v prostředí 
[Stan](https://mc-stan.org/). Jak ukážeme, analýza založená na procentech 
může být velmi citlivá na statistický šum. 
Bayesovský model je naopak robustní neboť reprezentuje data pomocí parametrů dvou kategorií:
lokální a globální. Lokální parametry reprezentují každou obec
pravděpodobností, že náhodně vybraný občan dané obce je ve vězení. Všechny obce jsou
pak ještě reprezentovány globálním parametrem, který lze interpretovat jako pravděpodobnost, že
náhodně vybraný občan z náhodně vybrané obce je ve vězení. Máme tak dva typy parametrů:
globální a lokální pro každou obci. Pro obce s malým počtem obyvatel bude sílit role 
globálního parametru, protože nemáme dost dat. Pro obce s dostatečným počtem lidí
pak bude sílit role lokálního parametru. Model tak automaticky a elegantně využívá
všechna dostupná data a je robustní.
