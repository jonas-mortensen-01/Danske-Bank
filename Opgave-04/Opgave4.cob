       IDENTIFICATION DIVISION.
       PROGRAM-ID. Opgave4.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 KundeOPL.
           02 KundeID PIC X(20) VALUE SPACES.
           02 Fornavn PIC X(20) VALUE SPACES.
           02 Efternavn PIC X(20) VALUE SPACES.
           02 KontoInfo.
               03 KontoNummer PIC X(20) VALUE SPACES.
               03 Balance PIC 9(7)V99 VALUE ZEROS.
               03 ValutaKode PIC X(3) VALUE SPACES.

       PROCEDURE DIVISION.
       MOVE "1234567890" TO KundeID.
       MOVE "Lars" TO Fornavn.
       MOVE "Hansen" TO Efternavn.
       MOVE "12341234" TO KontoNummer.
       MOVE 999.99 TO Balance.
       MOVE "DKK" TO ValutaKode.

       DISPLAY KundeOPL.
       STOP RUN.
