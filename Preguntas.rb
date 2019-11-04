class Preguntas

	def initialize()
		File.open('preguntas.txt', 'a')
	end

	def preguntas_(fn)
		temp=""
		File.open('preguntas.txt','r') do |f|
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

	def formato(preg)
		cont=0
		temp=""
		str=""
		preg=preg.split("+")
		preg.each {|u|
			if cont==2
				u.each_char {|c| 
					if c=="&"
						temp+="["+str+"]"
						str=""
					else 
						str+=c
					end
				}
			else
				temp+="["+u+"]" 
			end
			cont+=1
		}
		temp
	end

	def nueva_pregunta(preg)	
		id=self.genera_id()
		id=id.to_s
		temp=id.to_s+"+"+preg
		File.open('preguntas.txt', 'a') do |f|
  			f.puts temp
		end
		preg
	end

	def genera_id()
		temp=self.preguntas_(false)
		temp=temp.split(" ")
		temp=temp.last
		temp=temp.split("+")
		puts temp.first
		temp=temp.first.to_i+1
		temp
	end

	def ultimas_preguntas()
		ultimas=""
		tempL=[]
		temp=self.genera_id()
		ultimas=self.preguntas_(true)
		if temp.to_i>5
			ultimas=ultimas.split(" ")
			ultimas.each { |u| tempL.push(u.split("+")) }
			ultimas=""
			cont=0
			File.open('preguntas.txt','r') do |f|
				while line = f.gets
					if tempL[cont][0].to_i>=temp.to_i-5
						ultimas+=line
					end
					cont+=1
				end
			end
		else
			ultimas=self.preguntas_(true)
		end
		ultimas
	end
end
