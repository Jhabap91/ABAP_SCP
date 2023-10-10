CLASS zcl_insert_data_5255 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_5255 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_travel   TYPE STANDARD TABLE OF ztb_travel_5255,
          lt_booking  TYPE STANDARD TABLE OF ztb_booking_5255,
          lt_book_sup TYPE STANDARD TABLE OF ztb_bookspl_5255.

    SELECT FROM /dmo/travel AS tra
       FIELDS tra~travel_id,
              tra~agency_id,
              tra~customer_id,
              tra~begin_date,
              tra~end_date,
              tra~booking_fee,
              tra~total_price,
              tra~currency_code,
              tra~description,
              tra~status AS overall_status,
              tra~createdby AS created_by,
              tra~createdat AS created_at,
              tra~lastchangedby AS last_changed_by,
              tra~lastchangedat AS last_changed_at
      INTO CORRESPONDING FIELDS OF TABLE @lt_travel
       UP TO 50 ROWS.

    SELECT FROM /dmo/booking
      FIELDS *
      FOR ALL ENTRIES IN @lt_travel
      WHERE travel_id EQ @lt_travel-travel_id
      INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    SELECT FROM /dmo/book_suppl
      FIELDS *
      FOR ALL ENTRIES IN @lt_booking
      WHERE travel_id EQ @lt_booking-travel_id
        AND booking_id EQ @lt_booking-booking_id
      INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    DELETE FROM: ztb_travel_5255,
                 ztb_booking_5255,
                 ztb_bookspl_5255.

    INSERT: ztb_travel_5255 FROM TABLE @lt_travel,
            ztb_booking_5255 FROM TABLE @lt_booking,
            ztb_bookspl_5255 FROM TABLE @lt_book_sup.

    out->write(
      EXPORTING
        data   = 'DONE!'
*        name   =
*      RECEIVING
*        output =
    ).

  ENDMETHOD.
ENDCLASS.
