# Importujeme knihovnu Pandas
import pandas as pd

# Ukladame si tabulku se sloupcem obsahujicim texty podnetu s tematem "Chovani ridice" 
# do promenne
podnety = pd.read_csv('POV_POPIS_CHOVANI_RIDICE.csv', encoding='utf-8')

# Prevadime promennou na seznam
slova = podnety['POV_POPIS'].tolist()

# Odstranujeme nepotrebne znaky
slova = [str(slovo).replace(".", " ") for slovo in slova]
slova = [str(slovo).replace("..", " ") for slovo in slova]
slova = [str(slovo).replace("...", " ") for slovo in slova]
slova = [str(slovo).replace(",", " ") for slovo in slova]
slova = [str(slovo).replace("!", " ") for slovo in slova]
slova = [str(slovo).replace("?", " ") for slovo in slova]
slova = [str(slovo).replace(":", " ") for slovo in slova]
slova = [str(slovo).replace(";", " ") for slovo in slova]
slova = [str(slovo).replace(")", " ") for slovo in slova]
slova = [str(slovo).replace("(", " ") for slovo in slova]
slova = [str(slovo).replace("/", " ") for slovo in slova]
slova = [str(slovo).replace("@", " ") for slovo in slova]
slova = [str(slovo).replace("\\", " ") for slovo in slova]
slova = [str(slovo).replace("\n", " ") for slovo in slova]
slova = [str(slovo).replace("\r", " ") for slovo in slova]
slova = [str(slovo).replace(" ", " ") for slovo in slova]

# Prevadime slova na mala pismena
slova = [slovo.lower() for slovo in slova]

# Spojujeme jednotliva slova do jednoho dlouheho dokumentu, oddelujeme je opet mezerou
slova = ' '.join(str(slovo) for slovo in slova)

# Rozdelujeme dokument na slova
nova_slova = slova.split(' ')

# Pripravujeme data pro DataFrame
data = {'Slovo': nova_slova}

# Vytvarime DataFrame
df = pd.DataFrame(data)

# Vytvarime sloupec ID s automaticky generovanými ID
df.insert(0, 'ID', range(1, 1 + len(df)))

# Ukladame si tabulku do souboru csv
df.to_csv('slova_chovani_ridice.csv', index=False)