@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS Acceso Categoria'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZB_ACC_CATE_5255 as select from ztb_acc_cat_5255 as acc_cat  
{
    key acc_cat.bi_categ as BiCateg,
    key acc_cat.tipo_acceso as TipoAcceso
}
