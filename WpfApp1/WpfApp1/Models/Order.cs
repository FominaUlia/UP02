using System;
using System.Collections.Generic;

namespace WpfApp1.Models;

public partial class Order
{
    public int OrderNumber { get; set; }

    public string OrderItemNumber { get; set; } = null!;

    public DateOnly OrderDate { get; set; }

    public DateOnly DeliveryDate { get; set; }

    public int IdPickupPoint { get; set; }

    public int IdUser { get; set; }

    public int IdReceiving { get; set; }

    public int IdStatus { get; set; }

    public virtual PickupPoint IdPickupPointNavigation { get; set; } = null!;

    public virtual Status IdStatusNavigation { get; set; } = null!;

    public virtual User IdUserNavigation { get; set; } = null!;
}
