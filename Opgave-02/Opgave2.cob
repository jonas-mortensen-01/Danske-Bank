       IDENTIFICATION DIVISION.
       PROGRAM-ID. Opgave2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Kunde-id PIC X(10) VALUE " ".
       01 Fornavn PIC X(20) VALUE " ".
       01 Efternavn PIC X(20) VALUE " ".
       01 Kontonummer PIC 9(7)V99 VALUE 0.00.
       01 Valutakode PIC X(3) VALUE " ".

       PROCEDURE DIVISION.
       MOVE "1234567890" TO Kunde-id.
       MOVE "Lars" TO Fornavn.
       MOVE "Hansen" TO Efternavn.
       MOVE 1234567.89 TO Kontonummer.
       MOVE "DKK" TO Valutakode.

       DISPLAY "Kunde data".
       DISPLAY Kunde-id. 
       DISPLAY Fornavn. 
       DISPLAY Efternavn.
       DISPLAY Kontonummer. 
       DISPLAY ValutaKode.
       STOP RUN.
