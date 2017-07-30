#set java_nio_packageName = "java.nio"

#set elmtType = "Byte","Char","Double","Float","Int","Long","Short"
#set elmttype = "byte","char","double","float","int","long","short"
#set elmtSize = 0,1,3,2,2,3,1

#while elmtType, elmttype, elmtSize
  
	#adapt: "BufferExample/meta-fragments/[T]Buffer/[T]Buffer.vcl"
		#select elmtType
			#option Byte
				#insert-after moreMethods
					#adapt "BufferExample/meta-fragments/[T]Buffer/ByteBuffer_moreMethods.vcl"
				#endinsert
				#insert toString	
					#adapt "BufferExample/meta-fragments/[T]Buffer/toString.vcl"
				#endinsert	
			#endoption
			#option Char
				#insert implements 
				 , CharSequence
				#endinsert
				#insert toString
				#endinsert
				#insert-after moreMethods
					#adapt "BufferExample/meta-fragments/[T]Buffer/order.vcl"
					#adapt "BufferExample/meta-fragments/[T]Buffer/CharBuffer_moreMethods.vcl"
				#endinsert
			#endoption
			#otherwise
				#insert implements 
				#endinsert
				#insert-after moreMethods
					#adapt "BufferExample/meta-fragments/[T]Buffer/order.vcl"
				#endinsert
				#insert toString	
					#adapt "BufferExample/meta-fragments/[T]Buffer/toString.vcl"
				#endinsert	
			#endotherwise	
		#endselect
	#endadapt
#endwhile