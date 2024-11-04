% Script DEA - Analisi Data Envelopment Analysis
clear;
clc;
close all;

%% Caricamento del file CSV contenente i dati
filename = 'Dataset_DS_B_C_ER_cleaned.csv';

% Carica il file CSV come tabella in MATLAB
data = readtable(filename);        % Carica il file CSV nella variabile "data" come tabella
disp(head(data, 5));               % Visualizza le prime 5 righe per una rapida verifica

%% Selezione del modello DEA
model = 'CCR';                     % Scelta del modello DEA:'CCR'
orientation = 'io';                % Orientamento: 'io' per input-oriented
epsilon = 0.001;                   % Piccolo valore non archimedeo per stabilizzare il modello

%% Selezione degli input e output per tutte le DMU

% Matrice degli input (una riga per ciascuna DMU)
% Estrai le colonne 2, 3 e 4 come celle di input
X_cell = data{:, 2:4};             % Estrae le colonne come cell array

% Sostituisce le virgole con i punti per facilitare la conversione numerica
X_cell = strrep(X_cell, ',', '.'); % Sostituisce le virgole con punti decimali

% Converte X in un array numerico
X = cell2mat(cellfun(@str2double, X_cell, 'UniformOutput', false)); % Converte in array numerico
disp(X(1:5, :));                  % Visualizza i primi 5 valori di X per verifica

% Matrice degli output (una riga per ciascuna DMU)
% Estrai la quinta colonna come cell array di output
Y_cell = data{:, 5};               % Estrae la colonna di output come cell array

% Sostituisce le virgole con i punti per facilitare la conversione numerica
Y_cell = strrep(Y_cell, ',', '.'); % Sostituisce le virgole con punti decimali

% Converte Y in array numerico
Y = str2double(Y_cell);            % Converte in numeri (restituisce NaN in caso di errore)
disp(Y(1:5));                      % Visualizza i primi 5 valori di Y per verifica

% Estrae il numero di DMU, input e output
[~, m] = size(X);                  % Numero di input per DMU
[n, s] = size(Y);                  % Numero di DMU e di output per DMU

%% Calcolo dei risultati dal modello DEA CCR input-oriented
% I risultati dal modello vengono salvati nella matrice Z
switch model
    % Caso modello CCR
    case ('CCR')
        switch orientation
            % Caso orientamento input-oriented
            case ('io')
                Z = zeros(n, n + m + s + 1); % Inizializza la matrice Z dei risultati
                
                % Funzione obiettivo del modello CCR input-oriented: min(0*lambda - epsilon*(s+ + s-) + theta)
                f = [zeros(1, n), -epsilon * ones(1, s), -epsilon * ones(1, m), 1];
                lblambda = zeros(n, 1);      % Limiti inferiori per (n) lambda
                lboutput = zeros(s, 1);      % Limiti inferiori per (s) variabili di output
                lbinput = zeros(m, 1);       % Limiti inferiori per (m) variabili di input
                lb = [lblambda; lboutput; lbinput]; % Limiti inferiori per lambdas, output (s+) e input (s-)
                
                % Ciclo per ogni DMU per risolvere il problema di ottimizzazione
                for j = 1:n
                    % Aeq definisce i vincoli che devono essere soddisfatti per ogni DMU
                    Aeq = [Y', -eye(s, s), zeros(s, m+1); ...       % Vincoli sugli output: trasposta della matrice degli output, di dimensione  s * n , dove  s  è il numero di output e  n  il numero di DMU. Ogni riga rappresenta gli output di una DMU specifica | matrice identità di dimensione  s * s  con segno negativo, che introduce le variabili di slack sugli output (ossia, s+ per l’eccesso sugli output) | matrice di zeri di dimensione  s * (m+1) , utilizzata per mantenere la struttura della matrice senza influenzare gli altri termini
                           -X', zeros(m, s), -eye(m, m), X(j, :)']; % Vincoli sugli input: trasposta della matrice degli input, di dimensione  m * n , dove  m  è il numero di input. Viene usato per combinare linearmente gli input delle DMU | matrice di zeri di dimensione  m * s , per mantenere la struttura della matrice | matrice identità di dimensione  m * m  con segno negativo, che rappresenta le variabili di slack sugli input (ossia, s- per il deficit negli input) | input della DMU corrente, di dimensione  m \times 1 , utilizzati per ridimensionare gli input combinati attraverso il parametro theta 
                    % beq rappresenta i valori target di output e input da rispettare per la DMU corrente
                    beq = [Y(j, :)'; zeros(m, 1)];                  % l’output della DMU corrente (target), che è il valore che la combinazione lineare degli output delle altre DMU deve raggiungere | termini noti per i vincoli sugli input, dove si vuole che la combinazione lineare degli input sia proporzionale agli input della DMU target (scalati da theta )
                    z = linprog(f, [], [], Aeq, beq, lb); % Risolve il problema con "linprog"
                    Z(j, :) = z;                         % Salva i risultati in Z per la DMU corrente
                end
                Z;                                        % Visualizza i risultati finali                
        end
end

%% Creazione della tabella dei risultati finali
% Estrai i nomi dei fondi dalla prima colonna del CSV
nomi_fondi = data{:, 1};              % La prima colonna contiene i nomi dei fondi

% Estrai i nomi delle intestazioni delle colonne di input e output
nomi_input = data.Properties.VariableNames(2:4);  % Nomi delle colonne di input
nomi_output = data.Properties.VariableNames(5);    % Nome della colonna di output

% Estrai l'efficienza direttamente da theta per ciascun fondo
efficienza = Z(:, end);

% Crea la tabella finale con i nomi dei fondi e l'efficienza
tabella_risultati = table(nomi_fondi, efficienza, 'VariableNames', {'Fondo', 'Efficienza'});

% Salva la tabella dei risultati in un file CSV
writetable(tabella_risultati, 'Efficienza_Fondi_DS_B_C_ER.csv');

%% Creazione della tabella dei valori di lambda

% Indicano i pesi con cui ciascuna DMU contribuisce a formare un “benchmark”(o combinazione lineare) 
% per confrontare una DMU specifica. Questi valori \lambda sono usati per costruire una combinazione 
% lineare degli input e degli output delle altre DMU al fine di ottenere una DMU virtuale (o “DMU ideale”) 
% che sia confrontabile con la DMU in esame

% Estrai i valori di lambda da Z
lambda_vals = Z(:, 1:n); % Ogni colonna rappresenta i valori lambda per ogni DMU

% Crea la tabella lambda in formato coerente con le altre tabelle
tabella_lambda = table(nomi_fondi, lambda_vals, 'VariableNames', {'Fondo', 'Valori_Lambda'});

% Salva la tabella dei valori di lambda in un file CSV
writetable(tabella_lambda, 'Lambda_Values_DS_B_C_ER.csv');

%% Creazione della tabella degli slack

% Misurano le differenze residue tra la DMU corrente e il punto di efficienza sulla frontiera DEA
% Nel modello orientato agli input (come il CCR input-oriented): gli slack sugli output rappresentano la possibilità 
% di migliorare ulteriormente l’output senza dover incrementare; gli input slack sugli input rappresenta la riduzione 
% addizionale negli input che potrebbe essere effettuata per raggiungere il punto di efficienza

% Estrai i valori di slack sugli input e sugli output da Z
slack_output = Z(:, n+1:n+s); % Slack sugli output (s+)
slack_input = Z(:, n+s+1:n+s+m); % Slack sugli input (s-)
tabella_slack = table(nomi_fondi, slack_output, slack_input,'VariableNames', {'Fondo', 'Slack_Output', 'Slack_Input'});

% Salva la tabella degli slack in un file CSV
writetable(tabella_slack, 'Slack_Values_DS_B_C_ER.csv');
