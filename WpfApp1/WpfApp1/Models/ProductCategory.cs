using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class ProductCategory
{
    public int IdProductCategory { get; set; }

    public string ProductCategory1 { get; set; } = null!;

    public virtual ICollection<Nomenclature> Nomenclatures { get; set; } = new List<Nomenclature>();
}
