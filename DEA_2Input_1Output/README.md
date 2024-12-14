# Analisi dell'Efficienza dei Fondi di Investimento tramite DEA - Modello CCR Input-Oriented (2 Input, 1 Output)

## Descrizione del Progetto
Questo progetto applica la **Data Envelopment Analysis (DEA)** per valutare l'efficienza di fondi d'investimento appartenenti a diverse classi di rischio e rendimento. Utilizzando il **modello CCR input-oriented**, l'analisi si concentra sulla minimizzazione del rischio (input) per raggiungere un determinato rendimento atteso (output).  

L'analisi considera i dati storici di tre classi di fondi (secondo la classificazione Morningstar):  
1. **Azionario Italiano**  
2. **Obbligazionario Governativo EUR**  
3. **Bilanciato Moderato Europeo**  

Il periodo di riferimento è da **gennaio 2021 a giugno 2023**.

---

## Dataset
Il dataset include i rendimenti logaritmici e i dati di mercato necessari per calcolare gli indicatori utilizzati nell'analisi DEA.  

### Variabili utilizzate:
- **Input**:
  - **Deviazione Standard**: misura della volatilità dei rendimenti logaritmici dei fondi.
  - **Beta**: rappresenta la sensibilità del fondo rispetto alle variazioni del mercato, calcolato rispetto al FTSE Italia All Share.
- **Output**:
  - **Rendimento Atteso**: rendimento logaritmico medio annuo calcolato sulla base dei dati storici.

---

## Metodologia
### Calcolo degli Indicatori
1. **Deviazione Standard**:  
   - Calcolata sui rendimenti logaritmici settimanali per ogni fondo nel periodo 01/2021 - 06/2023.  
   - Questa misura è utilizzata come proxy del rischio associato al fondo.  

2. **Beta**:  
   - Determinato come rapporto tra la covarianza dei rendimenti del fondo e quelli del FTSE Italia All Share (indice di riferimento) e la varianza del mercato.  
   - Misura il rischio sistematico, ovvero la sensibilità del fondo alle variazioni del mercato.  

3. **Rendimento Atteso**:  
   - Calcolato come media aritmetica dei rendimenti logaritmici annualizzati nel periodo di riferimento.  
   - È il target di performance del fondo.  

### Modello DEA - CCR Input-Oriented
Il modello DEA è implementato utilizzando la libreria **Pyfrontier** per Python.  
- Obiettivo: minimizzare gli input (rischio) necessari per ottenere il rendimento atteso (output).  
- La DEA valuta l'efficienza relativa dei fondi in base alla capacità di ridurre la **Deviazione Standard** e il **Beta**, massimizzando al contempo il rendimento.  

L'output dell'analisi consiste in un **punteggio di efficienza** (tra 0 e 1) per ciascun fondo. I fondi efficienti (punteggio = 1) rappresentano il benchmark per gli altri.

---

## Requisiti
Per eseguire il progetto sono necessari i seguenti strumenti e librerie:  
- **Python 3.8+**  
- **Libreria Pyfrontier**: per l'implementazione della DEA.  
- **Pandas**: per la gestione del dataset.  
- **Numpy**: per il calcolo degli indicatori statistici.  
- **Matplotlib/Seaborn**: per la visualizzazione dei risultati.
