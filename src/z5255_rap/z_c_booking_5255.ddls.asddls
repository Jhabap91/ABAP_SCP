@EndUserText.label: 'CDS Consumption - Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z_C_BOOKING_5255
  as projection on Z_I_BOOKING_5255
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerID,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Travel : redirected to parent Z_C_TRAVEL_5255,
      _BookingSupplement : redirected to composition child Z_C_BOOKSUPPLEMENT_5255,
      _Carrier,
      _Connection,
      _Customer

}
