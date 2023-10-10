@EndUserText.label: 'Consumption - Booking Supplement'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUPPLEMENT_5255
  as projection on Z_I_BOOKSPL_5255
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      _SupplementText.Description as SupplementDesc : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel : redirected to Z_C_TRAVEL_5255,
      _Booking : redirected to parent Z_C_BOOKING_5255,
      _Product,
      _SupplementText
}
