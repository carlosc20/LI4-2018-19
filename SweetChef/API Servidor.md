
#API

##Receita

###GET
* api/Receita
  * Retorna as informações respetivas a todas as receitas
* api/Receita/{id}
  * Retorna a receita com o id com todas as informaçoes.
    * Informação
    * Ingredientes
    * Utensilios
    * Passo
      * Info
      * Ingredientes
      * Utensilios
* api/Receita/recomendadas/{idUtilizador}
  * Retorna as informações de receitas tendo em consideração os gostos do utilizador exceto as receitas das restrições alimentares
    * Nao retorna as favoritas  
* api/Receita/filtradas?dif=...&dur=...&tags=...&tags
  * Retorna receitas filtradas. Todos os campos são opcionais. Tags é uma lista.
* api/Receita/favoritas/{idUtilizador}
  * Retorna as receitas favoritas do utilizador


##Utilizador

###GET
* api/utilizador/{id}/favoritas
  * Retorna as receitas favoritas do utilizador
* api/Utilizador/{id}
  * Retorna as informações do utilizador.
* api/Utilizador/{idUt}/opiniao/{idReceita}
  * Retorna a opiniao correspondente a uma receita 
* api/Utilizador/{idUt}/passoFeedback/{idReceita}/{idPasso}/
  * Retorna o feedback do utilizador relativo a um passo

###POST
* api/utilizador
  * TO BE EXPLAINED
* api/Utilizador/autenticar
  * TO BE EXPLAINED
* api/Utilizador/{idUt}/opiniao/{idReceita}/?arguments
  * Chamar Put para criar opinião. se não existir
    * bool favorito
    * (Optional) short rating
    * bool blacklisted
* api/Utilizador/{idUt}/passoFeedback/{idReceita}/{idPasso}/?argumentos
    * (Opcional) int dificuldade
    * string comentario 

###PUT
* api/Utilizador/{idUt}/opiniao/{idReceita}/?arguments
  * Chamar Post para atualizar um campo. Precisa de existir
    * (Optional) bool favorito
    * (Optional) short rating
    * (Optional) bool blacklisted
* api/Utilizador/{idUt}/passoFeedback/{idReceita}/{idPasso}/?argumentos
    * (Opcional) int dificuldade
    * (Opcional) string comentario 
##Duvida

###GET
* api/duvida/{idReceita}/{idPasso}
  * Retorna array com todas as dúvidas associadas passo.