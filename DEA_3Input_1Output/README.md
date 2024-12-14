# Analisi dell'Efficienza dei Fondi di Investimento tramite DEA - Modello CCR Input-Oriented (3 Input, 1 Output)

## Descrizione del Progetto
Questo progetto utilizza la **Data Envelopment Analysis (DEA)** per valutare l'efficienza di fondi d'investimento, considerando una prospettiva più ampia di fattori che influenzano il rapporto rischio-rendimento. Il modello CCR input-oriented applicato minimizza i costi e i rischi (input) necessari per ottenere un rendimento atteso (output).  

L'analisi include **tre variabili di input**:
1. **Deviazione Standard**: come misura della volatilità.  
2. **Beta**: come misura del rischio sistematico.  
3. **Commissioni di Ingresso**: per catturare l'impatto dei costi iniziali.  

Questa configurazione consente un'analisi più dettagliata dell'efficienza dei fondi rispetto alla precedente versione con 2 input.

---

## Dataset
Il dataset contiene informazioni sui rendimenti e i costi associati ai fondi, calcolati da serie storiche nel periodo **gennaio 2021 - giugno 2023**.  

### Variabili utilizzate:
- **Input**:
  - **Deviazione Standard**: volatilità dei rendimenti logaritmici settimanali.  
  - **Beta**: sensibilità alle variazioni del mercato, calcolato rispetto al FTSE Italia All Share.  
  - **Commissioni di Ingresso**: percentuale di costo iniziale applicata agli investimenti.  
- **Output**:
  - **Rendimento Atteso**: media annua dei rendimenti logaritmici.

---

## Metodologia
### Calcolo degli Indicatori
1. **Deviazione Standard**:  
   - Calcolata sui rendimenti logaritmici settimanali.  
   - Rappresenta il rischio complessivo (volatilità) del fondo.  

2. **Beta**:  
   - Calcolato come il rapporto tra la covarianza dei rendimenti del fondo e del mercato (FTSE Italia All Share) e la varianza dei rendimenti del mercato.  
   - Misura il rischio sistematico, ossia la sensibilità alle oscillazioni del mercato.  

3. **Commissioni di Ingresso**:  
   - Rilevate come percentuale sul capitale iniziale investito.  
   - Rappresentano un costo fisso indipendente dalle performance del fondo.  

4. **Rendimento Atteso**:  
   - Media aritmetica dei rendimenti logaritmici annualizzati.  

### Modello DEA - CCR Input-Oriented
Il modello DEA utilizza **Pyfrontier** per analizzare l'efficienza relativa dei fondi.  
- Obiettivo: minimizzare gli input (Deviazione Standard, Beta e Commissioni di Ingresso) necessari per raggiungere il rendimento atteso (output).  
- L'efficienza viene espressa come un punteggio compreso tra 0 e 1, dove i fondi con punteggio pari a 1 sono considerati **efficienti** rispetto agli altri.  

L'analisi confronta i fondi all'interno delle tre classi definite da Morningstar:
1. **Azionario Italiano**  
2. **Obbligazionario Governativo EUR**  
3. **Bilanciato Moderato Europeo**  

---

## Requisiti
Per eseguire il progetto sono necessari i seguenti strumenti e librerie:  
- **Python 3.8+**  
- **Libreria Pyfrontier**: per implementare la DEA.  
- **Pandas**: per la gestione del dataset.  
- **Numpy**: per calcoli statistici.  
- **Matplotlib**: per la visualizzazione grafica dei risultati.
