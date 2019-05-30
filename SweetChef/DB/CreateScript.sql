﻿CREATE TABLE RestricoesAlimentares (Utilizadorid int NOT NULL, Ingredienteid int NOT NULL, PRIMARY KEY (Utilizadorid, Ingredienteid));
CREATE TABLE Utilizador (id int IDENTITY NOT NULL, Nome varchar(60) NOT NULL, email varchar(50) NOT NULL UNIQUE, password varchar(16) NOT NULL UNIQUE, dataNascimento datetime NOT NULL, PRIMARY KEY (id));
CREATE TABLE Ingrediente (id int IDENTITY NOT NULL, Unidadeid int NOT NULL, nome varchar(20) NOT NULL, imageLink varchar(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Unidade (id int IDENTITY NOT NULL, nome varchar(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Dislikes (Utilizadorid int NOT NULL, Tagid int NOT NULL, PRIMARY KEY (Utilizadorid, Tagid));
CREATE TABLE [Tag] (id int IDENTITY NOT NULL, [tag] varchar(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Likes (Utilizadorid int NOT NULL, Tagid int NOT NULL, PRIMARY KEY (Utilizadorid, Tagid));
CREATE TABLE Tag_Receita (Receitaid int NOT NULL, Tagid int NOT NULL, PRIMARY KEY (Receitaid, Tagid));
CREATE TABLE Receita (id int IDENTITY NOT NULL, imagemLink varchar(255) NOT NULL, videoLink varchar(255) NULL, descricao varchar(255) NOT NULL, nome varchar(60) NOT NULL, dificuldade int NOT NULL, porcoes int NOT NULL, tempodepreparacao int NOT NULL, tempodeespera int NOT NULL, energia int NOT NULL, gordura int NOT NULL, hidratosCarbono int NOT NULL, PRIMARY KEY (id));
CREATE TABLE Utilizador_Passo (Utilizadorid int NOT NULL, Passoid int NOT NULL, PassoReceitaid int NOT NULL, comentario varchar(255) NOT NULL, PRIMARY KEY (Utilizadorid, Passoid, PassoReceitaid));
CREATE TABLE Passo (numero int NOT NULL, Receitaid int NOT NULL, duracao int NOT NULL, descricao varchar(255) NOT NULL, imagemLink varchar(255) NULL, videoLink varchar(255) NULL, linkExterno varchar(255) NULL, PRIMARY KEY (numero, Receitaid));
CREATE TABLE Execucao (Receitaid int NOT NULL, Utilizadorid int NOT NULL, Data datetime NOT NULL, duracaoTotal int NOT NULL, satisfacao int NOT NULL, dificuldade int NOT NULL, PRIMARY KEY (Receitaid, Utilizadorid, Data));
CREATE TABLE Utensilio_Receita (Receitaid int NOT NULL, Utensilioid int NOT NULL, PRIMARY KEY (Receitaid, Utensilioid));
CREATE TABLE Utensilio (id int IDENTITY NOT NULL, nome varchar(255) NOT NULL, imageLink varchar(255) NULL, PRIMARY KEY (id));
CREATE TABLE Utensilio_Passo (Passoid int NOT NULL, PassoReceitaid int NOT NULL, Utensilioid int NOT NULL, PRIMARY KEY (Passoid, PassoReceitaid, Utensilioid));
CREATE TABLE Opiniao (Receitaid int NOT NULL, Utilizadorid int NOT NULL, favorito bit NOT NULL, rating smallint NULL, blacklist bit NOT NULL, PRIMARY KEY (Receitaid, Utilizadorid));
CREATE TABLE EmentaSemanal (Data datetime NOT NULL, Receitaid int NOT NULL, Utilizadorid int NOT NULL, PRIMARY KEY (Data, Receitaid, Utilizadorid));
CREATE TABLE Passo_Ingrediente (quantidade int NOT NULL, Passoid int NOT NULL, PassoReceitaid int NOT NULL, Ingredienteid int NOT NULL, PRIMARY KEY (Passoid, PassoReceitaid, Ingredienteid));
CREATE TABLE Receita_Ingrediente (quantidade int NOT NULL, Receitaid int NOT NULL, Ingredienteid int NOT NULL, PRIMARY KEY (Receitaid, Ingredienteid));
CREATE TABLE Passo_Dúvida (Passoid int NOT NULL, PassoReceitaid int NOT NULL, Dúvidaid int NOT NULL, questao varchar(255) NOT NULL, PRIMARY KEY (Passoid, PassoReceitaid, Dúvidaid));
CREATE TABLE Duvida (id int IDENTITY NOT NULL, titulo varchar(255) NOT NULL, videoLink varchar(255) NULL, imagemLink varchar(255) NULL, linkexterno varchar(255) NULL, Explicacao varchar(255) NULL, PRIMARY KEY (id));
CREATE TABLE CookieAuth (cookie int NOT NULL, Utilizadorid int NOT NULL, PRIMARY KEY (cookie));
CREATE TABLE Lojas (storeNum int IDENTITY NOT NULL, latitude float(10) NOT NULL, longitude float(10) NOT NULL, PRIMARY KEY (storeNum));
CREATE INDEX Utilizador ON Utilizador (email);
CREATE UNIQUE INDEX Passo_numero ON Passo (numero);
ALTER TABLE RestricoesAlimentares ADD CONSTRAINT FKRestricoes611183 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE RestricoesAlimentares ADD CONSTRAINT FKRestricoes283234 FOREIGN KEY (Ingredienteid) REFERENCES Ingrediente (id);
ALTER TABLE Ingrediente ADD CONSTRAINT FKIngredient791622 FOREIGN KEY (Unidadeid) REFERENCES Unidade (id);
ALTER TABLE Dislikes ADD CONSTRAINT FKDislikes309285 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE Dislikes ADD CONSTRAINT FKDislikes606690 FOREIGN KEY (Tagid) REFERENCES [Tag] (id);
ALTER TABLE Likes ADD CONSTRAINT FKLikes779490 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE Likes ADD CONSTRAINT FKLikes76896 FOREIGN KEY (Tagid) REFERENCES [Tag] (id);
ALTER TABLE Tag_Receita ADD CONSTRAINT FKTag_Receit644400 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE Tag_Receita ADD CONSTRAINT FKTag_Receit609365 FOREIGN KEY (Tagid) REFERENCES [Tag] (id);
ALTER TABLE Utilizador_Passo ADD CONSTRAINT FKUtilizador291789 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE Utilizador_Passo ADD CONSTRAINT FKUtilizador479350 FOREIGN KEY (Passoid, PassoReceitaid) REFERENCES Passo (numero, Receitaid);
ALTER TABLE Passo ADD CONSTRAINT FKPasso258598 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE Execucao ADD CONSTRAINT FKExecucao951778 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE Execucao ADD CONSTRAINT FKExecucao967008 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE Utensilio_Receita ADD CONSTRAINT FKUtensilio_681330 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE Utensilio_Receita ADD CONSTRAINT FKUtensilio_804784 FOREIGN KEY (Utensilioid) REFERENCES Utensilio (id);
ALTER TABLE Utensilio_Passo ADD CONSTRAINT FKUtensilio_754016 FOREIGN KEY (Passoid, PassoReceitaid) REFERENCES Passo (numero, Receitaid);
ALTER TABLE Utensilio_Passo ADD CONSTRAINT FKUtensilio_366619 FOREIGN KEY (Utensilioid) REFERENCES Utensilio (id);
ALTER TABLE Opiniao ADD CONSTRAINT FKOpiniao535745 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE Opiniao ADD CONSTRAINT FKOpiniao520515 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE EmentaSemanal ADD CONSTRAINT FKEmentaSema403694 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE EmentaSemanal ADD CONSTRAINT FKEmentaSema418924 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);
ALTER TABLE Passo_Ingrediente ADD CONSTRAINT FKPasso_Ingr754952 FOREIGN KEY (Passoid, PassoReceitaid) REFERENCES Passo (numero, Receitaid);
ALTER TABLE Passo_Ingrediente ADD CONSTRAINT FKPasso_Ingr655863 FOREIGN KEY (Ingredienteid) REFERENCES Ingrediente (id);
ALTER TABLE Receita_Ingrediente ADD CONSTRAINT FKReceita_In101998 FOREIGN KEY (Receitaid) REFERENCES Receita (id);
ALTER TABLE Receita_Ingrediente ADD CONSTRAINT FKReceita_In758818 FOREIGN KEY (Ingredienteid) REFERENCES Ingrediente (id);
ALTER TABLE Passo_Dúvida ADD CONSTRAINT FKPasso_Dúvi626074 FOREIGN KEY (Passoid, PassoReceitaid) REFERENCES Passo (numero, Receitaid);
ALTER TABLE Passo_Dúvida ADD CONSTRAINT FKPasso_Dúvi371016 FOREIGN KEY (Dúvidaid) REFERENCES Duvida (id);
ALTER TABLE CookieAuth ADD CONSTRAINT FKCookieAuth326630 FOREIGN KEY (Utilizadorid) REFERENCES Utilizador (id);