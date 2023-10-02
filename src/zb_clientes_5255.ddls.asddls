@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZB_CLIENTES_5255
  as select from ztb_client_5255  as cliente
    inner join   ztb_cln_lib_5255 as ClientLib on cliente.id_cliente = ClientLib.id_cliente
{
  key ClientLib.id_cliente                                      as IdCliente,
  key ClientLib.id_libro                                        as IdLibro,
  key cliente.tipo_acceso                                       as TipoAcceso,
      cliente.nombre                                            as Nombre,
      cliente.apellidos                                         as Apellidos,
      concat_with_space( cliente.nombre, cliente.apellidos, 1 ) as FullName,
      cliente.email                                             as Email,
      cliente.url                                               as ClienteUrl
}
