//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyPC.BD_MyPC
{
    using System;
    using System.Collections.Generic;
    
    public partial class Material
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Material()
        {
            this.OrderingMaterials = new HashSet<OrderingMaterial>();
        }
    
        public int ID { get; set; }
        public string Title { get; set; }
        public Nullable<int> ID_TypeMaterial { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<double> Purchase_price { get; set; }
        public Nullable<double> Retail_price { get; set; }
        public string Photo { get; set; }
    
        public virtual TypeMaterial TypeMaterial { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderingMaterial> OrderingMaterials { get; set; }
    }
}
