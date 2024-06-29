# Empsis

Este repositório contém o código fonte do projeto Empsis, desenvolvido como parte de um teste de programação. O projeto inclui uma aplicação completa com interface gráfica, lógica de negócios e integração com um banco de dados.

## Estrutura do Projeto

- `Empsis/`
  - `src/`: Diretório contendo o código fonte do projeto.
    - `src/service/`: Contém as unidades relacionadas à lógica de negócios e serviços.
    - `src/view/`: Contém os formulários e a interface do usuário.
  - `bin/`: Diretório contendo os arquivos de saída (executáveis).
    - `bin/Debug/`: Executáveis e arquivos de configuração para a build de Debug.
  - `lib/`: Diretório contendo bibliotecas e componentes adicionais usados no projeto.
  - `img/`: Diretório contendo recursos de imagem, como o ícone do projeto.
- `Telas/`: Diretório contendo capturas de tela.
- `Banco de Dados/`: Diretório contendo o banco de dados utilizado no projeto.

## Requisitos

- Delphi (versão utilizada no desenvolvimento: 11)
- MariaDB (versão utilizada no desenvolvimento: 10.4.32)

## Configuração do Ambiente

1. **Clonar o Repositório**:
   ```sh
   git clone git@github.com:AlexandreRosasCosta/EmpsisTest.git

Configurar Diretórios de Build:
No Delphi, vá para Project > Options > Delphi Compiler > Output - Debug e Output - Release. Configure os seguintes campos:

Unit output directory: .\Win32\Debug\ (para Debug)
Output directory: .\bin\Debug\ (para Debug)

Configurar o Search Path:
Em Building > Delphi Compiler > Search path, adicione:

.\src\
.\src\service\
.\src\view\
.\lib\
.\img\

Execução do Projeto
Configurar o Banco de Dados:
Certifique-se de que o banco de dados MariaDB 10.4.32 está instalado.
Execute o script de banco de dados localizado na pasta Banco de Dados/ para criar o banco de dados necessário.

Compilar e Executar:
No Delphi, selecione a configuração de build (Debug).
Compile e execute o projeto.
O executável pode ser encontrado no diretório bin/Debug/.

Estrutura do Código
- `src/service/`:
  - `service.cliente.pas`: Implementação de funcionalidades relacionadas ao cliente.
  - `service.connection.pas` e `service.connection.dfm`: Configuração e implementação da conexão com o banco de dados.
  - `service.endereco.pas`: Implementação de funcionalidades relacionadas ao endereço.

- `src/view/`:
  - `view.edit.client.pas` e `view.edit.client.dfm`: Formulário para edição de informações do cliente.
  - `view.principal.pas` e `view.principal.dfm`: Formulário principal da aplicação.
  - `view.register.client.pas` e `view.register.client.dfm`: Formulário para registro de novos clientes.
  - `view.register.client.vlb`: Arquivo adicional para o formulário de registro de clientes.

Contato
Para qualquer dúvida ou esclarecimento adicional, entre em contato:

Nome: Alexandre
Email: alexandrerosascosta@gmail.com

