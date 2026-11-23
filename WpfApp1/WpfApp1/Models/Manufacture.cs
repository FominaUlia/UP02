using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class Manufacture
{
    public int IdManufacture { get; set; }

    public string Manufacture1 { get; set; } = null!;

    public virtual ICollection<Nomenclature> Nomenclatures { get; set; } = new List<Nomenclature>();
}
