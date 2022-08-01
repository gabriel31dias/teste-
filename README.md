# README


# Foi desenvolvido teste de request e teste nos serviços

#Antes de tudo rodar sudo chmod -R 777 /api
#O sistem se encarrega de todas as tarefas de deploy
  docker-compose up -d

#para executar os testes
  docker exec -it PID bundle exec rspec



#Rotas -->>
METHOD POST
http://localhost:3000/parkings
 paylaod
    {
	    "parking": {
	        "plate" : "AAA-5555"
	    }
    }


METHOD GET
http://localhost:3000/out/:ID


METHOD GET
http://localhost:3000/paymant/:ID  