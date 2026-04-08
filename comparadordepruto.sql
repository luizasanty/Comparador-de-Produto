-- Primeiro criamos a tabela pai (Comparacao)

create database site;
use site;
CREATE TABLE Comparacao (
    idComparacao INT NOT NULL AUTO_INCREMENT,
    idUsuario_fk INT,
    idSessao_fk INT,
    DataCriacao DATE,
    TokenCompartilhamento VARCHAR(45),
    PRIMARY KEY (idComparacao)
);

-- Depois criamos a tabela filha (Itens_Comparacao)
CREATE TABLE Itens_Comparacao (
    idProduto INT NOT NULL,
    Comparacao_idComparacao INT NOT NULL,
    PRIMARY KEY (idProduto, Comparacao_idComparacao),
    CONSTRAINT fk_Itens_Comparacao_Comparacao
        FOREIGN KEY (Comparacao_idComparacao)
        REFERENCES Comparacao (idComparacao)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);