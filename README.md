# git_api_ror
Conversion of the app to rails
  
# Rails for Zombies 1
## Level 1  
Basicamente mostra como fazer *queries* dentro dos models.  
## Level 2  
Aprofundamento nos *models*, *relationship*, *validation*, etc...  
## Level 3  
Explica como funciona as *views* dentro de um *model*, e como instanciá-las via *link_to*. (*Link* com *if* e *each blocks*).  
## Level 4  
Ensina a definir controladores dentro das models.  
## Level 5  
Aula sobre como configurar rotas, redirecioná-las e instanciá-las.

## Comentários  
Muito boas as aulas para entender bem a estrutura de Rails, a única dificuldade que encontrei foi que os *Challenges* somente verificam se a pessoa lembra a sintaxe, que é difícil de lembrar após assistir um video de mais de 10 minutos com um amontoado de informações novas.  
Apesar disso deu pra assimilar bem as informações, recomendo baixar os slides para começar a implementar código pois é muita informação em pouco tempo tornando as coisas muito confusas na cabeça.  
Esse primeiro curso mostra bem a estrutura e a sintaxe mas não mostra como efetivamente começar a desenvolver. (Que é mostrado na aula 1 do segundo curso).  
Somente com este curso é possível ter uma boa base de como será a conversão da aplicação para Rails. Mas para efetivamente começar o desenvolvimento acredito que seja necessária a primeira aula do segundo curso.


# Command Line (to remember)
```shell
rails new myapp
```
(0.0.0.0 -> localhost)
```shell
rails s -b 0.0.0.0 
```
Generate scaffold (nao pode usar id como nome de coluna)
```shell
rails g scaffold repository repo_id:integer name:string user:string description:string stars:integer
```
Tive que dar dump no schema e depois load pra conseguir dar o migrate
```shell
rake db:migrate | db:reset | db:setup | db:schema:dump | db:schema:load | etc...
```
```shell
rails g migration RemoveDescriptionFromRepositories  (faz as paradas automatico wat)
rake db:migrate
rake db:rollback
```
```shell
rails g model brain zombie_id:integer status:string (cria models depois de ter criado o scaffold)
```
# rails console
Repository.create(repo_id: 0,name: 'benny',user: 'bennusr',description: 'blabla', stars: 20)
