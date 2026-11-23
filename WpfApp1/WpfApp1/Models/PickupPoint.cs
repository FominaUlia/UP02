using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class PickupPoint
{
    public int IdPickupPoint { get; set; }

    public string PickupPoint1 { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
