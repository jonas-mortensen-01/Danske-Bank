       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VAR-TEXT PIC X(30) VALUE "HELLO med variabel".

       PROCEDURE DIVISION.
      *Kommentar virker sådan her
       DISPLAY VAR-TEXT
       STOP RUN.
