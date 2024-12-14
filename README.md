# Analisi dell'Efficienza dei Fondi di Investimento tramite DEA

## Descrizione del Progetto
Questo progetto utilizza la tecnica statistica **Data Envelopment Analysis (DEA)** per valutare l'efficienza di fondi d'investimento appartenenti a diverse classi di rischio e rendimento. L'obiettivo principale è identificare i fondi più efficienti nel rapporto tra input (rischi e costi) e output (rendimenti attesi), fornendo un modello flessibile per analisi comparativa e ottimizzazione.

La metodologia applicata è basata sul **modello CCR Input-Oriented**, con la possibilità di estendere l'analisi a modelli alternativi o orientamenti diversi. 

Il progetto è sviluppato interamente in Python utilizzando la libreria **Pyfrontier**.

---

## Dataset
Il dataset di base include informazioni sui fondi d'investimento, con serie storiche di rendimenti da gennaio 2021 a giugno 2023. I dati sono pre-processati per calcolare gli indicatori di rischio e rendimento necessari all'analisi DEA.

### Variabili utilizzate:
- **Input**:
  - **Deviazione Standard**: misura della volatilità dei rendimenti logaritmici.
  - **Beta**: sensibilità del fondo alle variazioni del mercato (calcolato rispetto al FTSE Italia All Share).
  - **Commissioni d'Ingresso**: costi iniziali sostenuti dagli investitori(%)
- **Output**:
  - **Rendimento Atteso**: media annua dei rendimenti logaritmici.

### Classificazione dei Fondi:
I fondi sono suddivisi in tre categorie, basate sulla classificazione Morningstar:
1. **Azionario Italiano**
2. **Obbligazionario Governativo EUR**
3. **Bilanciato Moderato Europeo**

---

## Metodologia
1. **Calcolo degli Indicatori**:
   - **Deviazione Standard**: calcolata sui rendimenti logaritmici settimanali.
   - **Beta**: determinato come rapporto tra la covarianza dei rendimenti del fondo e del mercato, e la varianza dei rendimenti del mercato.
   - **Rendimento Atteso**: calcolato come media aritmetica dei rendimenti logaritmici annualizzati.

2. **DEA con Pyfrontier**:
   Il modello CCR input-oriented è implementato utilizzando **Pyfrontier**, una libreria Python specifica per la Data Envelopment Analysis. Questo approccio minimizza gli input richiesti per raggiungere un rendimento target.

3. **Analisi Comparativa**:
   L'efficienza viene analizzata separatamente per ciascuna classe di fondi, permettendo un confronto omogeneo tra fondi con profili di rischio simili.

---

## Requisiti
Per eseguire il progetto sono necessari i seguenti strumenti e librerie:
- **Python 3.8+**
- **Libreria Pyfrontier**: per l'implementazione
