using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class Nomenclature
{
    public int IdNomenclature { get; set; }

    public string ArticleNumber { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public int IdMeasure { get; set; }

    public decimal Price { get; set; }

    public int IdCategoryProduct { get; set; }

    public int CurrentDiscount { get; set; }

    public int QuantityInStock { get; set; }

    public string? Description { get; set; }

    public string? Photo { get; set; }

    public int IdProvider { get; set; }

    public int IdManufacturer { get; set; }

    public virtual ProductCategory IdCategoryProductNavigation { get; set; } = null!;

    public virtual Manufacture IdManufacturerNavigation { get; set; } = null!;

    public virtual Measure IdMeasureNavigation { get; set; } = null!;

    public virtual Provider IdProviderNavigation { get; set; } = null!;
}
