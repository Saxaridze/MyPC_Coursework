﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyPCEntities : DbContext
    {
        public MyPCEntities()
            : base("name=MyPCEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<Diagnostic> Diagnostics { get; set; }
        public virtual DbSet<Master> Masters { get; set; }
        public virtual DbSet<Material> Materials { get; set; }
        public virtual DbSet<Problem> Problems { get; set; }
        public virtual DbSet<Repair> Repairs { get; set; }
        public virtual DbSet<TypeDevice> TypeDevices { get; set; }
        public virtual DbSet<TypeMaterial> TypeMaterials { get; set; }
        public virtual DbSet<Work> Works { get; set; }
    }
}
