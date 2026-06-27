# Hotel_Nebula
projeto para desenvolver uma estrotura de banco de dados, desenvolver diagramas e resolver funções básicas.

## Parte 1: Origem do Sistema

Em algum ponto entre a tecnologia, a organização e o caos elegante de um sistema mal planejado, existe o Hotel Nebula.

À primeira vista, ele parece apenas um hotel moderno: quartos confortáveis, reservas acontecendo a todo instante, hóspedes chegando de diferentes lugares, profissionais cuidando da operação, serviços extras sendo solicitados e avaliações aparecendo a cada nova estadia. Mas, por trás da recepção iluminada e das portas automáticas, existe um universo inteiro de dados tentando se organizar.

O problema é que esse universo ainda está disperso. O hotel tem informações sobre seus hóspedes, quartos, reservas, hospedagens, pagamentos, profissionais e avaliações, mas tudo isso está em sistemas diferentes, planilhas soltas ou até mesmo em papéis amassados. A equipe de gestão sabe que precisa colocar ordem nesse caos para melhorar a experiência dos clientes e otimizar a operação, mas não sabe por onde começar.

### Regras gerais do projeto

O sistema do hotel deve contemplar, no mínimo, elementos como:

- hóspedes
- quartos
- reservas
- hospedagens
- pagamentos
- profissionais/funcionários
- avaliações/comentários dos clientes

O que deve ser feito: 

- identificar as entidades principais do sistema
- identificar os relacionamentos entre elas
- levantar regras de negócio
- produzir o modelo conceitual
- transformar o modelo conceitual em um modelo lógico relacional

  ### Entrega:
  ## Diagrama DER

  <img width="1318" height="741" alt="image" src="https://github.com/user-attachments/assets/a32f6837-f43d-4de2-8420-bdc03a2cd9cd" />

  ## Descrição de entidades e relacionamento
1. Hóspede e Reserva (1 : N)
Hóspede: É o cliente do hotel (guarda nome, CPF, contato).
Reserva: É o planejamento da estadia (guarda as datas pretendidas e o status).
Relacionamento: Um Hóspede pode fazer várias Reservas ao longo do tempo, mas cada Reserva pertence a apenas um Hóspede.

2. Quarto e Reserva (1 : N)
Quarto: É o espaço físico (guarda número, tipo e preço da diária).
Relacionamento: Um Quarto pode receber várias Reservas (em datas diferentes), mas uma Reserva específica garante apenas um Quarto.

3. Reserva e Hospedagem (1 : 1)
Hospedagem: É a presença real do cliente no hotel (check-in e check-out consumados).
Relacionamento: Uma Reserva confirmada gera exatamente uma Hospedagem quando o cliente chega.

4. Funcionário e Hospedagem (1 : N)
Funcionário: É a equipe do hotel (guarda nome, cargo e salário).
Relacionamento: Um Funcionário pode realizar o check-in de várias Hospedagens durante seu turno, mas cada Hospedagem registra apenas um Funcionário responsável pelo check-in.

5. Hospedagem, Pagamento e Avaliação (1 : N / 1 : 1)
Pagamento e Avaliação: São os fechamentos da estadia.
Relacionamento: Uma Hospedagem pode ter um ou mais Pagamentos (caso rache a conta, por exemplo) e gera apenas uma Avaliação opcional sobre como foi a experiência.


  ## Parte 2: Montagem do Núcleo:

  Foco: implementação física do banco relacional

Agora O profissional precisa construir a estrutura do banco de dados de forma funcional e consistente.

O que deve ser feito:

- criar o banco de dados
- criar as tabelas
- definir chaves primárias e estrangeiras
- aplicar restrições
- pensar em tipos de dados apropriados
- inserir dados iniciais para testes

  ### Entrega:

 - script de tabelas e inserts nos arquivos do projeto
 - Documentação explicando a estrotura criada:

A estrutura desse banco de dados foi criada seguindo um fluxo cronológico e lógico, dividida em três camadas simples para organizar o caos do hotel:

Cadastros Base (Dados Isolados): As tabelas hospede, quarto e funcionario guardam as informações fundamentais. Elas não dependem de ninguém para existir; são apenas o registro dos clientes, do espaço físico e da equipe.

O Planejamento (A Reserva): A tabela reserva funciona como uma ponte intermediária. Ela junta um hospede e um quarto em um período de tempo futuro, indicando apenas uma intenção de viagem.

A Execução e Fechamento (A Estadia Real): Quando o cliente chega, a tabela hospedagem entra em ação, puxando os dados da reserva e registrando qual funcionario fez o check-in. A partir dessa estadia real, geram-se os desdobramentos finais: o pagamento (financeiro) e a avaliacao (feedback).


  ## Parte 3: Radar de Comando

Foco: consultas SQL e extração de dados

O hotel agora quer enxergar melhor sua operação. O profissional deve produzir consultas que gerem informações relevantes para gestão.

O que deve ser feito

Criar consultas que respondam perguntas como:

- quais quartos estão disponíveis em determinado período?
- quais hóspedes mais realizaram reservas?
- qual foi o faturamento por mês?
- quais serviços extras são mais consumidos?
- quais quartos receberam melhores avaliações?
- quais reservas foram canceladas?
- quantas hospedagens cada profissional atendeu?

  Respostas das operações no própio arquivo banco de dados.
  


