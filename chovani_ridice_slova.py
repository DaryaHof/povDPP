import pandas as pd

# Soubor .csv s jednim sloupcem, ktery obsahuje podnety s tematem "Chovani ridice"
podnety = pd.read_csv('POV_POPIS_CHOVANI_RIDICE.csv', encoding='utf-8')

# Prevadime na seznam
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

# # muzeme i vynechat prazdna slova rovnou tady
# words = [w for w in words if w ]

# Pripravujeme data pro DataFrame
data = {'Slovo': nova_slova}

# Vytvarime DataFrame
df = pd.DataFrame(data)

# Vytvorime sloupec ID s automaticky generovanými ID
df.insert(0, 'ID', range(1, 1 + len(df)))

# Zobrazime vyslednou tabulku
print(df)

# Ulozime tabulku do souboru csv
df.to_csv('slova_chovani_ridice.csv', index=False)