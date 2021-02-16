*&---------------------------------------------------------------------*
*& Report  ZGIT_DEMO_REPORT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zgit_demo_report.

PARAMETERS: price TYPE p.

PERFORM minus_ten_percent CHANGING price.

WRITE price.


*&---------------------------------------------------------------------*
*&      Form  minus_ten_percent
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--FPRICE     text
*----------------------------------------------------------------------*
FORM minus_ten_percent CHANGING fprice TYPE p.

  fprice = fprice * '0.9'.

ENDFORM.                    "Minus_ten_percent

*----------------------------------------------------------------------*
*       CLASS test DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS test DEFINITION FOR TESTING.  "#AU Risk_Level Harmless
  "#AU Duration Short

  PRIVATE SECTION.

    METHODS test_minus_ten_percent FOR TESTING.

ENDCLASS.                    "test DEFINITION

*----------------------------------------------------------------------*
*       CLASS test IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS test IMPLEMENTATION.

  METHOD test_minus_ten_percent.

    DATA: testprice TYPE p VALUE '200'.

    PERFORM minus_ten_percent CHANGING testprice.

    cl_aunit_assert=>assert_equals( act = testprice exp = '170'

                        msg = 'ninety percent not calculated correctly').

  ENDMETHOD.                    "test_minus_ten_percent

ENDCLASS.                    "test IMPLEMENTATION
