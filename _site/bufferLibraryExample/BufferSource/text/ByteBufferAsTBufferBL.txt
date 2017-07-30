#set java_nio_packageName = "java.nio"

#set elmtType = "Char","Double","Float","Int","Long","Short"
#set elmttype = "char","double","float","int","long","short"
#set elmtSize = 1,3,2,2,3,1
#set ByteOrder = "B","L"

#while elmtType, elmttype, elmtSize
	#while ByteOrder
		#adapt: "BufferExample/meta-fragments/ByteBufferAs[T]Buffer[BL]/ByteBufferAs[T]Buffer[BL].vcl"
			#select elmtType
				#option Char		
					#insert-after moreMethods
						#adapt "BufferExample/meta-fragments/ByteBufferAs[T]Buffer[BL]/ByteBufferAsCharBuffer_methods.vcl"
					#endinsert		
				#endoption
				#otherwise
					#insert-after moreMethods
					#endinsert
				#endotherwise
			#endselect
		#endadapt
	#endwhile
#endwhile