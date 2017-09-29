# git_api_ror
Conversion of the app to rails

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
rails g migration RemoveDescriptionFromRepositories  (faz as paradas automatico wat)
rake db:migrate
rake db:rollback

rails g model brain zombie_id:integer status:string (cria models depois de ter criado o scaffold)

# rails console
Repository.create(repo_id: 0,name: 'benny',user: 'bennusr',description: 'blabla', stars: 20)
