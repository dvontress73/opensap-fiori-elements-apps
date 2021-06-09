@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@Search.searchable: true
@ObjectModel.semanticKey: ['TravelID']

define root view entity ZC_FE_TRAVEL_000003
  as projection on ZI_FE_TRAVEL_000003
{
  key TravelUUID,
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90
  @ObjectModel.text.element: ['Description']
  @EndUserText.label: 'Travel'
  TravelID,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Agency', 
      element: 'AgencyID'
    }
  } ]
  @ObjectModel.text.element: ['AgencyName']
  AgencyID,
  _Agency.Name as AgencyName,
  
  @ObjectModel.text.element: ['LastName']
  CustomerID,
  _Customer.LastName as LastName,
  
  BeginDate,
  
  EndDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BookingFee,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TotalPrice,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
  } ]
  CurrencyCode,
  
  Description,
  
  @EndUserText.label: 'Status'
  OverallStatus,
  
  CreatedBy,
  
  CreatedAt,
  
  LastChangedBy,
  
  @EndUserText.label: 'Last Changed At'
  LastChangedAt,
  
  LocalLastChangedAt,
  
  _Booking : redirected to composition child ZC_FE_BOOKING_000003,
  
  _Agency,
  
  _Currency,
  
  _Customer,
  
  _TravelStatus
}
