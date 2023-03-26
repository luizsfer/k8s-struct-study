# K8S Struct Study

Projeto criado para a criação e implementação de um Cluster Kubernernetes na Amazon Web Service (AWS).

O propósito desse repositório é fornecer um cluster de maneira rápida para estudos e implementação de projetos pessoais.

## Metodologia

- Esse repositório usa `Terraform` e `Terragrunt` para criar os recursos de infraestrtutura na AWS
- `Terraform` é usado para a representação e configuração de recursos na nuvem através do provider `aws`.
- `Terragrunt` é usado para manter os recursos do terraform em código limpo e de fácil manipulação. Fornce a criação de todos os módulos de Terraform atráves de um único comando.

## Pré requisitos

- aws-cli
- terraform
- terragrunt

## Implantação e testes de infraestrutura

- Configure o cliente da AWS através do comando:

```bash
aws configure
```

- Para executar o código usando o Terragrunt, entre no diretório `**infra**` e execute o seguinte comando:

```bash
terragrunt run-all apply
```

As ferramentas se encarregarão de encontrar modificações e/ou se é uma implementação inicial, armazendo em um bucket S3 todos os arquivos de estado do terraform, garantindo a integridade dos recursos criados.

Nota: Esse comando poderá demorar um tempo considerável até ser concluído. Execução de testes levaram 12 minutos aproximadamente.

- Para remover a infraestrutura criada, afinal, não queremos desperdiçar recursos (finandeiros), execute o seguinte comando:

```bash
terragrunt run-all destroy
```

Após a confirmação, todos os recursos criados pelo projeto serão removidos da sua conta AWS, garantindo que não iremos contar com recursos subutilizados que podem gerar custos elevados após um período longo de execução.

Nota: Esse comando também poderá levar um tempo para ser finalizado.

- **Utilizando o cluster**: o comando abaixo irá extrair as configurações necessárias para que você consiga ter acesso ao cluster recém-criado:

```bash
aws eks update-kubeconfig --region <REGION> --name <CLUSTER_NAME>
```

Garanta que o comando kubectl esteja configurado adequadamente com os dados apresentados pelo resultado do comando acima.

```bash
kubectl config get-contexts
kubectl set-context <CONTEXT_NAME>
````

## Obrigado

Agradeço por utilizar esse repositório, espero que ajude e facilite o dia-a-dia de quem quer aprender um novo recurso ou aplicação que necessite de um cluster rápido, barato e fácil de implementar.
