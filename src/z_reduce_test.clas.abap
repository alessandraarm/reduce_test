CLASS z_reduce_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    TYPES: BEGIN OF ty_employee,
             name             TYPE string,
             experience_years TYPE i,
             salary           TYPE i,
           END OF ty_employee.

    TYPES: ty_employee_tt TYPE TABLE OF ty_employee.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_REDUCE_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_employees   TYPE ty_employee_tt,
          l_total_sal TYPE i.

    lt_employees = VALUE #( ( name = 'Maria' experience_years = 8 salary = 6000 )
                            ( name = 'João'  experience_years = 3 salary = 4000 )
                            ( name = 'Pedro' experience_years = 6 salary = 5500 )
                            ( name = 'Rita'  experience_years = 4 salary = 4800 ) ).

    l_total_sal = REDUCE i( INIT l_amount = 0
                            FOR ls_employee IN lt_employees
                            WHERE ( experience_years > 5 )
                            NEXT l_amount = l_amount + ls_employee-salary ).

    out->write( |Total salário: { l_total_sal }| ).

  ENDMETHOD.
ENDCLASS.
