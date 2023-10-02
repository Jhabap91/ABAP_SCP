@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS Categorias'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZB_CATEGORIA_5255
  as select from ztb_catego_5255 as cat
{
  key cat.bi_categ    as BiCateg,
      @Semantics.text: true
      cat.descripcion as Descripcion
}
