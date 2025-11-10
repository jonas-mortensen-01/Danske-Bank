       IDENTIFICATION DIVISION.
       PROGRAM-ID. Opgave3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Firstname PIC X(20) VALUE " ".
       01 Lastname PIC X(20) VALUE " ".
       01 Fullname PIC X(40) VALUE " ".
       01 Cleanname    PIC X(40) VALUE SPACES.
       01 IndexVar     PIC 99 VALUE 1.
       01 CleanIndex   PIC 99 VALUE 1.
       01 PreviousChar PIC X VALUE SPACE.

       PROCEDURE DIVISION.
       MOVE "Lars" TO Firstname.
       MOVE "Hansen" TO Lastname.

       STRING 
           Firstname DELIMITED BY SIZE
           Lastname DELIMITED BY SIZE
           INTO Fullname

       DISPLAY Firstname. 
       DISPLAY Lastname.

       PERFORM VARYING IndexVar FROM 1 BY 1 UNTIL IndexVar > 40
           IF Fullname(IndexVar:1) NOT = SPACE OR PreviousChar NOT = SPACE
               MOVE Fullname(IndexVar:1) TO Cleanname(CleanIndex:1)
               ADD 1 TO CleanIndex
           END-IF
           MOVE Fullname(IndexVar:1) TO PreviousChar
       END-PERFORM

       DISPLAY Cleanname.
       STOP RUN.