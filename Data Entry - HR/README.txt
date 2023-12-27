Data Entry - HR

File:
 - Tabella HR.ipynb
	File Jupyter Notebook che crea un file CSV contenente i dati fittizi dei candidati.
 - Candidati.csv
	File di testo, formato Csv, contenente i dati fittizi dei canditati: viene gerato dallo script Python
 - Gestione dei Candidati.xlsm
	File formato Excel con codice VBA con cui vengono caricati, gestiti ed esaminati i dati dei candidati. Permette anche di aggiungere o eliminare nuove 	righe.

Descrizione del progetto:

1. Creazione della tabella dati
	Attraverso l'utilizzo dell'algoritmo, viene creata, in maniera del tutto casuale,una tabella con una quantità definibile di righe.
	Ognuna di queste righe contiene i dati di un singolo individuo o candidato. Alcuni dati possono essere ripetuti come il nome o il cognome ma il codice, 		associato ad ogni individuo è generato in maniera univoca. L'esecuzione del dello script genera il file "Candidati.csv" che conterà tutti questi dati. 

2. Funzioni del gestionale
	Utilizzando le funzioni del file Excel, è possibile svolgere diverse attività di inserimento e/o consultazione dei dati, fra quali:
		-Inserimento di un nuovo candidato,
		-Ricerca dei dati di un candidato partendo da uno qualsiasi dei suoi dati,
		-Eliminazione di un record,
		-Visualizzazione dei dati dei candidati più rilevanti,
		-Piccola analisi sui dati che sono stati inseriti come il numero di richieste per impiego o la divisione dei candiati per genere.
	
	L'obiettivo di questo progetto è quello di creare una base per un gestionale di facile ed intuitivo utilizzo, che permetta di di avere sempre facile 		accesso ai dati più importanti e richiesti.