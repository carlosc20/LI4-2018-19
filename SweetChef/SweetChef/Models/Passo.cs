﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetChef.Models
{
    public class Passo
    {
        [Key]
        public int PassoId { set; get; }
        //public int ReceitaId { set; get; }
        public TimeSpan Duracao { set; get; }
        public string Descricao { set; get; }
        public string ImageLink { set;get; }
        public string VideoLink { set; get; }
        public string LinkExterno { set; get; }
        public List<PassoIngrediente> PassoIngredientes { set; get; }
        [Key]
        public int ReceitaId { set; get; }
        public Receita Receita { set; get; } //ESTÁ COM NAVEGABILIDADE PARA OS DOIS LADOS
    }
}