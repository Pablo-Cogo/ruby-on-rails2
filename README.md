# Cheat Sheet de Ruby on Rails

## Ruby on Rails

### Task

- `rails new app_name`: Cria uma nova aplicação Rails com o nome especificado.
  - **rails**: Comando que indica o uso das funções do framework Rails.
  - **new**: Comando que aciona a funcionalidade de criação de um novo aplicativo.
  - **app_name**: Substitua isso pelo nome que você deseja atribuir ao seu novo aplicativo Rails.

- `rails generate model ModelName`: Gera um novo modelo com o nome especificado.
  - **generate**: Comando que aciona a funcionalidade de geração de código no Rails.
  - **model**: Indica que você está criando um novo modelo.
  - **ModelName**: Substitua isso pelo nome que você deseja atribuir ao modelo, seguindo o formato CamelCase (com a primeira letra maiúscula) e singular. Isso representa uma entidade no seu aplicativo, como `User`, `Product` ou qualquer outro nome relevante.

- `rails generate controller ControllerName`: Gera um novo controlador com o nome especificado.
  - **controller**: Indica que você está criando um novo controlador.
  - **ControllerName**: Substitua isso pelo nome que você deseja atribuir ao controlador, seguindo o formato CamelCase e singular.

- `rails db:migrate`: Executa migrações de banco de dados para aplicar as alterações de esquema definidas em migrações.
  - **db**: Categoria ou agrupamento de tarefas relacionadas a bancos de dados.
  - **migrate**: Tarefa específica que realiza a migração do banco de dados, aplicando as alterações pendentes no banco de dados.

- `rails db:seed`: Preenche o banco de dados com dados iniciais a partir dos arquivos em db/seeds.rb.
  - **seed**: Tarefa para preencher o banco de dados com dados iniciais a partir de arquivos em db/seeds.rb.

- `rails server`: Inicia o servidor local para executar a aplicação.
  - **server**: Tarefa para iniciar o servidor local.

### Generators

- `rails generate scaffold ModelName`: Cria um CRUD completo (Model, Controller, Views) para um modelo.
  - **scaffold**: Indica que você está criando um conjunto completo de recursos para um modelo.
  - **ModelName**: Substitua isso pelo nome do modelo para o qual você está criando o conjunto completo.

- `rails generate migration AddColumnToModel column_name:data_type`: Gera uma migração para adicionar uma coluna a um modelo.
  - **migration**: Indica que você está criando uma migração.
  - **AddColumnToModel**: Substitua isso pelo nome descritivo que indica a adição da coluna.
  - **column_name:data_type**: Especifique o nome da coluna e o tipo de dado que ela armazenará.

## Vagrant

### Task

- `vagrant init`: Inicializa um arquivo Vagrantfile no diretório atual, que descreve a configuração da máquina virtual.
  - **vagrant**: Comando para gerenciar máquinas virtuais com Vagrant.
  - **init**: Tarefa para inicializar um arquivo Vagrantfile no diretório atual.

- `vagrant up`: Inicia a máquina virtual com base nas configurações definidas no Vagrantfile.
  - **up**: Tarefa para iniciar a máquina virtual com base nas configurações definidas no Vagrantfile.

- `vagrant ssh`: Abre uma conexão SSH com a máquina virtual em execução.
  - **ssh**: Tarefa para abrir uma conexão SSH com a máquina virtual em execução.

- `vagrant halt`: Desliga a máquina virtual em execução.
  - **halt**: Tarefa para desligar a máquina virtual que está em execução.

- `vagrant destroy`: Remove completamente a máquina virtual, incluindo todos os arquivos associados.
  - **destroy**: Tarefa para remover permanentemente a máquina virtual, incluindo todos os arquivos associados.

## Sistema Operacional

### Task

- `ls`: Lista os arquivos e diretórios no diretório atual.
  - **ls**: Comando para listar os arquivos e diretórios no diretório atual.

- `cd directory_name`: Navega para o diretório especificado.
  - **cd directory_name**: Comando para mudar o diretório atual para o diretório especificado.

- `rm file_or_directory`: Remove um arquivo ou diretório especificado.
  - **rm file_or_directory**: Comando para remover um arquivo ou diretório especificado.

- `touch filename`: Cria um arquivo vazio com o nome especificado.
  - **touch filename**: Comando para criar um arquivo vazio com o nome especificado.

## Git

### Task

- `git init`: Inicializa um repositório Git local no diretório atual.
  - **git init**: Comando para iniciar um repositório Git local.

- `git clone repository_url`: Clona um repositório Git remoto para o diretório local.
  - **git clone repository_url**: Comando para clonar um repositório Git remoto.

- `git add file(s)`: Adiciona arquivos específicos ao área de preparação (staging area) para um futuro commit.
  - **git add file(s)**: Comando para adicionar arquivos específicos à área de preparação.

- `git commit -m "Commit message"`: Registra as mudanças no repositório com uma mensagem de commit explicativa.
  - **git commit -m "Commit message"**: Comando para registrar as mudanças no repositório com uma mensagem de commit explicativa.

- `git push origin branch_name`: Envia os commits locais para o repositório remoto na ramificação (branch) especificada.
  - **git push origin branch_name**: Comando para enviar os commits locais para o repositório remoto na ramificação especificada.

- `git pull origin branch_name`: Obtém e incorpora as alterações do repositório remoto na ramificação especificada.
  - **git pull origin branch_name**: Comando para obter e incorporar as alterações do repositório remoto na ramificação especificada.

- `git branch`: Lista todas as ramificações locais no repositório.
  - **git branch**: Comando para listar todas as ramificações locais no repositório.

- `git checkout branch_name`: Muda para a ramificação especificada.
  - **git checkout branch_name**: Comando para mudar para a ramificação especificada.

- `git merge branch_name`: Funde a ramificação especificada no branch atual.
  - **git merge branch_name**: Comando para fundir a ramificação especificada na ramificação atual.
