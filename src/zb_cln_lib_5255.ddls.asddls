@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS Cliente y Libreria'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZB_cln_lib_5255
  as select from ztb_cln_lib_5255 as cln_lib
{
  key cln_lib.id_libro                    as IdLibro,
      count(distinct cln_lib.id_cliente ) as Ventas
}
group by
  cln_lib.id_libro
