       IDENTIFICATION DIVISION.
       PROGRAM-ID. MINI-BANK.
       DATE-WRITTEN. 26-JUN-2026.
       AUTHOR. SHUBHAM-MORE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CHOICE           PIC 9 VALUE 0.
       01  WS-AMOUNT           PIC 9(10)V99 VALUE 0.
       01  WS-BALANCE          PIC 9(10)V99 VALUE 10000.00.
       01  WS-BALANCE-DISPLAY  PIC Z(9)9.99.
       01  WS-EOF              PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE WS-BALANCE TO WS-BALANCE-DISPLAY
           DISPLAY "--------------------------------"
           DISPLAY "WELCOME TO MINI BANK"
           DISPLAY "INITIAL BALANCE:  $" WS-BALANCE-DISPLAY
           DISPLAY "--------------------------------"

       PERFORM UNTIL WS-CHOICE = 3
           DISPLAY "1. DEPOSIT"
           DISPLAY "2. WITHDRAW"
           DISPLAY "3. EXIT"
           ACCEPT WS-CHOICE

       EVALUATE WS-CHOICE
           WHEN 1
                DISPLAY "ENTER DEPOSIT AMOUNT: "
                ACCEPT WS-AMOUNT
                ADD WS-AMOUNT TO WS-BALANCE
                MOVE WS-BALANCE TO WS-BALANCE-DISPLAY
                DISPLAY "UPDATED BALANCE:  $" WS-BALANCE-DISPLAY
           WHEN 2
                DISPLAY "ENTER WITHDRAW AMOUNT: "
                ACCEPT WS-AMOUNT
                IF WS-AMOUNT <= WS-BALANCE
                    SUBTRACT WS-AMOUNT FROM WS-BALANCE
                    MOVE WS-BALANCE TO WS-BALANCE-DISPLAY
                    DISPLAY "UPDATED BALANCE:  $" WS-BALANCE-DISPLAY
                ELSE
                    DISPLAY "INSUFFICIENT BALANCE!"
                END-IF
            WHEN 3
                DISPLAY "EXITING..."
            WHEN OTHER
                DISPLAY "INVALID CHOICE"
           END-EVALUATE
       END-PERFORM

       DISPLAY "--------------------------------"
       DISPLAY "BANK PROCESS COMPLETED SUCCESSFULLY"
       STOP RUN.
