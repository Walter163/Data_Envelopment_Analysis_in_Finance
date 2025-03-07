# Analisi dell'Efficienza dei Fondi Comuni Italiani tramite DEA

## Descrizione del Progetto
Questo progetto applica la tecnica **Data Envelopment Analysis (DEA)** per valutare l'efficienza relativa dei fondi comuni d'investimento italiani. L'obiettivo principale è analizzare il rapporto tra input (rischi e costi) e output (rendimenti attesi) per identificare i fondi più efficienti, fornendo un modello flessibile per l'ottimizzazione e il benchmarking.

La metodologia si basa sul **modello CCR Input-Oriented**, con estensioni al modello BCC e altre varianti per considerare rendimenti di scala variabili. Il progetto è sviluppato in Python, utilizzando la libreria **Pyfrontier** per l'implementazione della DEA.

---

## Dataset
Il dataset include informazioni su **52 fondi comuni d'investimento** italiani, suddivisi in tre categorie principali secondo la classificazione Morningstar:
1. **Azionario Italia** (22 fondi)
2. **Obbligazionario Governativo EUR** (15 fondi)
3. **Bilanciati Moderati EUR** (15 fondi)

I dati coprono il periodo dal **01/01/2019 al 30/06/2021**, un intervallo caratterizzato da eventi macroeconomici significativi come la pandemia di COVID-19.

### Variabili utilizzate:
- **Input**:
  - **Deviazione Standard**: misura della volatilità dei rendimenti logaritmici annualizzati.
  - **Beta**: sensibilità del fondo alle variazioni del mercato (calcolato rispetto al FTSE Italia All Share).
  - **Commissioni d'Ingresso**: costi iniziali sostenuti dagli investitori (in %).
- **Output**:
  - **Rendimento Atteso**: media annua dei rendimenti logaritmici.

### Fonti dei dati:
- **Morningstar**: per la classificazione dei fondi e le commissioni d'ingresso.
- **Investing.com**: per le serie storiche settimanali dei rendimenti.

---

## Metodologia
1. **Calcolo degli Indicatori**:
   - **Deviazione Standard**: calcolata sui rendimenti logaritmici settimanali e annualizzata.
   - **Beta**: determinato tramite regressione lineare tra i rendimenti del fondo e quelli del mercato.
   - **Rendimento Atteso**: calcolato come media dei rendimenti logaritmici annualizzati.

2. **DEA con Pyfrontier**:
   Il modello CCR input-oriented è implementato utilizzando **Pyfrontier**, una libreria Python specifica per la Data Envelopment Analysis. Questo approccio minimizza gli input (rischi e costi) necessari per raggiungere un determinato livello di rendimento.

3. **Analisi Comparativa**:
   L'efficienza viene analizzata sia all'interno di ciascuna categoria di fondi (intra-categoria) che tra le diverse categorie (inter-categoria), permettendo un confronto omogeneo e una valutazione complessiva.

4. **Estensioni**:
   - **Inclusione di ETF**: sono stati aggiunti due ETF (uno azionario e uno obbligazionario) per confrontare l'efficienza dei fondi passivi con quelli a gestione attiva.
   - **Analisi dei fondi ESG**: è stata valutata l'efficienza dei fondi che integrano criteri ambientali, sociali e di governance (ESG) rispetto ai fondi tradizionali.

---

## Risultati Principali
- **Fondi Obbligazionari più Efficienti**: I fondi obbligazionari governativi EUR hanno registrato il punteggio di efficienza più alto (0,856), grazie alla loro bassa volatilità e costi contenuti.
- **Fondi Azionari meno Efficienti**: Nonostante rendimenti più elevati, i fondi azionari italiani hanno mostrato un'efficienza inferiore (0,575) a causa della maggiore esposizione al rischio.
- **ETF**: L'ETF obbligazionario ha raggiunto un'efficienza massima (1,000), mentre l'ETF azionario ha ottenuto un punteggio inferiore (0,631), evidenziando che la gestione passiva non garantisce automaticamente efficienza.
- **Fondi ESG**: I fondi ESG hanno registrato un'efficienza leggermente inferiore rispetto ai fondi tradizionali, suggerendo che i criteri di sostenibilità non si traducono necessariamente in un vantaggio finanziario.

---

## Requisiti
Per eseguire il progetto sono necessari i seguenti strumenti e librerie:
- **Python 3.8+**
- **Libreria Pyfrontier**: per l'implementazione della DEA.
- **Pandas**: per la gestione e l'analisi dei dati.
- **NumPy**: per i calcoli numerici.
- **Matplotlib**: per la visualizzazione dei risultati.
- **mpl_toolkits**: per la visualizzazione dei risultati.

