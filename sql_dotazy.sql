-- Vytvarime finalni nabulku do Tableau s urcitym vyberem sloupcu
CREATE OR REPLACE TABLE TABLEAU AS 
SELECT
    D.POV_PA_00
    ,D.POV_CJ_INTERNI
    ,D.POV_CISLO_JEDNACI
    ,D.POV_CJ_ZMENTETO
    ,D.POV_DATUM
    ,D.POV_DATUM_UDALOSTI
    ,D.POV_DATUM_VYRIZENI
    ,D.POV_PRIJMENI
    ,D.POV_JMENO
    ,D.POV_OBEC
    ,D.POV_PSC
    ,D.POV_CIS_STATUS_CISLO
    ,D.POV_CIS_TEMA_CISLO
    ,T.POV_CIS_TEMA_POPIS
    ,D.POV_LINKA_S
    ,D.POV_POPIS
FROM DATA AS D
LEFT JOIN TEMA AS T ON D.POV_CIS_TEMA_CISLO = T.POV_CIS_TEMA_CISLO
;

-------------------------------------------------------------------
-- Pridavame prazdny sloupec NOVA_OBEC
ALTER TABLE TABLEAU ADD NOVA_OBEC VARCHAR(1000) DEFAULT NULL;

-- Vkladame hodnoty do prazdneho sloupce NOVA_OBEC
UPDATE TABLEAU
SET NOVA_OBEC = 
        CASE 
        WHEN POV_PSC like '11%' THEN 'Praha 1'
        WHEN POV_PSC like '12%' THEN 'Praha 2'
        WHEN POV_PSC like '13%' THEN 'Praha 3'
        WHEN POV_PSC like '13%' THEN 'Praha 3'
        WHEN POV_PSC like '14%' THEN 'Praha 4'
        WHEN POV_PSC like '15%' THEN 'Praha 5'
        WHEN POV_PSC like '16%' THEN 'Praha 6'
        WHEN POV_PSC like '17%' THEN 'Praha 7'
        WHEN POV_PSC like '18%' THEN 'Praha 8'
        WHEN POV_PSC like '19%' THEN 'Praha 9'
        WHEN POV_PSC like '10%' THEN 'Praha 10'
        
        WHEN POV_OBEC ILIKE 'PRAHA 1' THEN 'Praha 1'
        WHEN POV_OBEC ILIKE 'PRAHA 2' THEN 'Praha 2'
        WHEN POV_OBEC ILIKE 'PRAHA 3' THEN 'Praha 3'
        WHEN POV_OBEC ILIKE 'PRAHA 4' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE 'PRAHA 5' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE 'PRAHA 6' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE 'PRAHA 7' THEN 'Praha 7'
        WHEN POV_OBEC ILIKE 'PRAHA 8' THEN 'Praha 8'
        WHEN POV_OBEC ILIKE 'PRAHA 9' THEN 'Praha 9'
        WHEN POV_OBEC ILIKE 'PRAHA 10' THEN 'Praha 10'

        WHEN POV_OBEC ILIKE 'PRAHA 11' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE 'PRAHA 12' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE 'PRAHA 13' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE 'PRAHA 14' THEN 'Praha 9'
        WHEN POV_OBEC ILIKE 'PRAHA 15' THEN 'Praha 10'
        WHEN POV_OBEC ILIKE 'PRAHA 16' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE 'PRAHA 17' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE 'PRAHA 21' THEN 'Praha 9'
        WHEN POV_OBEC ILIKE 'PRAHA 22' THEN 'Praha 10'
        
        WHEN POV_OBEC ILIKE '%PRAHA 1%' THEN 'Praha 1'
        WHEN POV_OBEC ILIKE '%PRAHA 2%' THEN 'Praha 2'
        WHEN POV_OBEC ILIKE '%PRAHA 3%' THEN 'Praha 3'
        WHEN POV_OBEC ILIKE '%PRAHA 4%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%PRAHA 5%' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE '%PRAHA 6%' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE '%PRAHA 7%' THEN 'Praha 7'
        WHEN POV_OBEC ILIKE '%PRAHA 8%' THEN 'Praha 8'
        WHEN POV_OBEC ILIKE '%PRAHA 9%' THEN 'Praha 9'
        WHEN POV_OBEC ILIKE '%PRAHA 10%' THEN 'Praha 10'

        WHEN POV_OBEC ILIKE '%PRAHA1%' THEN 'Praha 1'
        WHEN POV_OBEC ILIKE '%PRAHA2%' THEN 'Praha 2'
        WHEN POV_OBEC ILIKE '%PRAHA3%' THEN 'Praha 3'
        WHEN POV_OBEC ILIKE '%PRAHA4%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%PRAHA5%' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE '%PRAHA6%' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE '%PRAHA7%' THEN 'Praha 7'
        WHEN POV_OBEC ILIKE '%PRAHA8%' THEN 'Praha 8'
        WHEN POV_OBEC ILIKE '%PRAHA9%' THEN 'Praha 9'
        WHEN POV_OBEC ILIKE '%PRAHA10%' THEN 'Praha 10'
        
        WHEN POV_OBEC ILIKE '%MODŘANY%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%ZBRASLAV%' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE '%DOLNÍ CHABRY%' THEN 'Praha 8'
        WHEN POV_OBEC ILIKE '%VRŠOVICE%' THEN 'Praha 10'
        WHEN POV_OBEC ILIKE '%LETŇANY%' THEN 'Praha 9'
        WHEN POV_OBEC ILIKE '%PRAGUE 4%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%PRAGUE 6%' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE '%SUCHDOL%' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE '%STRAŠNICE%' THEN 'Praha 10'
        WHEN POV_OBEC ILIKE '%DEJVICE%' THEN 'Praha 6'
        WHEN POV_OBEC ILIKE '%VINOHRADY%' THEN 'Praha 2'
        WHEN POV_OBEC ILIKE '%HLUBOČEPY%' THEN 'Praha 5'
        WHEN POV_OBEC ILIKE '%NUSLE%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%KUNRATICE%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%PETROVICE%' THEN 'Praha 10'
        WHEN POV_OBEC ILIKE '%ZÁBĚHLICE%' THEN 'Praha 4'
        WHEN POV_OBEC ILIKE '%KOBYLISY%' THEN 'Praha 8'
        END 
WHERE  POV_OBEC <> 'NULL'
       AND POV_OBEC <> 'Praha'
       AND POV_OBEC <> 'praha'
       AND POV_OBEC <> 'Prague'
       AND POV_OBEC <> 'prague'
       AND POV_OBEC <> 'PRAHA'
       AND POV_OBEC <> 'PRAGUE'
;

-------------------------------------------------------------------
-- Pridavame prazdny sloupec ROZDIL_CASU_PODNET_UDALOST
ALTER TABLE TABLEAU ADD ROZDIL_CASU_PODNET_UDALOST INT DEFAULT NULL;

-- Vkladame hodnoty do prazdneho sloupce ROZDIL_CASU_PODNET_UDALOST
UPDATE TABLEAU
SET ROZDIL_CASU_PODNET_UDALOST = datediff (day,try_to_date(POV_DATUM_UDALOSTI), POV_DATUM)
WHERE POV_DATUM_UDALOSTI IS NOT NULL 
      AND POV_DATUM_UDALOSTI <> '' 
      AND datediff (day,try_to_date(POV_DATUM_UDALOSTI), POV_DATUM) < 365 
      AND datediff (day,try_to_date(POV_DATUM_UDALOSTI), POV_DATUM) >= 0
;

-------------------------------------------------------------------
-- Pridavame novy prazdny sloupec DELKA_VYRIZENI_STIZNOSTI
ALTER TABLE TABLEAU ADD DELKA_VYRIZENI_STIZNOSTI INT DEFAULT NULL;

-- Vkladame hodnoty do prazdneho sloupce DELKA_VYRIZENI_STIZNOSTI
UPDATE TABLEAU
SET DELKA_VYRIZENI_STIZNOSTI = datediff (day, POV_DATUM, try_to_date(POV_DATUM_VYRIZENI))
WHERE POV_DATUM_VYRIZENI IS NOT NULL 
      AND POV_DATUM_VYRIZENI <> '' 
      AND datediff (day, POV_DATUM, try_to_date(POV_DATUM_VYRIZENI)) >= 0
;

-------------------------------------------------------------------
-- Cistime sloupec POV_LINKA_S
UPDATE TABLEAU
SET POV_LINKA_S = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(POV_LINKA_S, 'Metro', ''), 'Tram', ''), 'BUS', ''), ' ', ''), 'metro', ''), 'c', 'C'), 'METRO', ''), 'TRAM', ''), 'Bus', '')
;

-------------------------------------------------------------------
-- Pridavame novy prazdny sloupec POCHVALA
ALTER TABLE TABLEAU ADD POCHVALA INT DEFAULT NULL;

-- Vkladame hodnoty do prazdneho sloupce POCHVALA
UPDATE TABLEAU
SET POCHVALA = CASE WHEN POV_CIS_TEMA_CISLO = '27' THEN 1 ELSE 0 END
;

-------------------------------------------------------------------
-- Pridavame novy prazdny sloupec TYP_FORMULARE
ALTER TABLE TABLEAU ADD TYP_FORMULARE VARCHAR(1000) DEFAULT NULL;

-- Vkladame hodnoty do prazdneho sloupce TYP_FORMULARE
UPDATE TABLEAU
SET TYP_FORMULARE = CASE WHEN pov_cis_tema_cislo = '1' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '2' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '3' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '4' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '5' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '6' THEN 'Nezařazeno'
        WHEN pov_cis_tema_cislo = '7' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '8' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '9' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '10' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '11' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '12' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '13' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '14' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '15' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '16' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '17' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '18' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '19' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '20' THEN 'Eshop'
        WHEN pov_cis_tema_cislo = '21' THEN 'Eshop'
        WHEN pov_cis_tema_cislo = '22' THEN 'Eshop'
        WHEN pov_cis_tema_cislo = '23' THEN 'Eshop'
        WHEN pov_cis_tema_cislo = '24' THEN 'Eshop'
        WHEN pov_cis_tema_cislo = '25' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '26' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '27' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '28' THEN 'Podnět'
        WHEN pov_cis_tema_cislo = '29' THEN 'Nezařazeno'
        WHEN pov_cis_tema_cislo = '30' THEN 'Dotaz'
        WHEN pov_cis_tema_cislo = '31' THEN 'Nezařazeno'
        WHEN pov_cis_tema_cislo = 'NULL' THEN 'Nezařazeno'
        END
;

-------------------------------------------------------------------
-- Vytvarime novou tabulku PODNETY_ZDROJ
CREATE OR REPLACE TABLE ZDROJ_PODNETU AS 
SELECT 
         COUNT(*) AS CELKOVY_POCET_PODNETU
         
       , (SELECT COUNT(*)
          FROM DATA 
          WHERE POV_CISLO_JEDNACI <> 'NULL') AS POCET_PODNETU_Z_WEBU
          
       , (SELECT COUNT(*)
          FROM DATA
          WHERE POV_CJ_ZMENTETO <>  'NULL') AS POCET_PODNETU_ZE_ZMENTETO

        , CELKOVY_POCET_PODNETU - POCET_PODNETU_Z_WEBU - POCET_PODNETU_ZE_ZMENTETO AS POCET_PODNETU_OSTATNI_ZDROJE
FROM DATA
WHERE POV_DATUM BETWEEN '01.01.2018' AND '31.12.2022'
;

