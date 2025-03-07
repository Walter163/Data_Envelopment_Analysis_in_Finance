# Efficiency Analysis of Investment Funds Using DEA  
## **CCR Input-Oriented Model (3 Inputs, 1 Output)**  

### **Project Description**  
This project utilizes **Data Envelopment Analysis (DEA)** to evaluate the efficiency of investment funds, considering a broader perspective of factors influencing the risk-return relationship. The applied **CCR input-oriented model** minimizes costs and risks (**inputs**) required to achieve an **expected return** (**output**).  

---

## **Dataset**  
The dataset contains information on returns and costs associated with funds, calculated from historical series in the period **January 2021 - June 2023**.  

### **Variables Used**  
- **Inputs:**  
  - 📉 **Standard Deviation** – Volatility of weekly logarithmic returns.  
  - 📊 **Beta** – Sensitivity to market fluctuations, calculated relative to the FTSE Italia All Share.  
  - 💰 **Entry Fees** – Percentage of initial cost applied to investments.  

- **Output:**  
  - 🚀 **Expected Return** – Annual average of logarithmic returns.  

---

## **Methodology**  

### **Calculation of Indicators**  
1. **Standard Deviation**  
   - Calculated on weekly logarithmic returns.  
   - Represents the overall risk (**volatility**) of the fund.  

2. **Beta**  
   - Calculated as the ratio between the covariance of fund and market returns (**FTSE Italia All Share**) and the variance of market returns.  
   - Measures **systematic risk**, i.e., sensitivity to market fluctuations.  

3. **Entry Fees**  
   - Recorded as a **percentage** of the initial invested capital.  
   - Represents a **fixed cost** independent of fund performance.  

4. **Expected Return**  
   - Arithmetic **mean of annualized logarithmic returns**.  

### **DEA Model - CCR Input-Oriented**  
The DEA model uses **Pyfrontier** to analyze the relative efficiency of funds.  

- **Objective**: Minimize inputs (**Standard Deviation, Beta, and Entry Fees**) required to achieve the **expected return** (**output**).  
- **Efficiency** is expressed as a **score ranging from 0 to 1**, where funds with a score of **1** are considered **efficient** relative to others.  

The analysis compares funds within **three categories** defined by Morningstar:  
1. **Italian Equity**  
2. **Euro Government Bonds**  
3. **Moderate European Balanced**  

---

## **Requirements**  
To run the project, the following tools and libraries are required:  

- 🐍 **Python 3.8+**  
- 📦 **Pyfrontier** – for implementing DEA  
- 🐼 **Pandas** – for dataset management  
- 🔢 **NumPy** – for statistical calculations  
- 📈 **Matplotlib** – for graphical visualization of results  

---

# Install dependencies
pip install pandas numpy matplotlib pyfrontier  
