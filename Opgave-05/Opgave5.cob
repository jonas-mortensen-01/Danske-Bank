       IDENTIFICATION DIVISION.
       PROGRAM-ID. Opgave5.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 KundeOPL.
           COPY "KUNDEOPL.cpy".

       PROCEDURE DIVISION.
       MOVE "1234567890" TO KundeID.
       MOVE "Lars" TO Fornavn.
       MOVE "Hansen" TO Efternavn.
       MOVE "12341234" TO KontoNummer.
       MOVE 999.99 TO Balance.
       MOVE "DKK" TO ValutaKode.

       DISPLAY KundeOPL.
       STOP RUN.
