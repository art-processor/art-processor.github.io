#set java_nio_packageName = "java.nio"

#set elmtType = "Byte","Char","Double","Float","Int","Long","Short"
#set elmttype = "byte","char","double","float","int","long","short"
#set elmtSize = 0,1,3,2,2,3,1

#while elmtType, elmttype, elmtSize
	#select elmtType
		#option Byte
			#set ByteOrder = ""
			#adapt: "BufferExample/meta-fragments/Direct[T]Buffer[SU]/Direct[T]Buffer[SU].vcl"
				#insert-after extends Mapped
				#endinsert
				#insert-after moreConstructors
					#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/DirectByteBuffer_moreConstructors.vcl"
				#endinsert
				#insert-after moreMethods
					#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/DirectByteBuffer_moreMethods.vcl"
				#endinsert
			#endadapt
		#endoption
		#otherwise
			#set ByteOrder = "S","U"
			#while ByteOrder
				#adapt: "BufferExample/meta-fragments/Direct[T]Buffer[SU]/Direct[T]Buffer[SU].vcl"
					#select elmtType
						#option Char
							#insert-after extends
							#endinsert
								#insert-after moreConstructors
									#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/constructor.vcl"
								#endinsert
								#insert-after moreMethods
									#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/order.vcl"
									#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/DirectCharBuffer_methods.vcl"
								#endinsert
						#endoption
						#otherwise
								#insert-after moreConstructors
									#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/constructor.vcl"
								#endinsert
								#insert-after moreMethods
									#adapt "BufferExample/meta-fragments/Direct[T]Buffer[SU]/order.vcl"
								#endinsert			
						#endotherwise		
					#endselect
				#endadapt
			#endwhile
		#endotherwise
	
	#endselect
#endwhile
