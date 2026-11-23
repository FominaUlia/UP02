using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WpfApp1.Models;

public partial class DBContext : DbContext
{
    public DBContext()
    {
    }

    public DBContext(DbContextOptions<DBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Manufacture> Manufactures { get; set; }

    public virtual DbSet<Measure> Measures { get; set; }

    public virtual DbSet<Nomenclature> Nomenclatures { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<PickupPoint> PickupPoints { get; set; }

    public virtual DbSet<ProductCategory> ProductCategories { get; set; }

    public virtual DbSet<Provider> Providers { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=up;Username=postgres;Password=postgres");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Manufacture>(entity =>
        {
            entity.HasKey(e => e.IdManufacture).HasName("manufacture_pkey");

            entity.ToTable("manufacture");

            entity.Property(e => e.IdManufacture).HasColumnName("id_manufacture");
            entity.Property(e => e.Manufacture1)
                .HasMaxLength(100)
                .HasColumnName("manufacture");
        });

        modelBuilder.Entity<Measure>(entity =>
        {
            entity.HasKey(e => e.IdMeasure).HasName("measure_pkey");

            entity.ToTable("measure");

            entity.Property(e => e.IdMeasure).HasColumnName("id_measure");
            entity.Property(e => e.Measure1)
                .HasMaxLength(10)
                .HasColumnName("measure");
        });

        modelBuilder.Entity<Nomenclature>(entity =>
        {
            entity.HasKey(e => e.IdNomenclature).HasName("nomenclature_pkey");

            entity.ToTable("nomenclature");

            entity.Property(e => e.IdNomenclature).HasColumnName("id_nomenclature");
            entity.Property(e => e.ArticleNumber)
                .HasMaxLength(6)
                .HasColumnName("article_number");
            entity.Property(e => e.CurrentDiscount).HasColumnName("current_discount");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .HasColumnName("description");
            entity.Property(e => e.IdCategoryProduct).HasColumnName("id_category_product");
            entity.Property(e => e.IdManufacturer).HasColumnName("id_manufacturer");
            entity.Property(e => e.IdMeasure).HasColumnName("id_measure");
            entity.Property(e => e.IdProvider).HasColumnName("id_provider");
            entity.Property(e => e.Photo)
                .HasMaxLength(300)
                .HasColumnName("photo");
            entity.Property(e => e.Price)
                .HasPrecision(10, 2)
                .HasColumnName("price");
            entity.Property(e => e.ProductName)
                .HasMaxLength(300)
                .HasColumnName("product_name");
            entity.Property(e => e.QuantityInStock).HasColumnName("quantity_in_stock");

            entity.HasOne(d => d.IdCategoryProductNavigation).WithMany(p => p.Nomenclatures)
                .HasForeignKey(d => d.IdCategoryProduct)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("nomenclature_id_category_product_fkey");

            entity.HasOne(d => d.IdManufacturerNavigation).WithMany(p => p.Nomenclatures)
                .HasForeignKey(d => d.IdManufacturer)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("nomenclature_id_manufacturer_fkey");

            entity.HasOne(d => d.IdMeasureNavigation).WithMany(p => p.Nomenclatures)
                .HasForeignKey(d => d.IdMeasure)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("nomenclature_id_measure_fkey");

            entity.HasOne(d => d.IdProviderNavigation).WithMany(p => p.Nomenclatures)
                .HasForeignKey(d => d.IdProvider)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("nomenclature_id_provider_fkey");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderNumber).HasName("order_pkey");

            entity.ToTable("order");

            entity.Property(e => e.OrderNumber).HasColumnName("order_number");
            entity.Property(e => e.DeliveryDate).HasColumnName("delivery_date");
            entity.Property(e => e.IdPickupPoint).HasColumnName("id_pickup_point");
            entity.Property(e => e.IdReceiving).HasColumnName("id_receiving");
            entity.Property(e => e.IdStatus).HasColumnName("id_status");
            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.OrderDate).HasColumnName("order_date");
            entity.Property(e => e.OrderItemNumber)
                .HasMaxLength(23)
                .HasColumnName("order_item_number");

            entity.HasOne(d => d.IdPickupPointNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdPickupPoint)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("order_id_pickup_point_fkey");

            entity.HasOne(d => d.IdStatusNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdStatus)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("order_id_status_fkey");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("order_id_user_fkey");
        });

        modelBuilder.Entity<PickupPoint>(entity =>
        {
            entity.HasKey(e => e.IdPickupPoint).HasName("pickup_point_pkey");

            entity.ToTable("pickup_point");

            entity.Property(e => e.IdPickupPoint).HasColumnName("id_pickup_point");
            entity.Property(e => e.PickupPoint1)
                .HasMaxLength(300)
                .HasColumnName("pickup_point");
        });

        modelBuilder.Entity<ProductCategory>(entity =>
        {
            entity.HasKey(e => e.IdProductCategory).HasName("product_category_pkey");

            entity.ToTable("product_category");

            entity.Property(e => e.IdProductCategory).HasColumnName("id_product_category");
            entity.Property(e => e.ProductCategory1)
                .HasMaxLength(150)
                .HasColumnName("product_category");
        });

        modelBuilder.Entity<Provider>(entity =>
        {
            entity.HasKey(e => e.IdProvider).HasName("provider_pkey");

            entity.ToTable("provider");

            entity.Property(e => e.IdProvider).HasColumnName("id_provider");
            entity.Property(e => e.Provider1)
                .HasMaxLength(300)
                .HasColumnName("provider");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.IdRole).HasName("role_pkey");

            entity.ToTable("role");

            entity.Property(e => e.IdRole).HasColumnName("id_role");
            entity.Property(e => e.EmployeeRole)
                .HasMaxLength(50)
                .HasColumnName("employee_role");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.HasKey(e => e.IdStatus).HasName("status_pkey");

            entity.ToTable("status");

            entity.Property(e => e.IdStatus).HasColumnName("id_status");
            entity.Property(e => e.Status1)
                .HasMaxLength(50)
                .HasColumnName("status");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.IdUser).HasName("user_pkey");

            entity.ToTable("user");

            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.Fio)
                .HasMaxLength(300)
                .HasColumnName("fio");
            entity.Property(e => e.IdRole).HasColumnName("id_role");
            entity.Property(e => e.Login)
                .HasMaxLength(50)
                .HasColumnName("login");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .HasColumnName("password");

            entity.HasOne(d => d.IdRoleNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.IdRole)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("user_id_role_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
