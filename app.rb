require "sinatra"

require "./Usuarios.rb"
require "./Preguntas.rb"
require "./Respuestas.rb"

$U = Usuarios.new()
$P = Preguntas.new()
$R = Respuestas.new()

get '/' do                                  
	ultimas=$P.ultimas_preguntas()
	ultimas
end

get '/usuarios' do
	user=$U.usuarios_()
	user
end

get '/get_usuario/:user' do
	temp=params[:user]
	user=$U.nuevo_usuario(temp)
	user
end

get '/preguntas' do
	preg=$P.preguntas_(true)
	preg
end

get '/get_pregunta/:preg' do
	temp=params[:preg]
	preg=$P.nueva_pregunta(temp)
	preg
end

get '/ultimas' do
	ultimas=$P.ultimas_preguntas()
	ultimas
end

get '/respuestas' do
	res=$R.respuestas_(true)
	res
end

get '/get_respuesta/:res' do
	temp=params[:res]
	res=$R.nueva_respuesta(temp)
	res
end

get '/respuestas/:id' do
	temp=params[:id]
	asociadas=$R.respuestas_asociadas(temp)
	asociadas
end
