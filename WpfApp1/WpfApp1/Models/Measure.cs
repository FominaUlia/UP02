using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class Measure
{
    public int IdMeasure { get; set; }

    public string Measure1 { get; set; } = null!;

    public virtual ICollection<Nomenclature> Nomenclatures { get; set; } = new List<Nomenclature>();
}
