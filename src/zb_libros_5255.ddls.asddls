@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZB_LIBROS_5255
  as select from    ztb_libros_5255 as Libros
    inner join      ztb_catego_5255 as Categoria on Libros.bi_categ = Categoria.bi_categ
    left outer join ZB_cln_lib_5255 as Ventas    on Libros.id_libro = Ventas.IdLibro
  association [1..*] to ZB_CLIENTES_5255 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key  Libros.id_libro       as IdLibro,
  key  Libros.bi_categ       as BiCateg,
       Libros.titulo         as Titulo,
       Libros.autor          as Autor,
       Libros.editorial      as Editorial,
       Libros.idioma         as Idioma,
       Libros.paginas        as Paginas,
       @Semantics.amount.currencyCode: 'Moneda'
       Libros.precio         as Precio,
       case
        when Ventas.Ventas < 1 then 0
        when Ventas.Ventas = 1 then 1
        when Ventas.Ventas = 2 then 2
        else 3
        end                  as Ventas,
       ''                    as Text,
       Libros.moneda         as Moneda,
       Libros.formato        as Formato,
       Categoria.descripcion as Descripcion,
       Libros.url            as Url,
       _Clientes      
}
