       IDENTIFICATION DIVISION.
       PROGRAM-ID. Opgave8.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT KundeFil ASSIGN TO "Kundeoplysninger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT KontoFil ASSIGN TO "Kontooplysninger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT KundeOut ASSIGN TO "KundeoplysningerOut.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  KundeFil.
       01  KundeRecord.
           02 KundeRecord-KundeID       PIC X(10).
           02 KundeRecord-Fornavn       PIC X(20).
           02 KundeRecord-Efternavn     PIC X(20).
           02 KundeRecord-KontoId       PIC X(10).
           02 KundeRecord-Valuta        PIC X(3).
       FD  KontoFil.
       01  KontoRecord.
           02 KontoRecord-KontoID       PIC X(10).
           02 KontoRecord-KundeID       PIC X(10).
           02 KontoRecord-KontoType     PIC X(20).
           02 KontoRecord-Balance       PIC 9(10)V99.
           02 KontoRecord-Valuta        PIC X(3).

       FD  KundeOut.
       01  KundeOutLine PIC X(200).

       WORKING-STORAGE SECTION.
       01 EOF-KUNDE    PIC X VALUE "N".
          88 END-KUNDE VALUE "Y".

       01 EOF-KONTO    PIC X VALUE "N".
          88 END-KONTO VALUE "Y".

       01 WS-Balance-NUM        PIC 9(7)V99.
       01 WS-Balance-Text REDEFINES WS-Balance-NUM PIC X(9).

       01 Fullname PIC X(40) VALUE " ".
       01 Kunde-Fuldnavn PIC X(30).
       01 IndexVar     PIC 99 VALUE 1.
       01 CleanIndex   PIC 99 VALUE 1.
       01 PreviousChar PIC X VALUE SPACE.

       PROCEDURE DIVISION.
       OPEN INPUT KundeFil
       OPEN INPUT KontoFil
       OPEN OUTPUT KundeOut

       PERFORM UNTIL END-KUNDE
           READ KundeFil
               AT END
                   SET END-KUNDE TO TRUE
               NOT AT END
                   MOVE SPACES TO KundeOutLine
                   MOVE SPACES TO Kunde-Fuldnavn
                   MOVE 1 TO IndexVar
                   MOVE 1 TO PreviousChar
                   MOVE 1 TO CleanIndex

                   STRING 
                       KundeRecord-Fornavn DELIMITED BY SIZE
                       KundeRecord-Efternavn DELIMITED BY SIZE
                   INTO Fullname

                   PERFORM VARYING IndexVar FROM 1 
                           BY 1 UNTIL IndexVar > 40
                       IF Fullname(IndexVar:1) NOT = SPACE 
                           OR PreviousChar NOT = SPACE
                           MOVE Fullname(IndexVar:1) 
                               TO Kunde-Fuldnavn(CleanIndex:1)
                           ADD 1 TO CleanIndex
                       END-IF
                       MOVE Fullname(IndexVar:1) TO PreviousChar
                   END-PERFORM
       
                   STRING
                       KundeRecord-KundeID
                       " | "
                       Kunde-Fuldnavn
                       INTO KundeOutLine
                   END-STRING

                   WRITE KundeOutLine

                   CLOSE KontoFil
                   OPEN INPUT KontoFil
                   MOVE "N" TO EOF-KONTO

                   PERFORM UNTIL END-KONTO
                       READ KontoFil
                           AT END
                               MOVE "Y" TO EOF-KONTO
                           NOT AT END
                               DISPLAY KontoRecord-KundeID
                               DISPLAY KundeRecord-KundeID

                               IF KontoRecord-KundeID 
                                 = KundeRecord-KundeID(1:10)

                                  MOVE KontoRecord-Balance 
                                       TO WS-Balance-NUM

                                  STRING
                                      "    Konto: "
                                      KontoRecord-KontoId
                                      " | "
                                      KontoRecord-KontoType
                                      " | "
                                      WS-Balance-Text
                                      " "
                                      KontoRecord-Valuta
                                      INTO KundeOutLine
                                  END-STRING

                                  WRITE KundeOutLine
                               END-IF
                       END-READ
                   END-PERFORM

                   MOVE SPACES TO KundeOutLine
                   WRITE KundeOutLine

           END-READ
       END-PERFORM

       CLOSE KundeFil
       CLOSE KontoFil
       CLOSE KundeOut
       STOP RUN.
