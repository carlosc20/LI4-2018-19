﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace SweetChef.ModelsNew
{
    public partial class UtensilioPasso
    {
        public int Passoid { get; set; }
        public int PassoReceitaid { get; set; }
        public int Utensilioid { get; set; }
        [JsonIgnore]
        public Passo Passo { get; set; }
        [JsonIgnore]
        public Utensilio Utensilio { get; set; }
    }
}
