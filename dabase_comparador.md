#  Dicionário de Dados - Módulo de Comparação





## 1. Tabela: `Comparacao`
**Descrição:** Armazena o cabeçalho de uma lista de comparação criada por um usuário ou sessão.

| Atributo | Tipo | Chave | Descrição | Observações |
| :--- | :--- | :---: | :--- | :--- |
| **idComparacao** | INT | PK | Identificador único da comparação. | Auto-incremento. |
| **idUsuario_fk** | INT | - | ID do usuário que criou a comparação. | Pode ser nulo se for visitante. |
| **idSessao_fk** | INT | - | ID da sessão do navegador. | Útil para usuários não logados. |
| **DataCriacao** | DATE | - | Data em que a comparação foi feita. | Formato: AAAA-MM-DD. |
| **TokenCompartilhamento** | VARCHAR(45) | - | Código único para compartilhar a lista via URL. | - |

---

## 2. Tabela: `Itens_Comparacao`
**Descrição:** Tabela de ligação que armazena quais produtos pertencem a quais comparações.

| Atributo | Tipo | Chave | Descrição | Observações |
| :--- | :--- | :---: | :--- | :--- |
| **idProduto** | INT | PK | Identificador do produto comparado. | Parte da Chave Composta. |
| **Comparacao_idComparacao** | INT | PK / FK | ID da comparação pai. | Referencia `Comparacao(idComparacao)`. |

---

###  Regras de Relacionamento e Integridade

1. **Relacionamento (1:N):**
   - Uma **Comparacao** pode conter diversos itens (produtos).
   - A tabela `Itens_Comparacao` serve como a lista de itens vinculada ao cabeçalho.

2. **Chave Primária Composta:**
   - Na tabela `Itens_Comparacao`, a PK é formada por `(idProduto, Comparacao_idComparacao)`. Isso impede que o mesmo produto seja adicionado duas vezes na mesma lista de comparação.

3. **Integridade Referencial:**
   - **ON DELETE CASCADE:** Se uma `Comparacao` for excluída, todos os registros correspondentes em `Itens_Comparacao` serão removidos automaticamente pelo banco de dados.

