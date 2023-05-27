# Importujeme knihovnu Pandas
import pandas as pd

# Importujeme knihovnu Seaborn
import seaborn as sns

# Importujeme knihovnu Matplotlib.pyplot
import matplotlib.pyplot as plt

# Ukladame si tabulku do promenne
data = pd.read_csv('pov_podnety.csv', encoding='utf-8')

# Vybirame z tabulky pouze ty sloupce, ktere nas zajimaji
tabulka = data[['DELKA_VYRIZENI_PODNETU', 'POV_POPIS']]

# Pridavame do tabulky sloupec s vypoctem delky textu podnetu
tabulka.loc[:, 'DELKA_PODNETU'] = data['POV_POPIS'].str.len()

# Vyfiltrovavame si pouze ty podnety, kde delka vyrizeni stiznosti je mensi,
# nez 1 rok (ostatni podnety obsahuji chyby)
nova_tabulka = tabulka[tabulka['DELKA_VYRIZENI_PODNETU'] < 365]

# Zobrazujeme korelacni graf
g = sns.JointGrid(data=nova_tabulka, x='DELKA_VYRIZENI_PODNETU', y='DELKA_PODNETU')
g.plot_joint(sns.scatterplot, color='red', legend=False)
plt.show()

data_hodnota_korelace = nova_tabulka[["DELKA_VYRIZENI_PODNETU", "DELKA_PODNETU"]]
print(data_hodnota_korelace.corr())