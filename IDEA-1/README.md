# Analisi dell'Efficienza dei Fondi di Investimento tramite DEA - Modello CCR Input-Oriented

## Descrizione del Progetto
Questo progetto applica la Data Envelopment Analysis (DEA) per valutare l'efficienza di vari fondi d'investimento utilizzando il modello CCR input-oriented. L'analisi si concentra su tre classi di fondi (secondo la classificazione Morningstar): **Azionario Italiano**, **Obbligazionario Governativo EUR**, e **Bilanciato Moderato Europeo**, considerando serie storiche da gennaio 2021 a giugno 2023.

## Dataset
Il dataset include i rendimenti logaritmici per il calcolo degli indicatori di input e output e copre i seguenti dati:
- **Input**:
  - **Deviazione Standard**: rappresenta la volatilità dei rendimenti logaritmici dei fondi.
  - **Beta**: calcolato rispetto al FTSE Italia All Share come indice di riferimento del mercato.
  - **Commissioni d'Ingresso**: rappresentano i costi iniziali per gli investitori.
- **Output**:
  - **Rendimento Atteso**: rendimento logaritmico medio annuo calcolato sulla base dei dati storici.

## Metodologia
### Calcolo della Deviazione Standard
La deviazione standard per ciascun fondo è calcolata sui rendimenti logaritmici settimanali all'interno del periodo considerato (01/2021 - 06/2023). Questa misura serve come proxy della volatilità del fondo e riflette il rischio associato ai suoi rendimenti.

### Calcolo del Beta
Il Beta di ciascun fondo è determinato utilizzando la covarianza tra i rendimenti del fondo e quelli del FTSE Italia All Share, divisa per la varianza dei rendimenti del mercato. Questo indice rappresenta la sensibilità del fondo rispetto alle variazioni del mercato, utile per valutare il rischio sistematico.

### Modello DEA - CCR Input-Oriented
Il modello CCR input-oriented è utilizzato per analizzare l'efficienza relativa dei fondi, minimizzando i valori di input necessari per raggiungere il rendimento atteso. In questo contesto:

L'efficienza dei fondi viene valutata in base alla loro capacità di ridurre la deviazione standard, il Beta e i costi d'ingresso per raggiungere il rendimento target.

## Classificazione dei Fondi
I fondi sono suddivisi in tre classi secondo la classificazione Morningstar:
1. **Azionario Italiano**
2. **Obbligazionario Governativo EUR**
3. **Bilanciato Moderato Europeo**

Questa segmentazione consente un'analisi comparativa tra classi di rischio e rendimento differenti, nonché l'adattamento della DEA ai vari profili di rischio.

## Requisiti
- **Libreria Pyfrontier**: utilizzato per la modellizzazione e l'esecuzione della DEA.
- **Dataset** in formato `.csv` contenente i dati storici e i parametri necessari per l'analisi.
