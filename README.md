# Fullcycle-k8s-challenge

#### **Servidor Web - NGINX**

- Utilize a imagem base do Nginx Alpine
- Disponibilize 3 réplicas
- Quando alguém acessar o IP externo do LoadBalancer do serviço criado, ou em caso de utilização do Minikube usando "minikube service nome-do-serviço", deve ser exibido no browser: Code.education Rocks.

###### Solução:

​	1- Utilize o configmap.yaml para criar o novo index.html

​	2- Crie o arquivo deployment.yaml, criando um container usando a imagem nginx:1.17-alpine e adicione o configMap nos volumes, no arquivo de deployment.

​	3- Crie o arquivo service.yaml expondo a porta 80, com o selector para o app criado no deployment.



Para rodar, utilizando o kubernates do docker, simplesmente execute: 

​	kubectl apply -f nginx/configmap.yaml

​	kubectl apply -f nginx/service.yaml

​	kubectl apply -f nginx/deployment.yaml



Caso esteja usando o minikube, execute o comando para expor o serviço:

​	minikube service nginx-service



Obs: A solução desse exercício está na pasta nginx. E os arquivos ngk8sRun.sh e ngk8Del.sh, foram criados para facilitar o processo de criação e exclusão.

Embora o requisito seja usar o minikube, depois de usar o minikube no windows, decidi ativar o kubernetes direto no docker para poder usar direto do WSL2.







#### **Configuração do MySQL**

- Faça o processo de configuração de um servidor de banco de dados MySQL
- Utilize secret em conjunto com as variáveis de ambiente
- Utilize disco persistente para gravar as informações dos dados

###### **Solução:**

​	1 - Cria uma secret no kubernetes.  (Utilizei linha de comando).

​	2 - Crie o arquivo persistentvolume.yaml para informar os dados do arquivo persistente.

​	3 - Crie o arquivo deployment.yaml para criar o container do mysql, criando um volume apontando para o volume persistente criado no passo anterior.



Para rodar, utilizando o kubernates do docker, simplesmente execute: 

​	kubectl create secret generic mysql-pass --from-literal=password=senha321

​	kubectl apply -f mysql/persistentVolume.yaml

​	kubectl apply -f mysql/deployment.yaml



Pode ser que demore um pouco para o deployment subir, verifique com o comando:

​	kubectl get deployments

Depois localize o pod do mysql criado executando: 

​	kubectl get pods

Com o nome do pod em mãos, entre no pod com o comando:

​	kubectl exec -it mysql-deplo-7bf5df9c47-hhbxj bash

Dentro do container execute o comando abaixo e digite a senha informada na secret:

​	mysql -uroot -p

Veja que o banco foi criado corretamente, e depois digite "QUIT" e depois "EXIT" para sair.







#### **Desafio Go!**

- Crie um aplicativo Go que disponibilize um servidor web na porta 8000 que quando acessado seja exibido em HTML (em negrito) Code.education Rocks!

- A exibição dessa string deve ser baseada no retorno de uma função chamada "greeting". Essa função receberá a string como parâmetro e a retornará entre as tags <b></b>.

- Como ótimo desenvolvedor(a), você deverá criar o teste dessa função.
- Gere a imagem desse aplicativo de forma otimizada e publique-a no Docker Hub
- Utilizando o Kubernetes, disponibilize o serviço do tipo Load Balancer que quando acessado pelo browser acesse a aplicação criada em Go.
- Ative o processo de CI no Google Cloud Build para garantir que a cada PR criada faça com que os testes sejam executados.



###### **Solução:**

1. Criar a aplicação em Go e criar o teste na pasta go-server/src

   1. Executar a aplicação com o comando: "go run ./go-server/src/server.go"
   2. Abrir o browser e ver a aplicação rodando no http://localhost:8000
   3. Executar o teste unitário com o comando: "go test ./go-server/src/*"

2. Criar uma imagem utilizando multistaging build.

   1. Criar um arquivo chamado Dockerfile e escreva o build otimizado como nos exercícios anteriores. E execute:
      1. Dentro da pasta ./go-server
      2. docker build -t phmelomorais/code-education-go-webserver .
      3. docker login
      4. ducker push phmelomorais/code-education-go-webserver

3. Para rodar com o kubernetes

   1. Criar o arquivo de deployment.yaml, criando um container apontando para imagem que foi carregada no docker-hub, expondo a porta 8000.
   2. Criar arquivo service.yaml expondo a porta 8000.
   3. Depois executar:
      1. kubectl apply -f ./go-server/deployment.yaml
      2. kubectl apply -f ./go-server/service.yaml

4. Para criar o processo de CI com o Github e o GCB:

   1. Criar o arquivo "cloudbuild.yaml" e informar os comandos para:
      1. Executar o install com a imagem Go
      2. Executar o teste unitário
   2. Suba todos os arquivos para o Github
   3. Acesse o Google Cloud Plataform
      1. Dentro do Google Cloud Build
         1. Connecte ao repositório do github, criado na etapa anterior.
         2. Crie uma trigger para ser ativada por pull request e escolha o arquivo "cloudbuild.yaml"
   4. Criar um pull request e gerar commit para ativra a trigger.

   



Imagem do webserver Go criada no docker hub

https://hub.docker.com/repository/docker/phmelomorais/code-education-go-webserver

