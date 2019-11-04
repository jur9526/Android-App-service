class Respuestas

	def initialize()
		File.open('usuarios.txt', 'a')
	end

	def respuestas_(fn)
		temp=""
		File.open('respuestas.txt','r') do |f|
			while line = f.gets
				if fn
					temp+=self.formato(line)+" "
				else
					temp+=line+" "
				end
			end
		end
		temp
	end

	def formato(res)
		temp=""
		res=res.split("+")
		res.each {|r| temp+="["+r.chomp()+"]" }
		temp
	end

	def nueva_respuesta(res)
		File.open('respuestas.txt', 'a') do |f|
  			f.puts res
		end
		res
	end

	def respuestas_asociadas(id)
		respuestas=""
		tempL=[]
		temp=self.respuestas_(false)
		temp=temp.split(" ")
		temp.each {|r| tempL.push(r.split("+"))}
		cont=0
		File.open('respuestas.txt','r') do |f|
			while line = f.gets
				if tempL[cont][0]==id
					respuestas+=self.formato(line)+" "
				end
				cont+=1
			end
		end
		respuestas
	end
end
