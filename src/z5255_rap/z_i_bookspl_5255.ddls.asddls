@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Interfaz - Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_BOOKSPL_5255
  as select from ztb_bookspl_5255 as BookingSupplement
  association to parent Z_I_BOOKING_5255 as _Booking on  $projection.TravelId  = _Booking.TravelId
                                                     and $projection.BookingId = _Booking.BookingId
 association [1..1] to Z_I_TRAVEL_5255 as _Travel on $projection.TravelId = _Travel.TravelId
 association [1..1] to /DMO/I_Supplement as _Product on $projection.SupplementId = _Product.SupplementID
 association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
{

  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      BookingSupplement.currency_code as CurrencyCode,
      last_changed_at       as LastChangedAt,
      _Booking,
      _Travel,
      _Product,
      _SupplementText

}
