       IDENTIFICATION DIVISION.
       PROGRAM-ID. Opgave6.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT KundeFil ASSIGN TO "Kundeoplysninger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  KundeFil.
       01  KundeRecord.
           02 KundeRecord-KundeID       PIC X(20).
           02 KundeRecord-Fornavn       PIC X(20).
           02 KundeRecord-Efternavn     PIC X(20).
           02 KundeRecord-KontoInfo.
               03 KundeRecord-KontoInfo-KontoNummer PIC X(20).
               03 KundeRecord-KontoInfo-Balance     PIC 9(7)V99.
               03 KundeRecord-KontoInfo-ValutaKode  PIC X(3).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG      PIC X VALUE "N".
           88 END-OF-FILE VALUE "Y".

       01 KundeOPL.
           COPY "KUNDEOPL.cpy".

       PROCEDURE DIVISION.
       OPEN INPUT KundeFil
    
       PERFORM UNTIL END-OF-FILE
           READ KundeFil
               AT END
                   SET END-OF-FILE TO TRUE
               NOT AT END
                   MOVE KundeRecord-KundeID          TO KundeId
                   MOVE KundeRecord-Fornavn          TO Fornavn
                   MOVE KundeRecord-Efternavn        
                       TO Efternavn
                   MOVE KundeRecord-KontoInfo-KontoNummer
                       TO KontoNummer
                   MOVE KundeRecord-KontoInfo-Balance
                       TO Balance
                   MOVE KundeRecord-KontoInfo-ValutaKode
                       TO ValutaKode
    
                   DISPLAY "ID: "       KundeID
                   DISPLAY "Firstname: " Fornavn
                   DISPLAY "Lastname: "  Efternavn
                   DISPLAY "Account: "   KontoNummer
                   DISPLAY "Balance: "   Balance
                   DISPLAY "Currency: "  ValutaKode
                   DISPLAY "----------------------------------------"
           END-READ
       END-PERFORM
    
       CLOSE KundeFil
       STOP RUN.
