# 🎓 Sistema Acadêmico em Prolog

Este projeto consiste na implementação de um **sistema acadêmico em Prolog**, capaz de analisar o histórico de alunos e verificar sua situação em relação à conclusão de cursos.

O sistema utiliza **programação lógica e recursividade**, sem o uso de predicados avançados, conforme solicitado no trabalho.

---

## 🚀 Funcionalidades

### ✅ Verificação de Conclusão de Curso

Permite verificar se um aluno concluiu um curso com base em:

* Disciplinas obrigatórias do currículo
* Histórico do aluno
* Critérios de aprovação (nota e frequência)

```prolog
concluiu(RA, CC).
```

---

### 📚 Estrutura da Base de Conhecimento

O sistema foi construído utilizando os seguintes predicados:

* `curso(CC, Nome)` → cursos disponíveis
* `materia(CM, Nome, Carga)` → disciplinas
* `curriculo(CC, ListaMaterias)` → disciplinas obrigatórias do curso
* `aluno(RA, Nome)` → alunos cadastrados
* `cursa(RA, CC)` → curso do aluno
* `historico(RA, ListaItens)` → histórico acadêmico

Cada item do histórico segue o formato:

```prolog
item(CM, Semestre, Ano, Nota, Frequencia)
```

---

### 🔁 Uso de Recursividade

O projeto utiliza recursividade para:

* Percorrer listas de matérias do currículo
* Verificar aprovação no histórico
* Garantir que todas as disciplinas foram concluídas

Sem uso de:

* ❌ `member`
* ❌ `forall`

---

## ⚙️ Aspectos Técnicos

### 🔧 Tecnologias Utilizadas

* Prolog (SWI-Prolog)
* Programação Lógica
* Recursividade
* Git e GitHub para versionamento

---

## 🧪 Como Executar o Projeto

### 1. Instalar o Prolog

Baixe o **SWI-Prolog**

---

### 2. Clonar o repositório

```bash
git clone https://github.com/lipeleoneli/Atividade-Avaliativa-ProLog.git
```

---

### 3. Executar o Prolog

No terminal:

```bash
swipl
```

---

### 4. Carregar o arquivo

```prolog
consult('AvaliacaoPratica.pl').
```

---

### 5. Testar o sistema

Exemplo:

```prolog
concluiu(12909, 1).
```

---

## 👨‍💻 Contribuidores

* Felipe Nonato Leoneli
* Lucas Anelli Bissi

---

## 📌 Status do Projeto

✔️ Questão 1 implementada
✔️ Questão 2 implementada
🔄 Demais funcionalidades em desenvolvimento

---

## 📄 Observações

* O projeto segue as restrições da disciplina (uso de recursividade simples)
* Base de dados criada para testes e validação do sistema
* Estrutura preparada para expansão das próximas questões

---

## 🏁 Conclusão

Este trabalho demonstra a aplicação prática de conceitos de **programação lógica em Prolog**, com foco em manipulação de listas e uso de recursividade para resolução de problemas acadêmicos.
