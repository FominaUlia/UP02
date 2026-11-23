using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class Provider
{
    public int IdProvider { get; set; }

    public string Provider1 { get; set; } = null!;

    public virtual ICollection<Nomenclature> Nomenclatures { get; set; } = new List<Nomenclature>();
}
