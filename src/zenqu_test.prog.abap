*&---------------------------------------------------------------------*
*& Report  ZENQU_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zenqu_test.

*DATA MODE_ZEZENQU TYPE ENQMODE.
DATA CLIENT       TYPE mandt.
DATA KEYFIELD     TYPE char5.

CALL FUNCTION 'ENQUEUE_EZENQU'
 EXPORTING
   MODE_ZEZENQU         = 'X'
   CLIENT               = SY-MANDT
   KEYFIELD             = KEYFIELD
*   X_KEYFIELD           = ' '
*   _SCOPE               = '2'
*   _WAIT                = ' '
*   _COLLECT             = ' '
 EXCEPTIONS
   FOREIGN_LOCK         = 1
   SYSTEM_FAILURE       = 2
   OTHERS               = 3
          .
IF sy-subrc <> 0.
message 'WRONG' type 'X'.
ENDIF.
